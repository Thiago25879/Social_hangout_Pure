<%@page import="dao.OpcaoDAO"%>
<%@page import="dao.DecisaoDAO"%>
<%@page import="dao.MembroDAO"%>
<%@page import="modelo.Opcao"%>
<%@page import="modelo.Decisao"%>
<%@page import="modelo.Membro"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Grupo"%>
<%@page import="dao.VotoDAO"%>
<%@page import="modelo.Voto"%>
<%@include file="../padroes/cabecalho.jsp" %>
<%
    MembroDAO mDAO = new MembroDAO();
    List<Membro> mLista = mDAO.listar();
    DecisaoDAO dDAO = new DecisaoDAO();
    List<Decisao> dLista = dDAO.listar();
    OpcaoDAO oDAO = new OpcaoDAO();
    List<Opcao> oLista = oDAO.listar();

    Voto obj = new Voto();
    if (request.getMethod().equals("POST")) {
        VotoDAO dao = new VotoDAO();
        obj.setVotcodigo(Integer.parseInt(request.getParameter("txtCodigo")));
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

            response.sendRedirect("../tabelas/voto.jsp");
            return;
        }
        VotoDAO dao = new VotoDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
//Se for um resgistro inválido, sai da tela
        if (obj == null) {
            response.sendRedirect("../tabelas/voto.jsp");
            return;
        }
    }
%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-pencil"></i> Edição de voto</div>

    <form action="#" method="post" >

        <div class="col-lg-6">

            <div class="form-group">
                <label>Id</label>
                <input class="form-control" type="text" readonly name="txtCodigo" value="<%=obj.getVotcodigo()%>"  />
            </div>

            <div class="form-group">
                <label>Membro</label>
                <select name="txtMembro" class="form-control" required>
                    <option selected="selected" value="<%=obj.getMemcodigo().getMemcodigo()%>"><%=obj.getMemcodigo().getUsucodigo().getUsunick()%></option>
                    <%
                        for (Membro mem : mLista) {
                    %>
                    <option value="<%=mem.getMemcodigo()%>" ><%=mem.getUsucodigo().getUsunick()%></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label>Decisão</label>
                <select name="txtDecisao" class="form-control" required>
                    <option selected="selected" value="<%=obj.getDeccodigo().getDeccodigo()%>"><%=obj.getDeccodigo().getDectitulo()%></option>
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
                    <option selected="selected" value="<%=obj.getOpccodigo().getOpccodigo()%>"><%=obj.getOpccodigo().getOpcnome()%></option>
                    <%
                        for (Opcao opc : oLista) {
                    %>
                    <option value="<%=opc.getOpccodigo()%>" ><%=opc.getOpcnome()%></option>
                    <%
                        }
                    %>
                </select>
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
                Voto alterado com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../edicoes/voto.jsp?codigo=<%=obj.getVotcodigo()%>" type="button" class="btn btn-primary" >Corrigir edição</a>
                <a href="../tabelas/voto.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 