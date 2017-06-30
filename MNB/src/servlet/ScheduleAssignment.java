package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ScheduleBean;

/**
 * Servlet implementation class ScheduleAssignment
 */
@WebServlet("/ScheduleAssignment")
public class ScheduleAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ScheduleBean bean;
		HttpSession session  = request.getSession();

		//次のjspのURLのための変数
		String nextJsp = "";

		//もし既にtypeがsessionに存在していたら、新しく設定するので削除
		if(session.getAttribute("type") != null){
			session.removeAttribute("type");
		}

		//sessionスコープに追加、更新、削除のどれをするのかを格納
		//それぞれによって遷移先jspを変更
		switch((String)request.getParameter("TYPE")){
		case "add":
			nextJsp = "/addSchedule.jsp";
			session.setAttribute("type", "add");
			break;

		case "update":
			nextJsp = "/addSchedule.jsp";
			session.setAttribute("type", "update");
			break;

		case "delete":
			nextJsp = "/deleteCheck.jsp";
			session.setAttribute("type", "delete");
			break;

		default:
			break;
		}

		//それぞれのjspへ飛ぶ
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextJsp);
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
