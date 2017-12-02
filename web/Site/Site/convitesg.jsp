
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Convitegr"%>
<%@page import="dao.ConvitegrDAO"%>
<%@include file="padroes/cabecalho.jsp" %>
<%  ConvitegrDAO congrdao = new ConvitegrDAO();
    if (request.getParameter("code") != null) {
        Convitegr conv = congrdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("code")));;
        int X = Integer.parseInt(request.getParameter("action"));
        switch (X) {
            case 1:
                conv.setCongrresposta("sim");
                Membro membro = new Membro();
                membro.setGrucodigo(conv.getGrucodigo());
                membro.setUsucodigo(usuario);
                membro.setMemativo(true);

                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                membro.setMemdata(dateFormat.format(date).toString());

                memdao.incluir(membro);
                break;
            case 2:
                conv.setCongrresposta("nao");
                break;
        }
        congrdao.alterar(conv);
        response.sendRedirect("convitesg.jsp");
    }

    List<Convitegr> listacongrall;
    List<Convitegr> listacongr = new ArrayList<Convitegr>();
    listacongrall = congrdao.listar();
    for (Convitegr itemcon : listacongrall) {
        if (itemcon.getUsucodigo().getUsucodigo() == usuario.getUsucodigo() && itemcon.getCongrresposta() != "sim" && itemcon.getCongrresposta() != "nao") {
            listacongr.add(itemcon);
        }
    }
%>

<div class="services dark-background">
    <div class="container">
        <h3 class="title-w3-agileits two">Convites de grupos</h3>
        <div class="wthree_services_bottom_left banner_bottom_agile_grids">
            <div class="wthree_services_bottom_left_grid">
                <%
                    for (Convitegr item : listacongr) {
                %>
                <div class="col-md-4 w3_agileits_services_bottom_l_grid  center-webkit">
                    <div class="agile_services_bottom_l_grid1">
                        <img src="../../Fotos/<%=item.getGrucodigo().getGruimg()%>" alt=" " class="img-responsive rounded-div auto-height" />
                    </div>
                    <div class="serve_info_agile two rounded-div ">
                        <h4 class="small-pad"><%=item.getGrucodigo().getGrunome()%></h4>
                        <h4>
                            <a href="convitesg.jsp?code=<%=item.getCongrcodigo()%>&action=1"><span class="label label-success">Aceito</span></a>
                            <a href="convitesg.jsp?code=<%=item.getCongrcodigo()%>&action=2"><span class="label label-danger">Recuso</span></a>
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