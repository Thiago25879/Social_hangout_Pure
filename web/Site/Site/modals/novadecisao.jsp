<div class="modal fade" id="Modalnovadecisao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Nova Decis�o</h1>

                            <form action="evento.jsp?code=<%=(request.getParameter("code"))%>" method="post">

                                <div class="field-wrap">
                                    <label>
                                        T�tulo da decis�o<span class="req"></span>
                                    </label>
                                    <input type="text" required autocomplete="off" name="txtTituloDec"/>
                                </div>
                                <br>
                                <div class="field-wrap">
                                    <label>
                                        Descri��o da decis�o<span class="req"></span>
                                    </label>
                                    <input type="text" required autocomplete="off" name="txtDescrDec"/>
                                </div>
                                <input type="hidden" value="decisao" name="Id"/>
                                <button type="submit" class="button button-block" />Criar Decis�o</button>

                            </form>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
