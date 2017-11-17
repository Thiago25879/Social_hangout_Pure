<div class="modal fade" id="Modalnovomembro" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Novo membro</h1>

                             <form action="grupo.jsp?code=<%=(request.getParameter("code"))%>" method="post">

                                <div class="field-wrap">
                                    <label>
                                        Id do usuário<span class="req"></span>
                                    </label>
                                    <input type="text" id="txtNomeopc" name="txtIdusr">
                                </div>
                                <input type="hidden" value="buscar" name="Opc"/>
                                <button type="submit" class="button button-block"/>Buscar usuario</button>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



