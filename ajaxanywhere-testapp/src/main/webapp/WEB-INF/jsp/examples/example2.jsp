<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>

<c:url var="action" value="/action/examples/2" scope="request"/>
<form action="${action}" method="post">
    <fieldset>
        <legend>Ajaxify form buttons</legend>
        <p>
            Next we can see how to "ajaxify" the form buttons individually and specifying the zones to refresh for each of them:
        </p>
        <label>Type something:</label>
        <input type="text" name="someText" value="">
        <div>
            <button type="submit" aa-refresh-zones="aaZone1Example2" class="btn btn-primary" name="refreshTextButton" value="Refresh Text">Refresh Text</button>
            <input type="image"aa-refresh-zones="aaZone1Example2" src="<c:url value="/img/refresh.png"/>" name="refreshTextButton" value="Refresh Text"/>
            <input type="submit" aa-refresh-zones="aaZone2Example2" class="btn btn-info" name="showCodeButton" value="Show Code"/>
        </div>
        <p>
        <aa:zone id="aaZone1Example2">
            <strong>Text introduced by user:</strong>
            <strong>
            <c:choose>
                <c:when test="${empty requestScope.someText}">
                    <span class="text-info">This text will only be refreshed with the user text when the "Refresh Text" button is pressed.</span>
                </c:when>
                <c:otherwise>
                    <span class="text-success">${someText}</span>
                    <script>
                        $("div#aaZone1Example2").effect("highlight", 3000);
                    </script>
                </c:otherwise>
            </c:choose>
            </strong>
        </aa:zone>
        </p>
    </fieldset>
</form>
<div id="code2Layer" class="codeLayer">
    <aa:zone id="aaZone2Example2">
        <c:if test="${not empty code}">
            <label><strong>JSP Code:</strong></label>
            <pre class="brush: html; highlight: [3,6,15,16,17,20,40]">${code}</pre>
            <a class="btn btn-danger closeCode scroll" href="#example2"><i class="ui-icon-close"></i>Hide Code</a>
            <script>
                $("div#code2Layer").hide()
                SyntaxHighlighter.highlight();
                $("div#code2Layer").show("blind", {direction: 'up'}, 1000);
            </script>
        </c:if>
    </aa:zone>
</div>