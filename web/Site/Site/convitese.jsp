
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ConviteevDAO"%>
<%@page import="modelo.Conviteev"%>
<%@include file="padroes/cabecalho.jsp" %>
<%  ConviteevDAO conevdao = new ConviteevDAO();
    if (request.getParameter("code") != null) {
        Conviteev conv = conevdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("code")));;
        int X = Integer.parseInt(request.getParameter("action"));
        switch (X) {
            case 1:
                conv.setConevresposta("vou");
                break;
            case 2:
                conv.setConevresposta("talvez");
                break;
            case 3:
                conv.setConevresposta("nao");
                break;
        }
        conevdao.alterar(conv);
        response.sendRedirect("convitese.jsp");
    }

    List<Conviteev> listaconevall;
    List<Conviteev> listaconev = new ArrayList<Conviteev>();
    listaconevall = conevdao.listar();
    for (Conviteev itemcon : listaconevall) {
        if (itemcon.getMemcodigo().getUsucodigo().getUsucodigo() == usuario.getUsucodigo() && itemcon.getConevresposta() != "vou" && itemcon.getConevresposta() != "nao") {
            listaconev.add(itemcon);
        }
    }
%>

<div class="services dark-background">
    <div class="container">
        <h3 class="title-w3-agileits two">Convites de eventos</h3>
        <div class="wthree_services_bottom_left banner_bottom_agile_grids">
            <div class="wthree_services_bottom_left_grid">

                <%
                    for (Conviteev item : listaconev) {
                %>
                <div class="col-md-4 w3_agileits_services_bottom_l_grid ">
                    <div class="agile_services_bottom_l_grid1">
                        <img src="../../Fotos/<%=item.getEvecodigo().getEveimg()%>" alt=" " class="img-responsive rounded-div auto-height" />
                    </div>
                    <div class="serve_info_agile two rounded-div">
                        <h4><%=item.getEvecodigo().getEvenome()%></h4>
                        <p><%=item.getEvecodigo().getEvedesc()%></p>
                        <h4>
                            <a href="convitese.jsp?code=<%=item.getConevcodigo()%>&action=1"><span class="label label-success">Vou</span></a>
                            <a href="convitese.jsp?code=<%=item.getConevcodigo()%>&action=2"><span class="label label-info">Talvez</span></a>
                            <a href="convitese.jsp?code=<%=item.getConevcodigo()%>&action=3"><span class="label label-danger">Não vou</span></a>
                        </h4>
                    </div>
                </div>

                <%
                    }
                %>
                <div class="clearfix"> </div>
            </div>

        </div>
    </div>
</div>


<%@include file="padroes/rodape.jsp" %>