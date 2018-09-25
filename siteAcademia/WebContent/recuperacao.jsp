<%@page import="br.com.siteAcademia.bean.AlunoBean"%>
<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/estilos.css" rel="stylesheet">
<link rel="shortcut icon" href="imagens/BluuFitness.ico" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Recuperação de Senha</title>
</head>
<body>

</head>
  <body class="corpologin">
    
   
    
               <nav> 
        <div class="imagemFlux">    
         <a href="#fluxsys" class="botaoflux"></a>
        </div>
         <img src="imagens/BluFitness.png" alt="blufitness" height="100" width="250">
            <ul>
            
               <li>
                 <a href="index.html">SOBRE</a>
               </li>
               
               <li>
                 <a href="#servicos">SERVIÇOS</a>
               </li>
                              
               <li>
                 <a href="login.jsp">LOGIN</a>
               </li>               
               
               <li>
                 <a href="contato.html">CONTATO</a>
               </li>
            
            </ul>
      </nav>

<%@include file = "include/msg.jsp" %>

<form action="acoes/acaoRecuperar.jsp">
<label>Informe seu cpf e tentaremos localizar sua conta</label>
<input type="text" name = "cpf" class = "form-control" placeholder="CPF">
<br>
<input type="submit" name = "btn" class = "btn btn-success" name="Confirmar" value="Confirmar">
</form>

<%

	AlunoBean aluno = new AlunoBean();
    aluno = (AlunoBean) session.getAttribute("sessaoCpf");
 
    String msg = request.getParameter("msg");
    
    if(msg.equals("cpfVerificado")){
    
   
	
%>
	<div class="mostrarLogin">
	<label>Usuário:<%out.print(aluno.getUsuario()); %></label>
	<label>Senha:<%out.print(aluno.getSenha()); %></label>
	</div>
<%} %>



</body>
</html>