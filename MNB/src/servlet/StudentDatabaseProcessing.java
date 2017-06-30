package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StudentDAO;
import model.StudentBean;

/**
 * Servlet implementation class StudentDatabaseProcessing
 */
@WebServlet("/StudentDatabaseProcessing")
public class StudentDatabaseProcessing extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentDatabaseProcessing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		StudentBean bean = (StudentBean)session.getAttribute("bean");
		StudentDAO dao;

		//追加、更新、削除のどれなのかを判断し、それぞれを実行
				switch((String)session.getAttribute("type")){
				case "add":
					setParameter(bean, request);
					dao = new StudentDAO();
					dao.insertDatabase(bean);
					break;

				case "update":
					setParameter(bean, request);
					dao = new StudentDAO();
					dao.updateDatabase(bean);
					break;

				case "delete":
					dao = new StudentDAO();
					dao.deleteDatabase(bean);
					break;

				default:
					break;
				}

		//sessionスコープをまっさらにする
		session.invalidate();

		//endへ飛ぶ
		RequestDispatcher dispatcher = request.getRequestDispatcher("/end.jsp");
		dispatcher.forward(request, response);
	}
	private void setParameter(StudentBean bean, HttpServletRequest request){
		bean.setHandle((String)request.getParameter("handle"));
		bean.setName((String)request.getParameter("name"));
		bean.setId((String)request.getParameter("id"));
		bean.setPass((String)request.getParameter("pass"));
		bean.setEmail((String)request.getParameter("email"));
		bean.setHan((String)request.getParameter("han"));
	}
}
