package calendar;

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
 * Servlet implementation class DatabaseProcessing
 */
@WebServlet("/DatabaseProcessing")
public class DatabaseProcessing extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatabaseProcessing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    /*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		ScheduleBean bean = (ScheduleBean)session.getAttribute("bean");
		ScheduleDAO dao;

		switch((String)session.getAttribute("type")){
		case "add":
			setParameter(bean, request);
			dao = new ScheduleDAO(bean);
			dao.insertDatabase();
			break;

		case "update":
			setParameter(bean, request);
			dao = new ScheduleDAO(bean);
			dao.updateDatabase();
			break;

		case "delete":
			dao = new ScheduleDAO(bean);
			dao.deleteDatabase();
			break;

		default:
			break;
		}

		session.invalidate();

		RequestDispatcher dispatcher = request.getRequestDispatcher("/end.jsp");
		dispatcher.forward(request, response);
	}

	private void setParameter(ScheduleBean bean, HttpServletRequest request){
		bean.setHan((String)request.getParameter("HAN"));
		bean.setNumber(Integer.valueOf(request.getParameter("NUMBER")));
		bean.setTitle((String)request.getParameter("TITLE"));
		bean.setPlace((String)request.getParameter("PLACE"));
		bean.setBelongings((String)request.getParameter("BELONGINGS"));
		bean.setSubjects((String)request.getParameter("SUBJECTS"));
		bean.setContact((String)request.getParameter("CONTACT"));
		bean.setContent((String)request.getParameter("CONTENT"));
	}
}
