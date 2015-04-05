<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>

<c:url var="action" value="/action/examples/1" scope="request"/>
<mvc:form action="${action}" method="post" class="form-horizontal" commandName="countryForm" id="countryForm">
    <fieldset>
        <legend>Show me what you can do please!</legend>
        <p>
            With AjaxAnywhere you can do something like the example below <strong>without writing any Javascript</strong>.
            That means that all the behaviour in this widget has been specified declaratively.<br/>
            <strong>If that does not make you curious then I am not sure what will :-)</strong>
        </p>
        <div class="form-group">
            <mvc:label class="col-md-2 control-label" path="countryCode" for="countryCode2">Country :</mvc:label>
            <div class="col-md-4">
                <aa:zone id="countryDataZone">
                    <mvc:hidden path="countryCode" id="countryCode2"/>
                    <mvc:input path="countryName" class="form-control" readonly="true"/>
                </aa:zone>
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-default btn-sm form-control"
                        data-toggle="modal" data-target="#myModal">
                    <i class="fa fa-search"> </i> Choose country</button>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <input type="submit" aa-refresh-zones="aaZoneExample1" class="btn btn-primary" name="submitButton" value="Find capital"/>
            </div>
        </div>
    </fieldset>
</mvc:form>
<aa:zone id="aaZoneExample1">
<c:if test="${not empty countryForm.countryCode}">
    <p id="capitalText">The capital is: <strong>${countryForm.capital}</strong></p>
    <script>
        $('#capitalText').effect("highlight", 3000);
    </script>
</c:if>
</aa:zone>

<jsp:include page="/action/examples/dialog"/>