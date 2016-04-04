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
<form class="main" action="${contextPath}/lights" method="post">
    <div>
        <div>Введите количество секунд (2 - зеленый, 3 - желтый, 4 - красный):</div>
        <input type="text" name="seconds" placeholder="Количество секунд">
        <input type="submit" value="Включить">
    </div>
    <div id="color" hidden="true">${light}</div>
    <div id="light" class="color_font_size grey"></div>
</form>
</body>
<script type="text/javascript">
    var light = $("#color").text();
    var changeColor = function(color, seconds) {
        $("#light").removeClass("grey");
        $("#light").addClass(color);
        setTimeout(function(){
            $("#light").text("");
            $("#light").removeClass(color);
            $("#light").addClass("grey");
        }, 1000*seconds);
    }

    if (light == "Зеленый") {
        changeColor("green", 2);
    }
    else if (light =="Желтый") {
        changeColor("yellow", 3);
    }
    else if (light == "Красный") {
        changeColor("red", 4);
    }

</script>
<noscript><div><img src="//mc.yandex.ru/watch/30605492" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
</html>
