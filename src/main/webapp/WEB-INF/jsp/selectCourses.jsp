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
    <link href="${pageContext.request.contextPath}/resources/css/eligeCursos.css" rel="stylesheet" />
    <title>Seleccione los cursos de su preferencia</title>
</head>
<body>



<scroll-container>
    <form:form method="post" action="chooseCourses.html">
        <c:forEach var="category" items="${categories}">
            <div class="Sec1">
                <h4> ${category.nombreCategoria}</h4>
                <img src="${category.caratula}" alt="caratula">
                <ul class="fieldlist">
                    <c:forEach var="curso"  items="${category.cursos}">
                        <div>
                            <li>
                                <input   class="k-checkbox" id="${curso.nombre}" type="checkbox" value="${curso.idCurso}" name='${curso.nombre}'>
                                <label class="k-checkbox-label" for="${curso.nombre}">${curso.nombre}</label>
                            </li>
                        </div>
                    </c:forEach>
                </ul>
            </div>
        </c:forEach>

        <input type="submit" value="Enviar">
    </form:form>
</scroll-container>
</body>
</html>
