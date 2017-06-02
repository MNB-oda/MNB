package calendar;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ScheduleBean;

/**
 * Servlet implementation class AccsessContents
 */
@WebServlet("/AccsessContents")
public class AccsessContents extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccsessContents() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		ScheduleBean schedule = new ScheduleBean();

		schedule.setYear(Integer.valueOf(request.getParameter("YEAR")));
		schedule.setMonth(Integer.valueOf(request.getParameter("MONTH")));
		schedule.setDay(Integer.valueOf(request.getParameter("DAY")));

		request.setAttribute("year", schedule.getYear());
		request.setAttribute("month", schedule.getMonth());
		request.setAttribute("day", schedule.getDay());
		request.setAttribute("dayOfTheWeek", schedule.getDayOfTheWeek(Integer.valueOf(request.getParameter("DAYOFTHEWEEK"))));

		RequestDispatcher dispatcher = request.getRequestDispatcher("/schduleContent.jsp");
		dispatcher.forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	*/

}
