package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.ScheduleBean;

public class ScheduleDAO {
	String driverClassName = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/mnb";
	String user = "wspuser"; // ここはユーザ名
	String password = "hogehoge"; // ここはパスワード
	Connection connection;

	PreparedStatement prepStmt_SYMD; // 年月日を指定したSELECT用
    PreparedStatement prepStmt_SYM; // 年月を指定したSELECT用
    PreparedStatement prepStmt_I; // INSERT用
    PreparedStatement prepStmt_U; // UPDATE用
    PreparedStatement prepStmt_D; // DELETE用

    String strPrepSQL_SYMD = "SELECT * FROM schedule WHERE year = ? AND month = ? AND day = ?";
    String strPrepSQL_SYM = "SELECT * FROM schedule WHERE year = ? AND month = ?";
    String strPrepSQL_I = "INSERT INTO schedule VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    String strPrepSQL_U = "UPDATE schedule SET id = ? , han = ? , number = ? , title = ?"
    						+ ", place = ? , belongings = ? , subjects = ? , contact = ? , content = ?"
    						+ "WHERE year = ? AND month = ? AND day = ?";
    String strPrepSQL_D = "DELETE FROM schedule WHERE year = ? AND month = ? AND day = ?";

	ResultSet resultSet;

	//データベースから指定日時のデータを持ってくる
	public ScheduleBean getDatabase(ScheduleBean bean) {
		// データベース処理

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			prepStmt_SYMD = connection.prepareStatement(strPrepSQL_SYMD);

			prepStmt_SYMD.setInt(1, bean.getYear());
			prepStmt_SYMD.setInt(2, bean.getMonth());
			prepStmt_SYMD.setInt(3, bean.getDay());

            resultSet = prepStmt_SYMD.executeQuery();

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
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

	//指定データをデータベースに挿入
	public void insertDatabase(ScheduleBean bean){
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_I = connection.prepareStatement(strPrepSQL_I);
		    prepStmt_I.setString(1, bean.getId());
		    prepStmt_I.setString(2, bean.getHan());
		    prepStmt_I.setInt(3, bean.getNumber());
		    prepStmt_I.setString(4, bean.getTitle());
		    prepStmt_I.setInt(5, bean.getYear());
		    prepStmt_I.setInt(6, bean.getMonth());
		    prepStmt_I.setInt(7, bean.getDay());
		    prepStmt_I.setString(8, bean.getPlace());
		    prepStmt_I.setString(9, bean.getBelongings());
		    prepStmt_I.setString(10, bean.getSubjects());
		    prepStmt_I.setString(11, bean.getContact());
		    prepStmt_I.setString(12, bean.getContent());
		    prepStmt_I.executeUpdate();

		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	//指定データで同じ日時のデータを更新
	public void updateDatabase(ScheduleBean bean){
		try {
			Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_U = connection.prepareStatement(strPrepSQL_U);
		    prepStmt_U.setString(1, bean.getId());
		    prepStmt_U.setString(2, bean.getHan());
		    prepStmt_U.setInt(3, bean.getNumber());
		    prepStmt_U.setString(4, bean.getTitle());
		    prepStmt_U.setString(5, bean.getPlace());
		    prepStmt_U.setString(6, bean.getBelongings());
		    prepStmt_U.setString(7, bean.getSubjects());
		    prepStmt_U.setString(8, bean.getContact());
		    prepStmt_U.setString(9, bean.getContent());
		    prepStmt_U.setInt(10, bean.getYear());
		    prepStmt_U.setInt(11, bean.getMonth());
		    prepStmt_U.setInt(12, bean.getDay());
		    prepStmt_U.executeUpdate();

		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	//指定日時のデータを削除
	public void deleteDatabase(ScheduleBean bean){
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_D = connection.prepareStatement(strPrepSQL_D);
		    prepStmt_D.setInt(1, bean.getYear());
		    prepStmt_D.setInt(2, bean.getMonth());
		    prepStmt_D.setInt(3, bean.getDay());
		    prepStmt_D.executeUpdate();

		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	//指定日時のデータがデータベース内に存在するか
	public boolean checkExist(ScheduleBean bean){
		boolean result = false;

		try {
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);

            prepStmt_SYMD = connection.prepareStatement(strPrepSQL_SYMD);
			prepStmt_SYMD.setInt(1, bean.getYear());
			prepStmt_SYMD.setInt(2, bean.getMonth());
			prepStmt_SYMD.setInt(3, bean.getDay());

			resultSet = prepStmt_SYMD.executeQuery();
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
