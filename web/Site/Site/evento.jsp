
<%@page import="util.Upload"%>
<%@page import="modelo.Conviteev"%>
<%@page import="dao.ConviteevDAO"%>
<%@page import="dao.ParticipanteDAO"%>
<%@page import="modelo.Participante"%>
<%@page import="dao.OpcaoDAO"%>
<%@page import="modelo.Opcao"%>
<%@page import="dao.DecisaoDAO"%>
<%@page import="modelo.Decisao"%>
<%@page import="dao.EventoDAO"%>
<%@page import="modelo.Evento"%>
<!-- Mostrar status de convites, mostrar decisões e opções -->
<%@include file="padroes/cabecalho.jsp" %>
<%    Upload upload = new Upload();
    upload.setFolderUpload("Fotos");

    Evento evento = new Evento();
    EventoDAO edao = new EventoDAO();
    evento = edao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("code")));
    List<Decisao> listadec;
    DecisaoDAO ddao = new DecisaoDAO();
    listadec = ddao.listarporeveid(evento.getEvecodigo());
    List<Opcao> listaopc;
    MembroDAO mdao = new MembroDAO();
    Membro membro = new Membro();
    OpcaoDAO odao = new OpcaoDAO();
    ParticipanteDAO pdao = new ParticipanteDAO();
    ConviteevDAO cdao = new ConviteevDAO();
    Conviteev conviteev = new Conviteev();

    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            evento.setEvenome(upload.getForm().get("txtNomeev").toString());
            evento.setEvedesc(upload.getForm().get("txtDescev").toString());
            if (upload.getFiles().size() == 1) {
                evento.setEveimg(upload.getFiles().get(0));
            }
            edao.alterar(evento);
        } else {

            if (request.getParameter("Id").equals("decisao")) {
                Decisao decisao = new Decisao();
                decisao.setDectitulo(request.getParameter("txtTituloDec"));
                decisao.setDecdesc(request.getParameter("txtDescrDec"));
                decisao.setEvecodigo(evento);
                ddao.incluir(decisao);

                Boolean resultado = ddao.incluir(decisao);
                if (resultado) {
                    response.sendRedirect("evento.jsp?code=" + request.getParameter("code") + "");
                } else {

                }
            } else {
                if (request.getParameter("Id").equals("opcao")) {
                    Opcao opcao = new Opcao();
                    opcao.setOpcnome(request.getParameter("txtNomeopc"));
                    Decisao decisao = new Decisao();
                    decisao = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtId")));
                    opcao.setDeccodigo(decisao);
                    opcao.setOpcnumvotos(0);
                    opcao.setParcodigo(pdao.acharparticipante(usuario.getUsucodigo(), evento.getEvecodigo()));
                    odao.incluir(opcao);

                } else {
                    if (request.getParameter("Id").equals("sair")) {
                        membro = mdao.acharmembro(usuario.getUsucodigo(), evento.getEvecodigo());
                        conviteev = cdao.acharconvite(membro.getMemcodigo(), evento.getEvecodigo());
                        conviteev.setConevresposta("nao");
                        cdao.alterar(conviteev);
                    } else {

                    }
                }
            }
        }
    }

%>

<div class="banner-bottom dark-background">
    <div class="container ">
        <div class="smaller center-block">
            <h3 class="title-w3-agileits two"><%=evento.getEvenome()%></h3>  
            <br>
            <a href="#" class="link" data-toggle="modal" data-target="#Modaleventoopcoes"><img src="../../Fotos/<%=evento.getEveimg()%>" alt=" " class="center-block img-responsive img-circle" /></a>
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
                        <li class="list-group-item list-custom"><input type="checkbox" class="radio_custom" id="r<%=itemopc.getOpccodigo()%>" name="r<%=item.getDeccodigo()%>" value="<%=itemopc.getOpccodigo()%>" /><label for="r<%=itemopc.getOpccodigo()%>"><span></span><%=itemopc.getOpcnome()%></label></li>
                                    <%}%>
                    </ul>
                    <div class="panel-footer panel-footer-custom"><a class="link white abrir-novaOpcaoModal" onclick="setOptionId(<%=item.getDeccodigo()%>)" id="openModalButton" href="#" data-toggle="modal" data-target="#Modalnovaopcao " > <i class="fa fa-plus-square-o" aria-hidden="true"></i> Nova Opção</a></div>
                </div>
            </div>
        </div>
        <%}%>

    </div>
