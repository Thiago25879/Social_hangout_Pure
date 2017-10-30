
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../padroes/cabecalho_filtro.jsp" %>


<%
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> lista = null;
    //verifico se é escluir
    if (request.getParameter("usucodigo") != null) {
        Usuario obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("usucodigo")));
        if (obj != null) {
           Boolean funcionou = false;
            try{
            funcionou = dao.excluir(obj);
            }catch(IllegalStateException ISE){
                %><a id='erros' data-toggle="modal" data-target="#erro"></a><%
            }
            if (funcionou) {
                //aqui depois vai ter uma janela
            }
        }
    }
    if(request.getParameter("filtro") != null){
        lista = dao.listar(request.getParameter("filtro").toLowerCase());
    }else{
        lista = dao.listar();
    }
%>

<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-table"></i> Tabela de usuários</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Login</th>
                        <th>Apelido</th>
                        <th>Senha</th>
                        <th>Imagem</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Código</th>
                        <th>Login</th>
                        <th>Apelido</th>
                        <th>Senha</th>
                        <th>Imagem</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                <tbody>
                    <%
                        for (Usuario item : lista) {
                    %>
                    <tr>        
                        <td><%=item.getUsucodigo()%></td>
                        <td><%=item.getUsulogin()%></td>
                        <td><%=item.getUsunick()%></td>
                        <td><%=item.getUsusenha()%></td>
                        <td><%=item.getUsuimg()%></td>
                        <td><a href="../edicoes/usuario.jsp?codigo=<%=item.getUsucodigo()%>" class="btn  btn-primary btn-sm">Editar</a>
                <buttom class="btn  btn-light btn-sm" data-toggle="modal" data-target="#myModal" onclick=" codigo =<%=item.getUsucodigo()%>" >Excluir</buttom>
                </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
                <div style="height: 100px;"></div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Exclusão</h4>
            </div>
            <div class="modal-body">
                Você tem certeza que deseja excluir?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" onclick="excluir()">Confirmar Exclusão</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="erro" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"  id="myModalLabel" >Erro</h4>
            </div>
            <div class="modal-body">
                Não foi possível excluir essa entrada pois existe uma referencia a ela em outra tabela.
            </div>
            <div class="modal-footer">
                <a href="../tabelas/usuario.jsp" type="button" class="btn btn-default" >Cancelar</a>
                <a href="../tabelas/convitegr.jsp" type="button" class="btn btn-primary" >Convites</a>
                <a href="../tabelas/membro.jsp" type="button" class="btn btn-primary" >Membros</a>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<script>
    var codigo;

    function excluir()
    {
        document.location.href = "usuario.jsp?usucodigo=" + codigo;
    }
</script>
<!-- /.modal -->



<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("erros").click();
</script> 