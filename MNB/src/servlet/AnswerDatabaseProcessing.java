package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AnswerDAO;
import model.AnswerBean;

/**
 * Servlet implementation class AnswerDatabaseProsessing
 */
@WebServlet("/AnswerDatabaseProcessing")
public class AnswerDatabaseProcessing extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerDatabaseProcessing() {
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

		//データの追加
		AnswerDAO ansDAO = new AnswerDAO();

		String respondentID = "15FI018";

		int i = 0;
		while(request.getParameter("q" + i) != null){
			AnswerBean ansBean = new AnswerBean();

			//回答の形式によって追加の方法を変化
			switch(request.getParameter("q" + i + "type")){
			case "radio":
				ansBean.setQuestionID(request.getParameter("questionID"));
				ansBean.setRespondentID(respondentID);
				ansBean.setTypeIsFree(false);
				ansBean.setAnswer(request.getParameter("q" + i));
				ansDAO.insertDatabase(ansBean);
				break;

			case "select":
				String[] selectAnswers = request.getParameterValues("q" + i);

				for(int j=0; j<selectAnswers.length; j++){
					ansBean.setQuestionID(request.getParameter("questionID"));
					ansBean.setRespondentID(respondentID);
					ansBean.setTypeIsFree(false);
					ansBean.setAnswer(selectAnswers[j]);
					ansDAO.insertDatabase(ansBean);
					//一旦初期化
					ansBean = new AnswerBean();
				}
				break;

			case "free":
				ansBean.setQuestionID(request.getParameter("questionID"));
				ansBean.setRespondentID(respondentID);
				ansBean.setTypeIsFree(true);
				ansBean.setAnswer(request.getParameter("q" + i));
				ansDAO.insertDatabase(ansBean);
				break;

			default:
				break;
			}
			i++;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/end.jsp");
		dispatcher.forward(request, response);
	}
}
