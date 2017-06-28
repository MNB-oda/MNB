package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ScheduleDAO;
import model.ScheduleBean;

/**
 * Servlet implementation class AccsessContents
 */

/*
 役割
 homeから年月日のデータをもらって、そのデータの講習情報を取ってくる
 それをscheduleContentに受け渡す
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

		//beanに年月日と曜日とIDを登録
		schedule.setYear(Integer.valueOf(request.getParameter("YEAR")));
		schedule.setMonth(Integer.valueOf(request.getParameter("MONTH")));
		schedule.setDay(Integer.valueOf(request.getParameter("DAY")));
		schedule.setDayOfTheWeek(Integer.valueOf(request.getParameter("DAYOFTHEWEEK")));
		schedule.setId(String.valueOf(schedule.getYear() + "" + schedule.getMonth() + "" + schedule.getDay()));

		ScheduleDAO dao = new ScheduleDAO();

		//requestにデータを格納
		request.setAttribute("year", schedule.getYear());
		request.setAttribute("month", schedule.getMonth());
		request.setAttribute("day", schedule.getDay());
		request.setAttribute("dayOfTheWeek", schedule.getDayOfTheWeek());


		//指定日時のデータがデータベース上に存在するかを確認
		if(dao.checkExist(schedule)){
			schedule = dao.getDatabase(schedule);
			request.setAttribute("exist", true);
		}else{
			request.setAttribute("exist", false);
		}

		//しばらく参照するので、sessionスコープにscheduleBeanを格納
		HttpSession session = request.getSession();
		if(session.getAttribute("bean") != null){
			session.removeAttribute("bean");
		}
		session.setAttribute("bean", schedule);

		//scheduleContentへ飛ぶ
		RequestDispatcher dispatcher = request.getRequestDispatcher("/schduleContent.jsp");
		dispatcher.forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
