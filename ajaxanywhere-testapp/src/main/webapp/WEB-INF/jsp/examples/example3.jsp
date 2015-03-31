<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>

<c:url var="action" value="/action/examples/3" scope="request"/>
<mvc:form action="${action}" class="form-horizontal" method="post" commandName="countryForm" id="countryForm">
    <fieldset>
        <legend>Ajaxify select inputs</legend>
        <p>
            This is the classic examples of dependable drop down lists, With AjaxAnywhere is extremely easy and clean to implement:
        </p>
        <div class="form-group">
            <mvc:label class="col-md-2 control-label" for="continentCode">
                Select Continent:
            </mvc:label>
            <div class="col-md-4">
            <mvc:select aa-refresh-zones="countryZone, capitalZone" path="continentCode" class="form-control" id="continentCode">
                <mvc:option value="">-- Select One --</mvc:option>
                <mvc:options items="${countryForm.continentsSet}" itemLabel="value" itemValue="key"/>
            </mvc:select>
            </div>
        </div>
        <div class="form-group">
            <mvc:label class="col-md-2 control-label" for="countryCode">
                Select Country:
            </mvc:label>
            <div class="col-md-4">
            <aa:zone id="countryZone">
                <mvc:select aa-refresh-zones="capitalZone" path="countryCode" class="form-control" id="countryCode">
                    <c:choose>
                        <c:when test="${empty countryForm.countriesSet}">
                            <option value="">-- Select Continent First --</option>
                        </c:when>
                        <c:otherwise>
                            <mvc:option value="">-- Select One --</mvc:option>
                            <mvc:options items="${countryForm.countriesSet}" itemLabel="value" itemValue="key"/>
                        </c:otherwise>
                    </c:choose>
                </mvc:select>
            </aa:zone>
            </div>
        </div>
        <div class="form-group">
        <aa:zone id="capitalZone">
            <mvc:label class="col-md-2 control-label" path="countryCode" for="capital">
                Capital:
            </mvc:label>
            <input type="text" value="${countryForm.capital}" readonly="readonly"/>
        </aa:zone>
        </div>
        <div class="controls">
            <input type="submit" aa-refresh-zones="codeZone" class="btn btn-info" name="showCodeButton" value="Show Code"/>
        </div>
   </fieldset>
</mvc:form>
<div id="code3Layer" class="codeLayer">
    <aa:zone id="codeZone">
        <c:if test="${not empty code}">
            <label><strong>JSP Code:</strong></label>
            <pre class="brush: html; highlight: [3,16,23,24,36,43,48]">${code}</pre>
            <a class="btn btn-danger closeCode scroll" href="#example3"><i class="ui-icon-close"></i>Hide Code</a>
            <script>
                $("div#code3Layer").hide()
                SyntaxHighlighter.highlight();
                $("div#code3Layer").show("blind", {direction: 'up'}, 1000);
            </script>
        </c:if>
    </aa:zone>
</div>