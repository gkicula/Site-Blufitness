<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@page import="br.com.siteAcademia.bean.AlunoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String cpf = request.getParameter("cpf");

	AlunoBean ab = new AlunoBean();
	
	out.print(cpf);

	if(new AlunoDao().validaCpfRecuperacao(ab, cpf) == true){

		session.setAttribute("sessaoCpf", ab);
		
		response.sendRedirect("../recuperacao.jsp?msg=cpfVerificado");
		
	}else{
		response.sendRedirect("../recuperacao.jsp?msg=cpfInvalido");
	}
	
%>




