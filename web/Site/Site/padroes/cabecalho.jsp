<%@page import="modelo.Membro"%>
<%@page import="java.util.List"%>
<%@page import="dao.MembroDAO"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<head>
	<title>Social Hangout</title>
	<!-- custom-theme -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!-- //custom-theme -->
        <link href="css/modal-custom.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        
        <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
	<!-- //custom-theme -->
	<!-- font-awesome-icons -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- //font-awesome-icons -->
	<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Montserrat:200,200i,300,400,400i,500,500i,600,600i,700,700i,800" rel="stylesheet">
        
</head>

<%
String Logado = (String) session.getAttribute("Logado");
Usuario usuario = new Usuario();

UsuarioDAO usudao = new UsuarioDAO();
MembroDAO memdao = new MembroDAO();

    if(Logado == null){
        response.sendRedirect("../Inicial/index.jsp");
    }else{
        usuario = (Usuario) session.getAttribute("usuario");
    }
List<Membro> listam;
listam = memdao.listarporusuid(usuario.getUsucodigo());
%>

<body>
	<!-- banner -->
	<div class="banner1" id="home">
		<div class="center-container inner_agile">
			<!-- top_header_agile_info_w3ls -->
			<div class="top_header_agile_info_w3ls">
				<nav class="navbar navbar-default">
					<div class="navbar-header navbar-left">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
						<h1><a class="navbar-brand" href="index.jsp">Social Hangout</a></h1>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
						<div class="w3l_header_left">
							<ul>
								<li><i class="glyphicon glyphicon-user" aria-hidden="true"></i> <a href="conta.jsp">Bem vindo <%=usuario.getUsunick()%></a></li>
							</ul>
						</div>
						<div class="clearfix"> </div>

						<div id="m_nav_container" class="m_nav wthree_bg">
							<nav class="menu menu--sebastian">
								<ul id="m_nav_list" class="m_nav menu__list">
									<li class="m_nav_item dropdown" id="moble_nav_item_2">
										<a href="#" class="dropdown-toggle link link--kumya" data-toggle="dropdown"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Convites <b class="caret"></b></a>

										<ul class="dropdown-menu agile_short_dropdown">
											<li><a href="convitesg.jsp">Grupos</a></li>
											<li><a href="convitese.jsp">Eventos</a></li>
										</ul>
									</li>
                                                                        <li class="m_nav_item" id="m_nav_item_1"> <a href="index.jsp" class="link link--kumya"><i class="fa fa-group" aria-hidden="true"></i>Grupos</span></a></li>
                                                                        <li class="m_nav_item" id="m_nav_item_1"> <a href="eventos.jsp" class="link link--kumya"><i class="glyphicon glyphicon-glass" aria-hidden="true"></i>Eventos</span></a></li>
                                                                        
									</ul>
							</nav>
						</div>
					</div>
				</nav>
			</div>

			
		</div>
	</div>