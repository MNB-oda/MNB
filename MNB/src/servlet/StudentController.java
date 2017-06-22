package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StudentBean;
import model.StudentDAO;

/**
 * Servlet implementation class StudentController
 */
@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		StudentBean studentbean = new StudentBean();
		request.setCharacterEncoding("UTF-8");
		studentbean.setId(String.valueOf(request.getParameter("ID")));
		//studentbean.setId(request.getParameter("id"));
		studentbean.setName(String.valueOf(request.getParameter("NAME")));
		//studentbean.setName(request.getParameter("name"));
		StudentDAO studentdao = new StudentDAO();
		studentdao.getDatabase(studentbean);

		request.setAttribute("handle", studentbean.getHandle());
		request.setAttribute("name", studentbean.getName());
		request.setAttribute("id", studentbean.getId());
		request.setAttribute("pass", studentbean.getPass());
		request.setAttribute("email", studentbean.getEmail());
		request.setAttribute("group", studentbean.getGroup());

		RequestDispatcher dispatcher = request.getRequestDispatcher("/myPage.jsp");
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
