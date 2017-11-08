<%@page import="modelo.Opcao"%>
<%@page import="dao.OpcaoDAO"%>
<%@page import="modelo.Decisao"%>
<%@page import="dao.DecisaoDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dao.MembroDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Membro"%>
<%@page import="dao.VotoDAO"%>
<%@page import="modelo.Voto"%>
<%@include file="../padroes/cabecalho.jsp" %>
<%
    MembroDAO uDAO = new MembroDAO();
    List<Membro> uLista = uDAO.listar();
    DecisaoDAO dDAO = new DecisaoDAO();
    List<Decisao> dLista = dDAO.listar();
    OpcaoDAO oDAO = new OpcaoDAO();
    List<Opcao> oLista = oDAO.listar();

    Voto obj = new Voto();
    if (request.getMethod().equals("POST")) {
        VotoDAO dao = new VotoDAO();
        Membro membro = new Membro();
        membro.setMemcodigo(Integer.parseInt(request.getParameter("txtMembro")));
        obj.setMemcodigo(membro);
        Decisao decisao = new Decisao();
        decisao.setDeccodigo(Integer.parseInt(request.getParameter("txtDecisao")));
        obj.setDeccodigo(decisao);
        Opcao opcao = new Opcao();
        opcao.setOpccodigo(Integer.parseInt(request.getParameter("txtOpcao")));
        obj.setOpccodigo(opcao);
        if (obj == null) {
            response.sendRedirect("../tabelas/voto.jsp");
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



<form action="#" method="post" >

    <div class="col-lg-6">

        <div class="form-group">
            <label>Decisão</label>
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
            <label>Opção</label>
            <select name="txtOpcao" class="form-control" required>
                <option value="">Selecione</option>
                <%
                    for (Opcao opc : oLista) {
                %>
                <option value="<%=opc.getOpccodigo()%>" ><%=opc.getOpcnome()%></option>
                <%
                    }
                %>

            </select>
        </div>
                
        <div class="form-group">
            <label>Membro</label>
            <select name="txtMembro" class="form-control" required>
                <option value="">Selecione</option>
                <%
                    for (Membro mem : uLista) {
                %>
                <option value="<%=mem.getMemcodigo()%>" ><%=mem.getUsucodigo().getUsunick()%></option>
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
                Voto adicionado com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../novos/voto.jsp" type="button" class="btn btn-primary" >Continuar adições</a>
                <a href="../tabelas/voto.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 