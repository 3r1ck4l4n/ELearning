<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ValidadorAdmin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/estiloErroExito.css">
    <style>
     .bg_animate{
    width: 100%;
    height: 15%;
    padding: 10px;
    background: #203853;
    position: relative;
    overflow: hidden;
    border-bottom: solid 3px #B15D28;
}


.header_nav{
    width: 100%;
    position: absolute;
   
}

.header_nav .contenedor{
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 0;
}

        .logop{
   width: 200px;
   
}

        .img1{
    width: 405px;
  
}

.titulo{
    color: white;
    font-size: 70px;
    font-weight: 900;
    margin-bottom: 15px;
 
}
.llamanos{
    color: #fff;
    font-size: 20px;
    border-radius: 5px;
    text-decoration: none;
    display: inline-block;
    background: #B15D28;
    padding: 20px;
    
}

@media screen and (max-width:800px){
    .logop{
        width: 210px;
    }

    .bg_animate{
        width: 100%;
    }

    .img1{
        width: 250px;

    }

   .titulo{
        font-size: 45px;
    }

    .llamanos{
       
       font-size: 15px;
    }
}

    </style>
    
    </head>
<body>
    ´
    <header class="bg_animate">
        <div id= "logo"> 
            <center><img class="logop" src="${pageContext.request.contextPath}/resources/imagenes/logoazul.gif"alt=""></center>
        </div>
    
    </header>

    <center>
      <img class="img1" src="${pageContext.request.contextPath}/resources/imagenes/bienvenido.png" alt="">
      <h1 class="titulo">¡MUY BIEN!<br>
            Espera... El Administrador esta  validando tus cursos, si tienes alguna duda
            contacta al administrador por correo: administradorb1@gmail.com no olvides poner tu nombre y semillero al cual perteneces.</h1>
            <a href="index.html" class="llamanos">Regresar</a>
            <br>
            <br>
            
    </center>


</body>
</html>
