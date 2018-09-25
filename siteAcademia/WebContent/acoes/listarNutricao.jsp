<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@page import="br.com.siteAcademia.bean.AlunoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 	<%
    
 		String dia = request.getParameter("diaSemana");	
 	
 		AlunoBean ab = new AlunoBean();
 		ab = (AlunoBean) session.getAttribute("sessaoUsuario");
 		ab.setDiaSemana(dia);
 		ab.setTemTreino(null);
 		
 		new AlunoDao().listarAlimentacao(ab);
 		
 		if(ab.getTemTreino() != null){
 			response.sendRedirect("../nutricao.jsp");
 		}else{
 			response.sendRedirect("../nutricao.jsp?msg=naoTemNutricao");
 		}
 	
    %>