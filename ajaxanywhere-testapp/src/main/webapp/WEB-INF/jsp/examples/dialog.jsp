<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<c:url var="action" value="/action/examples/dialog/submit" scope="request"/>
<sf:form action="${action}" method="post" aa-refresh-zones="tableZone" commandName="countryForm" name="countryFormDialog" id="countryFormDialog">
    <fieldset>
        <sf:label path="continentCode" for="continentCodeDialog">
            Select Continent:
        </sf:label>
        <sf:select path="continentCode" id="continentCodeDialog" aa-refresh-zones="tableZone">
            <sf:option value="">-- Select One --</sf:option>
            <sf:options items="${countryForm.continentsSet}" itemLabel="value" itemValue="key"/>
        </sf:select>
    </fieldset>
    <aa:zone id="tableZone">
        <display:table list="${countryForm.countriesSet}"
                       class="table table-condensed table-hover table-striped table-bordered selectable"
                pagesize="10"
                requestURI="/action/examples/dialog/submit"
                id="countryMapEntry"
                excludedParams="aazones">
            <display:column title="Code">
                ${countryMapEntry.key}
            </display:column>
            <display:column title="Country">
                ${countryMapEntry.value}
            </display:column>
        </display:table>
        <script>
            $("span.pagelinks a").click(function(event){
                event.preventDefault();
                AjaxAnywhere.submitAjaxAnywhereLink($(this).attr("href"), "tableZone");
            });

            $("table.selectable > tbody tr").click(function (event){
                $("input#countryCode2").val($(this).find("td:first").text().trim());
                $("div#country-search-dialog").dialog("close");
            });
        </script>
    </aa:zone>
</sf:form>
