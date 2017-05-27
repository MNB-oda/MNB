package calendar;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalendarServlet
 */
@WebServlet("/CalendarServlet")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CalendarServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * 
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//今月のカレンダーの情報を取得
		Calendar calendar = Calendar.getInstance();
		int year;
		int month;


		//翌月か先月のリンクを踏んでいたら、年と月を貰った値に更新
		String param = request.getParameter("YEAR");
		if(param == null || param.length() == 0){
			year = calendar.get(Calendar.YEAR);
		}else{
			try{
				year = Integer.parseInt(param);
			}catch(NumberFormatException e){
				year = calendar.get(Calendar.YEAR);
			}
		}
		param = request.getParameter("MONTH");
		if(param == null || param.length() == 0){
			month = calendar.get(Calendar.MONTH);
		}else{
			try{
				month = Integer.parseInt(param);
			}catch(NumberFormatException e){
				month = calendar.get(Calendar.MONTH);
			}
		}


		//カレンダー情報を更新
		calendar.set(year, month, 1);

		//先月の最終日が何曜日だったか
		int startWeek = calendar.get(Calendar.DAY_OF_WEEK);

		//カレンダー表示処理内で、今追加しようと見ている日付
		//2から引いているのは、DAY_OF_WEEKの値との帳尻合わせ
		int lookingDay = 2 - startWeek;

		//今月の最終日の日付
		calendar.set(year, month + 1, 0);
		int thisMonthlastDay = calendar.get(Calendar.DATE);


		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0.1//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">");

		out.println("<html lang=\"ja\">");
		out.println("<head>");
		out.println("<meta http-equiv=\"Content-Type\" Content=\"text/html;charset=Shift_JIS\">");

		out.println("<title>スケジュール管理</title>");

		out.println("<style>");
		out.println("table {"
					+ "border:1px solid #ffffff; "
					+ "width:90%; "
					+ "padding:0px; "
					+ "margin:0px;"
					+ " border-collapse:collapse;"
					+ "}");

		out.println("td {"
					+ "width:12%; "
					+ "border-top:1px solid #ffffff;"
					+ "border-left:1px solid #ffffff;"
					+ "vertical-align:top;"
					+ "margin:0px;"
					+ "padding:2px;"
					+ "}");

		out.println("td.week {"
					+ "color:#ffffff;"
					+ "background-color:#55aaff;"
					+ "text-align:center;"
					+ "}");

		out.println("td.sunday {"
					+ "color:#ff0000;"
					+ "background-color:#55aaff;"
					+ "text-align:center;"
					+ "}");

		out.println("td.day {"
					+ "background-color:#95c9ff;"
					+ "text-align:left;"
					+ "font-size:0.75em;"
					+ "}");

		out.println("td.holiday {"
					+ "background-color:#95c9ff;"
					+ "text-align:left;"
					+ "font-size:0.75em;"
					+ "}");

		out.println("td.sche {"
					+ "background-color:#95c9ff;"
					+ "text-align:left;"
					+ "height:80px;"
					+ "}");

		out.println("p {"
					+ "font-size:0.75em;"
					+ "}");

		out.println("</style>");

		out.println("</head>");
		out.println("<body>");

		out.println("<p>ソフトウェア研究部</p>");

		//翌月、先月のリンクの描画
		out.println(monthLink(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)));

		//カレンダーの描画
		out.println("<table>");
		out.println(makeNowCalendar(lookingDay, thisMonthlastDay));
		out.println("</table>");

		out.println("</body>");
		out.println("</html>");
	}

	//カレンダーの作成
	protected String makeNowCalendar(int lookingDay, int thisMonthlastDay){
		StringBuffer sb = new StringBuffer();

		//曜日の出力
		sb.append(
				"<tr>"
				+ "<td class=\"sunday\">SUN</td>"
				+ "<td class=\"week\">MON</td>"
				+ "<td class=\"week\">TUE</td>"
				+ "<td class=\"week\">WED</td>"
				+ "<td class=\"week\">THU</td>"
				+ "<td class=\"week\">FRI</td>"
				+ "<td class=\"week\">SAT</td>"
				+ "</tr>"
				);

		//日付とスケジュール欄の描画
		while(lookingDay < thisMonthlastDay){
			StringBuffer storage = new StringBuffer();		//for文で追加したものを一度に出力するために一旦保存
			storage.append("<tr>");

			//日付の描画
			//先月の日付(lookingの値が0未満) と来月の日付(lookingの値が最終日より大きい) の場合には日付を表示せず、
			//今月の分には日付を表示する
			for(int i=0; i<7; i++){
				if(lookingDay < 1 || lookingDay > thisMonthlastDay){
					storage.append("<td class=\"day\"></td>");
					lookingDay++;
				}else{
					storage.append("<td class=\"day\">" + lookingDay +"</td>");
					lookingDay++;
				}
			}
			storage.append("</tr>");
			sb.append(storage);

			//スケジュール内容欄の描画
			sb.append("<tr>");
			for (int i = 0; i < 7; i++) {
				sb.append("<td class=\"sche\"></td>");
			}
			sb.append("</tr>");	
		}

		return new String(sb);
	}


	/*
	//スケジュールの内容欄の出力
	protected String makeScheduleContents() {
		StringBuffer sb = new StringBuffer();
		sb.append("<tr>");
		//一週間分の内容欄をfor文で表示
		for (int i = 0; i < 7; i++) {
			sb.append("<td class=\"sche\"></td>");
		}
		sb.append("</tr>");
		return new String(sb);
	}
	*/


	//翌月、先月へのリンクの作成
	protected String monthLink(int year, int month){
		StringBuffer sb = new StringBuffer();

		sb.append("<p>");

		sb.append("<a href = \"/MNB/CalendarServlet?YEAR=");
		sb.append(year);
		sb.append("&MONTH=");
		sb.append(month - 1);
		sb.append("\"><span class=\"small\">前月</span></a>&nbsp;&nbsp;");

        sb.append(month + 1);
		sb.append("月&nbsp;&nbsp;");

        sb.append("<a href = \"/MNB/CalendarServlet?YEAR=");
        sb.append(year);
        sb.append("&MONTH=");
        sb.append(month + 1);
        sb.append("\"><span class=\"small\">翌月</span></a>");

        sb.append("</p>");

        return new String(sb);
	}
}
