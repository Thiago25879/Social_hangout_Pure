
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="dao.VotoDAO"%>
<%@page import="modelo.Voto"%>
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
<%    
    Upload upload = new Upload();
    upload.setFolderUpload("Fotos");

    Boolean estaParticipando = false;
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
    Participante participante = new Participante();
    participante = pdao.acharparticipantelist(usuario.getUsucodigo(), evento.getEvecodigo()).get(0);
    ConviteevDAO cdao = new ConviteevDAO();
    Conviteev conviteev = new Conviteev();
    VotoDAO vdao = new VotoDAO();
    List<Conviteev> listaconviteev;
    listaconviteev = cdao.listarporeveid(evento.getEvecodigo());
    String msg = "";
    membro = (Membro) mdao.acharmembroList(usuario.getUsucodigo(), evento.getGrucodigo().getGrucodigo()).get(0);
    if(!cdao.acharconvitelist(membro.getMemcodigo(),evento.getEvecodigo()).isEmpty()){
        Conviteev conev = (Conviteev) cdao.acharconvitelist(membro.getMemcodigo(),evento.getEvecodigo()).get(0);
        if(conev.getConevresposta().equals("vou")){
            estaParticipando = true;
        }else{
            estaParticipando = false;
        }
    
    }
    
    
    
    
    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            evento.setEvenome(upload.getForm().get("txtNomeev").toString());
            evento.setEvedesc(upload.getForm().get("txtDescev").toString());
            if (upload.getFiles().size() == 1) {
                evento.setEveimg(upload.getFiles().get(0));
            }
            edao.alterar(evento);
            msg = "Evento alterado com sucesso";
                                    %><a id='mod' data-toggle="modal" data-target="#Modal-msg"></a><%
        } else {

            if (request.getParameter("Id").equals("decisao")) {
                Decisao decisao = new Decisao();
                decisao.setDectitulo(request.getParameter("txtTituloDec"));
                decisao.setDecdesc(request.getParameter("txtDescrDec"));
                decisao.setDecnumvotos(Integer.parseInt(request.getParameter("txtNumvotos")));
                decisao.setEvecodigo(evento);
                ddao.incluir(decisao);

                Boolean resultado = ddao.incluir(decisao);
                if (resultado) {
                    msg = "Nova decisão adicionada";
                                    %><a id='mod' data-toggle="modal" data-target="#Modal-msg"></a><%
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
                    opcao.setParcodigo(pdao.acharparticipante(usuario.getUsucodigo(), evento.getEvecodigo()));
                    opcao.setOpcvotosnum(0);
                    odao.incluir(opcao);
                    msg = "Nova opção adicionada";
                                    %><a id='mod' data-toggle="modal" data-target="#Modal-msg"></a><%
                } else {
                    if (request.getParameter("Id").equals("sair")) {
                        membro = (Membro) mdao.acharmembroList(usuario.getUsucodigo(), evento.getGrucodigo().getGrucodigo()).get(0);
                        List<Conviteev> conev = cdao.acharconvitelist(membro.getMemcodigo(), evento.getEvecodigo());
                        for (int x = 0; x < conev.size(); x++) {
                            conviteev = conev.get(x);
                            conviteev.setConevresposta("nao");
                            cdao.alterar(conviteev);
                        }
                        msg = "Presença cancelada";
                                    %><a id='mod' data-toggle="modal" data-target="#Modal-msg"></a><%
                    } else {
                        if (request.getParameter("Id").equals("submetevotos")) {
                            membro = (Membro) mdao.acharmembroList(usuario.getUsucodigo(), evento.getGrucodigo().getGrucodigo()).get(0);
                            for (Decisao decisao : listadec) {
                                List<Opcao> lopcao = odao.listarpordeccid(decisao.getDeccodigo());
                                for (Opcao opc : lopcao) {
                                    if (request.getParameter(String.valueOf(opc.getOpccodigo())) == null) {
                                        if (vdao.acharvotoList(decisao.getDeccodigo(), membro.getMemcodigo(), opc.getOpccodigo()).isEmpty()) {
                                            //Opção não está marcada e não estava antes
                                        } else {
                                            //Opção não está marcada e estava antes
                                            vdao.excluir((Voto) vdao.acharvotoList(decisao.getDeccodigo(), membro.getMemcodigo(), opc.getOpccodigo()).get(0));
                                        }
                                    } else {
                                        if (vdao.acharvotoList(decisao.getDeccodigo(), membro.getMemcodigo(), opc.getOpccodigo()).isEmpty()) {
                                            //Opção está marcada agora e não estava antes
                                            Voto voto = new Voto();
                                            voto.setDeccodigo(decisao);
                                            voto.setMemcodigo(membro);
                                            voto.setOpccodigo(opc);
                                            vdao.incluir(voto);
                                        } else {
                                            //Opção está marcada agora e já estava
                                        }
                                    }
                                }
                            }
                            
                                for (Decisao item : listadec) {
                                listaopc = odao.listarpordeccid(item.getDeccodigo());
                                for (Opcao itemopc : listaopc) {
                                    itemopc.setOpcvotosnum(vdao.acharvotosnumList(item.getDeccodigo(), itemopc.getOpccodigo()).size());
                                    odao.alterar(itemopc);
                                }
                            }

                            msg = "Votos submetidos";
                                    %><a id='mod' data-toggle="modal" data-target="#Modal-msg"></a><%
                        } else {
                                if (request.getParameter("Id").equals("finalizar")) {
                                        
                                        evento.setEveaberto(false);
                                        edao.alterar(evento);
                                        msg = "Votação fechada";
                                        %><a id='mod' data-toggle="modal" data-target="#Modal-msg"></a><%
                                            
                                } else {
                                msg = "Algo deu errado, contate um administrador";
                                %><a id='mod' data-toggle="modal" data-target="#Modal-msg"></a><% 
                                }
                            }
                        }
                    }
                }
            }
        }

