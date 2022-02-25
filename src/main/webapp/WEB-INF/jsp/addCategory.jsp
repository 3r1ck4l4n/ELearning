<%--
  Created by IntelliJ IDEA.
  User: yeder
  Date: 18/02/2022
  Time: 12:59 p. m.
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
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400&display=swap" rel="stylesheet">  <title>Añadir categoría</title>

    <title>Add Category</title>
</head>
<body>

    <%/**
     <c:forEach var="category" items="${categories}">

     <tr>
     <td>${category.nombreCategoria}</td>
     <td>${category.descripcionCategoria}</td>

     </tr>
     </c:forEach>
        **/
    %>
    <header>
        <div class="navbar">
            <div class="img-container">
                <img src="./B1SOFT-LOGO.gif" alt="Logo">
            </div>
            <nav>
                <ul class="nav">
                    <li class="nav-item"> <a href="#" class="nav-link">Cursos </a> </li>
                    <li class="nav-item"><a href="#" class="nav-link">Crear cursos</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">Lista de usuarios</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main>
        <div class="form-container">
            <form:form action="createCategory.html" modelAttribute="category" method="post">
                <div class="form-control">
                    <form:label for="name-category" class="form-item" path="">Nombre</form:label>
                    <form:input id="name-category"  class="form-item" path="nombreCategoria"></form:input>

                </div>
                <div class="form-control">
                    <form:label for="description" class="form-item" path="">Descripción</form:label>
                    <form:textarea  id="description" class="form-item" path="descripcionCategoria" ></form:textarea>
                </div>
                <div class="form-control">
                    <label class="form-item" for="image-category">Imagen</label>
                    <input class="form-item" id="image-category" type="file" />
                </div>
                <button class="form-item">
                    Enviar
                </button>
            </form:form>
        </div>
    </main>

</body>
</html>
