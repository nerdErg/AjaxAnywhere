<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>

<fieldset>
    <legend>Ajaxify links</legend>
    <p>
        Normal links that are not associated with any form element can be "ajaxified" too. You can also check how AjaxAnywhere handles the possible redirects automatically:
    </p>
</fieldset>
<a href="<c:url value="/action/examples/4?data=whatever"/>" aa-refresh-zones="codeLayer4">Show Code</a>
&nbsp | &nbsp;
<a href="<c:url value="/action/examples/4?data=redirect"/>" aa-refresh-zones="codeLayer4">Redirect Test</a>
<div id="code4Layer" class="codeLayer">
    <aa:zone id="codeLayer4">
        <c:if test="${not empty code}">
            <label><strong>JSP Code:</strong></label>
            <pre class="brush: html; highlight: [3,11,13]">${code}</pre>
            <a class="btn btn-danger closeCode scroll" href="#example4"><i class="ui-icon-close"></i>Hide Code</a>
            <script>
                $("div#code4Layer").hide()
                SyntaxHighlighter.highlight();
                $("div#code4Layer").show("blind", {direction: 'up'}, 1000);
            </script>
        </c:if>
    </aa:zone>
</div>