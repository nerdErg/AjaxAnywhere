<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>

<c:url var="action" value="/action/examples/3" scope="request"/>
<form action="${action}" class="form-horizontal" method="post">
    <fieldset>
        <legend>Ajaxify form buttons</legend>
        <p>
            Next we can see how to "ajaxify" the form buttons individually and specifying the zones to refresh for each of them:
        </p>

        <div class="form-group">
            <label class="col-md-2 control-label" for="example3TextField">Type something:</label>
            <div class="col-md-4">
                <input type="text" id="example3TextField" class="form-control" name="someText" value="">
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <button type="submit" aa-refresh-zones="aaZone1Example3" class="btn btn-primary" name="refreshTextButton" value="Refresh Text">Refresh Text</button>
                &nbsp;&nbsp;
                <input type="image"aa-refresh-zones="aaZone1Example3" src="<c:url value="/img/refresh.png"/>" name="refreshTextButton" value="Refresh Text"/>
                &nbsp;&nbsp;
                <input type="submit" aa-refresh-zones="aaZone2Example3" class="btn btn-info" name="showCodeButton" value="Show Code"/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-12">
            <aa:zone id="aaZone1Example3">
                <strong>Text introduced by user:</strong>
                <strong>
                <c:choose>
                    <c:when test="${empty requestScope.someText}">
                        <span class="text-info">This text will only be refreshed with the user text when the "Refresh Text" button is pressed.</span>
                    </c:when>
                    <c:otherwise>
                        <span class="text-success">${someText}</span>
                        <script>
                            $("div#aaZone1Example3").effect("highlight", 3000);
                        </script>
                    </c:otherwise>
                </c:choose>
                </strong>
            </aa:zone>
            </div>
        </div>
    </fieldset>
</form>
<div id="code2Layer" class="codeLayer">
    <aa:zone id="aaZone2Example3">
        <c:if test="${not empty code}">
            <label><strong>JSP Code:</strong></label>
            <pre class="brush: html; highlight: [3,6,22,24,26,32,53]">${code}</pre>
            <a class="btn btn-danger closeCode scroll" href="#example3"><i class="ui-icon-close"></i>Hide Code</a>
            <script>
                $("div#code2Layer").hide();
                SyntaxHighlighter.highlight();
                $("div#code2Layer").show("blind", {direction: 'up'}, 1000);
            </script>
        </c:if>
    </aa:zone>
</div>