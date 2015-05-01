/*
 Copyright 2005  Vitaliy Shevchuk (shevit@users.sourceforge.net)
 Copyright 2013  Angel Ruiz (aruizca@gmail.com)

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

"use strict";

/**
 * AjaxAnywhere client
 * @version: 2.1
 * @author: Angel Ruiz - aruizca@gmail.com
 */
var AjaxAnywhere = {
    /**
     * Parameters that can be added at runtime via javascript before the actual Ajax request is performed
     */
    dynamicParams: {},
    aaQueueName: "aa-queue"
};

/**
 * This function handles the submission of the provided form using the jQuery Ajax support and prepares the request to
 * hold the parameters required by the AjaxAnywhere library
 * @param parentForm
 * @param refreshZones
 * @param event [optional]
 * @param method
 * @param jsBefore [optional]
 * @param jsAfter [optional]
 */
AjaxAnywhere.submitAjaxAnywhereForm = function(parentForm, refreshZones, event, queue, method, jsBefore, jsAfter) {
    // The method specified in the form can be override if a method is specified
    method = method ? method : $(parentForm).attr("method");

    if(jsBefore) {
        // Execute javascript before Ajax request
        eval(jsBefore);
    }

    var params = this.initParams(refreshZones, event);

    var options = {
        url: $(parentForm).attr("action"),
        type: method,
        data: $(parentForm).serialize() + '&' + $.param(params),
        dataType: 'xml',
        success: function(response, status, request) {
            AjaxAnywhere.handleSuccessfulRequest(response, status, request, jsAfter);
        },
        error: this.handleError
    };

    AjaxAnywhere.performAjaxRequest(queue, options);
};

/**
 * This function handles the submission of the provided link using the jQuery Ajax support and prepares the request to
 * hold the parameters required by the AjaxAnywhere library
 * @param href
 * @param refreshZones
 * @param queue [optional]
 * @param jsAfter [optional]
 * @param jsBefore [optional]
 * @param jsAfter [optional]
 */
AjaxAnywhere.submitAjaxAnywhereLink = function(href, refreshZones, queue, method, jsBefore, jsAfter) {

    if(jsBefore) {
        // Execute javascript before Ajax request
        eval(jsBefore);
    }

    var params = this.initParams(refreshZones);

    var options = {
        url: href,
        type: method ? method : 'GET',
        data: $.param(params),
        dataType: 'xml',
        success: function(response, status, request) {
            AjaxAnywhere.handleSuccessfulRequest(response, status, request, jsAfter);
        },
        error: this.handleError
    };

    AjaxAnywhere.performAjaxRequest(queue, options);
};

/**
 *
 * @param queue
 * @param options
 */
AjaxAnywhere.performAjaxRequest = function(queue, options) {
  if (queue && $.ajaxq) {
      if (queue == 'abort') {
          $.ajaxq.abort(AjaxAnywhere.aaQueueName);
      } else if (queue == 'clear') {
          $.ajaxq.clear(AjaxAnywhere.aaQueueName);
      }
      $.ajaxq(AjaxAnywhere.aaQueueName, options);
  } else {
      $.ajax(options);
  }

};

/**
 * Initializes the required request parameters for AjaxAnywhere to work
 * @param refreshZones
 * @param event [optional]
 */
AjaxAnywhere.initParams = function(refreshZones, event) {
    var params = {};
    if (event) {
        // The form element that originated the submission event must be sent as a parameter manually, because the serialize() method cannot do that
        params[$(event.target).attr('name')] = $(event.target).val();
    }
    // Zones to refresh is also a request parameter
    params["aazones"] = refreshZones;
    params["aatags"] = this.retrieveTags(refreshZones);

    // We merge the dynamically params that might or might not been added at runtime
    $.extend(params, this.dynamicParams);
    // Reset for next request
    this.dynamicParams = {};

    return params;
};

/**
 * Returns comma separated html tags for each refresh zone id
 * @param refreshZones
 * @returns {string}
 */
AjaxAnywhere.retrieveTags = function(refreshZones) {
    var zonesArray = refreshZones.split(',');
    var tagsArray = [];
    $.each(zonesArray, function(index, value) {
        if ($('#' + $.trim(value)).length == 0) {
            console.log("The zone with name " + $.trim(value) + " does not exist. Please check for spelling mistake.");
        } else {
            tagsArray.push($('#' + $.trim(value)).prop('tagName').toLowerCase());
        }
    });
    return tagsArray.join(',');
};

/**
 * Function to handle successful requests.
 * @param response
 * @param status
 * @param request
 * @param jsAfter [optional]
 */
AjaxAnywhere.handleSuccessfulRequest = function (response, status, request, jsAfter) {
    if (request.getResponseHeader('content-type').toLowerCase().substring(0, 8) != 'text/xml') {
        alert("AjaxAnywhere error : content-type is not text/xml : [" + request.getResponseHeader('content-type') + "]");
        return;
    } else {
        AjaxAnywhere.processXmlResponse(request, response);
        if(jsAfter) {
            eval(jsAfter);
        }
    }
};

