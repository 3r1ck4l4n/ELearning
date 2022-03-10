<%--
  Created by IntelliJ IDEA.
  Date: 04/03/2022
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/addCategory.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400&display=swap" rel="stylesheet">
    <title>Valida Cursos</title>
</head>
<body>
<header>
    <div class="navbar">
        <div class="img-container">
            <img src="./B1SOFT-LOGO.gif" alt="Logo">
        </div>
        <nav>
            <ul class="nav">
                <li class="nav-item"><a href="#" class="nav-link">Cursos </a> </li>
                <li class="nav-item"><a href="#" class="nav-link">Crear cursos</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Lista de usuarios</a></li>
            </ul>
        </nav>
    </div>
</header>
<main>

    <div class="headUs">
        <h5>${listMiCurso[0].usuarioAc.nombre}</h5>
    </div>

    <div class="form-container">
        <form:form method="get" action="validateCourse.html" modelAttribute="listMiCurso">
            <c:forEach var="miCurso" items="${listMiCurso}">
                <div>
                    <h5>${miCurso.curso.nombre}</h5>
                </div>
            </c:forEach>
        </form:form>
    </div>


</main>

</body>
</html>