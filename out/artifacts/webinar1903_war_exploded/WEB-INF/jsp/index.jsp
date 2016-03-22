<%--
  Created by IntelliJ IDEA.
  User: Azon
  Date: 19.03.2016
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Светофор</title>
    <spring:url value="/css/index.css" var="indexCss" />
    <link rel="stylesheet" type="text/css" media="all" href="${indexCss}" />

    <spring:url value="/js/jquery-2.1.3.min.js" var="jqueryJs"/>
    <script src="${jqueryJs}" type="text/javascript"></script>
</head>
<body>
<form class="main" action="${contextPath}/lights" method="get">
    <div>
        <div>Введите количество минут (2 - зеленый, 3 - желтый, 4 - красный):</div>
        <input type="text" name="minutes" placeholder="Количество минут">
        <input type="submit" value="Включить">
    </div>
    <div id="color" hidden="true">${light}</div>
    <div id="light" class="color_font_size grey"></div>
</form>
</body>
<script type="text/javascript">
    var light = $("#color").text();
    if (light == "Зеленый") {
        $("#light").removeClass("grey");
        $("#light").addClass("green");
        setTimeout(function(){
            $("#light").text("");
            $("#light").removeClass("green");
            $("#light").addClass("grey");
        }, 2000*2);
    }
    else if (light =="Желтый") {
        $("#light").removeClass("grey");
        $("#light").addClass("yellow");
        setTimeout(function(){
            $("#light").text("");
            $("#light").removeClass("yellow");
            $("#light").addClass("grey");
        }, 60000*3);
    }
    else if (light == "Красный") {
        $("#light").removeClass("grey");
        $("#light").addClass("red");
        setTimeout(function(){
            $("#light").text("");
            $("#light").removeClass("red");
            $("#light").addClass("grey");
        }, 40000*4);
    }

</script>
<noscript><div><img src="//mc.yandex.ru/watch/30605492" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
</html>
