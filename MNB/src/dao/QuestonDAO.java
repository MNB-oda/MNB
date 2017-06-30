package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.SmallQuestionBean;

public class QuestonDAO {
	String driverClassName = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/mnb";
	String user = "wspuser"; // ここはユーザ名
	String password = "hogehoge"; // ここはパスワード
	Connection connection;

	PreparedStatement prepStmt_S; // SELECT用
    PreparedStatement prepStmt_I; // INSERT用
    PreparedStatement prepStmt_U; // UPDATE用
    PreparedStatement prepStmt_D; // DELETE用

    String strPrepSQL_S = "";
    String strPrepSQL_I = "";
    String strPrepSQL_U = "";
    String strPrepSQL_D = "";

    ResultSet resultSet;

    public SmallQuestionBean getDatabase(SmallQuestionBean bean){
    	return bean;
    }
    public void insertDatabase(SmallQuestionBean bean){

    }
}
