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
    <title>Valida Cursos</title>
</head>
<body>
<center>
    <table  class="tableUno">
        <tr>
            <td style="background-color: rgb(154, 214, 224);">
                <p>Usuario</p>
            </td>
            <td style="background-color: rgb(154, 214, 224);">
                <p>Juan</p>
            </td>
            <td style="background-color: rgb(154, 214, 224);" colspan="3">
                juan.ipn@gmail.com
            </td>
        </tr>
    </table>
    <br>
    <!--
    <table>
        <tr>
            <td style="background-color: rgb(244, 167, 187);">
                <p> Obligatorio</p>
            </td>
            <td style="background-color: rgb(161, 249, 171);">
                <p>Sugerido</p>
            </td>
            <td style="background-color: rgb(154, 214, 224);">
                <p>Categoria</p>
            </td>
            <td style="background-color: rgb(154, 214, 224);">
                <p>Cursos</p>
            </td>
            -->

    <form:form method="get" action="validateCourse.html" modelAttribute="listMiCurso">
            <c:forEach var="miCurso" items="${listMiCurso}">
                <div>
                   <h5>${miCurso.curso.nombre}</h5>
                </div>
            </c:forEach>
    </form:form>


    </table>
</center>

</body>
</html>
