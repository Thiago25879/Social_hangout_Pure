
<%@page import="modelo.Conviteev"%>
<%@page import="dao.ConviteevDAO"%>
<%@page import="modelo.Evento"%>
<%@page import="dao.EventoDAO"%>
<%@page import="modelo.Grupo"%>
<%@page import="dao.GrupoDAO"%>
<%@include file="padroes/cabecalho.jsp" %>
<%  ConviteevDAO cdao = new ConviteevDAO();
    List<Conviteev> listaconv;
    listaconv = cdao.listarporgruid(Integer.parseInt(request.getParameter("code")));
    GrupoDAO gdao = new GrupoDAO();
    Grupo grupo = gdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("code")));
%>
<div class="services dark-background">
    <div class="container">
        <h3 class="title-w3-agileits two">Eventos</h3>
        <p class="quia white shadow">Grupo: <%=grupo.getGrunome()%></p>
        <div class="wthree_services_bottom_left banner_bottom_agile_grids">
            <div class="wthree_services_bottom_left_grid">
                <div class="col-md-12 agile-w3l-img-grids-w3ls">
                    <%for (Conviteev item : listaconv) {
                            if (item.getConevresposta().equals("vou") && item.getMemcodigo().getUsucodigo().getUsucodigo().equals(usuario.getUsucodigo())) {
                    %>
                    <div class="col-md-3 agile-w3l3-grids w3_agileits_services_bottom_l_grid w3l-agileits">
                        <div class="agile_services_bottom_l_grid1">
                            <a href="evento.jsp?code=<%=item.getEvecodigo().getEvecodigo()%>">
                                <img src="../../Fotos/<%=item.getEvecodigo().getEveimg()%>" alt=" " class="img-responsive auto-height auto-width" />
                                <div class="w3_service_bottom_grid_pos mid_gd small-padding">
                                    <h3 class="shadow" ><%=item.getEvecodigo().getEvenome()%></h3>
                                </div>
                            </a>
                        </div>
                    </div>
                    <% }
                        } %>
                    <%for (Conviteev item : listaconv) {
                            if (item.getConevresposta().equals("pendente") && item.getMemcodigo().getUsucodigo().getUsucodigo() == usuario.getUsucodigo()) {
                    %>
                    <div class="col-md-3 agile-w3l3-grids w3_agileits_services_bottom_l_grid w3l-agileits">
                        <div class="agile_services_bottom_l_grid1">
                            <a href="evento.jsp?code=<%=item.getEvecodigo().getEvecodigo()%>">
                                <img src="../../Fotos/<%=item.getEvecodigo().getEveimg()%>" alt=" " class="img-responsive auto-height auto-width" />
                                <div class="w3_service_bottom_grid_pos mid_gd small-padding">
                                    <h3 class="shadow" ><%=item.getEvecodigo().getEvenome()%></h3>
                                </div>
                            </a>
                        </div>
                    </div>
                    <% }
                        } %>
                    <%for (Conviteev item : listaconv) {
                            if (item.getConevresposta().equals("talvez") && item.getMemcodigo().getUsucodigo().getUsucodigo() == usuario.getUsucodigo()) {
                    %>
                    <div class="col-md-3 agile-w3l3-grids w3_agileits_services_bottom_l_grid w3l-agileits">
                        <div class="agile_services_bottom_l_grid1">
                            <a href="evento.jsp?code=<%=item.getEvecodigo().getEvecodigo()%>">
                                <img src="../../Fotos/<%=item.getEvecodigo().getEveimg()%>" alt=" " class="img-responsive auto-height auto-width" />
                                <div class="w3_service_bottom_grid_pos mid_gd small-padding">
                                    <h3 class="shadow" ><%=item.getEvecodigo().getEvenome()%></h3>
                                </div>
                            </a>
                        </div>
                    </div>
                    <% }
                        } %>
                    <%for (Conviteev item : listaconv) {
                            if (item.getConevresposta().equals("nao") && item.getMemcodigo().getUsucodigo().getUsucodigo() == usuario.getUsucodigo()) {
                    %>
                    <div class="col-md-3 agile-w3l3-grids w3_agileits_services_bottom_l_grid w3l-agileits">
                        <div class="agile_services_bottom_l_grid1">
                            <a href="evento.jsp?code=<%=item.getEvecodigo().getEvecodigo()%>">
                                <img src="../../Fotos/<%=item.getEvecodigo().getEveimg()%>" alt=" " class="img-responsive auto-height auto-width" />
                                <div class="w3_service_bottom_grid_pos mid_gd small-padding">
                                    <h3 class="shadow" ><%=item.getEvecodigo().getEvenome()%></h3>
                                </div>
                            </a>
                        </div>
                    </div>
                    <% }
                        }%>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<%@include file="padroes/rodape.jsp" %>