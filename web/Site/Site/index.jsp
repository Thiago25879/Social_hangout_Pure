
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="modelo.Grupo"%>
<%@page import="util.Upload"%>
<%@include file="padroes/cabecalho.jsp" %>

<%  Upload upload = new Upload();
    upload.setFolderUpload("Fotos");

    Grupo obj = new Grupo();
    GrupoDAO dao = new GrupoDAO();
    Membro objm = new Membro();
    MembroDAO daom = new MembroDAO();

    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            obj.setGrunome(upload.getForm().get("txtNomegr").toString());
            if (upload.getFiles().size() != 1) {
                obj.setGruimg("question.jpg");
            } else {
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
                objm.setGrucodigo(obj);
                objm.setUsucodigo(usuario);
                objm.setMemativo(true);

                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                objm.setMemdata(dateFormat.format(date).toString());

                daom.incluir(objm);
                response.sendRedirect("../Site/index.jsp");
            } else {
                //Se a adição não pode ser concluida com sucesso
            }
        }
    }%>
<%@include file="modals/novogrupo.jsp" %>

<div class="banner-bottom dark-background">
    <div class="container">
        <h3 class="title-w3-agileits two">Grupos</h3>
        <p class="quia shadow"><a href="#" class="link" href="#" data-toggle="modal" data-target="#Modalnovogrupo">Criar grupo</a></p>

        <div class="w3ls_gallery_grids">

            <div class="col-md-4 w3_agile_gallery_grid ">
                <%  int temp1 = 0;
                    for (Membro item : listam) {
                        if (item.getMemativo().equals(true)) {
                            if (temp1 == 0) {
                                temp1 = 3;
                %>


                <div class="agile_gallery_grid ">
                    <a title="<%=item.getGrucodigo().getGrunome()%>" href="grupo.jsp?code=<%=item.getGrucodigo().getGrucodigo()%>">
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
                        }
                    }%>
            </div>


            <div class="col-md-4 w3_agile_gallery_grid ">
                <%  int temp2 = 1;
                    for (Membro item : listam) {
                        if (item.getMemativo().equals(true)) {
                            if (temp2 == 0) {
                                temp2 = 3;
                %>
                <div class="agile_gallery_grid ">
                    <a title="<%=item.getGrucodigo().getGrunome()%>" href="grupo.jsp?code=<%=item.getGrucodigo().getGrucodigo()%>">
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
                        }
                    }%>
            </div> 


            <div class="col-md-4 w3_agile_gallery_grid ">
                <%  int temp3 = 2;
                    for (Membro item : listam) {
                        if (item.getMemativo().equals(true)) {
                            if (temp3 == 0) {
                                temp3 = 3;
                %>

                <div class="agile_gallery_grid ">
                    <a title="<%=item.getGrucodigo().getGrunome()%>" href="grupo.jsp?code=<%=item.getGrucodigo().getGrucodigo()%>">
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
                        }
                    }%>

            </div> 

            <div class="clearfix"></div>

        </div>
    </div>
</div>



<%@include file="padroes/rodape.jsp" %>