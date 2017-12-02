
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="util.Upload"%>
<%@include file="../padroes/cabecalho.jsp" %>
<%  Upload upload = new Upload();

    upload.setFolderUpload("Fotos");

    Usuario obj = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();
    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            obj.setUsulogin(upload.getForm().get("txtLogin").toString());
            obj.setUsusenha(upload.getForm().get("txtSenha").toString());
            obj.setUsunick(upload.getForm().get("txtNick").toString());
            if (upload.getFiles().size() != 1) {
                obj.setUsuimg("empty.jpg");
            }else{
            obj.setUsuimg(upload.getFiles().get(0));
            }
            if (obj == null) {
                response.sendRedirect("../tabelas/usuario.jsp");
                return;
            } else {
                dao.incluir(obj);
            }

            Boolean resultado = dao.incluir(obj);
            if (resultado) {
                %><a id='mod' data-toggle="modal" data-target="#myModal"></a><%
            } else {
                //Se a adi��o n�o pode ser concluida com sucesso
            }
        }
    }
%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-plus"></i> Novo usu�rio</div>
<form action="#" method="post" enctype="multipart/form-data">

    <div class="col-lg-6">

        <div class="form-group">
            <label>Apelido</label>
            <input class="form-control" type="text" name="txtNick" required />
        </div>

        <div class="form-group">
            <label>Login</label>
            <input class="form-control" type="text" name="txtLogin" required />
        </div>

        <div class="form-group">
            <label>Senha</label>
            <input class="form-control" type="text" name="txtSenha" required />
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
                Usu�rio adicionado com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../novos/usuario.jsp" type="button" class="btn btn-primary" >Continuar adi��es</a>
                <a href="../tabelas/usuario.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 