package model;

public class ScheduleBean {
	private String han;
	private int Number;
	private String title;
	private int year;
	private int month;
	private int day;
	private String place;
	private String belongings;
	private String subjects;
	private String contact;
	private String content;

	public String getHan() {
		return han;
	}
	public void setHan(String han) {
		this.han = han;
	}

	public int getNumber() {
		return Number;
	}
	public void setNumber(int number) {
		Number = number;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}

	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}

	public String getBelongings() {
		return belongings;
	}
	public void setBelongings(String belongings) {
		this.belongings = belongings;
	}

	public String getSubjects() {
		return subjects;
	}
	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}

	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	//何曜日なのか
	public String getDayOfTheWeek(int value){
		switch(value){
			case 0:
				return "日";
			case 1:
				return "月";
			case 2:
				return "火";
			case 3:
				return "水";
			case 4:
				return "木";
			case 5:
				return "金";
			case 6:
				return "土";
			default:
				return null;
		}
	}

}
