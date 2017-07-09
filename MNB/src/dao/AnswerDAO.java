package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.AnswerBean;

public class AnswerDAO {
	String driverClassName = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/mnb";
	String user = "wspuser"; // ここはユーザ名
	String password = "hogehoge"; // ここはパスワード
	Connection connection;

	PreparedStatement prepStmt_S; // SELECT用
    PreparedStatement prepStmt_I; // INSERT用

    String strPrepSQL_S = "SELECT * FROM answer WHERE id = ? ORDER BY row, choicesNumber ASC";
    String strPrepSQL_I = "INSERT INTO answer VALUES(?, ?, ?, ?)";

    ResultSet resultSet;

    public AnswerBean getDatabase(AnswerBean bean){
    	try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			prepStmt_S = connection.prepareStatement(strPrepSQL_S);

			prepStmt_S.setString(1, bean.getQuestionID());

			resultSet = prepStmt_S.executeQuery();

			if(resultSet != null){
				while(resultSet.next()){
					bean.setQuestionID(resultSet.getString("questionID"));
					bean.setRespondentID(resultSet.getString("respondentID"));
					bean.setTypeIsFree(resultSet.getBoolean("typeIsFree"));
					bean.setAnswer(resultSet.getString("answer"));
				}
			}

			resultSet.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

    	return bean;
    }

    public void insertDatabase(AnswerBean bean){
    	try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_I = connection.prepareStatement(strPrepSQL_I);
		    prepStmt_I.setString(1, bean.getQuestionID());
		    prepStmt_I.setString(2, bean.getRespondentID());
		    prepStmt_I.setBoolean(3, bean.getTypeIsFree());
		    prepStmt_I.setString(4, bean.getAnswer());

		    prepStmt_I.executeUpdate();

		    connection.close();
    	} catch (Exception e) {
		    e.printStackTrace();
		}
    }
}
