package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BigQuestionDAO;
import dao.QuestionContentDAO;
import dao.SmallQuestionDAO;
import model.BigQuestionBean;

/**
 * Servlet implementation class AccsessQuestions
 */
@WebServlet("/AccsessQuestions")
public class AccsessQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccsessQuestions() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//アンケートの種類を取得
		String type = null;
		switch((String)request.getParameter("TYPE")){
		case "kosyu":
			type = "講習アンケート";
			break;
		case "event":
			type = "イベントアンケート";
			break;
		}

		//表示するアンケートを取得及び格納
		BigQuestionDAO bigDAO = new BigQuestionDAO();
		SmallQuestionDAO smallDAO = new SmallQuestionDAO();
		QuestionContentDAO contentDAO  = new QuestionContentDAO();

		BigQuestionBean bigBean = new BigQuestionBean();
		bigBean.setType(type);
		BigQuestionBean[] bigBeans = (BigQuestionBean[])bigDAO.getDatabase(bigBean).toArray(new BigQuestionBean[0]);

		request.setAttribute("bigBeans", bigBeans);


		//アンケートの種類を格納
		request.setAttribute("type", type);

		//questionInfo.jspへ飛ぶ
		RequestDispatcher dispatcher = request.getRequestDispatcher("/questionInfo.jsp");
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
