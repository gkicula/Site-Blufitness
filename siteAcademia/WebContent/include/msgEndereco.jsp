<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%
  
  if(request.getParameter("msgEndereco") != null){
	  
	  String msg = request.getParameter("msgEndereco");
	  
	  switch (msg){
	  
	 	case "enderecoAlterado":
			out.print("<div class='alert alert-success msg'>Endereço alterado com sucesso</div>");
		break;
		
		case "erroEnderecoAlterado":
			out.print("<div class='alert alert-danger msg'>Dados inválidos, favor preencher corretamente.</div>");
		break;
	  
	  }
	  
  }
  
  %>  
    