<html lang="en">
    <%               
        if (request.getParameter("login") != null && request.getParameter("password") != null) {
            if (request.getParameter("login").equals("admin") && request.getParameter("password").equals("admin")) {
                session.setAttribute("admin", (request.getParameter("login")));
                response.sendRedirect("index.jsp");
            }else{
                response.sendRedirect("login.jsp");
            }
        }else{
            session.setAttribute("admin", null); 
        }
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <link rel="shortcut icon" href="../vendor/favicon.ico">
        <title>Entrada para a página administradora</title>
        <!-- Bootstrap core CSS-->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
    </head>

    <body class="bg-dark">
        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header">Página Administradora</div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <label for="login">Login</label>
                            <input class="form-control" id="login" name="login" type="text" aria-describedby="emailHelp" placeholder="Digite seu login">
                        </div>
                        <div class="form-group">
                            <label for="password">Senha</label>
                            <input class="form-control"id="password"  name="password" type="password" placeholder="Digite sua senha">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block" href="index.html">Login</button>
                    </form>

                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/popper/popper.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
    </body>

</html>
