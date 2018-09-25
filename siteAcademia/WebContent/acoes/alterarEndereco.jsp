<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@page import="br.com.siteAcademia.bean.AlunoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	String rua = request.getParameter("rua");
	int numero = Integer.parseInt(request.getParameter("numero"));
	String bairro = request.getParameter("bairro");
	String cep = request.getParameter("cep");
	String complemento = request.getParameter("complemento");

	if(cep.length() != 9){
		response.sendRedirect("../conta.jsp?msgEndereco=erroEnderecoAlterado");
	}else{
	
	AlunoBean ab = new AlunoBean();
	ab = (AlunoBean) session.getAttribute("sessaoUsuario");
	
	ab.setRua(rua);
	ab.setNumero(numero);
	ab.setBairro(bairro);
	ab.setCep(cep);
	ab.setComplemento(complemento);

	AlunoDao ad = new AlunoDao();
	ad.idBairro(ab);
	
	ad.alterarEndereco(ab);
	
	response.sendRedirect("../conta.jsp?msgEndereco=enderecoAlterado");
	}
%>
