package model;

import java.util.ArrayList;

public class BigQuestionBean {
	private String title;
	private String type;
	private ArrayList<SmallQuestionBean> bean;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public ArrayList<SmallQuestionBean> getBean() {
		return bean;
	}
	public void setBean(ArrayList<SmallQuestionBean> bean) {
		this.bean = bean;
	}
}
