<%@page import="br.com.siteAcademia.bean.AlunoBean"%>
<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="imagens/BluuFitness.ico" />
<title>Treinos</title>
</head>
<body>

<%@include file = "include/topo.jsp" %>

<%AlunoBean ab = new AlunoBean();
	ab = (AlunoBean) session.getAttribute("sessaoUsuario");
	
%>

<form action="acoes/listarTreino.jsp">
<%out.print(new AlunoDao().listarDiasSemanas(ab)); %>

<br>

<input type="submit" class = "btn btn-success" name="Confirmar" value="Confirmar" id="botaoConfirmTreino">

</form>

<br>
<%if((ab.getDiaSemana() != null) && (ab.getTemTreino() != null)){
	out.print(new AlunoDao().listarExercicios(ab));	
}	
	%>

<%@include file = "include/msg.jsp" %>

</body>
</html>