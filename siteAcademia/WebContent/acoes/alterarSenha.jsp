<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@page import="br.com.siteAcademia.bean.AlunoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	String senhaAtual = request.getParameter("senhaAtual");
	String novaSenha = request.getParameter("novaSenha");
	String repetirSenha = request.getParameter("RepetirSenha");
	
	AlunoBean ab = new AlunoBean();
	ab = (AlunoBean) session.getAttribute("sessaoUsuario");
	
	if((senhaAtual.equals(ab.getSenha())) && (novaSenha.equals(repetirSenha))){
		
		new AlunoDao().alterarSenha(ab, novaSenha);
		
		response.sendRedirect("../conta.jsp?msg=loginAlterado");
		
	}else{
		
		response.sendRedirect("../conta.jsp?msg=erroLoginAlterado");
	
	}
%>
