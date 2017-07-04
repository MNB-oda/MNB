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

	PreparedStatement prepStmt_SI; // IDを指定したSELECT用
    PreparedStatement prepStmt_S; //SELECT用
    PreparedStatement prepStmt_I; // INSERT用
    PreparedStatement prepStmt_U; // UPDATE用
    PreparedStatement prepStmt_D; // DELETE用

    String strPrepSQL_SI = "SELECT * FROM student WHERE id = ?";
    String strPrepSQL_S = "SELECT * FROM student";
    String strPrepSQL_I = "INSERT INTO student VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
    String strPrepSQL_U = "UPDATE student SET handle = ? , name = ? , id = ? ,"
    						+ "pass = ? , email = ?  , program = ? , cg2d = ? , cg3d = ? , music = ?  "
    						+ "WHERE id = ?";
    String strPrepSQL_D = "DELETE FROM student WHERE id = ?";
	ResultSet resultSet;

	public StudentBean getDatabase(StudentBean bean){
		try{
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            prepStmt_SI = connection.prepareStatement(strPrepSQL_SI);

            prepStmt_SI.setString(1, bean.getId());

            resultSet = prepStmt_SI.executeQuery();

            while (resultSet.next()) {
            	bean.setHandle(resultSet.getString("handle"));
            	bean.setName(resultSet.getString("name"));
                bean.setId(resultSet.getString("id"));
                bean.setPass(resultSet.getString("pass"));
                bean.setEmail(resultSet.getString("email"));
                bean.setIsProhan(resultSet.getBoolean("program"));
            	bean.setIs2dcghan(resultSet.getBoolean("cg2d"));
            	bean.setIs3dcghan(resultSet.getBoolean("cg3d"));
            	bean.setIsMusichan(resultSet.getBoolean("music"));
            }

			resultSet.close();
			connection.close();

		}catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	public void createStudentList(ArrayList<StudentBean> studentList){
		try{
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            prepStmt_S = connection.prepareStatement(strPrepSQL_S);

            resultSet = prepStmt_S.executeQuery();

            while (resultSet.next()) {
            	StudentBean bean = new StudentBean();
            	bean.setHandle(resultSet.getString("handle"));
            	bean.setName(resultSet.getString("name"));
            	bean.setId(resultSet.getString("id"));
            	bean.setPass(resultSet.getString("pass"));
            	bean.setEmail(resultSet.getString("email"));
            	bean.setIsProhan(resultSet.getBoolean("program"));
            	bean.setIs2dcghan(resultSet.getBoolean("cg2d"));
            	bean.setIs3dcghan(resultSet.getBoolean("cg3d"));
            	bean.setIsMusichan(resultSet.getBoolean("music"));
                studentList.add(bean);
            }

			resultSet.close();
			connection.close();

		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertDatabase(StudentBean bean){
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_I = connection.prepareStatement(strPrepSQL_I);
		    prepStmt_I.setString(1, bean.getHandle());
		    prepStmt_I.setString(2, bean.getName());
		    prepStmt_I.setString(3, bean.getId());
		    prepStmt_I.setString(4, bean.getPass());
		    prepStmt_I.setString(5, bean.getEmail());
		    prepStmt_I.setBoolean(6, bean.isProhan());
		    prepStmt_I.setBoolean(7, bean.isIs2dcghan());
		    prepStmt_I.setBoolean(8, bean.isIs3dcghan());
		    prepStmt_I.setBoolean(9, bean.isMusichan());
		  //bean.setHan((String[])request.getParameterValues("han"));
		    prepStmt_I.executeUpdate();

		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	public void updateDatabase(StudentBean bean){
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_U = connection.prepareStatement(strPrepSQL_U);
		    prepStmt_U.setString(1, bean.getHandle());
		    prepStmt_U.setString(2, bean.getName());
		    prepStmt_U.setString(3, bean.getId());
		    prepStmt_U.setString(4, bean.getPass());
		    prepStmt_U.setString(5, bean.getEmail());
		    prepStmt_U.setBoolean(6, bean.isProhan());
		    prepStmt_U.setBoolean(7, bean.isIs2dcghan());
		    prepStmt_U.setBoolean(8, bean.isIs3dcghan());
		    prepStmt_U.setBoolean(9, bean.isMusichan());
		    prepStmt_U.setString(10, bean.getId());
		    System.out.println(prepStmt_U);
		    prepStmt_U.executeUpdate();

		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	public void deleteDatabase(StudentBean bean){
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_D = connection.prepareStatement(strPrepSQL_D);
		    prepStmt_D.setString(1, bean.getId());
		    prepStmt_D.executeUpdate();

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
