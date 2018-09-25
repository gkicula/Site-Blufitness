<%

if(request.getParameter("msg") != null){
	
	//Obter a mensagem
			String msg = request.getParameter("msg");
			
			//Exibir a mensagem
			switch(msg){
				case "loginIncorreto":
					out.print("<div class='alert alert-danger msg'>Usu�rio ou senha incorretos.</div>");
				break;
		
				case "sessaoExpirada":
					out.print("<div class='alert alert-danger msg'>A sessao foi expirada.</div>");
				break;
				
				case "saida":
					out.print("<div class='alert alert-danger msg'>Voc� saiu da �rea restrita com sucesso.</div>");
				break;
				
				case "cpfVerificado":
					out.print("<div class='alert alert-success msg'>Login encontrado som sucesso.</div>");
				break;
				
				case "cpfInvalido":
					out.print("<div class='alert alert-danger msg'>CPF n�o encontrado.</div>");
				break;
	
				case "enderecoAlterado":
					out.print("<div class='alert alert-success msg'>Endere�o alterado com sucesso</div>");
				break;
				
				case "erroEnderecoAlterado":
					out.print("<div class='alert alert-danger msg'>Dados inv�lidos, favor preencher corretamente.</div>");
				break;
			
				case "loginAlterado":
					out.print("<div class='alert alert-success msg'>Senha alterada com sucesso</div>");
				break;
				
				case "erroLoginAlterado":
					out.print("<div class='alert alert-danger msg'>Dados inv�lidos, favor preencher corretamente.</div>");
				break;
			
				case "naoTemTreino":
					out.print("<div class='alert alert-danger msg'>Nenhum treino encontrado para este dia</div>");
				break;
			
				case "naoTemNutricao":
					out.print("<div class='alert alert-danger msg'>N�o foi encontrada nutri��o neste dia.</div>");
				break;
				
			}
			

	
}




%>