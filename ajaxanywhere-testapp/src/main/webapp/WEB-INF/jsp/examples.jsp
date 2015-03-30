<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>

<html>
<head>
    <title>Examples</title>
    <meta name="decorator" content="main-layout"/>
    <link href="<c:url value="/webjars/jquery.tocify.js/1.9.0/css/jquery.tocify.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/css/syntax-highlighter/shCore.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/css/syntax-highlighter/shThemeDefault.css"/>" rel="stylesheet" type="text/css" />
</head>
<body id="examples">
    <div class="row">
        <div class="col-md-9">
            <a name="example1"></a>
            <jsp:include page="examples/example1.jsp"/>

            <br/>
            <a name="example2"></a>
            <jsp:include page="examples/example2.jsp"/>

            <br/>
            <a name="example3"></a>
            <%--<jsp:include page="examples/example3.jsp"/>--%>

            <br/>
            <a name="example4"></a>
            <%--<jsp:include page="examples/example4.jsp"/>--%>

            <br/>
            <a name="example5"></a>
            <%--<jsp:include page="examples/example5.jsp"/>--%>

            <hr/>
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
<script src="<c:url value="/webjars/jquery-ui/1.11.4/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/webjars/jquery.tocify.js/1.9.0/js/jquery.tocify.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/syntax-highlighter/shCore.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/syntax-highlighter/shBrushXml.js"/>"></script>
</body>
</html>
