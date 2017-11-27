
<%@page import="modelo.Participante"%>
<%@page import="dao.ParticipanteDAO"%>
<%@page import="modelo.Decisao"%>
<%@page import="java.util.List"%>
<%@page import="dao.DecisaoDAO"%>
<%@page import="dao.OpcaoDAO"%>
<%@page import="modelo.Opcao"%>
<%@include file="../padroes/cabecalho.jsp" %>
<%
    Opcao obj = new Opcao();

    DecisaoDAO dDAO = new DecisaoDAO();
    List<Decisao> dLista = dDAO.listar();
    ParticipanteDAO pDAO = new ParticipanteDAO();
    List<Participante> pLista = pDAO.listar();

    if (request.getMethod().equals("POST")) {
        OpcaoDAO dao = new OpcaoDAO();
        obj.setOpcnome(request.getParameter("txtNome"));
        Decisao decisao = new Decisao();
        decisao.setDeccodigo(Integer.parseInt(request.getParameter("txtDecisao")));
        obj.setDeccodigo(decisao);
        Participante participante = new Participante();
        participante.setParcodigo(Integer.parseInt(request.getParameter("txtParticipante")));
        obj.setParcodigo(participante);
        if (obj == null) {
            response.sendRedirect("../tabelas/opcao.jsp");
            return;
        } else {
            dao.incluir(obj);
        }

        Boolean resultado = dao.incluir(obj);
        if (resultado) {
            %><a id='mod' data-toggle="modal" data-target="#myModal"></a><%
        } else {

        }
    }
%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-plus"></i> Nova opção</div>

<form action="#" method="post" >

    <div class="col-lg-6">

        <div class="form-group">
            <label>Nome da opção</label>
            <input class="form-control" type="text" name="txtNome" required />
        </div>

        <div class="form-group">
            <label>Decisao</label>
            <select name="txtDecisao" class="form-control" required>
                <option value="">Selecione</option>
                <%
                    for (Decisao dec : dLista) {
                %>
                <option value="<%=dec.getDeccodigo()%>" ><%=dec.getDectitulo()%></option>
                <%
                    }
                %>

            </select>
        </div>

        <div class="form-group">
            <label>Participante</label>
            <select name="txtParticipante" class="form-control" required>
                <option value="">Selecione</option>
                <%
                    for (Participante par : pLista) {
                %>
                <option value="<%=par.getParcodigo()%>" ><%=par.getMemcodigo().getUsucodigo().getUsunick()%></option>
                <%
                    }
                %>

            </select>
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
                Opcão adicionada com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../novos/opcao.jsp" type="button" class="btn btn-primary" >Continuar adições</a>
                <a href="../tabelas/opcao.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 