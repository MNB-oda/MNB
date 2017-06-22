package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import model.InformationBean;

public class InformationDAO {
	String driverClassName = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/mnb";
	String user = "wspuser"; // ここはユーザ名
	String password = "hogehoge"; // ここはパスワード
	Connection connection;
	Statement statement;
	ResultSet resultSet;

	private InformationBean bean;

	public InformationDAO(InformationBean bean){
		this.bean = bean;
	}

	//データベースから指定IDのデータを持ってくる
	public InformationBean getDatabase() {
		// データベース処理
		String sql = "SELECT * FROM information WHERE id = '" + bean.getId() + "'";

		try {
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();

            resultSet = statement.executeQuery(sql);


			if (resultSet != null) {
				while(resultSet.next()){
					bean.setId(resultSet.getString("id"));
					bean.setTitle(resultSet.getString("title"));
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
		String sql = "INSERT INTO information VALUES('"
				+ bean.getId() + "', '"
				+ bean.getTitle() + "', '"
				+ bean.getContent() + "')";
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);
		    statement = connection.createStatement();
		    statement.executeUpdate(sql);

			statement.close();
			connection.close();

		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	//指定データで同じIDのデータを更新
	public void updateDatabase(){
		String sql = "UPDATE information SET title = '" + bean.getTitle()
									+ "', content = '" + bean.getContent()
									+ "' WHERE id = '" + bean.getId() + "'";
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);
		    statement = connection.createStatement();
		    statement.executeUpdate(sql);

			statement.close();
			connection.close();

		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	//指定IDのデータを削除
	public void deleteDatabase(){
		String sql = "DELETE FROM information WHERE id = '" + bean.getId() + "'";
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);
		    statement = connection.createStatement();
		    statement.executeUpdate(sql);

			statement.close();
			connection.close();

		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	//指定IDのデータがデータベース内に存在するか
	public boolean checkExist(){
		boolean result = false;
		String sql = "SELECT * FROM information WHERE id = '" + bean.getId() + "'";

		try {
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();

            resultSet = statement.executeQuery(sql);

			if (resultSet.next()) result = true;

			resultSet.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
