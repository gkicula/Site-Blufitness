<%

	//Verificar se há sessão usuário
	if(session.getAttribute("sessaoUsuario") == null){
		response.sendRedirect("login.jsp?msg=sessaoExpirada");
	}

%>
