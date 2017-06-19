package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import model.ScheduleBean;

public class ScheduleDAO {
	String driverClassName = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/mnb";
	String user = "wspuser"; // ここはユーザ名
	String password = "hogehoge"; // ここはパスワード
	Connection connection;
	Statement statement;
	ResultSet resultSet;

	private ScheduleBean bean;

	public ScheduleDAO(ScheduleBean bean){
		this.bean = bean;
	}

	//データベースから指定日時のデータを持ってくる
	public ScheduleBean getDatabase() {
		// データベース処理
		String sql = "SELECT * FROM schedule WHERE year =" + bean.getYear() + "AND month =" + bean.getMonth() + "AND day =" + bean.getDay();

		try {
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();

            resultSet = statement.executeQuery(sql);


			if (resultSet != null) {
				while(resultSet.next()){
					bean.setId(resultSet.getString("id"));
					bean.setHan(resultSet.getString("han"));
					bean.setNumber(resultSet.getInt("number"));
					bean.setTitle(resultSet.getString("title"));
					bean.setPlace(resultSet.getString("place"));
					bean.setBelongings(resultSet.getString("belongings"));
					bean.setSubjects(resultSet.getString("subjects"));
					bean.setContact(resultSet.getString("contact"));
					bean.setContent(resultSet.getString("content"));
				}
			}
			resultSet.close();
			statement.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

	//指定データをデータベースに挿入
	public void insertDatabase(){
		String sql = "SELECT * FROM schedule";
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);
		    statement = connection.createStatement();
		    statement.executeUpdate(
		    		"INSERT INTO schedule VALUES('" + bean.getId() +"','" + bean.getHan() + "'," +  bean.getNumber() + ",'"
		    				+ bean.getTitle() + "'," + bean.getYear() + "," + bean.getMonth() + "," + bean.getDay() + ",'"
		    				+ bean.getPlace() + "','" + bean.getBelongings() + "','" + bean.getSubjects() + "','"
		    				+ bean.getContact() + "','" + bean.getContent() + "')");

		    statement.close();
		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	//指定データで同じ日時のデータを更新
	public void updateDatabase(){
		String sql = "SELECT * FROM schedule";
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);
		    statement = connection.createStatement();
		    statement.executeUpdate(
		    		"UPDATE schedule SET id =" + bean.getId() + ",han ='" + bean.getHan() + "',number =" + bean.getNumber()
		    									+ ",title ='" + bean.getTitle() + "',place ='" + bean.getPlace()
		    									+ "',belongings ='" + bean.getBelongings() + "',subjects = '" + bean.getSubjects()
		    									+ "',contact ='" + bean.getContact() + "',content = '" + bean.getContent()
		    									+ "' WHERE year =" + bean.getYear() + " AND month =" + bean.getMonth()
		    									+ " AND day =" + bean.getDay());

		    statement.close();
		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	//指定日時のデータを削除
	public void deleteDatabase(){
		String sql = "SELECT * FROM schedule";
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);
		    statement = connection.createStatement();
		    statement.executeUpdate(
		    		"DELETE FROM schedule WHERE year =" + bean.getYear() + "AND month =" + bean.getMonth()
					+ "AND day =" + bean.getDay() );

		    statement.close();
		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	//指定日時のデータがデータベース内に存在するか
	public boolean checkExist(){
		boolean result = false;
		String sql = "SELECT * FROM schedule WHERE year =" + bean.getYear() + "AND month =" + bean.getMonth() + "AND day =" + bean.getDay();

		try {
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();

            resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
            	result = true;
            }

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
