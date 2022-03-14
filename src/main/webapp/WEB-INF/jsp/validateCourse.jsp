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
    <link href="${pageContext.request.contextPath}/resources/css/validateCourse.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400&display=swap" rel="stylesheet">
    <title>Valida Cursos</title>
</head>
<body>
<header>
    <div class="navbar">
        <div class="img-container">
            <img src="${pageContext.request.contextPath}/resources/imagenes/B1SOFT-LOGO.gif" alt="Logo">
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
        <h5>${listMiCurso[0].usuarioAc.nombre} ${listMiCurso[0].usuarioAc.aPaterno} ${listMiCurso[0].usuarioAc.aMaterno}</h5>
        <h6>Correo: ${listMiCurso[0].usuarioAc.email}</h6>

    </div>

    <div class="form-container">
        <pr>Cursos a validar</pr>
            <table>
                <thead>
                <tr>
                    <th>Obligatorio</th>
                    <th>Sugerido</th>
                    <th> Nombre del curso</th>
                    <th> Categoria</th>
                    <th> Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="miCurso" items="${listMiCurso}">
                    <form:form method="post" action="validateCourse.html" modelAttribute="updateMiCurso">

                        <form:hidden path="idUsuario" value="${miCurso.idUsuario}"/>
                        <form:hidden path="idCurso" value="${miCurso.idCurso}"/>
                        <c:choose>
                            <c:when test="${miCurso.obligatorio}">
                                <td><form:checkbox path="obligatorio" value="1" checked="checked"/></td>
                            </c:when>
                            <c:otherwise>
                                <td><form:checkbox path="obligatorio" value="1" /></td>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${miCurso.sugerido}">
                                <td><form:checkbox path="sugerido" value="1" checked="checked"/></td>
                            </c:when>
                            <c:otherwise>
                                <td><form:checkbox path="sugerido" value="1"  /></td>
                            </c:otherwise>
                        </c:choose>
                        <td> ${miCurso.curso.nombre}</td>
                        <td> ${miCurso.curso.categoria.nombreCategoria}</td>
                        <td>
                            <button type="submit">Guardar</button>
                        </td>
                        </tr>
                    </form:form>
                </c:forEach>
                </tbody>
            </table>


    </div>


</main>

</body>
</html>