%>

<div class="banner-bottom dark-background">
    <div class="container ">
        <div class="smaller center-block  center-webkit">
            <h3 class="title-w3-agileits two"><%=evento.getEvenome()%></h3>  
            <br>
            <a href="#" class="link" data-toggle="modal" data-target="#Modaleventoopcoes"><img src="../../Fotos/<%=evento.getEveimg()%>" alt=" " class="center-block img-responsive img-circle display-default" /></a>
        </div>
        <div class="center-pad">
            <h4 class="white"><%=evento.getEvedesc()%></h4>
        </div>
        <div class="center-pad grid_3 grid_5">
            <h1><a class="btn btn-default custom-btn font-big" href="#" class="link" href="#" data-toggle="modal" data-target="#Modallistaconvidados">Convidados</a></h1>
        </div>

        <br>

        <div class="smaller center-block ">
            <h3 class="title-w3-agileits two size-down">Decisões</h3>
            <%if(estaParticipando == true && evento.getEveaberto().equals(true)){%>
            <p class="quia shadow"><a class="link" href="#" data-toggle="modal" data-target="#Modalnovadecisao " >Nova Decisão</a></p>
            <%}%>
        </div>
        <br>
        <form action="evento.jsp?code=<%=(request.getParameter("code"))%>" method="post">
            <%for (Decisao item : listadec) {
                    listaopc = odao.listarpordeccid(item.getDeccodigo());
            %>
            <div class="panel-group">
                <div class="panel panel-default panel-custom">
                    <div class="panel-heading panel-heading-custom">
                        <h4 class="panel-title panel-title-custom">
                            <a data-toggle="collapse" href="#collapse<%=item.getDeccodigo()%>" class="custom-decision"><%=item.getDectitulo()%></a>
                        </h4>
                    </div>

                    <div id="collapse<%=item.getDeccodigo()%>" class="panel-collapse collapse panel-collapse-custom cada-decisao" data-limit="<%=item.getDecnumvotos()%>" >
                        <ul class="list-group list-group-custom">
                            <li class="list-group-item list-custom center-pad bold"><span><%=item.getDecdesc()%> - Votos: <%=item.getDecnumvotos()%></span></li>
                            <% if(evento.getEveaberto().equals(false)){ 
                                Collections.sort(listaopc, new Comparator<Opcao>() {
                                public int compare(Opcao o1, Opcao o2) {
                                    return o2.getOpcvotosnum().compareTo(o1.getOpcvotosnum());
                                }
                            }); 
                            }
                                    for (Opcao itemopc : listaopc) {%>
                            <li class="list-group-item list-custom"><input type="checkbox" <%if(!estaParticipando == true && evento.getEveaberto().equals(false)){%> disabled <%}%> class="radio_custom cada-opcao" name="<%=itemopc.getOpccodigo()%>" id="<%=itemopc.getOpccodigo()%>" value="<%=itemopc.getOpccodigo()%>" <%if (!vdao.acharvotoList(item.getDeccodigo(), membro.getMemcodigo(), itemopc.getOpccodigo()).isEmpty()) {%> checked <%}%>/><label for="<%=itemopc.getOpccodigo()%>"><%if(estaParticipando == true && evento.getEveaberto().equals(true)){%><span></span><%}%>Total: <%=itemopc.getOpcvotosnum()%> - <%=itemopc.getOpcnome()%></label></li>
                                        <%}%>
                        </ul>
                        <% if(estaParticipando == true && evento.getEveaberto().equals(true)){%>
                        <div class="panel-footer panel-footer-custom"><a class="link white abrir-novaOpcaoModal" onclick="setOptionId(<%=item.getDeccodigo()%>)" id="openModalButton" href="#" data-toggle="modal" data-target="#Modalnovaopcao " > <i class="fa fa-plus-square-o" aria-hidden="true"></i> Nova Opção</a></div>
                        <% } %>
                    </div>
                </div>
            </div>
            <%}%>
            <%if(estaParticipando == true && evento.getEveaberto().equals(true)){%>
            <input type="hidden" value="submetevotos" name="Id"/>
            <button class="btn btn-default custom-btn font-bigger center-block" type="submit">Submeter votos</button>
            <%}%>
        </form>
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
                                <div class="field-wrap">
                                    <label class="done">
                                        Numero de votos por participante<span class="req"></span>
                                    </label>
                                    <input type="number" required autocomplete="off" name="txtNumvotos" min="1" value="1"/>
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
                                        <a href="#"  data-toggle="modal" data-target="#Modaleditarevento"><button type="submit" class="button button-block" data-dismiss="modal" />Editar <br/> Evento</button></a>
                                    </div>
                                </div>
                            </form>
                            <%if(participante.getParadmin().equals(false)){%>
                            <form action="evento.jsp?code=<%=(request.getParameter("code"))%>" method="post">
                                <div class="field-wrap">
                                    <div class="col-md-6">
                                        <button type="submit" class="button button-block" />Cancelar     presença</button>
                                        <input type="hidden" value="sair" name="Id"/>
                                    </div>
                                </div>

                            </form>    
                            <%}else{%>
                            <form action="evento.jsp?code=<%=(request.getParameter("code"))%>" method="post">
                                <div class="field-wrap">
                                    <div class="col-md-6">
                                        <button type="submit" class="button button-block" />Finalizar  <br/>   votação</button>
                                        <input type="hidden" value="finalizar" name="Id"/>
                                    </div>
                                </div>

                            </form>
                            <%}%>    
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

