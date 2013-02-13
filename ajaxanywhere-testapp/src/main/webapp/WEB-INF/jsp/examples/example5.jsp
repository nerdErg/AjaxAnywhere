<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<c:url var="action" value="/action/examples/5" scope="request"/>
<sf:form action="${action}" method="post" commandName="countryForm" id="countryForm">
    <fieldset>
        <legend>Another cooler example</legend>
        <sf:label path="countryCode" for="countryCode2">
            Country Code:
        </sf:label>
        <sf:input path="countryCode" readonly="true" id="countryCode2"/>
        <a class="btn" id="search-country-button"
           href="<c:url value="/action/examples/dialog"/>"
           style="margin-bottom: 10px;"><i class="icon-search"></i>Search</a>
        <div>
            <input type="submit" aa-refresh-zones="aaZoneExample5" class="btn btn-primary" name="submitButton" value="Submit"/>
        </div>
    </fieldset>
</sf:form>
<aa:zone id="aaZoneExample5">
<c:if test="${not empty countryForm.countryCode}">
    <p>You have selected the country of: <strong>${countryForm.countryName}</strong></p>
</c:if>
</aa:zone>
<div id="country-search-dialog">
</div>

<script>
    $("div#country-search-dialog").dialog({
        autoOpen: false,
        modal: true,
        title: 'Search Country',
        resizable: false,
        width: 500,
        height: 527,
        maxHeight: 600
    });

    $("a#search-country-button").click(function(event){
        event.preventDefault();
        $.post("<c:url value="/action/examples/dialog"/>", function(data) {
            $("div#country-search-dialog").html(data);
        });

        $("div#country-search-dialog").dialog("open");
    });
</script>