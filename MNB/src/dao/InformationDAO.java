package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;

import model.InformationBean;

public class InformationDAO {
	private String driverClassName = "org.postgresql.Driver";
	private String url = "jdbc:postgresql://localhost/mnb";
	private String user = "wspuser"; // ここはユーザ名
	private String password = "hogehoge"; // ここはパスワード
	private Connection connection;
	private ResultSet resultSet;

	private PreparedStatement prepStmt_L; // LIST作成用
	private PreparedStatement prepStmt_S; // SELECT用
	private PreparedStatement prepStmt_I; // INSERT用
	private PreparedStatement prepStmt_U; // UPDATE用
	private PreparedStatement prepStmt_D; // DELETE用
	private PreparedStatement prepStmt_C; // COUNT用

	private String strPrepSQL_L = "SELECT * FROM information";
	private String strPrepSQL_S = "SELECT * FROM information WHERE id = ?";
	private String strPrepSQL_I = "INSERT INTO information VALUES(?, ?, ?)";
	private String strPrepSQL_U = "UPDATE information SET title = ?, content = ? WHERE id = ?";
	private String strPrepSQL_D = "DELETE FROM information WHERE id = ?";
	private String strPrepSQL_C = "SELECT COUNT(*) AS cnt FROM information WHERE id LIKE ?";

	public InformationDAO(){
	}

	//
	public ArrayList<InformationBean> createInformationList(){
		ArrayList<InformationBean> list = new ArrayList<InformationBean>();
		try{
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            prepStmt_L = connection.prepareStatement(strPrepSQL_L);

            resultSet = prepStmt_L.executeQuery();

            while (resultSet.next()) {
            	InformationBean bean = new InformationBean();
				bean.setId(resultSet.getString("id"));
				bean.setTitle(resultSet.getString("title"));
				bean.setContent(resultSet.getString("content"));
                list.add(bean);
            }

			resultSet.close();
			connection.close();

			return list;

		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	//データベースから指定IDのデータを持ってくる
	public InformationBean getDatabase(InformationBean bean) {
		// データベース処理
		try {
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            prepStmt_S = connection.prepareStatement(strPrepSQL_S);

            prepStmt_S.setString(1, bean.getId());

            resultSet = prepStmt_S.executeQuery();


			if (resultSet != null) {
				while(resultSet.next()){
					bean.setId(resultSet.getString("id"));
					bean.setTitle(resultSet.getString("title"));
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
	public void insertDatabase(InformationBean bean){
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);
            prepStmt_I = connection.prepareStatement(strPrepSQL_I);

            prepStmt_I.setString(1, bean.getId());
            prepStmt_I.setString(2, bean.getTitle());
            prepStmt_I.setString(3, bean.getContent());

		    prepStmt_I.executeUpdate();

			connection.close();

		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	//指定データで同じIDのデータを更新
	public void updateDatabase(InformationBean bean){
		try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);
            prepStmt_U = connection.prepareStatement(strPrepSQL_U);

            prepStmt_U.setString(1, bean.getTitle());
            prepStmt_U.setString(2, bean.getContent());
            prepStmt_U.setString(3, bean.getId());
            prepStmt_U.executeUpdate();

			connection.close();

		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

	//指定IDのデータを削除
	public void deleteDatabase(InformationBean bean){
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

	//指定IDのデータがデータベース内に存在するか
	public boolean checkExist(InformationBean bean){
		boolean result = false;
		try {
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            prepStmt_S = connection.prepareStatement(strPrepSQL_S);

            prepStmt_S.setString(1, bean.getId());

            resultSet = prepStmt_S.executeQuery();

			if (resultSet.next()) result = true;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	//データベースから指定IDのデータを持ってくる
	public String getNewId(String str) {
		// データベース処理
		try {
			Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            prepStmt_C = connection.prepareStatement(strPrepSQL_C);
    		DecimalFormat dformat = new DecimalFormat("00");

    		for(int i = 0; i < 100; i++) {
    			prepStmt_C.setString(1, str + dformat.format(i));

            	resultSet = prepStmt_C.executeQuery();

				if (resultSet != null) {
					resultSet.next();
					if(resultSet.getInt("cnt") == 0) {
						str = str + dformat.format(i);
						break;
					}
				}
    		}
			resultSet.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}
}
