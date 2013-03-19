<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Home</title>
    <meta name="decorator" content="main-layout"/>
</head>
<body id="home">
    <div id="myCarousel" class="carousel slide" data-interval="10000">
        <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="active item">
                <img src="<c:url value="/img/AjaxAnywhere-logo.png"/>" alt="AjaxAnywhere logo" title="AjaxAnywhere logo" border="0"/>
                <div class="carousel-caption">
                    <h4>AjaxAnywhere</h4>
                    <p>is an <strong>Open Source</strong> Java Ajax framework that enables the developer to <strong>add Ajax behavior to your web application without any Javascript coding</strong>.</p>
                </div>
            </div>
            <div class="item">
                <img src="<c:url value="/img/features.png"/>" alt="Features summary" title="Features summary" border="0" usemap="#frameworks-map"/>
                <div class="carousel-caption">
                    <h4>Simplicity, Productivity and Maintainability</h4>
                    <p>and it integrates seamlessly with any of your favourite Java or JVM Action based Web Frameworks.</p>
                </div>
            </div>
            <div class="item">
                <img src="<c:url value="/img/dependencies.png"/>" alt="Dependencies" title="Dependencies" border="0"/>
                <div class="carousel-caption">
                    <h4>Start using it now!!!</h4>
                    <p>AjaxAnywhere has <strong>very few dependencies</strong>, which means <strong>you can use it pretty much Anywhere</strong>, including your legacy application without descending into dependency hell.</p>
                </div>
            </div>
        </div>
        <!-- Carousel nav -->
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div>

    <map name="frameworks-map">
        <area shape="rect" coords="28,37,159,78" target="_blank" href="http://struts.apache.org/development/2.x/index.html" title="Struts 2" alt="Struts 2">
        <area shape="rect" coords="178,37,328,78" target="_blank" href="http://grails.org/" title="Grails" alt="Grails">
        <area shape="rect" coords="355,37,559,93" target="_blank" href="http://www.springsource.org/spring-framework" title="Spring MVC" alt="Spring MVC">
        <area shape="rect" coords="575,37,724,78" target="_blank" href="https://extrema-sistemas.com/confluence/display/loom/About+Loom" title="Loom framework" alt="Loom framework">
        <area shape="rect" coords="740,37,882,78" target="_blank" href="http://www.stripesframework.org/display/stripes/Home" title="Stripes" alt="Stripes">
    </map>
</body>
</html>