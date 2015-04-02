<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>

<c:url var="action" value="/action/examples/1" scope="request"/>
<form aa-refresh-zones="aaZone1Example1, aaZone2Example1" action="${action}" class="form-horizontal" method="post">
    <fieldset>
        <legend>Ajaxify entire forms</legend>
        <p>
            This example shows how you can "ajaxify" an entire form simply adding in the attribute:
            <strong><pre>aa-refresh-zones="aaZone1Example1, aaZone2Example1"</pre></strong>
            This is only recommended for simple forms as all the buttons within the form refresh the same zones.
        </p>

        <div class="form-group">
            <label class="col-md-2 control-label" for="example1TextField">Type something:</label>
            <div class="col-md-4">
                <input type="text" id="example1TextField" class="form-control" name="someText" value="">
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <button type="submit" class="btn btn-primary" name="refreshTextButton"  value="Submit"> Refresh Text</button>
                <input type="submit" class="btn btn-info" name="showCodeButton" value="Show Code"/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-12">
            <aa:zone id="aaZone1Example1">
                <strong>Text introduced by user:</strong>
                <strong>
                <c:choose>
                    <c:when test="${empty requestScope.someText}">
                        <span class="text-info">This text will only be refreshed with the user text when the "Refresh Text" button is pressed.</span>
                    </c:when>
                    <c:otherwise>
                        <span class="text-success">${someText}</span>
                        <script>
                            $("div#aaZone1Example1").effect("highlight", 3000);
                        </script>
                    </c:otherwise>
                </c:choose>
                </strong>
            </aa:zone>
            </div>
        </div>
    </fieldset>
</form>

<div id="code1Layer" class="codeLayer">
    <aa:zone id="aaZone2Example1">
        <c:if test="${not empty code}">
            <label><strong>JSP Code:</strong></label>
            <pre class="brush: html; highlight: [3,6,32,54]">${code}</pre>
            <a class="btn btn-danger closeCode scroll" href="#example1"><i class="ui-icon-close"></i>Hide Code</a>
            <script>
                $("div#code1Layer").hide()
                SyntaxHighlighter.highlight();
                $("div#code1Layer").show("blind", {direction: 'up'}, 1000);
            </script>
        </c:if>
    </aa:zone>
</div>