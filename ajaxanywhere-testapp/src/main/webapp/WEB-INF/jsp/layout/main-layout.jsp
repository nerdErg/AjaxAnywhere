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

    <link rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.3.4/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <link href='http://fonts.googleapis.com/css?family=Special+Elite' rel='stylesheet' type='text/css'>

    <script src="<c:url value="/webjars/jquery/1.11.2/jquery.min.js"/>"></script>

    <%-- Add additional header info --%>
    <decorator:head/>
</head>
<body <decorator:getProperty property="body.id"  writeEntireProperty="true" /> <decorator:getProperty property="body.class" writeEntireProperty="true" /> <decorator:getProperty property="body.style" writeEntireProperty="true"/> <decorator:getProperty property="body.onload" writeEntireProperty="true"/> <decorator:getProperty property="body.onunload" writeEntireProperty="true" /> >


<div id="main" class="container clear-top">
    <decorator:body/>
</div>


<script src="<c:url value="/webjars/bootstrap/3.3.4/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/common.js"/>"></script>
<div id="spinner" style="display:none;"></div>

</body>
</html>