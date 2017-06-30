package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.StudentBean;

public class StudentDAO {
	final private static String dbname = "mnb";   // データベース名
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
                bean.setHan(resultSet.getString("han"));
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
		//String sql = "SELECT handle,name,id,pass,email,han FROM student";
		String sql = "SELECT * FROM student";
		try{
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();

            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
            	StudentBean bean = new StudentBean();
            	bean.setHandle(resultSet.getString("handle"));
            	bean.setName(resultSet.getString("name"));
            	bean.setId(resultSet.getString("id"));
            	bean.setPass(resultSet.getString("pass"));
            	bean.setEmail(resultSet.getString("email"));
            	bean.setHan(resultSet.getString("han"));
                studentList.add(bean);
            }

			resultSet.close();
			statement.close();
			connection.close();

		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertDatabase(StudentBean bean){
		String sql = "SELECT * FROM student";
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);
		    statement = connection.createStatement();
		    statement.executeUpdate(
		    		"INSERT INTO schedule VALUES('" + bean.getHandle() +"','" + bean.getName() + "'," +  bean.getId() + ",'"
		    				+ bean.getPass() + "'," + bean.getEmail() + "," + bean.getHan() +"')");

		    statement.close();
		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	public void updateDatabase(StudentBean bean){
		String sql = "SELECT * FROM student";
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);
		    statement = connection.createStatement();
		    statement.executeUpdate(
		    		"UPDATE student SET handle ='" + bean.getHandle() + "',name ='" + bean.getName() + "',id ='" + bean.getId()
		    									+ "',pass ='" + bean.getPass() + "',email ='" + bean.getEmail()
		    									+ "',han ='" + bean.getHan()
		    									+ "' WHERE id ='" + bean.getId() + "'"
		    									);

		    statement.close();
		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	public void deleteDatabase(StudentBean bean){
		String sql = "SELECT * FROM student";
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);
		    statement = connection.createStatement();
		    statement.executeUpdate(
		    		"DELETE FROM student WHERE id =" + bean.getId() + "AND name =" + bean.getName());

		    statement.close();
		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	public boolean check(StudentBean bean){
		boolean result = false;
		String sql = "select * from student where id=? and pass=?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPass());

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = true;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
