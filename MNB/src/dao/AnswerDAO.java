package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.AnswerBean;
import model.AnswerContainer;

public class AnswerDAO {
	String driverClassName = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/mnb";
	String user = "wspuser"; // ここはユーザ名
	String password = "hogehoge"; // ここはパスワード
	Connection connection;

	PreparedStatement prepStmt_CR; // 回答者人数を数える用
	PreparedStatement prepStmt_CA; // それぞれの回答の数を数える用
	PreparedStatement prepStmt_CHECK; // それぞれの回答の数を数える用
	PreparedStatement prepStmt_CF; // 自由記入の回答内容を取り出す用
    PreparedStatement prepStmt_I; // INSERT用

    String strPrepSQL_CR = "SELECT COUNT(DISTINCT respondentID) AS amount FROM answer WHERE questionID = ?";
    String strPrepSQL_CA = "SELECT smallQuestionRow, answerNumber, COUNT(*) AS amount FROM answer "
    						+ "WHERE questionID = ? GROUP BY smallQuestionRow, answernumber "
    						+ "ORDER BY smallQuestionRow,answerNumber;";
    String strPrepSQL_CHECK = "SELECT * FROM answer WHERE respondentID = ?";
    String strPrepSQL_CF = "SELECT smallQuestionRow,freeAnswer FROM answer WHERE questionID = ? AND answerNumber = ?";
    String strPrepSQL_I = "INSERT INTO answer VALUES(?, ?, ?, ?, ?)";

    ResultSet resultSet;

    public boolean checkAlreadyAnswered(String respondentID){
    	boolean result = false;
    	try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			prepStmt_CHECK = connection.prepareStatement(strPrepSQL_CHECK);

			prepStmt_CHECK.setString(1, respondentID);

			resultSet = prepStmt_CHECK.executeQuery();

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

    public int countRespndent(AnswerBean bean){
    	int amount = 0;
    	try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			prepStmt_CR = connection.prepareStatement(strPrepSQL_CR);

			prepStmt_CR.setString(1, bean.getQuestionID());

			resultSet = prepStmt_CR.executeQuery();

			if(resultSet != null){
				while(resultSet.next()){
					amount = resultSet.getInt("amount");
				}
			}

			resultSet.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

    	return amount;
    }

    public ArrayList<AnswerContainer> countAnswer(AnswerBean bean, ArrayList<AnswerContainer> answersAmount){
    	try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			prepStmt_CA = connection.prepareStatement(strPrepSQL_CA);

			prepStmt_CA.setString(1, bean.getQuestionID());

			resultSet = prepStmt_CA.executeQuery();

			if(resultSet != null){
				while(resultSet.next()){

					for(int i=0; i<answersAmount.size(); i++){
						//もし列と回答番号の一致するデータがあれば、そのデータを格納
						if(answersAmount.get(i).getQuestionLine() == resultSet.getInt("smallQuestionRow")
								&& answersAmount.get(i).getAnswerNumber() == resultSet.getInt("answerNumber")){

							answersAmount.get(i).setAnswersAmount(resultSet.getInt("amount"));
						}
					}

				}
			}

			resultSet.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

    	return answersAmount;
    }

    public ArrayList<ArrayList<String>> getFreeAnswers(AnswerBean bean){
    	ArrayList<ArrayList<String>> linesFreeAnswers = new ArrayList<ArrayList<String>>();
    	try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			prepStmt_CF = connection.prepareStatement(strPrepSQL_CF);

			prepStmt_CF.setString(1, bean.getQuestionID());
			prepStmt_CF.setInt(2, bean.getAnswerNumber());

			resultSet = prepStmt_CF.executeQuery();

			int linePointer = 0;
			ArrayList<String> freeAnswers = new ArrayList<String>();
			if(resultSet != null){
				while(resultSet.next()){
					if(linePointer == 0){
						linePointer = resultSet.getInt("smallQuestionRow");
					}
					//回答の行が変化したら格納する配列番号を変える
					if(linePointer != resultSet.getInt("smallQuestionRow")){
						linesFreeAnswers.add(freeAnswers);
						freeAnswers = new ArrayList<String>();
					}
					freeAnswers.add(resultSet.getString("freeAnswer"));
				}
				//resultSet.next()との関係上、最後の行の回答配列を入れる瞬間が無いため
				linesFreeAnswers.add(freeAnswers);
			}

			resultSet.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

    	return linesFreeAnswers;
    }

    public void insertDatabase(AnswerBean bean){
    	try {
		    Class.forName(driverClassName);
		    connection = DriverManager.getConnection(url, user, password);

		    prepStmt_I = connection.prepareStatement(strPrepSQL_I);
		    prepStmt_I.setString(1, bean.getQuestionID());
		    prepStmt_I.setString(2, bean.getRespondentID());
		    prepStmt_I.setInt(3, bean.getSmallQuestionRow());
		    prepStmt_I.setInt(4, bean.getAnswerNumber());
		    prepStmt_I.setString(5, bean.getFreeAnswer());

		    prepStmt_I.executeUpdate();

		    connection.close();
    	} catch (Exception e) {
		    e.printStackTrace();
		}
    }
}
