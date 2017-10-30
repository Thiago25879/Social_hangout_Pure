
<%@page import="modelo.Grupo"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="modelo.Evento"%>
<%@page import="dao.EventoDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../padroes/cabecalho_filtro.jsp" %>
<%
    UsuarioDAO dao1 = new UsuarioDAO();
    List<Usuario> lista1 = null;
    EventoDAO dao2 = new EventoDAO();
    List<Evento> lista2 = null;
    GrupoDAO dao3 = new GrupoDAO();
    List<Grupo> lista3 = null;
    
if(request.getParameter("filtro") != null){
        lista1 = dao1.listarImg(request.getParameter("filtro").toLowerCase());
        lista2 = dao2.listarImg(request.getParameter("filtro").toLowerCase());
        lista3 = dao3.listarImg(request.getParameter("filtro").toLowerCase());
    }else{
        lista1 = dao1.listar();
        lista2 = dao2.listar();
        lista3 = dao3.listar();
    }
%>

<div class="container">
    <h1 class="my-4 text-center text-lg-left">Galeria de imagens</h1>
    <div class="row text-center text-lg-left">

        <%
            for (Usuario item1 : lista1) {
        %>
        <div class="col-lg-3 col-md-4 col-xs-6">
            <a class="d-block mb-4 h-100">
                <h6>Usuário: <%=item1.getUsunick()%></h6>
                <img class="img-fluid img-thumbnail" src="../../Fotos/<%=item1.getUsuimg()%>" >
            </a>
        </div>


        <%
            }
            for (Evento item2 : lista2) {
        %>
        <div class="col-lg-3 col-md-4 col-xs-6">
            <a class="d-block mb-4 h-100">
                <h6>Evento: <%=item2.getEvenome()%></h6>
                <img class="img-fluid img-thumbnail" src="../../Fotos/<%=item2.getEveimg()%>" >
            </a>
        </div>


        <%
            }
            for (Grupo item3 : lista3) {
        %>
        <div class="col-lg-3 col-md-4 col-xs-6">
            <a class="d-block mb-4 h-100">
                <h6>Grupo: <%=item3.getGrunome()%></h6>
                <img class="img-fluid img-thumbnail" src="../../Fotos/<%=item3.getGruimg()%>" >
            </a>
        </div>


        <%
            }
        %>
    </div>

</div>

<%@include file="../padroes/rodape.jsp" %>