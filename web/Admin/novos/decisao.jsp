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
        <i class="fa fa-plus"></i> Nova decis�o</div>
    <form action="#" method="post">

        <div class="col-lg-6">

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
                <label>T�tulo</label>
                <input class="form-control" type="text" name="txtTitulo" required />
            </div>

            <div class="form-group">
                <label>Descri��o</label>
                <input class="form-control" type="text" name="txtDescricao" required />
            </div>

            <div class="form-group">
                <label>N� de votos</label>
                <input class="form-control" type="number" name="txtNumvotos" required />
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
                    Decis�o adicionada com sucesso.
                </div>
                <div class="modal-footer">
                    <a href="../novos/decisao.jsp" type="button" class="btn btn-primary" >Continuar adi��es</a>
                    <a href="../tabelas/decisao.jsp" type="button" class="btn btn-primary" >Ir para tabela</a>
                </div>
            </div>

        </div>

    </div>
    <%@include file="../padroes/rodape.jsp" %>

    <script>
        document.getElementById("mod").click();
    </script> 