<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Home</title>
    <meta name="decorator" content="main-layout"/>
</head>
<body>
    <div id="myCarousel" class="carousel slide">
        <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="active item">
                <img src="<c:url value="/img/AjaxAnywhere-logo.png"/>" border="0"/>
                <div class="carousel-caption">
                    <h4>AjaxAnywhere</h4>
                    <p>is an <strong>Open Source</strong> Java Ajax framework that enables the developer to <strong>add Ajax behavior to your web application without any Javascript coding</strong>.</p>
                </div>
            </div>
            <div class="item">
                <img src="<c:url value="/img/dependencies.png"/>" border="0"/>
                <div class="carousel-caption">
                    <h4>Start using it now!!!</h4>
                    <p>The very few dependencies enables AjaxAnywhere to be used in pretty much almost any application without worrying about classloader issues. Enable Ajax even in your legacy applications <strong>without any change to your controller code base</strong>.</p>
                </div>
            </div>
        </div>
        <!-- Carousel nav -->
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div>
</body>
</html>