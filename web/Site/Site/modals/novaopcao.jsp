<div class="modal fade" id="Modalnovaopcao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Nova op��o</h1>

                             <form action="evento.jsp?code=<%=(request.getParameter("code"))%>" method="post">

                                <div class="field-wrap">
                                    <label>
                                        Nome da op��o<span class="req"></span>
                                    </label>
                                    <input type="text" id="txtNomeopc" name="txtNomeopc">
                                </div>
                                <input type="hidden" id="modalId" name="txtId">
                                <input type="hidden" value="opcao" name="Id"/>
                                <button type="submit" class="button button-block"/>Criar op��o</button>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


