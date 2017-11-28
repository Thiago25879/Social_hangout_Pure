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
        <link rel="shortcut icon" href="images/favicon.ico">
	<!-- //custom-theme -->
        <link href="css/modal-custom.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        
        <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
	<!-- //custom-theme -->
	<!-- font-awesome-icons -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- //font-awesome-icons -->
	<link href="css/custom-font1.css" rel="stylesheet">
	<link href="css/custom-font2.css" rel="stylesheet">
        
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
								<li><i class="glyphicon glyphicon-user" aria-hidden="true"></i> <a href="#" class="link" href="#" data-toggle="modal" data-target="#Modalcontaopcoes">Bem vindo <%=usuario.getUsunick()%></a></li>
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
                                                        
<div class="modal fade" id="Modalcontaopcoes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Opções</h1>

                                <div class="field-wrap">
                                    <div class="col-md-6">
                                        <button type="button" onclick="location.href = 'conta.jsp'" class="button button-block display-bk" data-dismiss="modal" />Editar Conta</button>
                                    </div>
                                </div>
                                <div class="field-wrap">
                                    <div class="col-md-6">
                                        <button type="button" onclick="location.href = '../Inicial/index.jsp'" class="button button-block display-bk" data-dismiss="modal" />Deslogar</button>
                                    </div>
                                </div>


                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
