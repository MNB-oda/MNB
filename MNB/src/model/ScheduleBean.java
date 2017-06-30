package model;

public class ScheduleBean {
	private String id;
	private String han;
	private int number;
	private String title;
	private int year;
	private int month;
	private int day;
	private String place;
	private String belongings;
	private String subjects;
	private String contact;
	private String content;

	private String dayOfTheWeek;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHan() {
		return han;
	}

	public void setHan(String han) {
		this.han = han;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
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

	// 何曜日なのか
	public void setDayOfTheWeek(int value) {
		switch (value) {
		case 0:
			dayOfTheWeek = "日";
			break;
		case 1:
			dayOfTheWeek = "月";
			break;
		case 2:
			dayOfTheWeek = "火";
			break;
		case 3:
			dayOfTheWeek = "水";
			break;
		case 4:
			dayOfTheWeek = "木";
			break;
		case 5:
			dayOfTheWeek = "金";
			break;
		case 6:
			dayOfTheWeek = "土";
			break;
		default:
			dayOfTheWeek = null;
			break;
		}
	}

	public String getDayOfTheWeek(){
		return dayOfTheWeek;
	}
}
