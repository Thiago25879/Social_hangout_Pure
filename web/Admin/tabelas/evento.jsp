
<%@page import="modelo.Evento"%>
<%@page import="java.util.List"%>
<%@page import="dao.EventoDAO"%>
<%@include file="../padroes/cabecalho_filtro.jsp" %>


<%
    EventoDAO dao = new EventoDAO();
    List<Evento> lista = null;
    //verifico se é escluir
    if (request.getParameter("evecodigo") != null) {
        Evento obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("evecodigo")));
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
        <i class="fa fa-table"></i> Tabela de eventos</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Imagem</th>
                        <th>Grupo</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Imagem</th>
                        <th>Grupo</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                <tbody>
                    <%
                        for (Evento item : lista) {
                    %>
                    <tr>        
                        <td><%=item.getEvecodigo()%></td>
                        <td><%=item.getEvenome()%></td>
                        <td><%=item.getEvedesc()%></td>
                        <td><%=item.getEveimg()%></td>
                        <td><%=item.getGrucodigo().getGrunome()%></td>
                        <td><a href="../edicoes/evento.jsp?codigo=<%=item.getEvecodigo()%>" class="btn  btn-primary btn-sm">Editar</a>
                <buttom class="btn  btn-light btn-sm" data-toggle="modal" data-target="#myModal" onclick=" codigo =<%=item.getEvecodigo()%>" >Excluir</buttom>
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
                <a href="../tabelas/evento.jsp" type="button" class="btn btn-default" >Cancelar</a>
                <a href="../tabelas/conviteev.jsp" type="button" class="btn btn-primary" >Convites</a>
                <a href="../tabelas/decisao.jsp" type="button" class="btn btn-primary" >Decisões</a>
                <a href="../tabelas/participantes.jsp" type="button" class="btn btn-primary" >Participantes</a>
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
        document.location.href = "evento.jsp?evecodigo=" + codigo;
    }
</script>
<!-- /.modal -->





<%@include file="../padroes/rodape.jsp" %>


<script>
    document.getElementById("erros").click();
</script> 