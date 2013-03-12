<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><fmt:message key="title.app"/> - <decorator:title/></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    <link rel="icon" href="<c:url value="/img/favicon.ico"/>" type="image/x-icon">

    <link rel="stylesheet" href="<c:url value="/css/jquery-ui-themes/redmond/jquery-ui-1.10.0.custom.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/bootstrap-2.2.2.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/bootstrap-2.2.2-responsive.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <link href='http://fonts.googleapis.com/css?family=Special+Elite' rel='stylesheet' type='text/css'>

    <script src="<c:url value="/js/jquery/jquery-1.9.1.min.js"/>"></script>
    <script src="<c:url value="/js/jquery/plugins/jquery-ui-1.10.0.custom.min.js"/>"></script>
    <script src="<c:url value="/js/modernizer/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script>

    <%-- Add additional header info --%>
    <decorator:head/>
</head>
<body <decorator:getProperty property="body.id"  writeEntireProperty="true" /> <decorator:getProperty property="body.class" writeEntireProperty="true" /> <decorator:getProperty property="body.style" writeEntireProperty="true"/> <decorator:getProperty property="body.onload" writeEntireProperty="true"/> <decorator:getProperty property="body.onunload" writeEntireProperty="true" /> >
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->
<div id="wrap">
    <!-- This code is taken from http://twitter.github.com/bootstrap/examples/hero.html -->
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="brand" href="<c:url value="/action/home"/>">AjaxAnywhere Test App</a>
                <div class="nav-collapse collapse">
                    <ul class="nav">
                        <li><a href="http://www.nerderg.com/AjaxAnywhere" target="_nerdErg">Documentation</a></li>
                        <li><a href="<c:url value="/action/examples"/>">Examples</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </div>

    <div id="main" class="container clear-top">
        <decorator:body/>
    </div>
</div>

<div class="container">
    <footer class="footer">
        <span>Sponsored by: </span>
        <a href="http://www.nerdErg.com" target="_nerdErg">
            <img class="logo" alt="nerdErg logo" src="<c:url value="/img/nerderg-logo.png"/>"/>
            <img class="name" alt="nerdErg - harness the power of the nerd" src="<c:url value="/img/nerderg-text.png"/>">
        </a>
    </footer>
</div>

<script src="<c:url value="/js/bootstrap/bootstrap-2.2.2.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/google-analytics.js"/>"></script>
<div id="spinner" style="display:none;"></div>
</body>
</html>