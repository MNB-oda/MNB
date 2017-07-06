package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InformationDAO;
import model.InformationBean;

/**
 * Servlet implementation class InformationController
 */
@WebServlet("/InformationAssignment")
public class InformationAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InformationAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		//次のjspのURLのための変数
		String nextJsp = "";
		InformationBean bean = new InformationBean();
		InformationDAO dao = new InformationDAO();
		request.setCharacterEncoding("UTF-8");


		//typeによって次のjspを判断
		switch((String)request.getParameter("TYPE")){
		case "display":
			nextJsp = "/InformationContent.jsp";
			bean.setId((String)request.getParameter("TYPE"));
			bean = dao.getDatabase(bean);
			request.setAttribute("list", bean);
			break;
		case "add":
			nextJsp = "";
			break;
		case "update":
			nextJsp = "";
			break;
		case "delete":
			nextJsp = "";
			break;
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
