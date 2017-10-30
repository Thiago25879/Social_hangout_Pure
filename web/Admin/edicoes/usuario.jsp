
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
            obj.setUsucodigo(Integer.parseInt(upload.getForm().get("txtCodigo").toString()));
            obj.setUsulogin(upload.getForm().get("txtLogin").toString());
            obj.setUsusenha(upload.getForm().get("txtSenha").toString());
            obj.setUsunick(upload.getForm().get("txtNick").toString());
            if (upload.getFiles().size() != 1) {
                Usuario obj2 = new Usuario();
                obj2 = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
                obj.setUsuimg(obj2.getUsuimg());
            } else {
                obj.setUsuimg(upload.getFiles().get(0));
            }
                if (obj == null) {
                    response.sendRedirect("../tabelas/usuario.jsp");
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
                            response.sendRedirect("../tabelas/usuario.jsp");
                            return;
                        }

                        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
//Se for um resgistro inválido, sai da tela
                        if (obj == null) {
                            response.sendRedirect("../tabelas/usuario.jsp");
                            return;
                        }
                    }
%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-pencil"></i> Edição de usuário</div>

    <form action="#" method="post" enctype="multipart/form-data">

        <div class="col-lg-6">

            <div class="form-group">
                <label>Id do grupo</label>
                <input class="form-control" type="text" name="txtCodigo" readonly value="<%=obj.getUsucodigo()%>"  />
            </div>

            <div class="form-group">
                <label>Apelido</label>
                <input class="form-control" type="text" name="txtNick" required value="<%=obj.getUsunick()%>"/>
            </div>

            <div class="form-group">                                                                     
                <label>Login</label>
                <input class="form-control" type="text" name="txtLogin" required value="<%=obj.getUsulogin()%>"/>
            </div>

            <div class="form-group">
                <label>Senha</label>
                <input class="form-control" type="text" name="txtSenha" required value="<%=obj.getUsusenha()%>"/>
            </div>

            <div class="form-group">
                <label>Imagem</label>
                <input class="form-control" type="file" name="txtImg1"  value="<%=obj.getUsuimg()%>"/>
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
                Usuário alterado com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../edicoes/usuario.jsp?codigo=<%=obj.getUsucodigo()%>" type="button" class="btn btn-primary" >Corrigir edição</a>
                <a href="../tabelas/usuario.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 