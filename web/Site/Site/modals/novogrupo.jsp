<div class="modal fade" id="Modalnovogrupo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="custom-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="form">
                        <div id="signup">   
                            <h1>Novo Grupo</h1>

                            <form action="index.jsp" method="post"  enctype="multipart/form-data">



                                <div class="field-wrap col-sm-12 text-center custom-img">


                                    <!-- image-preview-input -->
                                    <div class="btn btn-default image-preview-input">
                                        <!--<span class="image-preview-input-title">Imagem do grupo</span>-->
                                        <input type="file" id="OOO" accept="image/png, image/jpeg" onchange="previewFile()" name="input-file-preview" style="display: none ; " />
                                        <input type="image" class="button-Style" src="../../Fotos/empty.jpg" id="imgbtn" onclick="document.getElementById('OOO').click(); return false;" /> 
                                    </div>
                                    <!-- image-preview-clear button -->
                                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                        <span class="glyphicon glyphicon-remove"></span> Limpar
                                    </button>

                                </div>
                                <br>
                                <div class="field-wrap">
                                    <label>
                                        Nome do Grupo<span class="req"></span>
                                    </label>
                                    <input type="text" required autocomplete="off" name="txtNomegr" />

                                </div>

                                <button type="submit" class="button button-block"/>Criar grupo</button>

                            </form>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
