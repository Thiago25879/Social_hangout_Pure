
<%@page import="dao.ParticipanteDAO"%>
<%@page import="modelo.Participante"%>
<%@page import="modelo.Conviteev"%>
<%@page import="dao.ConviteevDAO"%>
<%@page import="modelo.Evento"%>
<%@page import="dao.EventoDAO"%>
<%@include file="padroes/cabecalho.jsp" %>
<%  ParticipanteDAO dao = new ParticipanteDAO();
    List<Participante> listapart;
    listapart = dao.listarporusuid(usuario.getUsucodigo());
%> 
<div class="services dark-background">
    <div class="container">
        <h3 class="title-w3-agileits two">Eventos</h3>
        <div class="wthree_services_bottom_left banner_bottom_agile_grids">
            <div class="wthree_services_bottom_left_grid">
                <div class="col-md-12 agile-w3l-img-grids-w3ls">
                    <%for (Participante item : listapart) {
                    %>
                    <div class="col-md-3 agile-w3l3-grids w3_agileits_services_bottom_l_grid w3l-agileits">
                        <div class="agile_services_bottom_l_grid1" >
                            <a href="evento.jsp?code=<%=item.getEvecodigo().getEvecodigo()%>">
                            <img src="../../Fotos/<%=item.getEvecodigo().getEveimg()%>" alt=" " class="img-responsive auto-height auto-width" />
                            <div class="w3_service_bottom_grid_pos mid_gd custom-mid">
                                <h3 class="shadow custom-mid " ><%=item.getEvecodigo().getEvenome()%></h3>
                                <p class="shadow custom-mid" >Grupo: <%=item.getEvecodigo().getGrucodigo().getGrunome()%></p>
                            </div>
                            </a>
                        </div>
                    </div>
                    <% }%>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<%@include file="padroes/rodape.jsp" %>