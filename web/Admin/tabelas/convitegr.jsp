
<%@page import="modelo.Convitegr"%>
<%@page import="java.util.List"%>
<%@page import="dao.ConvitegrDAO"%>
<%@include file="../padroes/cabecalho_filtro.jsp" %>


<%
    ConvitegrDAO dao = new ConvitegrDAO();
    List<Convitegr> lista = null;
    //verifico se é escluir
    if (request.getParameter("congrcodigo") != null) {
        Convitegr obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("congrcodigo")));
        if (obj != null) {
            Boolean funcionou = dao.excluir(obj);
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
        <i class="fa fa-table"></i> Tabela de convites para grupos</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Resposta</th>
                        <th>Grupo</th>
                        <th>Usuário</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Código</th>
                        <th>Resposta</th>
                        <th>Grupo</th>
                        <th>Usuário</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                <tbody>
                    <%
                        for (Convitegr item : lista) {
                    %>
                    <tr>        
                        <td><%=item.getCongrcodigo()%></td>
                        <td><%=item.getCongrresposta()%></td>
                        <td><%=item.getGrucodigo().getGrunome()%></td>
                        <td><%=item.getUsucodigo().getUsunick()%></td>
                        <td><a href="../edicoes/convitegr.jsp?codigo=<%=item.getCongrcodigo()%>" class="btn  btn-primary btn-sm">Editar</a>
                <buttom class="btn  btn-light btn-sm" data-toggle="modal" data-target="#myModal" onclick=" codigo =<%=item.getCongrcodigo()%>" >Excluir</buttom>
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
<script>
    var codigo;

    function excluir()
    {
        document.location.href = "convitegr.jsp?congrcodigo=" + codigo;
    }
</script>
<!-- /.modal -->



<%@include file="../padroes/rodape.jsp" %>