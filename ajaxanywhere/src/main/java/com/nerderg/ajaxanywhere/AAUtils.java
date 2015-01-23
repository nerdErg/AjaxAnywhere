/*
   Copyright 2005  Vitaliy Shevchuk (shevit@users.sourceforge.net)
   Copyright 2013  nerdErg Pty Ltd (info@nerderg.com)

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

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import static com.nerderg.ajaxanywhere.AAConstants.*;

/**
 * @author Angel Ruiz (aruizca@gmail.com)
 */
public class AAUtils {

    /**
     *
     * @param servletRequest
     * @return
     */
    public static boolean isAjaxAnywhereRequest(ServletRequest servletRequest) {
        return isjQueryAjaxRequest(servletRequest) && getCommaSeparatedValuesAsStringArray(servletRequest, ZONES_URL_KEY).length > 0;
    }

    /**
     *
     * @param servletRequest
     * @return true if it is an Ajax request using jQuery
     */
    public static boolean isjQueryAjaxRequest(ServletRequest servletRequest) {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        return AAConstants.AJAX_HEADER_INDENTIFIER_VALUE.equalsIgnoreCase(request.getHeader(AAConstants.AJAX_HEADER_INDENTIFIER_KEY));
    }

    /**
     *
     * @param request
     * @param parameterKey
     * @return
     */
    public static String[] getCommaSeparatedValuesAsStringArray(ServletRequest request, String parameterKey) {
        String commaSeparatedValue = request.getParameter(parameterKey);
        String[] values = new String[0];
        if (commaSeparatedValue != null) {
            values = commaSeparatedValue.trim().split("\\s*,\\s*");
        }

        return values;
    }

    /**
     *
     * @param zone
     * @param tag
     * @param bufferResponseWrapper
     * @return
     */
    public static String getZoneContent(String zone, String tag, BufferResponseWrapper bufferResponseWrapper) {
        return bufferResponseWrapper.findSubstring(getZoneStartDelimiter(zone, tag), getZoneEndDelimiter(zone, tag));
    }

    public static String getWholeContent(BufferResponseWrapper bufferResponseWrapper) {
        return bufferResponseWrapper.getContent();
    }

    /**
     *
     * @param zone
     * @return
     */
    public static String getZoneStartDelimiter(String zone, String tag) {
        StringBuilder sb = new StringBuilder("<" + tag + " id=\"" + zone.replaceAll("\"", "&quot;") + "\"");

        if (tag.toLowerCase().equals("div")) {
            sb.append(" style=\"display:inline;\"");
        }

        sb.append(">");

        return sb.toString();
    }

    /**
     *
     * @param zone
     * @param tag
     * @param fragmentUrl
     * @param jsBefore
     * @param jsAfter
     * @return
     */
    public static String getZoneStartDelimiter(String zone, String tag, String fragmentUrl, String jsBefore , String jsAfter) {
        StringBuilder sb = new StringBuilder("<" + tag + " id=\"" + zone.replaceAll("\"", "&quot;") + "\" fragment-url=\"" + fragmentUrl + "\"");

        if (tag.toLowerCase().equals("div")) {
            sb.append(" style=\"display:inline;\"");
        }

        if (jsBefore != null && !jsBefore.trim().equals("")) {
            sb.append(" js-before=\"" + jsBefore + "\"");
        }

        if (jsAfter != null && !jsAfter.trim().equals("")) {
            sb.append(" js-after=\"" + jsAfter + "\"");
        }

        sb.append(">");
        return sb.toString();
    }

    /**
     *
     * @param zone
     * @return
     */
    public static String getZoneEndDelimiter(String zone, String tag) {
        return END_OF_ZONE_PREFIX + zone + END_OF_ZONE_SUFFIX + "</" + tag + ">";
    }

}
