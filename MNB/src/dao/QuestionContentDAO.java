package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.QuestionContentBean;

public class QuestionContentDAO {
	String driverClassName = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/mnb";
	String user = "wspuser"; // ここはユーザ名
	String password = "hogehoge"; // ここはパスワード
	Connection connection;

	PreparedStatement prepStmt_S; // SELECT用
    PreparedStatement prepStmt_I; // INSERT用

    String strPrepSQL_S = "SELECT * FROM questionContent WHERE id = ? ORDER BY row, choicesNumber ASC";
    String strPrepSQL_I = "INSERT INTO questionContent VALUES(?, ?, ?, ?)";

    ResultSet resultSet;

    public ArrayList<QuestionContentBean> getDatabase(QuestionContentBean bean){
    	ArrayList<QuestionContentBean> beans = new ArrayList<QuestionContentBean>();
    	try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			prepStmt_S = connection.prepareStatement(strPrepSQL_S);

			prepStmt_S.setString(1, bean.getId());

			resultSet = prepStmt_S.executeQuery();

			if(resultSet != null){
				while(resultSet.next()){
					QuestionContentBean subBean = new QuestionContentBean();
					subBean.setId(resultSet.getString("id"));
					subBean.setChoicesNumber(resultSet.getInt("choicesNumber"));
					subBean.setRow(resultSet.getInt("row"));
					subBean.setContent(resultSet.getString("content"));
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

    public void insertDatabase(QuestionContentBean bean){
    	try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_I = connection.prepareStatement(strPrepSQL_I);
		    prepStmt_I.setString(1, bean.getId());
		    prepStmt_I.setInt(2, bean.getRow());
		    prepStmt_I.setInt(3, bean.getChoicesNumber());
		    prepStmt_I.setString(4, bean.getContent());

		    prepStmt_I.executeUpdate();

		    connection.close();
    	} catch (Exception e) {
		    e.printStackTrace();
		}
    }
}
