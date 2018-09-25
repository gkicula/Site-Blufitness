<%@page import="br.com.siteAcademia.dao.AlunoDao"%>
<%@page import="br.com.siteAcademia.bean.AlunoBean"%>

<link rel="shortcut icon" href="imagens/BluuFitness.ico" />

<%@include file = "include/topo.jsp" %>

<%
	AlunoBean aluno = new AlunoBean();
	aluno = (AlunoBean) session.getAttribute("sessaoUsuario");
	
	aluno.setDiaSemana(null);
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<div class="corpoConta">
  <ul class="nav nav-tabs" role="tablist" id="abas">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Informações Pessoais</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Endereço</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Contato</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Alteração de Senha</a></li>
  </ul>

  <!-- INFORMAÇÕES PESSOAIS -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    
    <br>
    <form class="infoAluno">
    
    <label>Nome</label>
    <input type="text" name="nome" value="<% out.print(aluno.getNomeAluno()); %>" class="form-control" disabled="disabled">
    
    <br>
    <br>
    <label>CPF</label>
    <input type="text" name="cpf" value="<% out.print(aluno.getCpf()); %>" class="form-control" disabled="disabled">
     
    <br>
    <br>
    <label>RG</label>
    <input type="text" name="rg" value="<% out.print(aluno.getRg()); %>" class="form-control" disabled="disabled">

    <br>
    <br>
    <label>Professor</label>
    <input type="text" name="professor" value="<% out.print(new AlunoDao().nomeProfessor(aluno));%>" class="form-control" disabled="disabled">
    </form>
    
    <!-- CONTATO -->
   
    
    </div>
    <div role="tabpanel" class="tab-pane" id="profile">
    
     
    
         <br>
    <form class="infoContato" action="acoes/alterarContato.jsp">
    
    <%@include file = "include/msgContato.jsp" %>
    
    <%	AlunoDao ad = new AlunoDao();
	ad.infoContato(aluno); %>
    
    <label>Celular</label>
    <input type="text" name="celular" value="<% out.print(aluno.getCelular()); %>" class="form-control" required="required">
    
    <br>
    <br>
    <label>Telefone</label>
    <input type="text" name="telefone" value="<% out.print(aluno.getTelefone()); %>" class="form-control" required="required">
     
    <br>
    <br>
    <label>E-mail</label>
    <input type="text" name="email" value="<% out.print(aluno.getEmail()); %>" class="form-control" required="required">
	
    <br>
    <br>
    <input type="submit" value="Salvar" class= "btn btn-success" id="salvarAlterar">
    </form>
    
    <!-- ENDEREÇO -->
    
    
    </div>
    <div role="tabpanel" class="tab-pane" id="messages">
    
    <% ad.infoEndereco(aluno); %>
     <br>
    <%@include file="include/msgEndereco.jsp" %>
    <form class="infoEndereco" action="acoes/alterarEndereco.jsp">
    
    <label>Rua</label>
    <input type="text" name="rua" value="<% out.print(aluno.getRua()); %>" class="form-control" required="required">
    
    <br>
    <br>
    <label>Número</label>
    <input type="text" name="numero" value="<% out.print(aluno.getNumero()); %>" class="form-control" required="required">
     
    <br>
    <br>
    <label>Bairro</label>
    <br>
	<%out.print(new AlunoDao().listarBairros(aluno)); %>
	
	<br>
    <br>
    <label>CEP</label>
    <input type="text" name="cep" value="<% out.print(aluno.getCep()); %>" class="form-control" required="required">
	
	<br>
    <br>
    <label>Complemento</label>
    <input type="text" name="complemento" value="<% out.print(aluno.getComplemento()); %>" class="form-control" required="required">
	
	
    <br>
    <br>
    <input type="submit" value="Salvar" class= "btn btn-success" id="salvarAlterar">
    </form>
    
    </div>
    <div role="tabpanel" class="tab-pane" id="messages"> </div>
    
    <!-- SENHA -->
    
    <div role="tabpanel" class="tab-pane" id="settings">
    
    <br>
   <form action="acoes/alterarSenha.jsp">
        
        <%@include file = "include/msg.jsp" %>
        <label>Senha Atual</label>
    	<input type="password" name="senhaAtual"  class="form-control" required="required" id="inputSenha">
    
    <br>
    <br>
    	<label>Nova senha</label>
    	<input type="password" name="novaSenha"  class="form-control" required="required">
    
       <br>
    <br>
   		<label>Repita a nova senha</label>
    	<input type="password" name="RepetirSenha" class="form-control" required="required">
    	
   	<br>
    <br>
    	<input type="submit" value="Salvar" class= "btn btn-success" id="salvarAlterar">
    	
    </form>
    
    </div>
  </div>

</div>

    <div role="tabpanel" class="tab-pane" id="settings"></div>

     <% if(((String.valueOf(request.getParameter("msgContato")).equals("contatoAlterado"))) || ((String.valueOf(request.getParameter("msgContato")).equals("erroAlterarCadastro"))) ){%>  
<script>
	  $("#feedtab a:eq(1)").tab('show');
</script>
<% } %>

     <% if(((String.valueOf(request.getParameter("msgEndereco")).equals("enderecoAlterado"))) || ((String.valueOf(request.getParameter("msgEndereco")).equals("erroEnderecoAlterado"))) ){%>  
<script>
	  $("#feedtab a:eq(2)").tab('show');
</script>
<% } %>

	     <% if(((String.valueOf(request.getParameter("msg")).equals("loginAlterado"))) || ((String.valueOf(request.getParameter("msg")).equals("erroLoginAlterado"))) ){%>  
<script>
	  $("#feedtab a:eq(3)").tab('show');
</script>
<% } %>
</body>
</html>