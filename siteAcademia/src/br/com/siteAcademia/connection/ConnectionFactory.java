package br.com.siteAcademia.connection;

	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.SQLException;

public class ConnectionFactory {

		private final String url = "jdbc:mysql://localhost:3306/tcc";
		private final String user = "root";
		private final String password = "";
		
		//M�todo de conex�o
			public Connection obterConexao(){
				
				//Vari�vel contendo a conex�o
				Connection conexao = null;
				
				//Selecionar a classe de conex�o MySQL
				try {
					Class.forName("com.mysql.jdbc.Driver");
				}catch(Exception erro) {
					System.out.println("Falha ao selecionar a classe "+erro.getMessage());
				}
				
				//Tenta obter a conex�o
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

	

