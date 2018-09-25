<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@page import="br.com.siteAcademia.bean.AlunoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html>
  <head>
<meta charset="utf-8">
<title>BluFitness</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/estilos.css" rel="stylesheet">
<link rel="shortcut icon" href="imagens/BluuFitness.ico" />
<link href="https://fonts.googleapis.com/css?family=Exo+2|Libre+Franklin|Lobster" rel="stylesheet">

  </head>	
   <%@include file = "include/topo.jsp" %>
  
  <%
  
  	AlunoBean aluno = new AlunoBean();
  	
  	aluno = (AlunoBean) session.getAttribute("sessaoUsuario");
  	
  	AlunoDao ad = new AlunoDao();
  
  	aluno.setDiaSemana(null);
  %>

<div>  
  
<form class = "escolhaInfo" action="conta.jsp">
  <input type="submit" value="Conta" name="botoesInterface" class="btn btn-primary" id="botoesInterface">
</form>                                                               
                                                                      
<form class = "escolhaInfo" action="treino.jsp">                       
  <input type="submit" value="Treinos" name="botoesInterface" class="btn btn-primary" id="botoesInterface">
</form>                                                               
                                                                      
<form class = "escolhaInfo" action="nutricao.jsp">                       
  <input type="submit" value="Nutrição" name="botoesInterface" class="btn btn-primary" id="botoesInterface">
</form>

</div>

  </body>
</html>