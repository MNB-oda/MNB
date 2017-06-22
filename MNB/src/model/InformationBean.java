package model;

public class InformationBean {
	private String id;
	private String title;
	private String content;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	// 何曜日なのか
	public String getDayOfTheWeek(int value) {
		switch (value) {
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
