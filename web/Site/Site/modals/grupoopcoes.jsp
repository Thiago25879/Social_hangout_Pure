<div class="modal fade" id="Modalgrupoopcoes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Opções</h1>

                            <form action="grupo.jsp?code=<%=(request.getParameter("code"))%>" method="post">
                                <div class="field-wrap">
                                    <input type="hidden" value="opcoes" name="Id"/>
                                    <div class="col-md-6">
                                        <a href="#" class="link" href="#" data-toggle="modal" data-target="#Modalgrupoedicao"><button type="submit" class="button button-block" data-dismiss="modal" />Editar Grupo</button></a>
                                    </div>
                                </div>
                            </form>
                            <form action="grupo.jsp?code=<%=(request.getParameter("code"))%>" method="post">
                                <div class="field-wrap">
                                    <div class="col-md-6">
                                        <button type="submit" class="button button-block" />Sair do Grupo</button>
                                        <input type="hidden" value="sair" name="Opc"/>
                                    </div>
                                </div>

                            </form>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>