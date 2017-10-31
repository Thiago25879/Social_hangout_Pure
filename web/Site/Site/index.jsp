
<%@page import="dao.GrupoDAO"%>
<%@page import="modelo.Grupo"%>
<%@page import="util.Upload"%>
<%@include file="padroes/cabecalho.jsp" %>

<%  Upload upload = new Upload();
    upload.setFolderUpload("../../Fotos");

    Grupo obj = new Grupo();
    GrupoDAO dao = new GrupoDAO();

    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            obj.setGrunome(upload.getForm().get("txtNomegr").toString());
            if (upload.getFiles().size() != 1) {
                obj.setGruimg("question.jpg");
            }else{
            obj.setGruimg(upload.getFiles().get(0));
            }
            if (obj == null) {
                response.sendRedirect("../index.jsp");
                return;
            } else {
                dao.incluir(obj);
            }

            Boolean resultado = dao.incluir(obj);
            if (resultado) {
            } else {
                //Se a adição não pode ser concluida com sucesso
            }
        }
    }%>

<div class="modal fade" id="Modalnovogrupo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div>
                <style>
                    *, *:before, *:after {
                        box-sizing: border-box;
                    }

                    html {
                        overflow-y: scroll;
                    }

                    body {
                        font-family: 'Titillium Web', sans-serif;
                    }

                    a {
                        text-decoration: none;
                        color: #1ab188;
                        -webkit-transition: .5s ease;
                        transition: .5s ease;
                    }
                    a:hover {
                        color: #179b77;
                    }

                    .form {
                        background: rgba(19, 35, 47, 0.9);
                        padding: 40px;
                        max-width: 600px;
                        margin: 40px auto;
                        border-radius: 4px;
                        box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
                    }

                    .tab-group {
                        list-style: none;
                        padding: 0;
                        margin: 0 0 40px 0;
                    }
                    .tab-group:after {
                        content: "";
                        display: table;
                        clear: both;
                    }
                    .tab-group li a {
                        display: block;
                        text-decoration: none;
                        padding: 15px;
                        background: rgba(160, 179, 176, 0.25);
                        color: #a0b3b0;
                        font-size: 20px;
                        float: left;
                        width: 50%;
                        text-align: center;
                        cursor: pointer;
                        -webkit-transition: .5s ease;
                        transition: .5s ease;
                    }
                    .tab-group li a:hover {
                        background: #179b77;
                        color: #ffffff;
                    }
                    .tab-group .active a {
                        background: #1ab188;
                        color: #ffffff;
                    }

                    .tab-content > div:last-child {
                        display: none;
                    }

                    h1 {
                        text-align: center;
                        color: #ffffff;
                        font-weight: 300;
                        margin: 0 0 40px;
                    }

                    label {
                        position: absolute;
                        -webkit-transform: translateY(6px);
                        transform: translateY(6px);
                        left: 13px;
                        color: rgba(255, 255, 255, 0.5);
                        -webkit-transition: all 0.25s ease;
                        transition: all 0.25s ease;
                        -webkit-backface-visibility: hidden;
                        pointer-events: none;
                        font-size: 22px;
                    }
                    label .req {
                        margin: 2px;
                        color: #1ab188;
                    }

                    label.active {
                        -webkit-transform: translateY(50px);
                        transform: translateY(50px);
                        left: 2px;
                        font-size: 14px;
                    }
                    label.active .req {
                        opacity: 0;
                    }

                    label.highlight {
                        color: #ffffff;
                    }

                    input, textarea {
                        font-size: 22px;
                        display: block;
                        width: 100%;
                        //height: 100%;
                        padding: 5px 10px;
                        background: none;
                        background-image: none;
                        border: 1px solid #a0b3b0;
                        color: #ffffff;
                        border-radius: 0;
                        -webkit-transition: border-color .25s ease, box-shadow .25s ease;
                        transition: border-color .25s ease, box-shadow .25s ease;
                    }
                    input:focus, textarea:focus {
                        outline: 0;
                        border-color: #1ab188;
                    }

                    textarea {
                        border: 2px solid #a0b3b0;
                        resize: vertical;
                    }

                    .field-wrap {
                        position: relative;
                        margin-bottom: 40px;

                    }

                    .top-row:after {
                        content: "";
                        display: table;
                        clear: both;
                    }
                    .top-row > div {
                        float: left;
                        width: 48%;
                        margin-right: 4%;
                    }

                    .modal-content{
                        background-color: transparent;
                        border: none;
                    }

                    .modal-body{
                        padding: 0px;
                    }
                    .top-row > div:last-child {
                        margin: 0;
                    }

                    .button {
                        border: 0;
                        outline: none;
                        border-radius: 0;
                        padding: 15px 0;
                        font-size: 2rem;
                        font-weight: 600;
                        text-transform: uppercase;
                        letter-spacing: .1em;
                        background: #1ab188;
                        color: #ffffff;
                        -webkit-transition: all 0.5s ease;
                        transition: all 0.5s ease;
                        -webkit-appearance: none;
                    }
                    .button:hover, .button:focus {
                        background: #179b77;
                    }

                    .button-block {
                        display: block;
                        width: 100%;
                    }
                    .button-small {
                        display: block;
                        padding: 6px 0;
                        width: 100%;
                        font-size: 1rem;
                    }

                    .forgot {
                        margin-top: -20px;
                        text-align: right;
                    }

                    .msg{
                        margin: 0 0 10px;
                    }

                    .custom-img{
                        width: 50%;
                        margin: 30px auto;
                        float: none;
                    }

                    .button-Style{
                        cursor:pointer;
                        border: none;
                        background-size: 100% 100%;
                        background-repeat: no-repeat;
                    }
                </style>
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form">
                                    <div id="signup">   
                                        <h1>Novo Grupo</h1>

                                        <form action="index.jsp" method="post"  enctype="multipart/form-data">

                                            

                                            <div class="field-wrap col-sm-12 text-center custom-img">

                                                
                                                <!-- image-preview-input -->
                                                <div class="btn btn-default image-preview-input">
                                                    <!--<span class="image-preview-input-title">Imagem do grupo</span>-->
                                                    <input type="file" id="OOO" accept="image/png, image/jpeg" onchange="previewFile()" name="input-file-preview" style="display: none ; " />
                                                    <input type="image" class="button-Style" src="../../Fotos/empty.jpg" id="imgbtn" onclick="document.getElementById('OOO').click(); return false;" /> 
                                                </div>
                                                <!-- image-preview-clear button -->
                                                <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                                    <span class="glyphicon glyphicon-remove"></span> Limpar
                                                </button>

                                            </div>
                                            <br>
                                            <div class="field-wrap">
                                                <label>
                                                    Nome do Grupo<span class="req"></span>
                                                </label>
                                                <input type="text" required autocomplete="off" name="txtNomegr"/>
                                            </div>

                                            <button type="submit" class="button button-block"/>Criar grupo</button>

                                        </form>

                                    </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


















