package model;

import java.io.Serializable;
import java.util.Calendar;

public class CalendarBean implements Serializable{
	Calendar calendar;

	public Calendar getCalendar(){
		return calendar;
	}
	public void setCalendar(Calendar calendar){
		this.calendar = calendar;
	}

	public int getCalendarYear(){
		return calendar.get(Calendar.YEAR);
	}
	public int getCalendarMonth(){
		return calendar.get(Calendar.MONTH);
	}

	public void setCalendarYear(int year){
		calendar.set(Calendar.YEAR, year);
	}
	public void setCalendarMonth(int month){
		calendar.set(Calendar.MONTH, month);
	}

	// カレンダー表示処理内で、今追加しようと見ている日付
	// 2から引いているのは、DAY_OF_WEEKの値との帳尻合わせ
	public int getPointedDay(){
		return 2 - calendar.get(Calendar.DAY_OF_WEEK);
	}

	// 今月の最終日の日付
	public int getThisMonthLastDay(){
		return calendar.getActualMaximum(Calendar.DATE);
	}
}
