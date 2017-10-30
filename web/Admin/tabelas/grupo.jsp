
<%@page import="modelo.Grupo"%>
<%@page import="java.util.List"%>
<%@page import="dao.GrupoDAO"%>
<%@include file="../padroes/cabecalho_filtro.jsp" %>

<%
    GrupoDAO dao = new GrupoDAO();
    List<Grupo> lista = null;
    //verifico se é escluir
    if (request.getParameter("grucodigo") != null) {
        Grupo obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("grucodigo")));
        if (obj != null) {
            Boolean funcionou = false;
            try{
            funcionou = dao.excluir(obj);
            }catch(IllegalStateException ISE){
                %><a id='erros' data-toggle="modal" data-target="#erro"></a><%
            }
            if (funcionou) {
                //aqui depois vai ter uma janela
            }else{
                
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
        <i class="fa fa-table"></i> Tabela de grupos</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Imagem</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Imagem</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                <tbody>
                    <%
                        for (Grupo item : lista) {
                    %>
                    <tr>        
                        <td><%=item.getGrucodigo()%></td>
                        <td><%=item.getGrunome()%></td>
                        <td><%=item.getGruimg()%></td>
                        <td><a href="../edicoes/grupo.jsp?codigo=<%=item.getGrucodigo()%>" class="btn  btn-primary btn-sm">Editar</a>
                <buttom class="btn  btn-light btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo =<%=item.getGrucodigo()%>" >Excluir</buttom>
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
                <a href="../tabelas/grupo.jsp" type="button" class="btn btn-default" >Cancelar</a>
                <a href="../tabelas/convitegr.jsp" type="button" class="btn btn-primary" >Convites</a>
                <a href="../tabelas/membro.jsp" type="button" class="btn btn-primary" >Membros</a>
                <a href="../tabelas/evento.jsp" type="button" class="btn btn-primary" >Eventos</a>
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
        document.location.href = "grupo.jsp?grucodigo=" + codigo;
    }
</script>
<!-- /.modal -->




<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("erros").click();
</script> 