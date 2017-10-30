<!-- Mostrar status de convites, mostrar decisões e opções -->
<%@include file="padroes/cabecalho.jsp" %>


<div class="banner-bottom dark-background">
    <div class="container ">
        <div class="smaller center-block">
            <h3 class="title-w3-agileits two">Evento</h3>  
            <br>
            <img src="images/1.jpg" alt=" " class="center-block img-responsive img-circle" />
        </div>

        <div class="center-pad grid_3 grid_5">
            <h1><a class="label label-default grp-btn" href="#">Convidados</a></h1>
        </div>

        <br>

        <div class="smaller center-block ">
            <h3 class="title-w3-agileits two size-down">Decisões</h3>
            <p class="quia shadow"><a href="#" class="link">Nova decisão</a></p>
        </div>
        <br>
        <div class="panel-group">
            <div class="panel panel-default panel-custom">
                <div class="panel-heading panel-heading-custom">
                    <h4 class="panel-title panel-title-custom">
                        <a data-toggle="collapse" href="#collapse1">Collapsible list group</a>
                    </h4>
                </div>

                <div id="collapse1" class="panel-collapse collapse panel-collapse-custom">
                    <ul class="list-group list-group-custom">
                        <li class="list-group-item list-custom"><input type="radio" id="r1" name="rr" value="" /><label for="r1"><span></span>One</label></li>
                        <li class="list-group-item list-custom"><input type="radio" id="r2" name="rr" value="" /><label for="r2"><span></span>Two</label></li>
                        <li class="list-group-item list-custom"><input type="radio" id="r3" name="rr" value="" /><label for="r3"><span></span>Three</label></li>
                    </ul>
                    <div class="panel-footer panel-footer-custom"> <i class="fa fa-plus-square-o" aria-hidden="true"></i> Nova Opção</div>
                </div>
            </div>
        </div>
        <div class="panel-group">
            <div class="panel panel-default panel-custom">
                <div class="panel-heading panel-heading-custom">
                    <h4 class="panel-title panel-title-custom">
                        <a data-toggle="collapse" href="#collapse2">Collapsible list group</a>
                    </h4>
                </div>

                <div id="collapse2" class="panel-collapse collapse panel-collapse-custom">
                    <ul class="list-group list-group-custom">
                        <li class="list-group-item list-custom"><input type="radio" id="r11" name="rrr" value="" /><label for="r11"><span></span>One</label></li>
                        <li class="list-group-item list-custom"><input type="radio" id="r22" name="rrr" value="" /><label for="r22"><span></span>Two</label></li>
                        <li class="list-group-item list-custom"><input type="radio" id="r33" name="rrr" value="" /><label for="r33"><span></span>Three</label></li>
                    </ul>
                    <div class="panel-footer panel-footer-custom"> <i class="fa fa-plus-square-o" aria-hidden="true"></i> Nova Opção</div>
                </div>
            </div>
        </div>
        <div class="panel-group">
            <div class="panel panel-default panel-custom">
                <div class="panel-heading panel-heading-custom">
                    <h4 class="panel-title panel-title-custom">
                        <a data-toggle="collapse" href="#collapse3">Collapsible list group</a>
                    </h4>
                </div>

                <div id="collapse3" class="panel-collapse collapse panel-collapse-custom">
                    <ul class="list-group list-group-custom">
                        <li class="list-group-item list-custom"><input type="radio" id="r111" name="rrrr" value="" /><label for="r111"><span></span>One</label></li>
                        <li class="list-group-item list-custom"><input type="radio" id="r222" name="rrrr" value="" /><label for="r222"><span></span>Two</label></li>
                        <li class="list-group-item list-custom"><input type="radio" id="r333" name="rrrr" value="" /><label for="r333"><span></span>Three</label></li>
                    </ul>
                    <div class="panel-footer panel-footer-custom"> <i class="fa fa-plus-square-o" aria-hidden="true"></i> Nova Opção</div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="padroes/rodape.jsp" %>