<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Social Hangout - P A</title>
        <!-- Bootstrap core CSS-->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
        
        <link href="../css/custom.css" rel="stylesheet">
        
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    
    </head>
    <body class="fixed-nav bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="../paginas/index.jsp">Página administrativa - Social Hangout</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tabelas">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseTabelas" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Tabelas</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseTabelas">
            <li>
              <a href="../tabelas/conviteev.jsp">Convites de eventos</a>
            </li>
            <li>
              <a href="../tabelas/convitegr.jsp">Convites de grupos</a>
            </li>
            <li>
              <a href="../tabelas/decisao.jsp">Decisões</a>
            </li>
            <li>
              <a href="../tabelas/evento.jsp">Eventos</a>
            </li>
            <li>
              <a href="../tabelas/grupo.jsp">Grupos</a>
            </li>
            <li>
              <a href="../tabelas/membro.jsp">Membros</a>
            </li>
            <li>
              <a href="../tabelas/opcao.jsp">Opções</a>
            </li>
            <li>
              <a href="../tabelas/participante.jsp">Participantes</a>
            </li>
            <li>
              <a href="../tabelas/usuario.jsp">Usuários</a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Novos">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseNovos" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-plus"></i>
            <span class="nav-link-text">Novas entradas</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseNovos">
            <li>
              <a href="../novos/conviteev.jsp">Convites de eventos</a>
            </li>
            <li>
              <a href="../novos/convitegr.jsp">Convites de grupos</a>
            </li>
            <li>
              <a href="../novos/decisao.jsp">Decisões</a>
            </li>
            <li>
              <a href="../novos/evento.jsp">Eventos</a>
            </li>
            <li>
              <a href="../novos/grupo.jsp">Grupos</a>
            </li>
            <li>
              <a href="../novos/membro.jsp">Membros</a>
            </li>
            <li>
              <a href="../novos/opcao.jsp">Opções</a>
            </li>
            <li>
              <a href="../novos/participante.jsp">Participantes</a>
            </li>
            <li>
              <a href="../novos/usuario.jsp">Usuários</a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Galeria">
          <a class="nav-link" href="../paginas/galeria.jsp">
            <i class="fa fa-fw fa-picture-o"></i>
            <span class="nav-link-text">Galeria</span>
          </a>
        </li>
        <!--<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="../paginas/configura.jsp">
            <i class="fa fa-fw fa-cog"></i>
            <span class="nav-link-text">Configurações da página</span>
          </a>
        </li>-->
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Deslogar</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="content-wrapper">