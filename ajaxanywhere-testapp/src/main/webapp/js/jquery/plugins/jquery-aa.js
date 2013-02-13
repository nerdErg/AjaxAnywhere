/*
 Copyright 2005  Vitaliy Shevchuk (shevit@users.sourceforge.net)
 Copyright 2013  nerdErg Pty Ltd (sales@nerderg.com)

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

/**
 * Global Object container
 * @type {{}}
 */
var AjaxAnywhere = {};

/**
 *
 * @param parentForm
 * @param refreshZones
 * @param event
 * @param method
 */
AjaxAnywhere.submitAjaxAnywhereForm = function(parentForm, refreshZones, event, method) {
    // The method specified in the form can be override if a method is specified
    method = method ? method : $(parentForm).attr("method");

    var params = {};
    if (event) {
        // The form element that originated the submission event must be sent as a parameter manually, because the serialize() method cannot do that
        params[$(event.target).attr('name')] = $(event.target).val();
    }
    // Zones to refresh is also a request parameter
    params["aazones"] =  refreshZones;

    $.ajax({
        url: $(parentForm).attr("action"),
        type: method,
        data: $(parentForm).serialize() + '&' + $.param(params),
        dataType: 'xml',
        success: this.handleSuccessfulRequest,
        error: this.handleError
    });
}

/**
 * TODO
 * @param href
 * @param refreshZones
 */
AjaxAnywhere.submitAjaxAnywhereLink = function(href, refreshZones) {
    var params = {};
    // Zones to refresh is also a request parameter
    params["aazones"] =  refreshZones;

    $.ajax({
        url: href,
        type: 'GET',
        data: $.param(params),
        dataType: 'xml',
        success: this.handleSuccessfulRequest,
        error: this.handleError
    });
}

/**
 * TODO comment
 * @param response
 * @param status
 * @param request
 */
AjaxAnywhere.handleSuccessfulRequest = function (response, status, request) {
    if (response.redirect) {
        // data.redirect contains the string URL to redirect to
        window.location.href = response.redirect;
    } else {
        AjaxAnywhere.processXmlResponse(request, response);
    }
}

/**
 * TODO comment
 * @param request
 * @param status
 * @param error
 */
AjaxAnywhere.handleError = function(request, status, error) {
    var details = confirm("AjaxAnywhere default error handler. XMLHttpRequest HTTP Error code:" + status + " \n\n Would you like to view the response content in a new window?");
    if (details) {
        var win = window.open("", this.id + "_debug_window");
        if (win != null) {
            win.document.write("<html><body><xmp>" + request.responseText);
            win.document.close();
            win.focus();
        } else {
            alert("Please, disable your pop-up blocker for this site first.");
        }
    }
}

/**
 * TODO comment
 * @param request
 * @param response
 */
AjaxAnywhere.processXmlResponse = function(request, response) {
    if (request.getResponseHeader('content-type').toLowerCase().substring(0, 8) != 'text/xml') {
        alert("AjaxAnywhere error : content-type in not text/xml : [" + this.req.getResponseHeader('content-type') + "]");
        return;
    }

    $(response).find("zone").each (function(i, zoneNode) {
        var id = $(zoneNode).attr("id");
        $("#"+id).html($(zoneNode).text());
    });

}

// Tasks to be performed once the document is loaded
$(function () {

    // Check for all the AjaxAnywhere enabled forms
    $(document).on("click", "form[aa-refresh-zones] input[type='submit'], form[aa-refresh-zones] input[type='image'], form[aa-refresh-zones] button[type='submit']", function(event) {
        event.preventDefault();
        var parentForm = $(this).closest("form");
        // Submit Form w ith AjaxAnywhere attributes
        AjaxAnywhere.submitAjaxAnywhereForm(parentForm, $(parentForm).attr("aa-refresh-zones"), event, $(parentForm).attr("method"));
    });

    $(document).on("submit", "form[aa-refresh-zones]", function (event){
        event.preventDefault();
        // Submit Form w ith AjaxAnywhere attributes
        AjaxAnywhere.submitAjaxAnywhereForm($(this), $(this).attr("aa-refresh-zones"), null, $(this).attr("method"));
    });

    // Check for all the AjaxAnywhere enabled buttons
    $(document).on("click", "input[type='submit'][aa-refresh-zones], input[type='image'][aa-refresh-zones], button[type='submit'][aa-refresh-zones]", function(event) {
        event.preventDefault();
        // Find parent form
        var parentForm = $(this).closest("form");
        // Submit Form with AjaxAnywhere attributes
        AjaxAnywhere.submitAjaxAnywhereForm(parentForm, $(this).attr("aa-refresh-zones"), event, $(this).attr("aa-method"));
    });

    // Check for all the AjaxAnywhere enabled selects
    $(document).on("change", "select[aa-refresh-zones]", function(event) {
        event.preventDefault();
        // Find parent form
        var parentForm = $(this).closest("form");
        // Submit Form with AjaxAnywhere attributes
        AjaxAnywhere.submitAjaxAnywhereForm(parentForm, $(this).attr("aa-refresh-zones"), null, $(this).attr("aa-method"));
    });

    // Check for all the AjaxAnywhere enabled links
    $(document).on("click", "a[aa-refresh-zones]", function(event) {
        event.preventDefault();
        AjaxAnywhere.submitAjaxAnywhereLink($(this).attr("href"), $(this).attr("aa-refresh-zones"));
    });
});