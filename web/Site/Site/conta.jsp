<%@page import="util.Upload"%>
<%@include file="padroes/cabecalho.jsp" %>
<%Upload upload = new Upload();

    upload.setFolderUpload("Fotos");

    Usuario obj = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();
    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            obj = usuario;
            obj.setUsunick(upload.getForm().get("nick").toString());
            obj.setUsulogin(upload.getForm().get("login").toString());
            if(!upload.getForm().get("senhaant").toString().isEmpty() || !upload.getForm().get("senhanov").toString().isEmpty()){
                if(upload.getForm().get("senhaant").toString().equals(usuario.getUsusenha().toString()) ){
                    obj.setUsusenha(upload.getForm().get("senhanov").toString());
                }
            }
            if (upload.getFiles().size() == 1) {
                obj.setUsuimg(upload.getFiles().get(0));
            }
            dao.alterar(obj);
            Boolean resultado = dao.alterar(obj);
                if (resultado) {
                    
                }else{
                    
                }
        }
    }


%>

<div class="col-md-8 wthree_contact_left col-centered">
    <h3 class="title-w3-agileits two">Usu�rio</h3>
    <br>
    <form action="#" method="post" enctype="multipart/form-data">
        <div>
            <style scoped>
                .btn-default:hover{
                    border: 1px solid #00cc00;
                    background-color: #00cc00;
                }

                .btn-default{
                    color: #00cc00;
                    border: 1px solid #00cc00;
                    background-color: transparent;
                }

                .custom-input {
                    font-size: 22px;
                    display: block;
                    width: 100%;
                    padding: 5px 10px;
                    background: none;
                    background-image: none;
                    border: none;
                    color: #00cc00;
                    border-radius: 0;
                    -webkit-transition: border-color .25s ease, box-shadow .25s ease;
                    transition: border-color .25s ease, box-shadow .25s ease;
                }
                .custom-input:focus {
                    outline: 0;
                    border-color: #00cc00;
                }

                .custom-img{
                    width: 50%;
                    margin: 30px auto;
                    float: none;
                }

                .button-Style{
                    cursor:pointer;
                    border: none;
                    background-size: 100% 100%;
                    background-repeat: no-repeat;
                }
            </style>
            <div class="field-wrap col-sm-12 text-center custom-img">

                <div class="btn btn-default image-preview-input">
                    <!--<span class="image-preview-input-title">Imagem do grupo</span>-->
                    <input type="file" class="custom-input" id="OOO" accept="image/png, image/jpeg" onchange="previewFile()"  name="input-file-preview" style="display: none ; " />
                    <input type="image" class="custom-input" class="button-Style" src="../../Fotos/<%=usuario.getUsuimg()%>" id="imgbtn" value="../../Fotos/<%=usuario.getUsuimg()%>" onclick="document.getElementById('OOO').click(); return false;" /> 
                </div>

            </div>
        </div>  



        <div class="col-md-6 wthree_contact_left_grid">
            <input type="text" name="nick" placeholder="Apelido" required value="<%=usuario.getUsunick()%>">

            <input type="text" name="login" placeholder="Login " required value="<%=usuario.getUsulogin()%>">
        </div>
        <div class="col-md-6 wthree_contact_left_grid">
            <input class="password-custom" type="password" name="senhaant" placeholder="Digite a senha antiga" >
            <input class="password-custom" type="password" name="senhanov" placeholder="Digite a nova senha" >
        </div>
        <div class="clearfix"> </div>
        <br>
        <input type="submit" value="Alterar">
        <input type="reset" value="Resetar" onclick="clean()">
    </form>

</div>
<div class="clearfix"> </div>


<%@include file="padroes/rodape.jsp" %>