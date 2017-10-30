
<%@include file="padroes/cabecalho.jsp" %>

<div class="banner-bottom dark-background">
    <div class="container">
        <h3 class="title-w3-agileits two">Grupos</h3>
        <p class="quia shadow"><a href="#" class="link">Criar grupo</a></p>

        <div class="w3ls_gallery_grids">
            <div>
                <%  int temp = 0;
                    for (Membro item : listam) {
                        if (temp == 0) {
                            temp = 3;
                %>
                </div>
                <div class="row">
            
            
                <% }%>
                <div class="col-md-4 w3_agile_gallery_grid ">
                <div class="agile_gallery_grid ">
                    <a title="Donec sapien massa, placerat ac sodales ac, feugiat quis est." href="images/1.jpg">
                        <div class="agile_gallery_grid1 auto-height">
                            <img src="../../Fotos/<%=item.getGrucodigo().getGruimg()%>" alt=" " class="img-responsive img-circle img-custom" />
                            <div class="w3layouts_gallery_grid1_pos">
                                <h3><%=item.getGrucodigo().getGrunome()%></h3>
                                <p><%=item.getMemdata()%></p>
                            </div>
                        </div>
                    </a>
                </div>
                            </div> 
                <%
                        temp--;
                    }%>
                   
            <div class="clearfix"></div>
        </div>
    </div>
</div>



<%@include file="padroes/rodape.jsp" %>