<div class="modal fade" id="Modallistaconvidados" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Lista de convidados</h1>

                            <%
                                for (Conviteev item : listaconviteev) {
                            %>
                            <div class="clearfix vertical-center usr-icon ">
                                <img class="media-object dp1 img-circle img-responsive usr-icon" src="../../Fotos/<%=item.getMemcodigo().getUsucodigo().getUsuimg()%>" >
                                <h2 class="modal-text font-h2 <%
                                    if (item.getConevresposta().equals("vou")) {
                                    %> text-green <%
                                    } else {
                                        if (item.getConevresposta().equals("talvez")) {
                                    %> text-blue <%
                                    } else {
                                        if (item.getConevresposta().equals("nao")) {
                                    %> text-red <%
                                    } else {
                                        if (item.getConevresposta().equals("pendente")) {
                                    %> text-white <%
                                                    } else {
                                                        //Deu bad
                                                    }
                                                }
                                            }
                                        }
                                    %>"><%=item.getMemcodigo().getUsucodigo().getUsunick()%></h2>
                            </div>
                            <%}%>
                            <input type="hidden" value="opcao" name="Id"/>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="Modal-msg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="centered">
                        <div class="form">
                            <div id="message">   
                                <h1><%=msg%></h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 

<%@include file="padroes/rodape.jsp" %>

<script src="js/modalScript.js"></script>
<script>

                                            $('.cada-opcao').on('change', function (evt) {
                                                if ($(this).is(":checked")) {
                                                    var limit = $(this).closest(".cada-decisao").data("limit");
                                                    if ($(this).closest(".cada-decisao").find(".cada-opcao:checked").length > limit) {
                                                        $(this).prop("checked", false);
                                                        //alert("Você só pode escolher " + limit + " opções !!!");
                                                    }
                                                }
                                            });

</script>
<script>
    document.getElementById("mod").click();
</script> 