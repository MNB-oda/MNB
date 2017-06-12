package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ScheduleBean {
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

	public String getHan() {
		return han;
	}

	public void setHan(String han) {
		this.han = han;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getBelongings() {
		return belongings;
	}

	public void setBelongings(String belongings) {
		this.belongings = belongings;
	}

	public String getSubjects() {
		return subjects;
	}

	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	// 何曜日なのか
	public String getDayOfTheWeek(int value) {
		switch (value) {
		case 0:
			return "日";
		case 1:
			return "月";
		case 2:
			return "火";
		case 3:
			return "水";
		case 4:
			return "木";
		case 5:
			return "金";
		case 6:
			return "土";
		default:
			return null;
		}
	}

	public void detabaseAccses() {
		// データベース処理
		String driverClassName = "org.postgresql.Driver";
		String url = "jdbc:postgresql://localhost/test";
		String user = "dbpuser"; // ここはユーザ名
		String password = "hogehoge"; // ここはパスワード
		Connection connection;
		Statement statement;
		ResultSet resultSet;
		String sql = "SELECT * FROM schedule WHERE year =" + year + "AND month =" + month
				+ "AND day =" + day;

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			statement = connection.createStatement();

			resultSet = statement.executeQuery(sql);

			if (resultSet != null) {
				han = resultSet.getString("han");
				number = resultSet.getInt("number");
				title = resultSet.getString("title");
				place = resultSet.getString("place");
				belongings = resultSet.getString("belongings");
				subjects = resultSet.getString("subjects");
				contact = resultSet.getString("contact");
				content = resultSet.getString("content");
			}

			resultSet.close();
			statement.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
