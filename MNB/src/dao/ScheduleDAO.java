package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import model.ScheduleBean;

public class ScheduleDAO {
	/*
	private String id;
	private String han;
	private int number;
	private String title;
	private int year;
	private int month;
	private int day;
	private String place;
	private String belongings;
	private String subjects;
	private String contact;
	private String content;
	*/
	String driverClassName = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/mnb";
	String user = "wspuser"; // ここはユーザ名
	String password = "hogehoge"; // ここはパスワード
	Connection connection;
	Statement statement;
	ResultSet resultSet;

	private ScheduleBean bean;

	public ScheduleDAO(ScheduleBean sb){
		bean = sb;
	}

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
					/*
					id = resultSet.getString("id");
					han = resultSet.getString("han");
					number = resultSet.getInt("number");
					title = resultSet.getString("title");
					place = resultSet.getString("place");
					belongings = resultSet.getString("belongings");
					subjects = resultSet.getString("subjects");
					contact = resultSet.getString("contact");
					content = resultSet.getString("content");
					*/

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

	public void insertDatabase(){

	}

	public void updateDatabase(){

	}

	public void deleteDatabase(){

	}
}
