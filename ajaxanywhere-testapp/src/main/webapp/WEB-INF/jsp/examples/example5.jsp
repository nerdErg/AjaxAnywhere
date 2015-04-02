<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>

<c:url var="action" value="/action/examples/5" scope="request"/>
<mvc:form action="${action}" method="post" class="form-horizontal" commandName="countryForm" id="countryForm">
    <fieldset>
        <legend>A more complete example</legend>
        <p>
            An examples that combines all the above to showcase a very common use case in our web applications:
        </p>
        <div class="form-group">
            <mvc:label class="col-md-2 control-label" path="countryCode">Country Code:</mvc:label>
            <div class="col-md-4">
                <mvc:input path="countryCode" class="form-control" readonly="true"/>
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-default btn-sm form-control"
                        data-toggle="modal" data-target="#myModal">
                    <i class="fa fa-search"> </i> Find country</button>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <input type="submit" aa-refresh-zones="aaZoneExample5" class="btn btn-primary" name="submitButton" value="Submit"/>
            </div>
        </div>
    </fieldset>
</mvc:form>
<aa:zone id="aaZoneExample5">
<c:if test="${not empty countryForm.countryCode}">
    <p>You have selected the country of: <strong>${countryForm.countryName}</strong></p>
</c:if>
</aa:zone>

<jsp:include page="/action/examples/dialog"/>