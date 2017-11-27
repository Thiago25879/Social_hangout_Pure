<%@page import="modelo.Evento"%>
<%@page import="java.util.List"%>
<%@page import="dao.EventoDAO"%>
<%@page import="dao.DecisaoDAO"%>
<%@page import="modelo.Decisao"%>
<%@include file="../padroes/cabecalho.jsp" %>
<%
    Decisao obj = new Decisao();

    EventoDAO eDAO = new EventoDAO();
    List<Evento> eLista = eDAO.listar();

    if (request.getMethod().equals("POST")) {
        DecisaoDAO dao = new DecisaoDAO();
        obj.setDeccodigo(Integer.parseInt(request.getParameter("txtCodigo")));
        obj.setDectitulo(request.getParameter("txtTitulo"));
        obj.setDecdesc(request.getParameter("txtDescricao"));
        obj.setDecnumvotos(Integer.parseInt(request.getParameter("txtNumvotos")));
        Evento evento = new Evento();
        evento.setEvecodigo(Integer.parseInt(request.getParameter("txtEvento")));
        obj.setEvecodigo(evento);
        if (obj == null) {
            response.sendRedirect("../tabelas/decisao.jsp");
            return;
        } else {
            dao.alterar(obj);
        }

        Boolean resultado = dao.alterar(obj);
        if (resultado) {
            obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
%><a id='mod' data-toggle="modal" data-target="#myModal"></a><%
                    } else {

                    }
                } else {
                    //É GET -------
                    if (request.getParameter("codigo") == null) {

                        response.sendRedirect("../tabelas/decisao.jsp");
                        return;
                    }
                    DecisaoDAO dao = new DecisaoDAO();
                    obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
//Se for um resgistro inválido, sai da tela
                    if (obj == null) {
                        response.sendRedirect("../tabelas/decisao.jsp");
                        return;
                    }
                }
%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-pencil"></i> Edição de decisão</div>

    <form action="#" method="post" >

        <div class="col-lg-6">

            <div class="form-group">
                <label>Id</label>
                <input class="form-control" type="text" readonly name="txtCodigo" value="<%=obj.getDeccodigo()%>"  />
            </div>

            <div class="form-group">
                <label>Evento</label>
                <select name="txtEvento" class="form-control" required >
                    <option selected="selected" value="<%=obj.getEvecodigo().getEvecodigo()%>"><%=obj.getEvecodigo().getEvenome()%></option>
                    <%
                        for (Evento eve : eLista) {
                    %>
                    <option value="<%=eve.getEvecodigo()%>" ><%=eve.getEvenome()%></option>
                    <%
                        }
                    %>

                </select>
            </div>

            <div class="form-group">
                <label>Título</label>
                <input class="form-control" type="text" name="txtTitulo" required value="<%=obj.getDectitulo()%>" />
            </div>

            <div class="form-group">
                <label>Descrição</label>
                <input class="form-control" type="text" name="txtDescricao" required value="<%=obj.getDecdesc()%>" />
            </div>
            
            <div class="form-group">
                <label>Nº de votos</label>
                <input class="form-control" type="number" name="txtNumvotos" required value="<%=obj.getDecnumvotos()%>" />
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
                Decisão alterada com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../edicoes/decisao.jsp?codigo=<%=obj.getDeccodigo()%>" type="button" class="btn btn-primary" >Corrigir edição</a>
                <a href="../tabelas/decisao.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 