<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

if(request.getParameter("msgContato") != null){
	
	String msgContato = request.getParameter("msgContato");
	
switch(msgContato){

case "contatoAlterado":
	out.print("<div class='alert alert-success msg'>Contato alterado com sucesso.</div>");
break;

case "erroAlterarCadastro":
	out.print("<div class='alert alert-danger msg'>Dados inválidos, favor preencher corretamente.</div>");
break;

}
	
	
}

%>