<div class="banner-bottom dark-background">
    <div class="container">
        <h3 class="title-w3-agileits two">Grupos</h3>
        <p class="quia shadow"><a href="#" class="link" href="#" data-toggle="modal" data-target="#Modalnovogrupo">Criar grupo</a></p>

        <div class="w3ls_gallery_grids">

            <div class="col-md-4 w3_agile_gallery_grid ">
                <%  int temp1 = 0;
                    for (Membro item : listam) {
                        if (temp1 == 0) {
                            temp1 = 3;
                %>


                <div class="agile_gallery_grid ">
                    <a title="Donec sapien massa, placerat ac sodales ac, feugiat quis est." href="images/1.jpg">
                        <div class="agile_gallery_grid1 auto-height">
                            <img src="../../Fotos/<%=item.getGrucodigo().getGruimg()%>" alt=" " class="img-responsive img-circle img-custom" />
                            <div class="w3layouts_gallery_grid1_pos">
                                <h3><%=item.getGrucodigo().getGrunome()%></h3>
                                <p><%=item.getMemdata()%></p>
                            </div>
                        </div>
                    </a>
                </div>

                <%
                        }
                        temp1--;
                    }%>
            </div>


            <div class="col-md-4 w3_agile_gallery_grid ">
                <%  int temp2 = 1;
                    for (Membro item : listam) {
                        if (temp2 == 0) {
                            temp2 = 3;
                %>
                <div class="agile_gallery_grid ">
                    <a title="Donec sapien massa, placerat ac sodales ac, feugiat quis est." href="images/1.jpg">
                        <div class="agile_gallery_grid1 auto-height">
                            <img src="../../Fotos/<%=item.getGrucodigo().getGruimg()%>" alt=" " class="img-responsive img-circle img-custom" />
                            <div class="w3layouts_gallery_grid1_pos">
                                <h3><%=item.getGrucodigo().getGrunome()%></h3>
                                <p><%=item.getMemdata()%></p>
                            </div>
                        </div>
                    </a>
                </div>

                <%      }
                        temp2--;
                    }%>
            </div> 


            <div class="col-md-4 w3_agile_gallery_grid ">
                <%  int temp3 = 2;
                    for (Membro item : listam) {
                        if (temp3 == 0) {
                            temp3 = 3;
                %>

                <div class="agile_gallery_grid ">
                    <a title="Donec sapien massa, placerat ac sodales ac, feugiat quis est." href="images/1.jpg">
                        <div class="agile_gallery_grid1 auto-height">
                            <img src="../../Fotos/<%=item.getGrucodigo().getGruimg()%>" alt=" " class="img-responsive img-circle img-custom" />
                            <div class="w3layouts_gallery_grid1_pos">
                                <h3><%=item.getGrucodigo().getGrunome()%></h3>
                                <p><%=item.getMemdata()%></p>
                            </div>
                        </div>
                    </a>
                </div>

                <%
                        }
                        temp3--;
                    }%>

            </div> 

            <div class="clearfix"></div>

        </div>
    </div>
                    </div>



    <%@include file="padroes/rodape.jsp" %>