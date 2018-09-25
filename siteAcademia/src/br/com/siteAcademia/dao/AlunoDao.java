package br.com.siteAcademia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.JOptionPane;


import br.com.siteAcademia.bean.AlunoBean;
import br.com.siteAcademia.connection.ConnectionFactory;

public class AlunoDao {

	Connection conexao;
	
	public AlunoDao() {
		this.conexao = new ConnectionFactory().obterConexao();
	}
	
	public boolean validaLogin(AlunoBean ab) {
		
		boolean existe = false;
		
		String sql = "SELECT idAluno, cpfAluno, rgAluno, nomeAluno, idEnderecoAluno, idContatoAluno, idProfessor, alunos.idLogin, idPlano FROM login, alunos WHERE login.usuario = ? AND login.senha = ? AND alunos.idLogin = login.idLogin";
		
		try {
			
			PreparedStatement pstmt = this.conexao.prepareStatement(sql);
			pstmt.setString(1, ab.getUsuario());
			pstmt.setString(2,ab.getSenha());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ab.setIdAluno(rs.getInt("idAluno"));
				ab.setNomeAluno(rs.getString("nomeAluno"));
				ab.setIdEndereco(rs.getInt("idEnderecoAluno"));
				ab.setIdContato(rs.getInt("idContatoAluno"));
				ab.setIdProfessor(rs.getInt("idProfessor"));
				ab.setIdLogin(rs.getInt("idLogin"));
				ab.setIdPlano(rs.getInt("idPlano"));
				ab.setCpf(rs.getString("cpfAluno"));
				ab.setRg(rs.getString("rgAluno"));
			}
			
			if(ab.getIdAluno() != 0) {
				existe = true;
			}
			
			
			
			pstmt.close();
			this.conexao.close();
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Não foi possível realizar o login   "+e.getMessage());
		}
		
		
		return existe;
		
	}
	
	public String nomeProfessor(AlunoBean ab){
		
		String nomeProfessor = "";
		
		String sql = "SELECT professores.nomeProfessor FROM professores WHERE professores.idProfessor = ?";
		
		try{
			
			PreparedStatement pstmt = this.conexao.prepareStatement(sql);
			pstmt.setInt(1, ab.getIdProfessor());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				nomeProfessor = rs.getString("nomeProfessor");
			}
			
			pstmt.close();
			this.conexao.close();
			
		}catch(Exception e){
			JOptionPane.showMessageDialog(null, "Não foi possível identificar o professor   "+e.getMessage());
		}
		
		
		return nomeProfessor;
		
	}
	
	public boolean validaCpfRecuperacao(AlunoBean ab ,String cpf) {
		
		boolean existe = false;
		
		String sql = "SELECT login.usuario, login.senha FROM alunos, login WHERE alunos.cpfAluno = ? AND alunos.idLogin = login.idLogin";
		
		try {
			
			PreparedStatement pstmt = this.conexao.prepareStatement(sql);
			pstmt.setString(1, cpf);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if((rs.getString("usuario") != null)){
				existe = true;
				ab.setUsuario(rs.getString("usuario"));
				ab.setSenha(rs.getString("senha"));
				ab.setCpfValida(existe);
				}
			}
			
			pstmt.close();
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Não foi possível encontrar o cpf  "+e.getMessage());
		}
		
		return existe;
		
	}
	
	public void infoContato(AlunoBean ab) {
		
		String sql = "SELECT * from contatoaluno WHERE idContatoAluno = ?";
		
		try {
			
			PreparedStatement pstmt = this.conexao.prepareStatement(sql);
			pstmt.setInt(1, ab.getIdContato());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ab.setCelular(rs.getInt(("numeroCelularAluno")));
				ab.setTelefone(rs.getInt("telefoneAluno"));
				ab.setEmail(rs.getString("emailAluno"));
			}
			
			pstmt.close();
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Não foi possível localizar o contato  "+e.getMessage());
		}
		
	}
	
	public void alterarContato(AlunoBean ab) {
		
		String sql = "UPDATE contatoaluno SET numeroCelularAluno = ?, telefoneAluno = ?, emailAluno = ? WHERE idContatoAluno = ?";
		
		try {
			
			PreparedStatement pstmt = this.conexao.prepareStatement(sql);
			pstmt.setInt(1, ab.getCelular());
			pstmt.setInt(2, ab.getTelefone());
			pstmt.setString(3, ab.getEmail());
			pstmt.setInt(4, ab.getIdContato());
			
			pstmt.execute();
			pstmt.close();
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Não foi possível alterar o contato  "+e.getMessage());
		}
		
	}
	
	public void infoEndereco(AlunoBean ab) {
		
		String sql = "SELECT ruaAluno, numeroAluno, bairros.nomeBairro, cepAluno, complemento FROM enderecoaluno, bairros WHERE idEnderecoAluno = ? AND enderecoaluno.bairroAluno = bairros.idBairros";
		
		try {
			
			PreparedStatement pstmt = this.conexao.prepareStatement(sql);
			pstmt.setInt(1, ab.getIdEndereco());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ab.setRua(rs.getString("ruaAluno"));
				ab.setNumero(rs.getInt("numeroAluno"));
				ab.setBairro(rs.getString("nomeBairro"));
				ab.setCep(rs.getString("cepAluno"));
				ab.setComplemento(rs.getString("complemento"));
			}
			
			pstmt.close();
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Não foi possível identificar o enderço  "+e.getMessage());		
			}
		
	}

	public String listarBairros(AlunoBean ab) {
		
		String bairros = "<select  class = form-control name = bairro>";
		
		String sql = "SELECT * FROM bairros ORDER BY nomeBairro";
		
		try {
			
			Statement stmt = this.conexao.createStatement();
			
			ResultSet rs = stmt.executeQuery(sql);
			bairros += "<option>"+ab.getBairro()+"</option>";
			
			
			while(rs.next()) {
				if(!rs.getString("nomeBairro").equals(ab.getBairro())) {
				bairros += "<option>"+rs.getString("nomeBairro")+"</option>";
				}
			}
			
			bairros += "</select>";
			
			stmt.close();
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Não foi possível listar os bairros  "+e.getMessage());
		}
	
		return bairros;
		
	}
	
	public void idBairro(AlunoBean ab) {
		
		String sql = "SELECT bairros.idBairros FROM bairros WHERE bairros.nomeBairro = ?";
		
		try {
			
			PreparedStatement pstmt = this.conexao.prepareStatement(sql);
			pstmt.setString(1, ab.getBairro());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ab.setIdBairro(rs.getInt("idBairros"));
			}
			
			pstmt.close();
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Não foi possível selecionar o id do bairro  "+e.getMessage());
		}
		
	}
	
	public void alterarEndereco(AlunoBean ab) {
		
		String sql = "UPDATE enderecoaluno SET ruaAluno = ?, numeroAluno = ?, bairroAluno = ?, cepAluno = ?, complemento = ? WHERE idEnderecoAluno = ?";
		
		try {
			
			PreparedStatement pstmt = this.conexao.prepareStatement(sql);
			pstmt.setString(1, ab.getRua());
			pstmt.setInt(2, ab.getNumero());
			pstmt.setInt(3, ab.getIdBairro());
			pstmt.setString(4, ab.getCep());
			pstmt.setString(5, ab.getComplemento());
			pstmt.setInt(6, ab.getIdEndereco());
			
			pstmt.execute();
			pstmt.close();
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Não foi possível altera o enderço  "+e.getMessage());
		}
		
	}
	
	public String listarDiasSemanas(AlunoBean ab) {
		
		String estrutura = "<select class=form-control name=diaSemana>";
		
		       String sql = "SELECT * FROM diassemana";
		       
		       if(ab.getDiaSemana() != null) {
		    	   estrutura += "<option>"+ab.getDiaSemana()+"</option>";
		       }
		       
		       try {
		    	   
		    	   Statement stmt = this.conexao.createStatement();
		    	   
		    	   ResultSet rs = stmt.executeQuery(sql);
		    	   
		    	  while(rs.next()) {
		    		  if(!rs.getString("nomeDia").equals(ab.getDiaSemana())) {
		    		  estrutura += "<option>"+rs.getString("nomeDia")+"</option>";
		    		  }
		    		  }
		
		    	  estrutura += "</select>";
		    	  
		    	  stmt.close();
		    	   
		       }catch (Exception e) {
				JOptionPane.showMessageDialog(null, "Não foi possível listar os dias da semana  "+e.getMessage());
			}
		
		
		
		return estrutura;
	}
	
	public void alterarSenha(AlunoBean ab, String senha) {
		
		String sql = "UPDATE login SET senha = ? WHERE idLogin = ?";
		
		try {
			
			PreparedStatement pstmt = this.conexao.prepareStatement(sql);
			pstmt.setString(1, senha);
			pstmt.setInt(2, ab.getIdLogin());
			
			ab.setSenha(senha);
			
			pstmt.execute();
			pstmt.close();
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Não foi possível alterar a senha "+e.getMessage());
		}
		
		
	}
	
	public String listarExercicios(AlunoBean ab) {
		
		String estrutura = "<table class = table table-striped>";
				
				estrutura += "<tr>";
				estrutura += "<th>Treino</th>";
				estrutura += "</tr>";
		
		String sql = "SELECT exercicios.exercicio1, exercicios.exercicio2, exercicios.exercicio3, exercicios.exercicio4, exercicios.exercicio5, exercicios.exercicio6, exercicios.exercicio7, exercicios.exercicio8, exercicios.exercicio9, exercicios.exercicio10 FROM exercicios, treinossemanais WHERE treinossemanais.idExercicios = exercicios.idExercicio AND treinossemanais.idAluno = ? AND treinossemanais.diaSemana = ?";
		
		try {
			
			PreparedStatement pstmt = this.conexao.prepareStatement(sql);
			pstmt.setInt(1, ab.getIdAluno());
			pstmt.setString(2, ab.getDiaSemana());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				estrutura += "<tr>";
				estrutura += "<td>";
				estrutura += rs.getString(1);
				
				if(rs.getString(1) != null) {
					ab.setTemTreino("Sim");
				}
				
				if(rs.getString(2) != null) {
				estrutura += rs.getString(2);
				}
				if(rs.getString(3) != null) {
					estrutura += rs.getString(3);
					}
				if(rs.getString(4) != null) {
					estrutura += rs.getString(4);
					}
				if(rs.getString(5) != null) {
					estrutura += rs.getString(5);
					}
				if(rs.getString(6) != null) {
					estrutura += rs.getString(6);
					}
				if(rs.getString(7) != null) {
					estrutura += rs.getString(7);
					}
				if(rs.getString(8) != null) {
					estrutura += rs.getString(8);
					}
				if(rs.getString(9) != null) {
					estrutura += rs.getString(9);
					}
				if(rs.getString(10) != null) {
					estrutura += rs.getString(10);
					}
				estrutura += "</td>";
				estrutura += "</tr>";
				
			}
			
			pstmt.close();
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Não foi possível listar os exercícios "+e.getMessage());
		}
		
		estrutura += "</table>";
		
		return estrutura;
		
	}

	public String listarAlimentacao(AlunoBean ab) {
		
		String estrutura = "<table class = table table-striped>";
		
		estrutura += "<tr>";
		estrutura += "<th>Café da Manhã</th>";
		estrutura += "<th>Almoço</th>";
		estrutura += "<th>Jantar</th>";
		estrutura += "<th>Pós-Treino</th>";
		estrutura += "<th>Pré-Treino</th>";
		estrutura += "</tr>";
		
		String sql = "SELECT * FROM alimentacao WHERE alimentacao.diaSemana = ? AND alimentacao.idAluno = ?";
		
		try {
			
			PreparedStatement pstmt = this.conexao.prepareStatement(sql);
			pstmt.setString(1, ab.getDiaSemana());
			pstmt.setInt(2, ab.getIdAluno());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString(1) != null) {
				ab.setTemTreino("Sim");
				}
				estrutura += "<tr>";
				estrutura += "<td>";
				estrutura += rs.getString("cafeManha");
				estrutura += "</td>";
				estrutura += "<td>";
				estrutura += rs.getString("almoco");
				estrutura += "</td>";
				estrutura += "<td>";
				estrutura += rs.getString("jantar");
				estrutura += "</td>";
				estrutura += "<td>";
				estrutura += rs.getString("preTreino");
				estrutura += "</td>";
				estrutura += "<td>";
				estrutura += rs.getString("posTreino");
				estrutura += "</td>";
				estrutura += "</tr>";
				
			}
			
			pstmt.close();
			
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Não foi possível listar a nutrição do aluno  "+e.getMessage());
		}
		
		return estrutura;
		
	}
	
}
