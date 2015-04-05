<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>

<html>
<head>
    <title>Examples</title>
    <meta name="decorator" content="main-layout"/>
    <link href="<c:url value="/webjars/font-awesome/4.3.0/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/webjars/jquery.tocify.js/1.9.0/css/jquery.tocify.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/webjars/syntaxhighlighter/3.0.83/styles/shCore.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/webjars/syntaxhighlighter/3.0.83/styles/shThemeDefault.css"/>" rel="stylesheet" type="text/css" />
</head>
<body id="examples">
    <div class="row">
        <div class="col-md-9">
            <c:import url="/action/examples/1"/>

            <br/>
            <jsp:include page="examples/example2.jsp"/>

            <br/>
            <jsp:include page="examples/example3.jsp"/>

            <br/>
            <jsp:include page="examples/example4.jsp"/>

            <br/>
            <jsp:include page="examples/example5.jsp"/>

        </div>
        <div class="col-md-3">
            <div id="toc"></div>
        </div>
    </div>
<script>
    $("ul.bs-docs-sidenav LI").click(function () {
        $("ul.bs-docs-sidenav LI").each(function() {
            $(this).removeClass("active")
        });
        $(this).addClass("active");
    });
</script>
<script src="<c:url value="/webjars/ajaxanywhere/2.1/aa.js"/>"></script>
<script src="<c:url value="/webjars/iframe-resizer/2.8.5-SNAPSHOT/js/iframeResizer.contentWindow.min.js"/>"></script>
<script src="<c:url value="/webjars/jquery-ui/1.11.4/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/webjars/jquery.tocify.js/1.9.0/js/jquery.tocify.min.js"/>"></script>
<script src="<c:url value="/webjars/syntaxhighlighter/3.0.83/scripts/XRegExp.js"/>"></script>
<script src="<c:url value="/webjars/syntaxhighlighter/3.0.83/scripts/shCore.js"/>"></script>
<script src="<c:url value="/webjars/syntaxhighlighter/3.0.83/scripts/shBrushXml.js"/>"></script>
</body>
</html>
