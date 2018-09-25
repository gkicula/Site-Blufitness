<%

	//Limpar a sessão
	session.setAttribute("sessaoUsuario", null);

	//Redirecionamento
	response.sendRedirect("login.jsp?msg=saida");

%>