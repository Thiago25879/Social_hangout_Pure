
<%@page import="java.util.List"%>
<%@page import="dao.EventoDAO"%>
<%@page import="dao.MembroDAO"%>
<%@page import="modelo.Membro"%>
<%@page import="modelo.Evento"%>
<%@page import="dao.ConviteevDAO"%>
<%@page import="modelo.Conviteev"%>
<%@include file="../padroes/cabecalho.jsp" %>
<%
    Conviteev obj = new Conviteev();

    MembroDAO mDAO = new MembroDAO();
    List<Membro> mLista = mDAO.listar();
    EventoDAO eDAO = new EventoDAO();
    List<Evento> eLista = eDAO.listar();

    if (request.getMethod().equals("POST")) {
        ConviteevDAO dao = new ConviteevDAO();
        obj.setConevresposta(request.getParameter("txtNome").toString());
        Evento evento = new Evento();
        evento.setEvecodigo(Integer.parseInt(request.getParameter("txtEvento")));
        obj.setEvecodigo(evento);
        Membro membro = new Membro();
        membro.setMemcodigo(Integer.parseInt(request.getParameter("txtMembro")));
        obj.setMemcodigo(membro);
        if (obj == null) {
            response.sendRedirect("../tabelas/conviteev.jsp");
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
        <i class="fa fa-plus"></i> Novo convite para evento</div>

<form action="#" method="post" >

    <div class="col-lg-6">

        <div class="form-group">
            <label>Resposta</label>
            <input class="form-control" type="text" name="txtNome" required />
        </div>

        <div class="form-group">
            <label>Evento</label>
            <select name="txtEvento" class="form-control" required>
                <option value="">Selecione</option>
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
                <option value="">Selecione</option>
                <%
                    for (Membro mem : mLista) {
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
                Convite adicionado com sucesso.
            </div>
            <div class="modal-footer">
                <a href="../novos/conviteev.jsp" type="button" class="btn btn-primary" >Continuar adições</a>
                <a href="../tabelas/conviteev.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
            </div>
        </div>

    </div>

</div>
<%@include file="../padroes/rodape.jsp" %>

<script>
    document.getElementById("mod").click();
</script> 