<%@page import="util.Upload"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Grupo"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="modelo.Evento"%>
<%@page import="dao.EventoDAO"%>
<%@page import="java.util.List"%>
<%@include file="../padroes/cabecalho.jsp" %>
<%Upload upload = new Upload();
    upload.setFolderUpload("Fotos");

    Evento obj = new Evento();
    EventoDAO dao = new EventoDAO();
    GrupoDAO gDAO = new GrupoDAO();
    List<Grupo> gLista = gDAO.listar();

    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            obj.setEvecodigo(Integer.parseInt(upload.getForm().get("txtCodigo").toString()));
            obj.setEvenome(upload.getForm().get("txtNome").toString());
            obj.setEvedesc(upload.getForm().get("txtDescricao").toString());
            if(upload.getForm().get("txtAberto") == null){
                obj.setEveaberto(false);
            }else{
                obj.setEveaberto(true);
            }

            Grupo grupo = new Grupo();
            grupo.setGrucodigo(Integer.parseInt(upload.getForm().get("txtGrupo").toString()));
            obj.setGrucodigo(grupo);
            if(upload.getFiles().size()!=1){
                Evento obj2 = new Evento();
                obj2 = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
                obj.setEveimg(obj2.getEveimg());
            }else{
                    obj.setEveimg(upload.getFiles().get(0));
            }

            if (obj == null) {
                response.sendRedirect("../tabelas/evento.jsp");
                return;
            } else {
                dao.alterar(obj);
            }

            Boolean resultado = dao.alterar(obj);
            if (resultado) {
                obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
                %><a id='mod' data-toggle="modal" data-target="#myModal"></a><%
                            } else {
                                //Se a adição não pode ser concluida com sucesso
                            }
                        }
                    } else {
                        //É GET -------
                        if (request.getParameter("codigo") == null) {
                            response.sendRedirect("../tabelas/evento.jsp");
                            return;
                        }
                        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
//Se for um resgistro inválido, sai da tela
                        if (obj == null) {
                            response.sendRedirect("../tabelas/evento.jsp");
                            return;
                        }
                    }
%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-pencil"></i> Edição de evento</div>

    <form action="#" method="post" enctype="multipart/form-data">

        <div class="col-lg-6">

            <div class="form-group">
                <label>Id do grupo</label>
                <input class="form-control" type="text" name="txtCodigo" readonly value="<%=obj.getEvecodigo()%>"  />
            </div>

            <div class="form-group">
                <label>Grupo</label>
                <select name="txtGrupo" class="form-control" required >
                    <option selected="selected" value="<%=obj.getGrucodigo().getGrucodigo()%>"><%=obj.getGrucodigo().getGrunome()%></option>
                    <%
                        for (Grupo gru : gLista) {
                    %>
                    <option value="<%=gru.getGrucodigo()%>" ><%=gru.getGrunome()%></option>
                    <%
                        }
                    %>

                </select>
            </div>

            <div class="form-group">
                <label>Nome do evento</label>
                <input class="form-control" type="text" name="txtNome" required value="<%=obj.getEvenome()%>"/>
            </div>

            <div class="form-group">
                <label>Descrição do evento</label>
                <input class="form-control" type="text" name="txtDescricao" required value="<%=obj.getEvedesc()%>"/>
            </div>
            
            <div class="form-group">
                <label>Evento está aberto</label>
                <input class="form-control" type="checkbox" name="txtAberto" value="true" <%if(obj.getEveaberto()== true){%> checked <%}%>/>
            </div>

            <div class="form-group">
                <label>Imagem</label>
                <input class="form-control" type="file" name="txtImg1" value="Fotos/<%=obj.getEveimg()%>"/>
            </div>        

            <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

        </div>    
    </form>
</div>
<div style="height: 100px;"></div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Sucesso</h4>
            </div>
            <div class="modal-body">
                Evento alterado com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../edicoes/evento.jsp?codigo=<%=obj.getEvecodigo()%>" type="button" class="btn btn-primary" >Corrigir edição</a>
                <a href="../tabelas/evento.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 