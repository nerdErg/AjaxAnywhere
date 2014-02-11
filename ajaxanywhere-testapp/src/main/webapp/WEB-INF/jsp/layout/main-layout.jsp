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
    <link rel="stylesheet" href="<c:url value="webjars/bootstrap/2.2.2/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="webjars/bootstrap/2.2.2/css/bootstrap-responsive.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <link href='http://fonts.googleapis.com/css?family=Special+Elite' rel='stylesheet' type='text/css'>

    <script src="<c:url value="webjars/jquery/1.9.1/jquery.min.js"/>"></script>
    <script src="<c:url value="webjars/bootstrap/2.2.2/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/js/jquery/plugins/jquery-ui-1.10.0.custom.min.js"/>"></script>
    <%--<script src="<c:url value="/js/modernizer/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script>--%>

    <%-- Add additional header info --%>
    <decorator:head/>
</head>
<body <decorator:getProperty property="body.id"  writeEntireProperty="true" /> <decorator:getProperty property="body.class" writeEntireProperty="true" /> <decorator:getProperty property="body.style" writeEntireProperty="true"/> <decorator:getProperty property="body.onload" writeEntireProperty="true"/> <decorator:getProperty property="body.onunload" writeEntireProperty="true" /> >
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand home" href="<c:url value="/action/home"/>">AjaxAnywhere (Reloaded)</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><a class="examples" href="<c:url value="/action/examples"/>" title="Examples">Examples</a></li>
                    <li><a href="http://www.nerderg.com/AjaxAnywhere" target="_nerdErg" title="Documentation">Documentation</a></li>
                    <li><a href="#" id="grails-plugin" rel="popover">Grails Plugin</a></li>
                    <li><a href="http://nerderg.com/AjaxAnywhere#download" id="download" target="_nerdErg" title="Download">Download</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>

<div id="main" class="container clear-top">
    <decorator:body/>
</div>

<div class="container">
    <footer class="footer">
        <span>Sponsored by: </span>
        <a href="http://www.nerdErg.com" target="_nerdErg">
            <img class="logo" alt="nerdErg logo" src="<c:url value="/img/nerderg-logo.png"/>"/>
            <img class="name" alt="nerdErg - harness the power of the nerd" src="<c:url value="/img/nerderg-text.png"/>">
        </a>
        <div id="social">
            <a href="https://twitter.com/nerdErg" target="_blank">
                <img src="<c:url value="/img/Twitter.png"/>" title="nerdErg Twitter account" alt="nerdErg Twitter account">
            </a>
            <a href="https://plus.google.com/u/0/communities/110661434396927001866" target="_blank">
                <img src="<c:url value="/img/Google+.png"/>" title="nerdErg Google+ page" alt="nerdErg Google+ page">
            </a>
            <a href="http://www.nerderg.com/feed/rss/news" target="_nerdErg">
                <img src="<c:url value="/img/Feed.png"/>" title="nerdErg new feed" alt="nerdErg new feed">
            </a>
            <a href="http://www.linkedin.com/company/642670?trk=tyah" target="_blank">
                <img src="<c:url value="/img/LinkedIn.png"/>" title="nerdErg LinkedIn page" alt="nerdErg LinkedIn page">
            </a>
            <br/>
            <span>Copyright © nerdErg Pty Ltd 2013</span>
        </div>
    </footer>
</div>

<script src="<c:url value="/js/bootstrap/bootstrap-2.2.2.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<script src="<c:url value="/js/google-analytics.js"/>"></script>
<div id="spinner" style="display:none;"></div>

</body>
</html>