</div>


<div class="modal fade" id="Modalnovadecisao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Nova Decisão</h1>

                            <form action="evento.jsp?code=<%=(request.getParameter("code"))%>" method="post">

                                <div class="field-wrap">
                                    <label>
                                        Título da decisão<span class="req"></span>
                                    </label>
                                    <input type="text" required autocomplete="off" name="txtTituloDec"/>
                                </div>
                                <br>
                                <div class="field-wrap">
                                    <label>
                                        Descrição da decisão<span class="req"></span>
                                    </label>
                                    <input type="text" required autocomplete="off" name="txtDescrDec"/>
                                </div>
                                <input type="hidden" value="decisao" name="Id"/>
                                <button type="submit" class="button button-block" />Criar Decisão</button>

                            </form>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="Modalnovaopcao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Nova opção</h1>

                            <form action="evento.jsp?code=<%=(request.getParameter("code"))%>" method="post">

                                <div class="field-wrap">
                                    <label>
                                        Nome da opção<span class="req"></span>
                                    </label>
                                    <input type="text" id="txtNomeopc" name="txtNomeopc">
                                </div>
                                <input type="hidden" id="modalId" name="txtId">
                                <input type="hidden" value="opcao" name="Id"/>
                                <button type="submit" class="button button-block"/>Criar opção</button>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="Modaleventoopcoes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Opções</h1>

                            <form action="evento.jsp?code=<%=(request.getParameter("code"))%>" method="post">
                                <div class="field-wrap">
                                    <input type="hidden" value="opcoes" name="Id"/>
                                    <div class="col-md-6">
                                        <a href="#" class="link" data-toggle="modal" data-target="#Modaleditarevento"><button type="submit" class="button button-block" data-dismiss="modal" />Editar <br/> Evento</button></a>
                                    </div>
                                </div>
                            </form>
                            <form action="evento.jsp?code=<%=(request.getParameter("code"))%>" method="post">
                                <div class="field-wrap">
                                    <div class="col-md-6">
                                        <button type="submit" class="button button-block" />Cancelar     presença</button>z
                                        <input type="hidden" value="sair" name="Id"/>
                                    </div>
                                </div>

                            </form>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="Modaleditarevento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Editar Evento</h1>

                            <form action="#" method="post"  enctype="multipart/form-data">



                                <div class="field-wrap col-sm-12 text-center custom-img">

                                    <div class="btn btn-default image-preview-input">
                                        <!--<span class="image-preview-input-title">Imagem do grupo</span>-->
                                        <input type="file" class="custom-input" id="OOO" accept="image/png, image/jpeg" onchange="previewFile()"  name="input-file-preview" style="display: none ; " />
                                        <input type="image" class="custom-input no-border" class="button-Style" src="../../Fotos/<%=evento.getEveimg()%>" id="imgbtn" value="../../Fotos/<%=evento.getEveimg()%>" onclick="document.getElementById('OOO').click(); return false;" /> 
                                    </div>

                                </div>
                                <br>
                                <div class="field-wrap">
                                    <label class="done">
                                        Nome do Evento<span class="req"></span>
                                    </label>
                                    <input type="text" required autocomplete="off" name="txtNomeev" value="<%=evento.getEvenome()%>"/>
                                </div>
                                <br>
                                <div class="field-wrap">
                                    <label class="done">
                                        Descrição do Evento<span class="req"></span>
                                    </label>
                                    <input type="text" required autocomplete="off" name="txtDescev" value="<%=evento.getEvedesc()%>"/>
                                </div>
                                <input type="hidden" value="novoevento" name="Id"/>
                                <button type="submit" class="button button-block"/>Editar Evento</button>

                            </form>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<script src="js/modalScript.js"></script>
<%@include file="padroes/rodape.jsp" %>
