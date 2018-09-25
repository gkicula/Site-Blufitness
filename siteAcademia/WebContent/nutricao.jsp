<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@page import="br.com.siteAcademia.bean.AlunoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="imagens/BluuFitness.ico" />
<title>Nutrição</title>
</head>
<body>

    <%@include file = "include/topo.jsp" %>
    
<%
    
    	AlunoBean ab = new AlunoBean();
    	ab = (AlunoBean) session.getAttribute("sessaoUsuario");
    	
    	if(ab.getIdPlano() == 1){
       		out.print("<div class='alert alert-danger msg'>Não é possivel listar a nutrição pois sua conta não possui Premium. Se deseja alterar seu plano, entre em contato com a recepção");
    	}else{    
 %>

<form action="acoes/listarNutricao.jsp">
<%out.print(new AlunoDao().listarDiasSemanas(ab)); %>

<br>

<input type="submit" class = "btn btn-success" name="Confirmar" value="Confirmar" id="botaoConfirmTreino">

</form>

<br>

<%if((ab.getDiaSemana() != null) && (ab.getTemTreino() != null)){
	out.print(new AlunoDao().listarAlimentacao(ab));	
}	
	%>

<br>
<%@include file = "include/msg.jsp" %>
</body>
</html>

<%}%>