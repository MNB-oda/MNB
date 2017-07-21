package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.BigQuestionBean;

public class BigQuestionDAO {
	String driverClassName = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/mnb";
	String user = "wspuser"; // ここはユーザ名
	String password = "hogehoge"; // ここはパスワード
	Connection connection;

	PreparedStatement prepStmt_S; // SELECT用
	PreparedStatement prepStmt_SI; // IDを指定してただ一つのみ引き出すSELECT用
    PreparedStatement prepStmt_I; // INSERT用
    PreparedStatement prepStmt_D; // DELETE用
    PreparedStatement prepStmt_C; // ID作成のためのCOUNT用

    String strPrepSQL_S = "SELECT * FROM bigQuestion WHERE type = ?";
    String strPrepSQL_SI = "SELECT * FROM bigQuestion WHERE id = ?";
    String strPrepSQL_I = "INSERT INTO bigQuestion VALUES(?, ?, ?)";
    String strPrepSQL_D = "DELETE FROM bigQuestion WHERE id = ?";
    String strPrepSQL_C = "SELECT MAX(id) AS count FROM bigQuestion";

    ResultSet resultSet;

    public ArrayList<BigQuestionBean> getDatabase(BigQuestionBean bean){
    	ArrayList<BigQuestionBean> beans = new ArrayList<BigQuestionBean>();
    	try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			prepStmt_S = connection.prepareStatement(strPrepSQL_S);

			prepStmt_S.setString(1, bean.getType());

			resultSet = prepStmt_S.executeQuery();

			if(resultSet != null){
				while(resultSet.next()){
					BigQuestionBean subBean = new BigQuestionBean();
					subBean.setId(resultSet.getString("id"));
					subBean.setType(resultSet.getString("type"));
					subBean.setTitle(resultSet.getString("title"));
					beans.add(subBean);
				}
			}

			resultSet.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

    	return beans;
    }

    public BigQuestionBean getDatabaseById(BigQuestionBean bean){
    	try {
	    	Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			prepStmt_SI = connection.prepareStatement(strPrepSQL_SI);

			prepStmt_SI.setString(1, bean.getId());

			resultSet = prepStmt_SI.executeQuery();

			if(resultSet != null){
				while(resultSet.next()){
					bean.setId(resultSet.getString("id"));
					bean.setType(resultSet.getString("type"));
					bean.setTitle(resultSet.getString("title"));
				}
			}

			resultSet.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

    	return bean;
    }

    public void insertDatabase(BigQuestionBean bean){
    	try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_I = connection.prepareStatement(strPrepSQL_I);
		    prepStmt_I.setString(1, bean.getId());
		    prepStmt_I.setString(2, bean.getTitle());
		    prepStmt_I.setString(3, bean.getType());

		    prepStmt_I.executeUpdate();

		    connection.close();
    	} catch (Exception e) {
		    e.printStackTrace();
		}
    }

    public void deleteDatabase(BigQuestionBean bean){
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

    public int getIdMax(){
    	int count = 0;
    	try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_C = connection.prepareStatement(strPrepSQL_C);
		    resultSet = prepStmt_C.executeQuery();

		    if(resultSet != null){
				while(resultSet.next()){
					count = resultSet.getInt("count");
				}
			}

		    connection.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
    	return count;
    }
}
