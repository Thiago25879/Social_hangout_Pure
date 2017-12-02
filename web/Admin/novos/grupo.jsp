
<%@page import="util.Upload"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Grupo"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="java.util.List"%>
<%@include file="../padroes/cabecalho.jsp" %>

<%Upload upload = new Upload();
    upload.setFolderUpload("Fotos");

    Grupo obj = new Grupo();
    GrupoDAO dao = new GrupoDAO();

    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            obj.setGrunome(upload.getForm().get("txtTitulo").toString());
            if (upload.getFiles().size() != 1) {
                obj.setGruimg("empty.jpg");
            }else{
            obj.setGruimg(upload.getFiles().get(0));
            }
            if (obj == null) {
                response.sendRedirect("../tabelas/grupo.jsp");
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
        <i class="fa fa-plus"></i> Novo grupo</div>
<form action="#" method="post" enctype="multipart/form-data">


    <div class="col-lg-6">

        <div class="form-group">
            <label>Nome do grupo</label>
            <input class="form-control" type="text" name="txtTitulo" required />
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
                Grupo adicionado com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../novos/grupo.jsp" type="button" class="btn btn-primary" >Continuar adições</a>
                <a href="../tabelas/grupo.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 