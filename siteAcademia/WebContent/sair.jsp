<%

	//Limpar a sess�o
	session.setAttribute("sessaoUsuario", null);

	//Redirecionamento
	response.sendRedirect("login.jsp?msg=saida");

%>