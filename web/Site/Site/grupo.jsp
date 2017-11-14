
<%@page import="dao.ParticipanteDAO"%>
<%@page import="modelo.Participante"%>
<%@page import="dao.ConviteevDAO"%>
<%@page import="modelo.Conviteev"%>
<%@page import="dao.EventoDAO"%>
<%@page import="modelo.Evento"%>
<%@page import="util.Upload"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="modelo.Grupo"%>
<%@include file="padroes/cabecalho.jsp" %>
<%  Upload upload = new Upload();
    upload.setFolderUpload("Fotos");

    GrupoDAO dao = new GrupoDAO();
    Grupo item2 = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("code")));
    MembroDAO mdao = new MembroDAO();
    List<Membro> listamem;
    listamem = memdao.listarporgruid(item2.getGrucodigo());

    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            Evento obj = new Evento();
            EventoDAO edao = new EventoDAO();
            obj.setEvenome(upload.getForm().get("txtNomeev").toString());
            obj.setEvedesc(upload.getForm().get("txtDescev").toString());
            obj.setGrucodigo(item2);
            if (upload.getFiles().size() != 1) {
                obj.setEveimg("question.jpg");
            } else {
                obj.setEveimg(upload.getFiles().get(0));
            }
            if (obj == null) {
                response.sendRedirect("grupo.jsp?code=" + obj.getGrucodigo().getGrucodigo() + "");
                return;
            } else {
                edao.incluir(obj);
            }

            Boolean resultado = edao.incluir(obj);
            if (resultado) {
                Participante part = new Participante();
                ParticipanteDAO pdao = new ParticipanteDAO();
                ConviteevDAO cdao = new ConviteevDAO();
                Conviteev conev = new Conviteev();
                conev.setConevresposta("vou");
                conev.setEvecodigo(obj);
                conev.setMemcodigo(mdao.acharmembro(usuario.getUsucodigo(), item2.getGrucodigo()));
                cdao.incluir(conev);
                part.setEvecodigo(obj);
                part.setMemcodigo(mdao.acharmembro(usuario.getUsucodigo(), item2.getGrucodigo()));
                pdao.incluir(part);
                response.sendRedirect("evento.jsp?code=" + obj.getEvecodigo() + "");
            } else {
                //Se a adição não pode ser concluida com sucesso
            }
        }
    }
%> 

<%@include file="modals/novoevento.jsp" %>
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
                <a class="label label-default grp-btn" href="#" class="link" href="#" data-toggle="modal" data-target="#Modalnovoevento">Novo Evento</a></h1>
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