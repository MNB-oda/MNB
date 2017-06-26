package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.StudentBean;

/**
 * Servlet implementation class StudentAssignment
 */
@WebServlet("/StudentAssignment")
public class StudentAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nextJsp = "";
		StudentBean bean;
		HttpSession session  = request.getSession();

		if(session.getAttribute("type") != null){
			session.removeAttribute("type");
		}

		switch((String)request.getParameter("TYPE")){
		case "add":
			nextJsp = "/mypageEdit.jsp";
			session.setAttribute("type", "add");
			break;

		case "update":
			nextJsp = "/mypageEdit.jsp";
			session.setAttribute("type", "update");
			break;
/*
		case "delete":
			nextJsp = "/deleteCheck.jsp";
			session.setAttribute("type", "delete");
			break;
*/
		default:
			break;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(nextJsp);
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
