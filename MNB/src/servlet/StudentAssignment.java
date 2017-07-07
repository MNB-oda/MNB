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
		StudentBean studentBean = new StudentBean();
		StudentDAO studentdao = new StudentDAO();
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		//もし既にtypeがsessionに存在していたら、新しく設定するので削除
		if(session.getAttribute("type") != null){
			session.removeAttribute("type");
		}

		//sessionスコープに追加、更新、削除のどれをするのかを格納
		//それぞれによって遷移先jspを変更
		switch((String)request.getParameter("TYPE")){
		case "add":
			studentBean = studentdao.getDatabase(studentBean);
			session.setAttribute("studentBean", studentBean);
			nextJsp = "/mypageEdit.jsp";
			session.setAttribute("type", "add");
			break;

		case "update":
			studentBean.setId((String)request.getParameter("ID"));
			studentBean = studentdao.getDatabase(studentBean);

			session.setAttribute("handle", studentBean.getHandle());
			session.setAttribute("name", studentBean.getName());
			session.setAttribute("id", studentBean.getId());
			session.setAttribute("pass", studentBean.getPass());
			session.setAttribute("email", studentBean.getEmail());
			session.setAttribute("studentBean", studentBean);
			nextJsp = "/mypageEdit.jsp";
			session.setAttribute("type", "update");
			break;

		case "delete":
			studentBean.setId((String)request.getParameter("ID"));
			studentBean = studentdao.getDatabase(studentBean);
			session.setAttribute("studentBean", studentBean);
			nextJsp = "/studentDeleteCheck.jsp";
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
