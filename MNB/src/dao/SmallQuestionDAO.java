package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.SmallQuestionBean;

public class SmallQuestionDAO {
	String driverClassName = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/mnb";
	String user = "wspuser"; // ここはユーザ名
	String password = "hogehoge"; // ここはパスワード
	Connection connection;

	PreparedStatement prepStmt_S; // SELECT用
    PreparedStatement prepStmt_I; // INSERT用

    String strPrepSQL_S = "SELECT * FROM smallQuestion WHERE id = ? ORDER BY row ASC";
    String strPrepSQL_I = "INSERT INTO smallQuestion VALUES(?, ?, ?, ?)";

    ResultSet resultSet;

    public ArrayList<SmallQuestionBean> getDatabase(SmallQuestionBean bean){
    	ArrayList<SmallQuestionBean> beans = new ArrayList<SmallQuestionBean>();
    	try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			prepStmt_S = connection.prepareStatement(strPrepSQL_S);

			prepStmt_S.setString(1, bean.getId());

			resultSet = prepStmt_S.executeQuery();

			if(resultSet != null){
				while(resultSet.next()){
					SmallQuestionBean subBean = new SmallQuestionBean();
					subBean.setId(resultSet.getString("id"));
					subBean.setTitle(resultSet.getString("title"));
					subBean.setQuestionType(resultSet.getString("questionType"));
					subBean.setRow(resultSet.getInt("row"));
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

    public void insertDatabase(SmallQuestionBean bean){
    	try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_I = connection.prepareStatement(strPrepSQL_I);
		    prepStmt_I.setString(1, bean.getId());
		    prepStmt_I.setString(2, bean.getTitle());
		    prepStmt_I.setString(3, bean.getQuestionType());
		    prepStmt_I.setInt(4, bean.getRow());

		    prepStmt_I.executeUpdate();

		    connection.close();
    	} catch (Exception e) {
		    e.printStackTrace();
		}
    }
}
