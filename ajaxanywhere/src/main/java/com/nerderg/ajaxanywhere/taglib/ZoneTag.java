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
package com.nerderg.ajaxanywhere.taglib;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

import com.nerderg.ajaxanywhere.AAUtils;

/**
 * @author Angel Ruiz (aruizca@gmail.com)
 *
 * @jsp.tag name = "zone"
 * display-name = "zone"
 * description = ""
 */
public class ZoneTag extends TagSupport {

    private String id, fragmentUrl, jsBefore, jsAfter;

    public String getId() {
        return id;
    }

    /**
     * @param id String
     * @jsp.attribute required="true"
     * @jsp.attribute rtexprvalue="true"
     * @jsp.attribute type="java.lang.String"
     * @jsp.attribute description="id of layer to be refreshed"
     */
    public void setId(String id) {
        this.id = id;
    }

    public String getFragmentUrl() {
        return fragmentUrl;
    }

    public String getJsBefore() {
        return jsBefore;
    }

    /**
     * @param jsBefore String
     * @jsp.attribute required="false"
     * @jsp.attribute rtexprvalue="true"
     * @jsp.attribute type="java.lang.String"
     * @jsp.attribute description="javascript that will get evaluated before the Ajax request"
     */
    public void setJsBefore(String jsBefore) {
        this.jsBefore = jsBefore;
    }

    public String getJsAfter() {
        return jsAfter;
    }

    /**
     * @param jsAfter String
     * @jsp.attribute required="false"
     * @jsp.attribute rtexprvalue="true"
     * @jsp.attribute type="java.lang.String"
     * @jsp.attribute description="javascript that will get evaluated after the Ajax request"
     */
    public void setJsAfter(String jsAfter) {
        this.jsAfter = jsAfter;
    }

    /**
     * @param fragmentUrl String
     * @jsp.attribute required="false"
     * @jsp.attribute rtexprvalue="true"
     * @jsp.attribute type="java.lang.String"
     * @jsp.attribute description="url to get content when page is loaded"
     */
    public void setFragmentUrl(String fragmentUrl) {
        this.fragmentUrl = fragmentUrl;
    }

    public int doStartTag() throws JspException {
        try {
            if (fragmentUrl != null && fragmentUrl.trim().length() > 0) {
                pageContext.getOut().print(AAUtils.getZoneStartDelimiter(id, fragmentUrl, jsBefore, jsAfter));
            } else {
                pageContext.getOut().print(AAUtils.getZoneStartDelimiter(id));
            }

            ServletRequest request = pageContext.getRequest();
            if (AAUtils.isjQueryAjaxRequest(request)
                    && !AAUtils.getZonesToRefresh(request).contains(id)
                    ) {
                return SKIP_BODY;
            } else {
                return EVAL_BODY_INCLUDE;
            }
        } catch (IOException e) {
            throw new JspException(e);
        }
    }

    public int doEndTag() throws JspException {
        try {
            pageContext.getOut().print(AAUtils.getZoneEndDelimiter(id));
        } catch (IOException e) {
            throw new JspException(e);
        }
        return EVAL_PAGE;
    }

    public int doAfterBody() throws JspException {
        return super.doAfterBody();
    }


    public void setPageContext(PageContext pageContext) {
        super.setPageContext(pageContext);
    }
}
