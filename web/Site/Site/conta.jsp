<%@include file="padroes/cabecalho.jsp" %>


<div class="col-md-8 wthree_contact_left col-centered">
				<h3 class="title-w3-agileits two">Usuário</h3>
                                <br>
				<form action="#" method="post">
					<div class="col-md-6 wthree_contact_left_grid">
						<input type="text" name="nick" placeholder="Apelido" required="">

						<input type="text" name="login" placeholder="Login " required="">
					</div>
					<div class="col-md-6 wthree_contact_left_grid">
                                            <input class="password-custom" type="password" name="senhaant" placeholder="Digite a senha antiga" required="">
						<input class="password-custom" type="password" name="senhanov" placeholder="Digite a nova senha" required="">
					</div>
					<div class="clearfix"> </div>
                                        <br>
					<input type="submit" value="Alterar">
					<input type="reset" value="Resetar">
				</form>
		
                                    </div>
			<div class="clearfix"> </div>


<%@include file="padroes/rodape.jsp" %>