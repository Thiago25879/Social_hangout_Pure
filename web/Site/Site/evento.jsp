
<%@page import="dao.OpcaoDAO"%>
<%@page import="modelo.Opcao"%>
<%@page import="dao.DecisaoDAO"%>
<%@page import="modelo.Decisao"%>
<%@page import="dao.EventoDAO"%>
<%@page import="modelo.Evento"%>
<!-- Mostrar status de convites, mostrar decisões e opções -->
<%@include file="padroes/cabecalho.jsp" %>
<%Evento evento = new Evento();
    EventoDAO edao = new EventoDAO();
    evento = edao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("code")));
    List<Decisao> listadec;
    DecisaoDAO ddao = new DecisaoDAO();
    listadec = ddao.listarporeveid(evento.getEvecodigo());
    List<Opcao> listaopc;
    OpcaoDAO odao = new OpcaoDAO();

    if (request.getMethod().equals("POST")) {
        if (request.getParameter("txtId").equals("decisao")) {
            Decisao decisao = new Decisao();
            decisao.setDectitulo(request.getParameter("txtTituloDec"));
            decisao.setDecdesc(request.getParameter("txtDescrDec"));
            decisao.setEvecodigo(evento);
            ddao.incluir(decisao);

            Boolean resultado = ddao.incluir(decisao);
            if (resultado) {
            } else {

            }
        }
        if (request.getParameter("txtId").equals("opcao")) {
            Opcao opcao = new Opcao();
            opcao.setOpcnome(request.getParameter("txtNomeop"));

        }

    }


%>
<%@include file="modals/novadecisao.jsp" %>
<%@include file="modals/novaopcao.jsp" %>

<div class="banner-bottom dark-background">
    <div class="container ">
        <div class="smaller center-block">
            <h3 class="title-w3-agileits two"><%=evento.getEvenome()%></h3>  
            <br>
            <img src="../../Fotos/<%=evento.getEveimg()%>" alt=" " class="center-block img-responsive img-circle" />
        </div>
        <div class="center-pad">
            <h4 class="white"><%=evento.getEvedesc()%></h4>
        </div>
        <div class="center-pad grid_3 grid_5">
            <h1><a class="label label-default grp-btn" href="#">Convidados</a></h1>
        </div>

        <br>

        <div class="smaller center-block ">
            <h3 class="title-w3-agileits two size-down">Decisões</h3>
            <p class="quia shadow"><a class="link" href="#" data-toggle="modal" data-target="#Modalnovadecisao " >Nova decisão</a></p>
        </div>
        <br>
        <%for (Decisao item : listadec) {
                listaopc = odao.listarpordeccid(item.getDeccodigo());
        %>
        <div class="panel-group">
            <div class="panel panel-default panel-custom">
                <div class="panel-heading panel-heading-custom">
                    <h4 class="panel-title panel-title-custom">
                        <a data-toggle="collapse" href="#collapse<%=item.getDeccodigo()%>"><%=item.getDectitulo()%></a>
                    </h4>
                </div>

                <div id="collapse<%=item.getDeccodigo()%>" class="panel-collapse collapse panel-collapse-custom">
                    <ul class="list-group list-group-custom">
                        <li class="list-group-item list-custom center-pad bold"><span><%=item.getDecdesc()%></span></li>
                                <%for (Opcao itemopc : listaopc) {%>
                        <li class="list-group-item list-custom"><input type="radio" class="radio_custom" id="r<%=itemopc.getOpccodigo()%>" name="r<%=item.getDeccodigo()%>" value="<%=itemopc.getOpccodigo()%>" /><label for="r<%=itemopc.getOpccodigo()%>"><span></span><%=itemopc.getOpcnome()%></label></li>
                                    <%}%>
                    </ul>
                    <div class="panel-footer panel-footer-custom"> <i class="fa fa-plus-square-o" aria-hidden="true"></i> Nova Opção</div>
                </div>
            </div>
        </div>
        <%}%>

    </div>
</div>


<%@include file="padroes/rodape.jsp" %>