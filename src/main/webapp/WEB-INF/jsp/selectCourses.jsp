<%--
  Created by IntelliJ IDEA.
  User: yeder
  Date: 28/02/2022
  Time: 11:04 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.material-v2.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index1.css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/eligeCursos.css" rel="stylesheet" />
    <title>Seleccione los cursos de su preferencia</title>
</head>
<body>


<div class="title-select">
    <h1>Welcome ${usuario.nombre}!</h1>
    <p> Selecciona los cursos que te gustaría ver!* <br> <small>*Estan sujetos a aprobación</small></p>
</div>
<div class="form-container">
    <form:form method="post" action="chooseCourses.html" modelAttribute="usuario">
        <form:hidden path="idUsuario"/>
        <c:forEach var="category" items="${categories}">
            <div class="Sec1">
               <div class="container-head-form">
                   <h2> ${category.nombreCategoria}</h2>
                   <img src="${category.caratula}" alt="caratula" class="categorie-img">
               </div>
                <ul class="fieldlist">
                    <c:forEach var="curso" items="${category.cursos}">
                        <div class="options-form">
                            <li>
                                <input class="k-checkbox" id="${curso.nombre}" type="checkbox" value="${curso.idCurso}"
                                       name='${curso.nombre}'>
                                <label class="k-checkbox-label" for="${curso.nombre}">${curso.nombre}</label>
                            </li>
                        </div>
                    </c:forEach>
                </ul>
            </div>
        </c:forEach>
        <div class="k-form-buttons">
            <input class="k-secundary k-button" type="submit" value="Enviar">
        </div>
    </form:form>
</div>
</body>
</html>
