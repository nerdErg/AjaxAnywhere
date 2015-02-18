package com.nerderg.ajaxanywhere.tests.unit;

import com.nerderg.ajaxanywhere.taglib.ZoneTag;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockJspWriter;
import org.springframework.mock.web.MockPageContext;
import org.springframework.mock.web.MockServletContext;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import static java.lang.System.*;

import javax.servlet.jsp.JspException;

/**
 * Created by Angel Ruiz
 */
public class TestZoneTagLib {

    MockPageContext mockPageContext;
    MockServletContext mockServletContext;
    ZoneTag zoneTag;

    @Before
    public void setup() {

        // mock ServletContext
        mockServletContext = new MockServletContext();
        // mock PageContext
        mockPageContext = new MockPageContext(mockServletContext);
        zoneTag = new ZoneTag();
        zoneTag.setPageContext(mockPageContext);
    }

    @Test
    public void testTag1() {
        try {
            zoneTag.setId("whatever");
            zoneTag.doStartTag();
            zoneTag.doEndTag();
            String output = ((MockHttpServletResponse)mockPageContext.getResponse()).getContentAsString();

            out.println(output);
            assertThat(output, is("<div id=\"whatever\" style=\"display:inline;\"><!-- @end of zone [whatever]@ --></div>"));


        }catch(Exception e){
            System.out.println(e.getStackTrace());
        }

    }

    @Test
    public void testTag2() {
        try {
            zoneTag.setId("whatever");
            zoneTag.setFragmentUrl("http://whatever.com/whatever");
            zoneTag.setJsBefore("beforeJs();");
            zoneTag.setJsAfter("afterJs();");
            zoneTag.doStartTag();
            zoneTag.doEndTag();
            String output = ((MockHttpServletResponse)mockPageContext.getResponse()).getContentAsString();

            out.println(output);
            assertThat(output, is("<div id=\"whatever\" aa-fragment-url=\"http://whatever.com/whatever\" style=\"display:inline;\" aa-js-before=\"beforeJs();\" aa-js-after=\"afterJs();\"><!-- @end of zone [whatever]@ --></div>"));


        }catch(Exception e){
            System.out.println(e.getStackTrace());
        }

    }

    @Test
    public void testTag3() {
        try {
            zoneTag.setId("whatever");
            zoneTag.setFragmentUrl("http://whatever.com/whatever");
            zoneTag.setJsAfter("afterJs();");
            zoneTag.doStartTag();
            zoneTag.doEndTag();
            String output = ((MockHttpServletResponse)mockPageContext.getResponse()).getContentAsString();

            out.println(output);
            assertThat(output, is("<div id=\"whatever\" aa-fragment-url=\"http://whatever.com/whatever\" style=\"display:inline;\" aa-js-after=\"afterJs();\"><!-- @end of zone [whatever]@ --></div>"));


        }catch(Exception e){
            System.out.println(e.getStackTrace());
        }

    }

    @Test
    public void testTag4() {
        try {
            zoneTag.setId("whatever");
            zoneTag.setFragmentUrl("http://whatever.com/whatever");
            zoneTag.setJsBefore("beforeJs();");
            zoneTag.doStartTag();
            zoneTag.doEndTag();
            String output = ((MockHttpServletResponse)mockPageContext.getResponse()).getContentAsString();

            out.println(output);
            assertThat(output, is("<div id=\"whatever\" aa-fragment-url=\"http://whatever.com/whatever\" style=\"display:inline;\" aa-js-before=\"beforeJs();\"><!-- @end of zone [whatever]@ --></div>"));


        }catch(Exception e){
            System.out.println(e.getStackTrace());
        }

    }

    @Test
    public void testTag5() {
        try {
            zoneTag.setId("whatever");
            zoneTag.setJsBefore("beforeJs();");
            zoneTag.setJsAfter("afterJs();");
            zoneTag.doStartTag();
            zoneTag.doEndTag();
            String output = ((MockHttpServletResponse)mockPageContext.getResponse()).getContentAsString();

            out.println(output);
            assertThat(output, is("<div id=\"whatever\" style=\"display:inline;\"><!-- @end of zone [whatever]@ --></div>"));


        }catch(Exception e){
            System.out.println(e.getStackTrace());
        }

    }

    @Test
    public void testTag6() {
        try {
            zoneTag.setId("whatever");
            zoneTag.setTag("tbody");
            zoneTag.doStartTag();
            zoneTag.doEndTag();
            String output = ((MockHttpServletResponse)mockPageContext.getResponse()).getContentAsString();

            out.println(output);
            assertThat(output, is("<tbody id=\"whatever\"><!-- @end of zone [whatever]@ --></tbody>"));


        }catch(Exception e){
            System.out.println(e.getStackTrace());
        }

    }
}
