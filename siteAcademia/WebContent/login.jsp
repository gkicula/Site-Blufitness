<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>BluFitness</title>
<link href="interface.html">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/estilos.css" rel="stylesheet">
<link rel="shortcut icon" href="imagens/BluuFitness.ico" />
</head>
  <body class="corpologin">
    
   
    
     <nav> 
        <div class="imagemFlux">    
         <a href="#fluxsys" class="botaoflux"></a>
        </div>
         <img src="imagens/BluFitness.png" alt="blufitness" height="100" width="250">
            <ul class="topoUl">
            
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
    
     <%@include file ="include/msg.jsp" %>
   
     <div class="caixalogin">
      <img src="imagens/bonecologin.png" class="bonecologin"><br/><br/>
      <h1 class="LOGIN">FAÇA SEU LOGIN</h1><br/>
    <form action="logar.jsp">
      <div class="conteudoCaixaLogin">
        <p class="loginEsenha" >Login:</p>
         <input class="login" type="text" name="usuario" placeholder="Insira o login" required="required">
        <p class="loginEsenha" >Senha:</p>
         <input class="senha" type="password" name="senha" placeholder="Insira a senha" required="required">
         <input type="submit" class = "btn btn-success" name="entrar" value="Login">
       
        <a id="recuperacaoSenha" href="recuperacao.jsp?msg=nulo">Esqueceu sua senha?</a><br/>
      </div>
    </form>  

       </div>


  </body>
</html>