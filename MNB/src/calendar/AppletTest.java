package calendar;

import java.applet.Applet;
import java.awt.Color;
import java.awt.Graphics;
import java.util.Calendar;
import java.util.Locale;

public class AppletTest extends Applet{
private static final long serialVersionUID = 1L;

	private Calendar now;
	private int first;
	private int last;

	public void init(){
	   // 現在の日付を取得し、1日の曜日と末日を求めます。
		now = Calendar.getInstance();
		now.set(now.get(Calendar.YEAR), now.get(Calendar.MONTH), 1);
		Calendar next = (Calendar) now.clone();
		next.setLenient(true);
		first = now.get(Calendar.DAY_OF_WEEK) - 1;	// SUNDAY : 1、MONDAY : 2、・・・
		now.set(now.get(Calendar.YEAR), now.get(Calendar.MONTH), 1);
		next.set(now.get(Calendar.YEAR), now.get(Calendar.MONTH), 0);
		last = next.get(Calendar.DATE);
	}

	public void paint(Graphics g){
		setBackground(Color.white);
		g.drawString(String.format( Locale.US,"%1$tY %1$tB", now), 20, 20);
		// カレンダーを出力します。
		for( int seq = first, curDay = 1; curDay <= last; seq++, curDay++ ){
			g.drawString(String.format("%1$2d", curDay), 20 + ( seq % 7 ) * 20, 50 + ( seq / 7 ) * 20);
		}
	}
}
