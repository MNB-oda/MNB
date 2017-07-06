package model;

public class QuestionContentBean {
	private String id;
	private int row;
	private int choicesNumber;
	private String content;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getChoicesNumber() {
		return choicesNumber;
	}
	public void setChoicesNumber(int choicesNumber) {
		this.choicesNumber = choicesNumber;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

}
