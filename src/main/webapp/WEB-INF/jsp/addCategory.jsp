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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.common.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.black.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kendo.default.mobile.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newheader.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/kendo.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
    <title>Añadir categoría</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <title>Add Category</title>
</head>
<body>
<%
    String tipoUsuario = (String) session.getAttribute("tUsuario");
    if (tipoUsuario != null) {
        if (tipoUsuario.equals("Semillero")) {
            response.sendRedirect("bienvenida.html");
        }
    } else {
        response.sendRedirect("index.html");
    }
%>
<header>

    <nav class="navbar">
        <div class="logo">
            <div>
                <a href="admin.html"><img src="${pageContext.request.contextPath}/resources/imagenes/B1SOFT-LOGO.gif"></a>
            </div>
        </div>
        <a href="#" class="toggle-button">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </a>
        <div class="navbar-links">
            <ul>
                <li><a href="perfiladmin.html">Mi perfil</a></li>
                <li><a href="nuevoadmin.html">Administradores</a></li>
                <li><a href="nuevosemillero.html">Semilleros</a></li>
                <li><a href="listadodecursos.html">Cursos</a></li>
                <li><a href="nuevocurso.html">Agregar nuevo curso</a></li>
                <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
            </ul>
        </div>
    </nav>
    <br>
</header>

    <main>
        <div id="container">
            <div id="Titulo">
                <center><h1>Agregar Nueva Categoria</h1></center>
            </div>
        </div>
            
        <div class="form-container">
                       
            <center><img  src="${pageContext.request.contextPath}/resources/imagenes/curso.png" width="220px" height="160px" ></center>
            <form:form action="createCategory.html" modelAttribute="category" method="post" enctype="multipart/form-data">
                <div class="form-control">
                    <form:label for="name-category" class="form-item" path="">Nombre</form:label>
                    <input id="name-category"  class="form-item k-textbox" path="nombreCategoria" />

                </div>
                <div class="form-control">
                    <form:label for="description" class="form-item" path="">Descripción</form:label>
                    <textarea  id="description" class="form-item k-textbox" path="descripcionCategoria" ></textarea>
                </div>
                <div class="form-control">
                    <label class="form-item" for="image-category" >Imagen</label>
                    <input class="form-item" id="image-category" name="imgCategory" type="file" />
                </div>
                <button class="form-item">
                    Enviar
                </button>
            </form:form>
        </div>
    </main>
<!--Footer-->
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<footer>
    <div class="footer-content">
        <h3>B1 SOFT LATINOAMERICA</h3>
        <ul class="socials">
            <li><a href="#"><i class="fab fa-facebook"></i></a>
            <li><a href="#"><i class="fab fa-twitter"></i></a>
            <li><a href="#"><i class="fab fa-google"></i></a>
            <li><a href="#"><i class="fab fa-youtube"></i></a>
            <li><a href="#"><i class="fab fa-linkedin"></i></a>
        </ul>
    </div>
    <div class="footer-bottom">
        <p>2021. <span>B1 SOFT</span></p>
    </div>
</footer>
</body>
<script>
    function cerrarSession() {
        $(location).attr('href', "cerrarSession.html");
    }
</script>
</html>

