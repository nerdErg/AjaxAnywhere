/*
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
package com.nerderg.ajaxanywhere.tests.unit;

import com.nerderg.ajaxanywhere.AAUtils;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import static com.nerderg.ajaxanywhere.AAConstants.*;

/**
 * @author Angel Ruiz (aruizca@gmail.com)
 */
public class TestAAUtils {

    MockHttpServletRequest mockHttpServletRequest;

    @Before
    public void setup() {
        mockHttpServletRequest = new MockHttpServletRequest();
    }

    @Test
    public void testRetrievalOfSingleRefreshZone() {
        mockHttpServletRequest.setParameter("aazones", "whateverZone");
        mockHttpServletRequest.setParameter("aatags", "tbody");

        assertThat(AAUtils.getCommaSeparatedValuesAsStringArray(mockHttpServletRequest, ZONES_URL_KEY), is(new String[] {"whateverZone"}));
        assertThat(AAUtils.getCommaSeparatedValuesAsStringArray(mockHttpServletRequest, ZONES_TAGS_KEY), is(new String[] {"tbody"}));
    }

    @Test
    public void testRetrievalOfMultipleRefreshZones() {
        mockHttpServletRequest.setParameter("aazones", "zone1,zone2");
        mockHttpServletRequest.setParameter("aatags", "div,tbody");

        assertThat(AAUtils.getCommaSeparatedValuesAsStringArray(mockHttpServletRequest, ZONES_URL_KEY), is(new String[] {"zone1", "zone2"}));
        assertThat(AAUtils.getCommaSeparatedValuesAsStringArray(mockHttpServletRequest, ZONES_TAGS_KEY), is(new String[] {"div", "tbody"}));
    }

    @Test
    public void testAjaxRequestWasMadeByJquery() {
        assertThat(AAUtils.isjQueryAjaxRequest(mockHttpServletRequest), is(false));

        mockHttpServletRequest.addHeader(AJAX_HEADER_INDENTIFIER_KEY, AJAX_HEADER_INDENTIFIER_VALUE);
        assertThat(AAUtils.isjQueryAjaxRequest(mockHttpServletRequest), is(true));
    }
}
