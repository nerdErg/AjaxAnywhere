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

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import static com.nerderg.ajaxanywhere.AAConstants.*;

/**
 * @author Angel Ruiz (aruizca@gmail.com)
 */
public class AAFilter implements Filter {

    private Logger logger = Logger.getLogger(AAFilter.class.getCanonicalName());

    public void init(FilterConfig filterConfig) throws ServletException {
        // Do nothing
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String requestMapping = "";
        if (request instanceof HttpServletRequest) {
            requestMapping = ((HttpServletRequest) request).getRequestURI();
        }
        long start = System.currentTimeMillis();
        if (!AAUtils.isAjaxAnywhereRequest(request)) {
            filterChain.doFilter(servletRequest, response);
            logger.info("Request: \"" + requestMapping + "\" took: " + (System.currentTimeMillis() - start) + "ms" );
        } else {
            logger.info("Start handling Ajax request with AjaxAnywhere refresh zones on it.");
            // Set encoding for the XML response
            response.setContentType("text/xml;charset=utf-8");
            // Make sure there is no caching by the browser
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma", "no-cache");

            BufferResponseWrapper bufferResponseWrapper = new BufferResponseWrapper(response);

            try {
                filterChain.doFilter(request, bufferResponseWrapper);

                if (bufferResponseWrapper.getRedirect() == null) {
                    XMLHandler.sendZones(bufferResponseWrapper, AAUtils.getCommaSeparatedValuesAsStringArray(request, ZONES_URL_KEY), AAUtils.getCommaSeparatedValuesAsStringArray(request, ZONES_TAGS_KEY));
                } else {
                    XMLHandler.sendRedirect(bufferResponseWrapper);
                }
            } catch (Throwable e) {
                String simpleName = e.getCause().getClass().getSimpleName();
                if (!simpleName.equals("ClientAbortException")) {
                    logger.log(Level.SEVERE, e.getMessage(), e);
                    XMLHandler.handleError(response, e);
                }
            }
            logger.info("AjaxAnywhere Request: \"" + requestMapping + "\" took: " + (System.currentTimeMillis() - start) + "ms" );
        }
    }

    public void destroy() {
        // Do nothing
    }
}
