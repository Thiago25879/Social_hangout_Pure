<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Grupo"%>
<%@page import="dao.MembroDAO"%>
<%@page import="modelo.Membro"%>
<%@include file="../padroes/cabecalho.jsp" %>
<%
    GrupoDAO gDAO = new GrupoDAO();
    List<Grupo> gLista = gDAO.listar();
    UsuarioDAO uDAO = new UsuarioDAO();
    List<Usuario> uLista = uDAO.listar();

    Membro obj = new Membro();
    if (request.getMethod().equals("POST")) {
        MembroDAO dao = new MembroDAO();
        obj.setMemdata(request.getParameter("txtData"));
        Grupo grupo = new Grupo();
        grupo.setGrucodigo(Integer.parseInt(request.getParameter("txtGrupo")));
        obj.setGrucodigo(grupo);
        Usuario usuario = new Usuario();
        usuario.setUsucodigo(Integer.parseInt(request.getParameter("txtUsuario")));
        obj.setUsucodigo(usuario);
        if (obj == null) {
            response.sendRedirect("../tabelas/membro.jsp");
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
            <label>Data de inclusão</label>
            <input class="form-control" type="date" name="txtData" required />
        </div>

        <div class="form-group">
            <label>Grupo</label>
            <select name="txtGrupo" class="form-control" required>
                <option value="">Selecione</option>
                <%
                    for (Grupo gru : gLista) {
                %>
                <option value="<%=gru.getGrucodigo()%>" ><%=gru.getGrunome()%></option>
                <%
                    }
                %>

            </select>
        </div>

        <div class="form-group">
            <label>Usuário</label>
            <select name="txtUsuario" class="form-control" required>
                <option value="">Selecione</option>
                <%
                    for (Usuario usu : uLista) {
                %>
                <option value="<%=usu.getUsucodigo()%>" ><%=usu.getUsunick()%></option>
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
                Membro adicionado com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../novos/membro.jsp" type="button" class="btn btn-primary" >Continuar adições</a>
                <a href="../tabelas/membro.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 