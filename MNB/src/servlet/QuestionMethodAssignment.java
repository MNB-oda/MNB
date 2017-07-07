package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BigQuestionDAO;
import dao.QuestionContentDAO;
import dao.SmallQuestionDAO;
import model.BigQuestionBean;
import model.QuestionContentBean;
import model.SmallQuestionBean;

/**
 * Servlet implementation class QuestionMethodAssignment
 */
@WebServlet("/QuestionMethodAssignment")
public class QuestionMethodAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionMethodAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		BigQuestionDAO bigDAO = new BigQuestionDAO();
		SmallQuestionDAO smallDAO = new SmallQuestionDAO();
		QuestionContentDAO contentDAO  = new QuestionContentDAO();

		BigQuestionBean bigBean = new BigQuestionBean();

		//Questionそれぞれの要素に共通するID
		String id = request.getParameter("ID");

		//次のjspのURLのための変数
		String nextJsp = "";

		//typeによって次のjspを判断及びデータの処理
		switch((String)request.getParameter("TYPE")){

		case "add":
			//アンケートのタイプを投げる
			request.setAttribute("questionType", request.getParameter("QUESTIONTYPE"));
			nextJsp = "/addQuestion.jsp";
			break;

		case "answer":
			//指定のIDのデータを全てanswerQuestion.jspに投げる
			bigBean.setId(id);
			bigBean = bigDAO.getDatabaseById(bigBean);
			request.setAttribute("bigBean", bigBean);

			SmallQuestionBean smallBean = new SmallQuestionBean();
			smallBean.setId(id);
			ArrayList<SmallQuestionBean> smallBeans = (ArrayList<SmallQuestionBean>)smallDAO.getDatabase(smallBean);
			request.setAttribute("smallBeans", smallBeans);

			QuestionContentBean contentBean = new QuestionContentBean();
			contentBean.setId(id);
			ArrayList<QuestionContentBean> contentBeans = (ArrayList<QuestionContentBean>)contentDAO.getDatabase(contentBean);
			request.setAttribute("contentBeans", contentBeans);

			nextJsp = "/answerQuestion.jsp";
			break;

		case "aggregate":
			nextJsp = "/questionnaire_Aggregate.jsp";
			break;

		case "delete":
			bigBean.setId(id);
			bigBean = bigDAO.getDatabaseById(bigBean);
			bigBean.getTitle();
			HttpSession session = request.getSession();
			session.setAttribute("deleteBean", bigBean);

			nextJsp = "/questionDeleteCheck.jsp";
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
