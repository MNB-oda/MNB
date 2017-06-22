package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class StudentDAO {
	final private static String dbname = "tutorial";   // データベース名
	final private static String user = "wspuser";      // tutorialにアクセスできるユーザ
	final private static String password = "hogehoge"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;
	Connection connection;
	Statement statement;
	ResultSet resultSet;

	public StudentBean getDatabase(StudentBean bean){
		String sql = "SELECT * FROM student WHERE id= '"+bean.getId()+"'  AND name= '"+bean.getName()+"'";
		try{
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();

            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
            	bean.setHandle(resultSet.getString("handle"));
            	bean.setName(resultSet.getString("name"));
                bean.setId(resultSet.getString("id"));
                bean.setPass(resultSet.getString("pass"));
                bean.setEmail(resultSet.getString("email"));
                bean.setGroup(resultSet.getString("group"));
            }

			resultSet.close();
			statement.close();
			connection.close();

		}catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	public void createStudentList(ArrayList<StudentBean> studentList){
		String sql = "SELECT id,name FROM student";
		try{
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();

            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
            	StudentBean bean = new StudentBean();
            	bean.setId(resultSet.getString("id"));
            	bean.setName(resultSet.getString("name"));
                studentList.add(bean);
            }

			resultSet.close();
			statement.close();
			connection.close();

		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertDatabase(){

	}

	public void updateDatabase(){

	}

	public void deleteDatabase(){

	}
}
