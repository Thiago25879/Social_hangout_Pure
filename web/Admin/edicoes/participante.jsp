<%@page import="dao.ParticipanteDAO"%>
<%@page import="modelo.Participante"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dao.EventoDAO"%>
<%@page import="dao.MembroDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Evento"%>
<%@page import="modelo.Membro"%>
<%@page import="dao.MembroDAO"%>
<%@page import="modelo.Membro"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@include file="../padroes/cabecalho.jsp" %>
<%
    MembroDAO mDAO = new MembroDAO();
    List<Membro> mLista = mDAO.listar();
    EventoDAO eDAO = new EventoDAO();
    List<Evento> eLista = eDAO.listar();

    Participante obj = new Participante();
    if (request.getMethod().equals("POST")) {
        ParticipanteDAO dao = new ParticipanteDAO();
        
        if(request.getParameter("txtAdmin") == null){
            obj.setParadmin(false);
        }else{
            obj.setParadmin(true);
        }

        obj.setParcodigo(Integer.parseInt(request.getParameter("txtCodigo")));
        Membro membro = new Membro();
        membro.setMemcodigo(Integer.parseInt(request.getParameter("txtMembro")));
        obj.setMemcodigo(membro);

        Evento evento = new Evento();
        evento.setEvecodigo(Integer.parseInt(request.getParameter("txtEvento")));
        obj.setEvecodigo(evento);

        if (obj == null) {
            response.sendRedirect("../tabelas/participante.jsp");
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

                        response.sendRedirect("../tabelas/participante.jsp");
                        return;
                    }
                    ParticipanteDAO dao = new ParticipanteDAO();
                    obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
//Se for um resgistro inválido, sai da tela
                    if (obj == null) {
                        response.sendRedirect("../tabelas/participante.jsp");
                        return;
                    }
                }
%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-pencil"></i> Edição de participante</div>

    <form action="#" method="post" >

        <div class="col-lg-6">

            <div class="form-group">
                <label>Id</label>
                <input class="form-control" type="text" readonly name="txtCodigo" value="<%=obj.getParcodigo()%>"  />
            </div> 

            <div class="form-group">
                <label>Evento</label>
                <select name="txtEvento" class="form-control" required>
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
                <label>Criador do evento</label>
                <input class="form-control" type="checkbox" name="txtAdmin" value="true" <%if(obj.getParadmin()== true){%> checked <%}%>/>
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
                Participante alterado com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../edicoes/participante.jsp?codigo=<%=obj.getParcodigo()%>" type="button" class="btn btn-primary" >Corrigir edição</a>
                <a href="../tabelas/participante.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 