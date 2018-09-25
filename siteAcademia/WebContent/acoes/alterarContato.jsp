<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@page import="br.com.siteAcademia.bean.AlunoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	int celular = Integer.parseInt(request.getParameter("celular"));
	int telefone = Integer.parseInt(request.getParameter("telefone"));
	String email = request.getParameter("email");
	
	if((String.valueOf(celular).length() != 9) || (String.valueOf(telefone).length() != 8)){
		response.sendRedirect("../conta.jsp?msgContato=erroAlterarCadastro");	
	}else{
	
	AlunoBean ab = new AlunoBean();
	ab = (AlunoBean) session.getAttribute("sessaoUsuario");
	ab.setCelular(celular);
	ab.setTelefone(telefone);
	ab.setEmail(email);
	
	AlunoDao ad = new AlunoDao();
	ad.alterarContato(ab);
	
	response.sendRedirect("../conta.jsp?msgContato=contatoAlterado");
	}
%>