<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@page import="br.com.siteAcademia.bean.AlunoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    	String diaSemana = request.getParameter("diaSemana");
    
    	AlunoBean ab = new AlunoBean();
    	ab = (AlunoBean) session.getAttribute("sessaoUsuario");
    	ab.setDiaSemana(diaSemana);
    	ab.setTemTreino(null);
    	
    	
    	
    	new AlunoDao().listarExercicios(ab); 
    	
    
    	
    	if(ab.getTemTreino() == null){
    		response.sendRedirect("../treino.jsp?msg=naoTemTreino");
    	}else{
    		response.sendRedirect("../treino.jsp");
    	}
    	
    %>