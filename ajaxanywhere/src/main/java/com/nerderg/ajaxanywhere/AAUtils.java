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
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

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
        return isjQueryAjaxRequest(servletRequest) && !getZonesToRefresh(servletRequest).isEmpty();
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
     * @param commaSeparatedZonesList
     */
    private static void addZonesToRefresh(ServletRequest request, String commaSeparatedZonesList) {
        Set res = getZonesToRefresh(request);
        if (res != null) {
            StringTokenizer st = new StringTokenizer(commaSeparatedZonesList, ",", false);
            while (st.hasMoreTokens()) res.add(st.nextToken().trim());
        }
    }

    /**
     *
     * @param request
     * @return
     */
    public static Set getZonesToRefresh(ServletRequest request) {
        if (request.getAttribute(AAConstants.REFRESH_ZONES_KEY) == null) {
            request.setAttribute(AAConstants.REFRESH_ZONES_KEY, new HashSet());
            getRefreshZonesFromRequest(request);
        }

        Set zonesToRefresh = (Set)request.getAttribute(AAConstants.REFRESH_ZONES_KEY);
        return zonesToRefresh;
    }

    /**
     *
     * @param request
     */
    private static void getRefreshZonesFromRequest(ServletRequest request) {
        String[] zones = request.getParameterValues(AAConstants.ZONES_URL_KEY);
        if (zones != null) {
            for (int i1 = 0; zones != null && i1 < zones.length; i1++) {
                String zone1 = zones[i1].trim();
                addZonesToRefresh(request, zone1);
            }
        }
    }

    /**
     *
     * @param zone
     * @param bufferResponseWrapper
     * @return
     */
    static String getZoneContent(String zone, BufferResponseWrapper bufferResponseWrapper) {
        String res = bufferResponseWrapper.findSubstring(getZoneStartDelimiter(zone), getZoneEndDelimiter(zone));
        return res;
    }

    /**
     *
     * @param zone
     * @return
     */
    public static String getZoneStartDelimiter(String zone) {
        return "<div style=\"display:inline;\" id=\"" + zone.replaceAll("\"", "&quot;")  + "\">";
    }

    /**
     *
     * @param zone
     * @return
     */
    public static String getZoneEndDelimiter(String zone) {
        return AAConstants.END_OF_ZONE_PREFIX+zone+AAConstants.END_OF_ZONE_SUFFIX;
    }

}
