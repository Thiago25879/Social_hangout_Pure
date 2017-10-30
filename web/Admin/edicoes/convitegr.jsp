
<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.GrupoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Grupo"%>
<%@page import="dao.ConvitegrDAO"%>
<%@page import="modelo.Convitegr"%>
<%@include file="../padroes/cabecalho.jsp" %>


<%

    GrupoDAO gDAO = new GrupoDAO();
    List<Grupo> gLista = gDAO.listar();
    UsuarioDAO uDAO = new UsuarioDAO();
    List<Usuario> uLista = uDAO.listar();

    Convitegr obj = new Convitegr();
    if (request.getMethod().equals("POST")) {
        ConvitegrDAO dao = new ConvitegrDAO();
        obj.setCongrcodigo(Integer.parseInt(request.getParameter("txtCodigo")));
        obj.setCongrresposta(request.getParameter("txtResposta").toString());
        Grupo grupo = new Grupo();
        grupo.setGrucodigo(Integer.parseInt(request.getParameter("txtGrupo")));
        obj.setGrucodigo(grupo);
        Usuario usuario = new Usuario();
        usuario.setUsucodigo(Integer.parseInt(request.getParameter("txtUsuario")));
        obj.setUsucodigo(usuario);
        if (obj == null) {
            response.sendRedirect("../tabelas/convitegr.jsp");
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

                        response.sendRedirect("../tabelas/convitegr.jsp");
                        return;
                    }
                    ConvitegrDAO dao = new ConvitegrDAO();
                    obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
//Se for um resgistro inválido, sai da tela
                    if (obj == null) {
                        response.sendRedirect("../tabelas/convitegr.jsp");
                        return;
                    }
                }
%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-pencil"></i> Edição de convite para grupo</div>

    <form action="#" method="post" >

        <div class="col-lg-6">

            <div class="form-group">
                <label>Id</label>
                <input class="form-control" type="text" readonly name="txtCodigo" value="<%=obj.getCongrcodigo()%>"  />
            </div>

            <div class="form-group">
                <label>Resposta</label>
                <input class="form-control" type="text" name="txtResposta" required value="<%=obj.getCongrresposta()%>" />
            </div>

            <div class="form-group">
                <label>Usuário</label>
                <select name="txtUsuario" class="form-control" required>
                    <option selected="selected" value="<%=obj.getUsucodigo().getUsucodigo()%>"><%=obj.getUsucodigo().getUsunick()%></option>
                    <%
                        for (Usuario usu : uLista) {
                    %>
                    <option value="<%=usu.getUsucodigo()%>" ><%=usu.getUsunick()%></option>
                    <%
                        }
                    %>

                </select>
            </div>

            <div class="form-group">
                <label>Grupo</label>
                <select name="txtGrupo" class="form-control" required>
                    <option selected="selected" value="<%=obj.getGrucodigo().getGrucodigo()%>"><%=obj.getGrucodigo().getGrunome()%></option>
                    <%
                        for (Grupo gru : gLista) {
                    %>
                    <option value="<%=gru.getGrucodigo()%>" ><%=gru.getGrunome()%></option>
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
                Convite alterado com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../edicoes/convitegr.jsp?codigo=<%=obj.getCongrcodigo()%>" type="button" class="btn btn-primary" >Corrigir edição</a>
                <a href="../tabelas/convitegr.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 