<%@page import="java.util.List"%>
<%@page import="util.Upload"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<!DOCTYPE html>
<%  session.setAttribute("usuario", null);
    session.setAttribute("Logado", null);
    UsuarioDAO dao = new UsuarioDAO();
    String msg = "";
    String msg2 = "";
    Upload upload = new Upload();
    upload.setFolderUpload("Fotos");

    if (request.getParameter("access") != null) {
        List list = dao.buscarUsrList(request.getParameter("txtLogin").toLowerCase());
        if (!list.isEmpty()) {
            Usuario usuario = (Usuario) list.get(0);
            if (usuario.getUsusenha().equals(request.getParameter("txtSenha"))) {
                msg = "Login efetuado com sucesso";
                session.setAttribute("usuario", usuario);
                session.setAttribute("Logado", (request.getParameter("txtLogin")));
                response.sendRedirect("../Site/index.jsp");
            } else {
                msg = "Senha Errada";
%><a id='mod' data-toggle="modal" data-target="#Modal-msg"></a><%
    }
} else {
%><a id='mod' data-toggle="modal" data-target="#Modal-msg"></a><%
        msg = "Conta não existente";
    }

} else {
    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            if (upload.getForm().get("CtxtSenha").toString().equals(upload.getForm().get("CtxtCSenha").toString())) {
                List list = dao.buscarUsrList(upload.getForm().get("CtxtNick").toString().toLowerCase());
                if (list.isEmpty()) {

                    Usuario obj = new Usuario();
                    obj.setUsunick(upload.getForm().get("CtxtNick").toString());
                    obj.setUsulogin(upload.getForm().get("CtxtLogin").toString());
                    obj.setUsusenha(upload.getForm().get("CtxtSenha").toString());
                    if (upload.getFiles().size() != 1) {
                        obj.setUsuimg("empty.jpg");
                    } else {
                        obj.setUsuimg(upload.getFiles().get(0));
                    }
                    if (obj == null) {
                        response.sendRedirect("../inicial/index.jsp");
                        return;
                    } else {

                        if (upload.getForm().get("CtxtSenha").toString().equals(upload.getForm().get("CtxtCSenha").toString())) {
                            dao.incluir(obj);
                            session.setAttribute("usuario", obj);
                            session.setAttribute("Logado", obj.getUsunick());
                            response.sendRedirect("../Site/index.jsp");
                        }
                    }

                } else {
                    msg = "Id já existente";
    %><a id='mod' data-toggle="modal" data-target="#Modal-msg"></a><%
        }
    } else {
        msg = "Senhas não são iguais";
    %><a id='mod' data-toggle="modal" data-target="#Modal-msg"></a><%
                    }
                }
            }
        }

    %>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Social Hangout</title>
        <link rel="shortcut icon" href="img/favicon.ico">
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Cabin:700' rel='stylesheet' type='text/css'>

        <!-- Custom styles for this template -->
        <link href="css/grayscale.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

    </head>
    <body id="page-top">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">Social Hangout</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fa fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#sobre">Sobre</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#atalho">Atalhos</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Intro Header -->
        <header class="masthead">
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 mx-auto">
                            <h1 class="brand-heading">Social hangout</h1>
                            <p class="intro-text">O melhor site para organizar seus eventos e vida social
                                <br></p>
                            <a href="#" class="btn btn-default btn-lg" data-toggle="modal" data-target="#login-modal">Acesse agora</a>
                            <!--<a href="#sobre" class="btn btn-circle js-scroll-trigger">
                              <i class="fa fa-angle-double-down animated"></i>
                            </a>-->
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- About Section -->
        <section id="sobre" class="content-section text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <h2>Sobre Social Hangout</h2>
                        <p>Este site foi criado como projeto de conclusão de curso no
                            <a href="http://www.ifsul.edu.br/">Instituto Federal de Educação, Ciência e Tecnologia Sul-rio-grandense </a>na cidade de Bagé no ano de 2017.</p>
                        <p>A proposta do site é oferecer uma alternativa simples e prática para organizar eventos com seus amigos e familiares sem a menor dificuldade ou demora.</p>
                        <p>A idéia desse site surgiu quando o desenvolvedor percebeu o quão trabalhoso se tornou organizar uma saída a noite para beber com os amigos e programações similares, tais dificuldades causadas pela ineficiência e poluição visual de outras ferramentas que até o momento eram as únicas opções.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Download Section -->
        <section id="atalho" class="download-section content-section text-center">
            <div class="container">
                <div class="col-lg-8 mx-auto">
                    <h2>Redes Sociais</h2>
                    <p>Alguns links úteis para algumas das redes sociais mais utilizadas atualmente.</p>
                    <ul class="list-inline banner-social-buttons">
                        <li class="list-inline-item">
                            <a href="https://twitter.com" class="btn btn-default btn-lg">
                                <i class="fa fa-twitter fa-fw"></i>
                                <span class="network-name">Twitter</span>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="https://www.facebook.com" class="btn btn-default btn-lg">
                                <i class="fa fa-facebook fa-fw"></i>
                                <span class="network-name">Facebook</span>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="https://plus.google.com" class="btn btn-default btn-lg">
                                <i class="fa fa-google-plus fa-fw"></i>
                                <span class="network-name">Google+</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Map Section -->
        <!--<div id="map"></div>-->

        <!-- Footer -->
        <footer>
            <div class="container text-center">
                <p>Copyright &copy;<a href="../../Admin/index.jsp" class="white"> Social Hangout 2017 </a></p>
            </div>
        </footer>






        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div>
                <style>
                    *, *:before, *:after {
                        box-sizing: border-box;
                    }

                    html {
                        overflow-y: scroll;
                    }

                    body {
                        font-family: 'Titillium Web', sans-serif;
                    }

                    a {
                        text-decoration: none;
                        color: #1ab188;
                        -webkit-transition: .5s ease;
                        transition: .5s ease;
                    }
                    a:hover {
                        color: #179b77;
                    }

                    .form {
                        background: rgba(19, 35, 47, 0.9);
                        padding: 40px;
                        max-width: 600px;
                        margin: 40px auto;
                        border-radius: 4px;
                        box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
                    }

                    .tab-group {
                        list-style: none;
                        padding: 0;
                        margin: 0 0 40px 0;
                    }
                    .tab-group:after {
                        content: "";
                        display: table;
                        clear: both;
                    }
                    .tab-group li a {
                        display: block;
                        text-decoration: none;
                        padding: 15px;
                        background: rgba(160, 179, 176, 0.25);
                        color: #a0b3b0;
                        font-size: 20px;
                        float: left;
                        width: 50%;
                        text-align: center;
                        cursor: pointer;
                        -webkit-transition: .5s ease;
                        transition: .5s ease;
                    }
                    .tab-group li a:hover {
                        background: #179b77;
                        color: #ffffff;
                    }
                    .tab-group .active a {
                        background: #1ab188;
                        color: #ffffff;
                    }

                    .tab-content > div:last-child {
                        display: none;
                    }

                    h1 {
                        text-align: center;
                        color: #ffffff;
                        font-weight: 300;
                        margin: 0 0 40px;
                    }

                    label {
                        position: absolute;
                        -webkit-transform: translateY(6px);
                        transform: translateY(6px);
                        left: 13px;
                        color: rgba(255, 255, 255, 0.5);
                        -webkit-transition: all 0.25s ease;
                        transition: all 0.25s ease;
                        -webkit-backface-visibility: hidden;
                        pointer-events: none;
                        font-size: 22px;
                    }
                    label .req {
                        margin: 2px;
                        color: #1ab188;
                    }

                    label.active {
                        -webkit-transform: translateY(50px);
                        transform: translateY(50px);
                        left: 2px;
                        font-size: 14px;
                    }
                    label.active .req {
                        opacity: 0;
                    }

                    label.highlight {
                        color: #ffffff;
                    }

                    input, textarea {
                        font-size: 22px;
                        display: block;
                        width: 100%;
                        height: 100%;
                        padding: 5px 10px;
                        background: none;
                        background-image: none;
                        border: 1px solid #a0b3b0;
                        color: #ffffff;
                        border-radius: 0;
                        -webkit-transition: border-color .25s ease, box-shadow .25s ease;
                        transition: border-color .25s ease, box-shadow .25s ease;
                    }
                    input:focus, textarea:focus {
                        outline: 0;
                        border-color: #1ab188;
                    }

                    textarea {
                        border: 2px solid #a0b3b0;
                        resize: vertical;
                    }

                    .field-wrap {
                        position: relative;
                        margin-bottom: 40px;

                    }

                    .top-row:after {
                        content: "";
                        display: table;
                        clear: both;
                    }
                    .top-row > div {
                        float: left;
                        width: 48%;
                        margin-right: 4%;
                    }

                    .modal-content{
                        background-color: transparent;
                        border: none;
                    }

                    .modal-body{
                        padding: 0px;
                    }
                    .top-row > div:last-child {
                        margin: 0;
                    }

                    .button {
                        border: 0;
                        outline: none;
                        border-radius: 0;
                        padding: 15px 0;
                        font-size: 2rem;
                        font-weight: 600;
                        text-transform: uppercase;
                        letter-spacing: .1em;
                        background: #1ab188;
                        color: #ffffff;
                        -webkit-transition: all 0.5s ease;
                        transition: all 0.5s ease;
                        -webkit-appearance: none;
                    }
                    .button:hover, .button:focus {
                        background: #179b77;
                    }

                    .button-block {
                        display: block;
                        width: 100%;
                    }
                    .button-small {
                        display: block;
                        padding: 6px 0;
                        width: 100%;
                        font-size: 1rem;
                    }

                    .forgot {
                        margin-top: -20px;
                        text-align: right;
                    }

                    .msg{
                        margin: 0 0 10px;
                    }

                    .custom-img{
                        width: 50%;
                        margin: 30px auto;
                    }

                    .button-Style{
                        cursor:pointer;
                        border: none;
                        background-size: 100% 100%;
                        background-repeat: no-repeat;
                    }


                </style>
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form">

                                <ul class="tab-group">
                                    <li class="tab active"><a href="#login">Logar</a></li>
                                    <li class="tab "><a href="#signup">Criar conta</a></li>
                                </ul>

                                <div class="tab-content">
                                    <div id="login">   
                                        <h1>Bem vindo!</h1>

                                        <form action="../Inicial/index.jsp" method="post" >

                                            <div class="field-wrap">
                                                <label>
                                                    Id<span class="req">*</span>
                                                </label>
                                                <input type="text"required autocomplete="off" name="txtLogin"/>
                                            </div>

                                            <div class="field-wrap">
                                                <label>
                                                    Senha<span class="req">*</span>
                                                </label>
                                                <input type="password"required autocomplete="off" name="txtSenha"/>
                                            </div>
                                            <p class="msg"> <%=msg%></p>
                                            <!-- <p class="forgot"><a href="#">Esqueci a senha</a></p> -->
                                            <input type= "hidden" name="access" value="access"/>
                                            <button type="submit" class="button button-block"  />Acessar</button>

                                        </form>

                                    </div>

                                    <div id="signup">   
                                        <h1>Inscreva-se</h1>

                                        <form action="../Inicial/index.jsp" method="post"  enctype="multipart/form-data">


                                            <div class="field-wrap">
                                                <label>
                                                    Apelido<span class="req">*</span>
                                                </label>
                                                <input type="text" required autocomplete="off" name="CtxtNick"/>
                                            </div>

                                            <div class="field-wrap">
                                                <label>
                                                    Id<span class="req">*</span>
                                                </label>
                                                <input type="text"required autocomplete="off" name="CtxtLogin"/>
                                            </div>
                                            <div class="field-wrap">
                                                <label>
                                                    Senha<span class="req">*</span>
                                                </label>
                                                <input type="password"required autocomplete="off" name="CtxtSenha"/>
                                            </div>
                                            <div class="field-wrap">
                                                <label>
                                                    Confirmar Senha<span class="req">*</span>
                                                </label>
                                                <input type="password"required autocomplete="off" name="CtxtCSenha"/>
                                            </div>

                                            <div class="field-wrap col-sm-12 text-center custom-img">

                                                <!-- image-preview-clear button -->
                                                <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                                    <span class="glyphicon glyphicon-remove"></span> Limpar
                                                </button>
                                                <!-- image-preview-input -->
                                                <div class="btn btn-default image-preview-input">
                                                    <span class="glyphicon glyphicon-folder-open"></span>
                                                    <span class="image-preview-input-title">Selecionar</span>
                                                    <input type="file" id="OOO" accept="image/png, image/jpeg" onchange="previewFile()" name="input-file-preview" style="display: none ; " />
                                                    <input type="image" class="button-Style" src="../../Fotos/empty.jpg" id="imgbtn" onclick="document.getElementById('OOO').click(); return false;" /> 
                                                </div>

                                            </div>

                                            <button type="submit" class="button button-block"/>Criar conta</button>

                                        </form>

                                    </div>



                                </div><!-- tab-content -->

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="Modal-msg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="custom-modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="centered">
                                <div class="form">
                                    <div id="message">   
                                        <h1><%=msg%></h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                                    





        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/popper/popper.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for this template -->
        <script src="js/grayscale.min.js"></script>
        <script  src="js/index.js"></script>


    </body>

</html>
<script>
                                                        document.getElementById("mod").click();
</script> 