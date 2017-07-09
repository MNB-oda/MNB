package model;

//誰がどういう回答したのかは必要でないので、複数選択の場合は複数のデータを作る
public class AnswerBean {
	private String questionID;
	private String respondentID;
	private Boolean typeIsFree;
	private String answer;

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
	public Boolean getTypeIsFree() {
		return typeIsFree;
	}
	public void setTypeIsFree(Boolean typeIsFree) {
		this.typeIsFree = typeIsFree;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
