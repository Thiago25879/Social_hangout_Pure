
<%@page import="dao.GrupoDAO"%>
<%@page import="modelo.Grupo"%>
<%@include file="padroes/cabecalho.jsp" %>
<%    GrupoDAO dao = new GrupoDAO();
    Grupo item2 = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("code")));
    MembroDAO mdao = new MembroDAO();
    List<Membro> listamem;
    listamem = memdao.listarporgruid(item2.getGrucodigo());

%> 
<div class="banner-bottom dark-background">
    <div class="container ">
        <div class="smaller center-block">
            <h3 class="title-w3-agileits two"><%=item2.getGrunome()%></h3>  
            <br>
            <img src="../../Fotos/<%=item2.getGruimg()%>" alt=" " class="center-block img-responsive img-circle" />
        </div>

        <div class="center-pad grid_3 grid_5">
            <h1><a class="label label-default grp-btn" href="#">Novo Membro</a>
                <a class="label label-default grp-btn" href="geventos.jsp?code=<%=item2.getGrucodigo()%>">Eventos</a>
                <a class="label label-default grp-btn" href="#">Novo Evento</a></h1>
        </div>

        <table class="table">
            <tbody>
                <tr>
                    <td><%
                        for (Membro item : listamem) {
                        %>
                        <div class="clearfix vertical-center usr-icon ">
                            <img class="media-object dp1 img-circle img-responsive usr-icon" src="../../Fotos/<%=item.getUsucodigo().getUsuimg()%>" >
                            <h2 class="usr-names"><%=item.getUsucodigo().getUsunick()%></h2>
                        </div>
                        <%
                            }%></td>
                </tr>    
            </tbody>
        </table>








    </div>
</div>
</div>


<%@include file="padroes/rodape.jsp" %>