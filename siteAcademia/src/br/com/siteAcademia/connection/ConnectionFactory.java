package br.com.siteAcademia.connection;

	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.SQLException;

public class ConnectionFactory {

		private final String url = "jdbc:mysql://localhost:3306/tcc";
		private final String user = "root";
		private final String password = "";
		
		//Método de conexão
			public Connection obterConexao(){
				
				//Variável contendo a conexão
				Connection conexao = null;
				
				//Selecionar a classe de conexão MySQL
				try {
					Class.forName("com.mysql.jdbc.Driver");
				}catch(Exception erro) {
					System.out.println("Falha ao selecionar a classe "+erro.getMessage());
				}
				
				//Tenta obter a conexão
				try {
					conexao = DriverManager.getConnection(url, user, password);
					
				}catch(SQLException e) {
					System.out.println("Falha ao conectar "+e.getMessage());
					throw new RuntimeException(e);
				}
			
				//Retorno
				return conexao;
			}
		
	}

	

