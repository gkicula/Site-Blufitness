<%@page import="br.com.siteAcademia.bean.AlunoBean"%>
<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%


	String usuario = request.getParameter("usuario");
	String senha = request.getParameter("senha");

	AlunoBean ab = new AlunoBean();
	ab.setUsuario(usuario);
	ab.setSenha(senha);
	
	AlunoDao ad = new AlunoDao();
	
	if(ad.validaLogin(ab) == true){
	
	session.setAttribute("sessaoUsuario", ab);
		
	response.sendRedirect("interface.jsp");
		
	}else{
		response.sendRedirect("login.jsp?msg=loginIncorreto");
	}
	
	
%>