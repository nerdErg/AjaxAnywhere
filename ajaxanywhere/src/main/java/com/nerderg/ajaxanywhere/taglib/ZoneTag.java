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
import java.util.Arrays;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

import com.nerderg.ajaxanywhere.AAUtils;
import static com.nerderg.ajaxanywhere.AAConstants.*;

/**
 * @author Angel Ruiz (aruizca@gmail.com)
 *
 * @jsp.tag name = "zone"
 * display-name = "zone"
 * description = ""
 */
public class ZoneTag extends TagSupport {

    // TODO deprecate fragmentUrl in next version
    private String id, tag, fragmentUrl, href, jsBefore, jsAfter;

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

    public String getTag() {
        return tag != null && !tag.trim().equals("") ? tag : "div";
    }
    /**
     * @param tag String
     * @jsp.attribute required="false"
     * @jsp.attribute rtexprvalue="true"
     * @jsp.attribute type="java.lang.String"
     * @jsp.attribute description="html inline or block element tag to be generated instead of the default DIV block tag"
     */
    public void setTag(String tag) {
        this.tag = tag;
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

    public String getFragmentUrl() {
        return fragmentUrl;
    }

    /**
     * @deprecated
     * @param fragmentUrl String
     * @jsp.attribute required="false"
     * @jsp.attribute rtexprvalue="true"
     * @jsp.attribute type="java.lang.String"
     * @jsp.attribute description="url to get content when page is loaded"
     */
    public void setFragmentUrl(String fragmentUrl) {
        this.fragmentUrl = fragmentUrl;
    }

    public String getHref() {
        return href;
    }

    /**
     * @param href String
     * @jsp.attribute required="false"
     * @jsp.attribute rtexprvalue="true"
     * @jsp.attribute type="java.lang.String"
     * @jsp.attribute description="url to get content when page is loaded"
     */
    public void setHref(String href) {
        this.href = href;
    }

    public int doStartTag() throws JspException {
        try {
            // TODO remove fragmenturl support in next version
            if (fragmentUrl != null && fragmentUrl.trim().length() > 0) {
                pageContext.getOut().print(AAUtils.getZoneStartDelimiter(id, getTag(), fragmentUrl, jsBefore, jsAfter));
            } else if (href != null && href.trim().length() > 0) {
                pageContext.getOut().print(AAUtils.getZoneStartDelimiter(id, getTag(), href, jsBefore, jsAfter));
            } else {
                pageContext.getOut().print(AAUtils.getZoneStartDelimiter(id, getTag()));
            }

            ServletRequest request = pageContext.getRequest();
            if (AAUtils.isjQueryAjaxRequest(request)
                    && !Arrays.asList(AAUtils.getCommaSeparatedValuesAsStringArray(request, ZONES_URL_KEY)).contains(id)
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
            pageContext.getOut().print(AAUtils.getZoneEndDelimiter(id, getTag()));
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
