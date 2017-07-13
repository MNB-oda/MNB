package servlet;

import java.io.IOException;
import java.util.Arrays;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
		StudentDAO dao;

		// 追加、更新、削除のどれなのかを判断し、それぞれを実行
		switch ((String) session.getAttribute("type")) {
		case "add":
			setParameter(studentBean, request);
			dao = new StudentDAO();
			checkBoxCheck(studentBean, request);
			dao.insertDatabase(studentBean);
			break;

		case "update":
			setParameter(studentBean, request);
			dao = new StudentDAO();
			checkBoxCheck(studentBean, request);
			dao.updateDatabase(studentBean);
			break;

		case "delete":
			dao = new StudentDAO();
			dao.deleteDatabase(studentBean);
			break;

		default:
			break;
		}

		// sessionスコープをまっさらにする
		//session.invalidate();
		session.removeAttribute("type");

		// endへ飛ぶ
		RequestDispatcher dispatcher = request.getRequestDispatcher("/end.jsp");
		dispatcher.forward(request, response);
	}

	private void setParameter(StudentBean bean, HttpServletRequest request) {
		bean.setHandle((String) request.getParameter("handle"));
		bean.setName((String) request.getParameter("name"));
		bean.setId((String) request.getParameter("id"));
		bean.setPass((String) request.getParameter("pass"));
		bean.setEmail((String) request.getParameter("email"));
		bean.setIsProhan(Boolean.valueOf(request.getParameter("program")));
		bean.setIs2dcghan(Boolean.valueOf(request.getParameter("2dcg")));
		bean.setIs3dcghan(Boolean.valueOf(request.getParameter("3dcg")));
		bean.setIsMusichan(Boolean.valueOf(request.getParameter("music")));
	}
	private void checkBoxCheck(StudentBean bean, HttpServletRequest request){
		String han[] = request.getParameterValues("han");
		for (int i = 0; i < han.length; i++) {
			if(Arrays.asList(han).contains("プログラム班")){bean.setIsProhan(true);}
			if(Arrays.asList(han).contains("2DCG班")){bean.setIs2dcghan(true);}
			if(Arrays.asList(han).contains("3DCG班")){bean.setIs3dcghan(true);}
			if(Arrays.asList(han).contains("サウンド班")){bean.setIsMusichan(true);}
		}
	}
}
