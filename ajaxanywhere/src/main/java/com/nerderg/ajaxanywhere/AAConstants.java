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
package com.nerderg.ajaxanywhere;

/**
 * @author Angel Ruiz (aruizca@gmail.com)
 */
public interface AAConstants {

    String REFRESH_ZONES_KEY = "AjaxAnywhere.refreshZones";

    String AJAX_HEADER_INDENTIFIER_VALUE = "XMLHttpRequest";
    String AJAX_HEADER_INDENTIFIER_KEY = "X-Requested-With";

    String ZONES_URL_KEY = "aazones";

    String END_OF_ZONE_PREFIX = "<!-- @end of zone [";
    String END_OF_ZONE_SUFFIX = "]@ --></div>";

    //constants used in the XML content returned to the client
    String AA_XML_ZONES = "zones";
    String AA_XML_ZONE = "zone";
    String AA_XML_ID = "id";
    String AA_XML_EXCEPTION = "exception";
    String AA_XML_TYPE = "type";
}
