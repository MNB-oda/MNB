package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class StudentDAO {
	final private static String dbname = "tutorial";   // データベース名
	final private static String user = "wspuser";      // tutorialにアクセスできるユーザ
	final private static String password = "hogehoge"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;
	Connection connection;
	Statement statement;
	ResultSet resultSet;

	public StudentBean getStudent(StudentBean bean){
		//String sql = "SELECT * FROM student WHERE handle ="
		//		+ "" + bean.getHandle() + "AND name =" + bean.getName() + "AND id=" + bean.getId()
		//		+ "AND pass=" + bean.getPass() + "AND email=" + bean.getEmail() + "AND group=" + bean.getGroup();
		String sql = "SELECT * FROM student where id= ? and pass= ?";
		try{
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
           PreparedStatement pstmt = connection.prepareStatement(sql);

           pstmt.setString(1, bean.getId());
           pstmt.setString(2, bean.getId());

            resultSet = statement.executeQuery(sql);

            if (resultSet != null) {
				while(resultSet.next()){
					bean.setHandle(resultSet.getString("handle"));
					bean.setName(resultSet.getString("name"));
					bean.setId(resultSet.getString("id"));
					bean.setPass(resultSet.getString("pass"));
					bean.setEmail(resultSet.getString("email"));
					bean.setGroup(resultSet.getString("group"));
				}
			}
			resultSet.close();
			statement.close();
			connection.close();

		}catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	public void insertDatabase(){

	}

	public void updateDatabase(){

	}

	public void deleteDatabase(){

	}
}
