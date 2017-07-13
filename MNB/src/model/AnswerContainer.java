package model;

public class AnswerContainer {
	private int questionRow;
	private int answerNumber;
	private int answersAmount;

	public AnswerContainer(int questionRow, int answerNumber, int answersAmount){
		this.questionRow = questionRow;
		this.answerNumber = answerNumber;
		this.answersAmount = answersAmount;
	}

	public int getQuestionLine() {
		return questionRow;
	}
	public void setQuestionLine(int questionRow) {
		this.questionRow = questionRow;
	}
	public int getAnswerNumber() {
		return answerNumber;
	}
	public void setAnswerNumber(int answerNumber) {
		this.answerNumber = answerNumber;
	}
	public int getAnswersAmount() {
		return answersAmount;
	}
	public void setAnswersAmount(int answersAmount) {
		this.answersAmount = answersAmount;
	}

}
