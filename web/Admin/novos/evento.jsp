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
            if (upload.getFiles().size() != 1) {
                obj.setEveimg("empty.jpg");
            }else{
            obj.setEveimg(upload.getFiles().get(0));
            }
            if (obj == null) {
                response.sendRedirect("../tabelas/evento.jsp");
                return;
            } else {
                dao.incluir(obj);
            }

            Boolean resultado = dao.incluir(obj);
            if (resultado) {
                %><a id='mod' data-toggle="modal" data-target="#myModal"></a><%
            } else {
                //Se a adição não pode ser concluida com sucesso
            }
        }
    }
%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-plus"></i> Novo evento</div>
<form action="#" method="post" enctype="multipart/form-data">


    <div class="col-lg-6">

        <div class="form-group">
            <label>Grupo</label>
            <select name="txtGrupo" class="form-control" required>
                <option value="">Selecione</option>
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
            <input class="form-control" type="text" name="txtNome" required />
        </div>

        <div class="form-group">
            <label>Descrição do evento</label>
            <input class="form-control" type="text" name="txtDescricao" required />
        </div>
                
        <div class="form-group">
            <label>Evento está aberto</label>
            <input class="form-control" type="checkbox" name="txtAberto" value="true" />
        </div>

        <div class="form-group">
            <label>Imagem</label>
            <input class="form-control" type="file" name="txtImg1" />
        </div>        

        <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

    </div>    
</form>
                <div style="height: 100px;"></div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Sucesso</h4>
            </div>
            <div class="modal-body">
                Evento adicionado com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../novos/evento.jsp" type="button" class="btn btn-primary" >Continuar adições</a>
                <a href="../tabelas/evento.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 