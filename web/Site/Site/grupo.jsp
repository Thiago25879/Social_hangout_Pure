
<%@page import="modelo.Convitegr"%>
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
    UsuarioDAO udao = new UsuarioDAO();
    Grupo item2 = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("code")));
    MembroDAO mdao = new MembroDAO();
    List<Membro> listamem;
    listamem = memdao.listarporgruid(item2.getGrucodigo());

    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            if (upload.getForm().get("Id").toString().equals("novoevento")) {

                Evento obj = new Evento();
                EventoDAO edao = new EventoDAO();
                obj.setEvenome(upload.getForm().get("txtNomeev").toString());
                obj.setEvedesc(upload.getForm().get("txtDescev").toString());
                obj.setGrucodigo(item2);
                System.out.println(upload.getFiles().size());
                if (upload.getFiles().size() != 1) {
                    obj.setEveimg("empty.jpg");
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
                    part.setEvecodigo(obj);
                    part.setMemcodigo(mdao.acharmembro(usuario.getUsucodigo(), item2.getGrucodigo()));
                    pdao.incluir(part);

                    List<Membro> mlist = item2.getMembroList();
                    for (Membro item : mlist) {
                        conev = new Conviteev();
                        conev.setEvecodigo(obj);
                        conev.setMemcodigo(item);
                        if (!item.getUsucodigo().getUsucodigo().equals(usuario.getUsucodigo())) {
                            conev.setConevresposta("pendente");
                        } else {
                            conev.setConevresposta("vou");
                        }
                        cdao.incluir(conev);
                    }
                    response.sendRedirect("evento.jsp?code=" + obj.getEvecodigo() + "");
                } else {
                    //Se a adição não pode ser concluida com sucesso
                }
            } else {
                if (upload.getForm().get("Id").toString().equals("editar")) {
                    item2.setGrunome(upload.getForm().get("txtNomegred").toString());
                    if (upload.getFiles().size() == 1) {
                        item2.setGruimg(upload.getFiles().get(0));
                        System.out.println("Imagem: " + item2.getGruimg());
                    }
                    dao.alterar(item2);
                }
            }
        } else {
            if (request.getParameter("Opc").equals("sair")) {
                Membro mem = new Membro();
                mem = mdao.acharmembro(usuario.getUsucodigo(), item2.getGrucodigo());
                mem.setMemativo(false);
                mdao.alterar(mem);
                response.sendRedirect("index.jsp");
            } else {
                if (request.getParameter("Opc").equals("buscar")) {
                    if (!udao.buscarUsrList(request.getParameter("txtIdusr")).isEmpty()) {
                        Usuario usr = new Usuario();
                        usr = udao.buscarUsr(request.getParameter("txtIdusr").toString());
                        if (mdao.acharmembroList(usr.getUsucodigo(), item2.getGrucodigo()).isEmpty()) {
                            Convitegr convgr = new Convitegr();
                            convgr.setCongrresposta("pendente");
                            convgr.setGrucodigo(item2);
                            convgr.setUsucodigo(usr);
                            usr.getConvitegrList().add(convgr);
                            udao.alterar(usr);
                        } else {
                            //Se já houver esse usuário no grupo
                        }
                    } else {
                        //Se não tiver nenhum usuario com esse id
                    }
                }
            }
        }
    }
%> 


<div class="modal fade" id="Modalgrupoedicao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Editar Grupo</h1>
                            <form action="grupo.jsp?code=<%=(request.getParameter("code"))%>" method="post"  enctype="multipart/form-data">
                                <div class="field-wrap col-sm-12 text-center custom-img">
                                    <!-- image-preview-input -->
                                    <div class="btn btn-default image-preview-input">
                                        <!--<span class="image-preview-input-title">Imagem do grupo</span>-->
                                        <input type="file" class="input-imagem" accept="image/png, image/jpeg" onchange="previewFile(this)" name="input-file-preview" style="display: none ; " />
                                        <input type="image" class="button-Style imgbtn" src="../../Fotos/<%=item2.getGruimg()%>" value="../../Fotos/<%=item2.getGruimg()%>" /> 
                                    </div>
                                </div>
                                <br>
                                <div class="field-wrap">
                                    <label class="done">
                                        Nome do Grupo<span class="req"></span>
                                    </label>
                                    <input type="text" required autocomplete="off" name="txtNomegred" value="<%=item2.getGrunome()%>" />
                                </div>
                                <input type="hidden" value="editar" name="Id"/>
                                <button type="submit" class="button button-block"/>Editar grupo</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="modals/novomembro.jsp" %>
<%@include file="modals/grupoopcoes.jsp" %>
<%@include file="modals/novoevento.jsp" %>
<div class="banner-bottom dark-background">
    <div class="container ">
        <div class="smaller center-block">
            <h3 class="title-w3-agileits two"><%=item2.getGrunome()%></h3>  
            <br>
            <a href="#" class="link" href="#" data-toggle="modal" data-target="#Modalgrupoopcoes"><img src="../../Fotos/<%=item2.getGruimg()%>" alt=" " class="center-block img-responsive img-circle" /></a>
        </div>

        <div class="center-pad grid_3 grid_5">
          <h1><!--  <a class="label label-default grp-btn" href="#" class="link" href="#" data-toggle="modal" data-target="#Modalnovomembro">Novo Membro</a>-->
                <a class=" btn btn-default custom-btn" href="#" class="link" href="#" data-toggle="modal" data-target="#Modalnovomembro">Novo Membro</a>
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
                            <img class="media-object dp1 img-circle img-responsive usr-icon auto-height" src="../../Fotos/<%=item.getUsucodigo().getUsuimg()%>" >
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


<%@include file="padroes/rodape_1.jsp" %>