<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://com.nerderg/ajaxanywhere" prefix="aa" %>

<html>
<head>
    <title>Examples</title>
    <meta name="decorator" content="main-layout"/>
    <link href="<c:url value="/css/docs.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/css/bootstrapdocs.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/css/syntax-highlighter/shCore.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/css/syntax-highlighter/shThemeDefault.css"/>" rel="stylesheet" type="text/css" />

    <script src="<c:url value="/js/jquery-aa.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/syntax-highlighter/shCore.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/syntax-highlighter/shBrushXml.js"/>"></script>
</head>
<body id="examples">
    <div class="row">
        <div class="span3 bs-docs-sidebar">
            <ul class="nav nav-tabs nav-stacked bs-docs-sidenav affix">
                <li class="active">
                    <a href="#example1" class="scroll">
                        <i class="icon-chevron-right"></i>
                        Ajaxify entire forms
                    </a>
                </li>
                <li>
                    <a href="#example2" class="scroll">
                        <i class="icon-chevron-right"></i>
                        Ajaxify form buttons
                    </a>
                </li>
                <li>
                    <a href="#example3" class="scroll">
                        <i class="icon-chevron-right"></i>
                        Ajaxify select inputs
                    </a>
                </li>
                <li>
                    <a href="#example4" class="scroll">
                        <i class="icon-chevron-right"></i>
                        Ajaxify links
                    </a>
                </li>
                <li>
                    <a href="#example5" class="scroll">
                        <i class="icon-chevron-right"></i>
                        A cooler example
                    </a>
                </li>
            </ul>
        </div>
        <div class="span9">
            <a name="example1"></a>
            <jsp:include page="examples/example1.jsp"/>

            <hr/>
            <a name="example2"></a>
            <jsp:include page="examples/example2.jsp"/>

            <hr/>
            <a name="example3"></a>
            <jsp:include page="examples/example3.jsp"/>

            <hr/>
            <a name="example4"></a>
            <jsp:include page="examples/example4.jsp"/>

            <hr/>
            <a name="example5"></a>
            <jsp:include page="examples/example5.jsp"/>

            <hr/>
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
</body>
</html>
