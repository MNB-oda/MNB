package calendar;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CalendarBean;

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

		//最初の起動や渡された値に問題があった時の処理
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

		calendar.set(Calendar.DATE, 1);

		calendarBean.setCalendar(calendar);

		request.setAttribute("year", calendarBean.getCalendarYear());
		request.setAttribute("month", calendarBean.getCalendarMonth() + 1);
		request.setAttribute("pointedDay", calendarBean.getPointedDay());
		request.setAttribute("thisMonthLastDay", calendarBean.getThisMonthLastDay());

		RequestDispatcher dispatcher = request.getRequestDispatcher("/mypage.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub doGet(request, response); }
	 */
}
