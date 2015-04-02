<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Find country</h4>
            </div>
            <div class="modal-body">
                <c:url var="action" value="/action/examples/dialog/submit" scope="request"/>
                <mvc:form aa-refresh-zones="tableZone" action="${action}" method="post"  commandName="countryForm" name="countryFormDialog" id="countryFormDialog">
                    <fieldset>
                        <mvc:label path="continentCode">
                            Select Continent:
                        </mvc:label>
                        <mvc:select path="continentCode" aa-refresh-zones="tableZone">
                            <mvc:option value="">-- Select One --</mvc:option>
                            <mvc:options items="${countryForm.continentsSet}" itemLabel="value" itemValue="key"/>
                        </mvc:select>
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
                </mvc:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

