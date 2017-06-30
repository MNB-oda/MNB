package model;

import java.util.ArrayList;

public class SmallQuestionBean {
	private String title;
	private String questionType;
	private int numberOfItems;
	private ArrayList<String> questions;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public int getNumberOfItems() {
		return numberOfItems;
	}
	public void setNumberOfItems(int numberOfItems) {
		this.numberOfItems = numberOfItems;
	}
	public ArrayList<String> getQuestions() {
		return questions;
	}
	public void setQuestions(ArrayList<String> questions) {
		this.questions = questions;
	}
}
