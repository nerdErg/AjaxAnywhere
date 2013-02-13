package com.nerderg.ajaxanywhere.web.util;

import org.apache.commons.io.IOUtils;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.io.StringWriter;

/**
 * @author Angel Ruiz
 *         Date: 9/02/13
 */
public class WebUtil {
    public static String getPageSourceCode(ServletContext servletContext, String pageLocation) {
        StringWriter stringWriter = new StringWriter();
        try {
            IOUtils.copy(servletContext.getResourceAsStream(pageLocation), stringWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return HtmlUtils.htmlEscape(stringWriter.toString());
    }
}
