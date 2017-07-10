package model;

public class AnswerContainer {
	private int questionLine;
	private int answerNumber;
	private int answersAmount;

	public AnswerContainer(int questionLine, int answerNumber, int answersAmount){
		this.questionLine = questionLine;
		this.answerNumber = answerNumber;
		this.answersAmount = answersAmount;
	}

	public int getQuestionLine() {
		return questionLine;
	}
	public void setQuestionLine(int questionLine) {
		this.questionLine = questionLine;
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
