package servlet;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScheduleDAO;
import model.CalendarBean;
import model.ScheduleBean;

/**
 * Servlet implementation class MakeCalender
 */
@WebServlet("/MakeCalender")
public class MakeCalender extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MakeCalender() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		CalendarBean calendarBean = new CalendarBean();
		Calendar calendar = Calendar.getInstance();

		//最初の起動や、渡された値に問題があった時のための処理
		if (request.getParameter("YEAR") == null || request.getParameter("YEAR").length() == 0) {
			// 何もしない
		} else {
			try {
				calendar.set(Calendar.YEAR, Integer.valueOf(request.getParameter("YEAR")));
			} catch (NumberFormatException e) {
				// 何もしない
			}
		}
		if (request.getParameter("MONTH") == null || request.getParameter("MONTH").length() == 0) {
			// 何もしない
		} else {
			try {
				calendar.set(Calendar.MONTH, Integer.valueOf(request.getParameter("MONTH"))-1);
			} catch (NumberFormatException e) {
				// 何もしない
			}
		}

		//カレンダーに一日目をセット
		calendar.set(Calendar.DATE, 1);

		//beanのインスタンス生成
		calendarBean.setCalendar(calendar);

		//ここ
		ScheduleBean[] beans = new ScheduleBean[50];
		/*
		ScheduleBean bean = new ScheduleBean();
		bean.setYear(calendarBean.getCalendarYear());
		bean.setMonth(calendarBean.getCalendarMonth() + 1);
		*/
		ScheduleDAO dao = new ScheduleDAO();
		for(int i=0; i<beans.length; i++){
			//bean.setDay(i);
			if(dao.checkExistEXTRA(calendarBean.getCalendarYear(), calendarBean.getCalendarMonth() + 1, i)){
				beans[i] = dao.getDatabaseEXTRA(calendarBean.getCalendarYear(), calendarBean.getCalendarMonth() + 1, i);
				System.out.println(beans[i].getTitle());
				System.out.println(beans[i].getMonth());
				System.out.println(beans[i].getDay());
				System.out.println(i);
			}
		}
		System.out.println(beans[13].getTitle());
		System.out.println(beans[13].getMonth());
		System.out.println(beans[13].getDay());
		System.out.println(beans[14].getTitle());
		System.out.println(beans[14].getMonth());
		System.out.println(beans[14].getDay());


		//requestにデータ格納
		request.setAttribute("year", calendarBean.getCalendarYear());
		request.setAttribute("month", calendarBean.getCalendarMonth() + 1);
		request.setAttribute("pointedDay", calendarBean.getPointedDay());
		request.setAttribute("thisMonthLastDay", calendarBean.getThisMonthLastDay());
		request.setAttribute("beans", beans);

		//home.jspへ飛ぶ
		RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub doGet(request, response);
		doGet(request, response);
	}
}
