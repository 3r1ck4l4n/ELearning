<%@ page import="javax.swing.*" %><%--
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
    <link href="${pageContext.request.contextPath}/resources/css/validateCourse.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/css/newheader.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet"/>
    <!--<script src="${pageContext.request.contextPath}/resources/js/validateCheck.js" defer></script> -->

    <title>Valida Cursos</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/header.js" defer></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <!-- Kendo para ButtonGroup
    <base href="https://demos.telerik.com/kendo-ui/treeview/index">
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2021.2.616/styles/kendo.default-v2.min.css" />
    <script src="https://kendo.cdn.telerik.com/2021.2.616/js/jquery.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2021.2.616/js/kendo.all.min.js"></script> -->

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
                <li><a href="addCategory.html">Añadir categoria</a></li>
                <li><span><a onclick="cerrarSession()" class="cta">Cerrar sesión</a></span></li>
            </ul>
        </div>
    </nav>
    <br>
</header>
<main>

    <div class="upText">
        <h1>Cursos a validar</h1>
    </div>

    <div class="headUs">
        <h3>${listMiCurso[0].usuarioAc.nombre} ${listMiCurso[0].usuarioAc.aPaterno} ${listMiCurso[0].usuarioAc.aMaterno}</h3>
        <h4>Correo: ${listMiCurso[0].usuarioAc.email}</h4>
        <h4>RFC: ${listMiCurso[0].usuarioAc.rfc}</h4>
    </div>

    <div class="form-container">
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

                    <script>
                        function onlyOne(checkbox) {
                            var checkboxes = document.getElement()
                            checkboxes.forEach((item) => {
                                if (item !== checkbox) item.checked = false
                            })
                        }
                    </script>


                    <c:forEach var="miCurso" items="${listMiCurso}">
                        <form:form method="post" action="validateCourse.html" modelAttribute="updateMiCurso">

                            <form:hidden path="idUsuario" value="${miCurso.idUsuario}"/>
                            <form:hidden path="idCurso" value="${miCurso.idCurso}"/>

                                    <c:choose>
                                        <c:when test="${miCurso.obligatorio}">
                                            <td><form:checkbox id="check" path="obligatorio" value="1" checked="checked" onclick="onlyOne(this)" /></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td><form:checkbox id="check" path="obligatorio" value="1" onclick="onlyOne(this)"/></td>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${miCurso.sugerido}">
                                            <td><form:checkbox id="check" path="sugerido" value="1" checked="checked" onclick="onlyOne(this)"/></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td><form:checkbox id="check" path="sugerido" value="1" onclick="onlyOne(this)"/></td>
                                        </c:otherwise>
                                    </c:choose>

                            <td> ${miCurso.curso.nombre}</td>
                            <td> ${miCurso.curso.categoria.nombreCategoria}</td>

                            <td>
                                <button type="submit">Guardar</button>
                            </td>
                            <tr>
                        </form:form>
                    </c:forEach>
                </tbody>
            </table>
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