/**
 * Function to handle unsuccessful requests.
 * @param request
 * @param status
 * @param error
 */
AjaxAnywhere.handleError = function(request, status, error) {
    console.log('Error: ' + error);
    console.log('Status: ' + request.status);
    console.log('Response: ' + request.responseText);
};

/**
 * This function parses the XML response to extract each zone to be appended to the corresponding DOM node.
 * @param request
 * @param response
 */
AjaxAnywhere.processXmlResponse = function(request, response) {
    if ($(response).find("redirect").length == 1) {
        window.location.href = $(response).find("redirect").text();
    } else {
        $(response).find("zone").each (function(i, zoneNode) {
            var id = $(zoneNode).attr("id");
            // If the tag of the zone is different from div we will replace the whole tag instead of just the content
            var tagName = $("#"+id).prop('tagName');
            if (tagName.toLowerCase() != 'div') {
                $("#" + id).replaceWith($(zoneNode).text());
            } else {
                $("#" + id).html($(zoneNode).text());
            }
        });
    }
};

// Tasks to be performed once the document is loaded
$(function () {

    // Check for all the AjaxAnywhere enabled forms. This is similar to the event handler bellow but the main difference is
    // that in this instance we are able to add the value of the event trigger with the rest of the form values that will
    // be serialized and sent in the Ajax request
    $(document).on("click", "form[aa-refresh-zones] input[type='submit'], form[aa-refresh-zones] input[type='image'], form[aa-refresh-zones] button[type='submit']", function(event) {
        event.preventDefault();
        var parentForm = $(this).closest('form');
        // Submit Form with AjaxAnywhere attributes
        AjaxAnywhere.submitAjaxAnywhereForm(parentForm, parentForm.attr("aa-refresh-zones"), event, $(this).attr("aa-queue") || false, parentForm.attr("method"), parentForm.attr("aa-js-before"), parentForm.attr("aa-js-after"));
    });

    $(document).on("submit", "form[aa-refresh-zones]", function (event){
        event.preventDefault();
        // Submit Form with AjaxAnywhere attributes
        AjaxAnywhere.submitAjaxAnywhereForm($(this), $(this).attr("aa-refresh-zones"), null, $(this).attr("aa-queue") || false, $(this).attr("method"), $(this).attr("aa-js-before"), $(this).attr("aa-js-after"));
    });

    // Check for all the AjaxAnywhere enabled buttons
    $(document).on("click", "input[type='submit'][aa-refresh-zones], input[type='image'][aa-refresh-zones], button[type='submit'][aa-refresh-zones]", function(event) {
        event.preventDefault();
        // Find parent form
        var parentForm = $(this).closest('form');
        // Submit Form with AjaxAnywhere attributes
        AjaxAnywhere.submitAjaxAnywhereForm(parentForm, $(this).attr("aa-refresh-zones"), event, $(this).attr("aa-queue") || false, $(this).attr("aa-method"), $(this).attr("aa-js-before"), $(this).attr("aa-js-after"));
    });

    // Check for all the AjaxAnywhere enabled selects
    $(document).on("change", "select[aa-refresh-zones]", function(event) {
        event.preventDefault();
        // Find parent form
        var parentForm = $(this).closest('form');
        // Submit Form with AjaxAnywhere attributes
        AjaxAnywhere.submitAjaxAnywhereForm(parentForm, $(this).attr("aa-refresh-zones"), null, $(this).attr("aa-queue") || false, $(this).attr("aa-method"), $(this).attr("aa-js-before"), $(this).attr("aa-js-after"));
    });

    // Check for all the AjaxAnywhere enabled links or elements
    $(document).on("click", "[aa-refresh-zones]", function(event) {
        event.preventDefault();
        // Form elements have already been taken care of
        if (!$(this).is("form, input, button, select") || !$(this).closest('form')) {
            var href = $(this).attr("href") || $(this).attr("aa-href");
            AjaxAnywhere.submitAjaxAnywhereLink(href, $(this).attr("aa-refresh-zones"), $(this).attr("aa-queue") || false, $(this).attr("aa-method"), $(this).attr("aa-js-before"), $(this).attr("aa-js-after"));
        }
    });

    // Check all the defined refresh zones that need to be loaded automatically when the page loads
    // TODO Deprecated and to be removed in next version
    $("[aa-href]:not([aa-refresh-zones])").each(function(){
        AjaxAnywhere.submitAjaxAnywhereLink($(this).attr("aa-href"), $(this).attr("id"), $(this).attr("aa-queue") || false, $(this).attr("aa-method"), $(this).attr("aa-js-before"), $(this).attr("aa-js-after"));
    });
});