package model;

public class AnswerBean {
	private String questionID;
	private String respondentID;	//回答者のID
	private int questionRow;
	private int answerNumber;	//チェックボックスやラジオボタンでの回答を上から番号にしたもの
	private String freeAnswer;

	public String getQuestionID() {
		return questionID;
	}
	public void setQuestionID(String questionID) {
		this.questionID = questionID;
	}
	public String getRespondentID() {
		return respondentID;
	}
	public void setRespondentID(String respondentID) {
		this.respondentID = respondentID;
	}
	public int getSmallQuestionRow() {
		return questionRow;
	}
	public void setSmallQuestionRow(int smallQuestionRow) {
		this.questionRow = smallQuestionRow;
	}
	public int getAnswerNumber() {
		return answerNumber;
	}
	public void setAnswerNumber(int answerNumber) {
		this.answerNumber = answerNumber;
	}
	public String getFreeAnswer() {
		return freeAnswer;
	}
	public void setFreeAnswer(String freeAnswer) {
		this.freeAnswer = freeAnswer;
	}
}
