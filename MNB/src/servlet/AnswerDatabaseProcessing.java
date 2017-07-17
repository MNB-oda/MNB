package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AnswerDAO;
import model.AnswerBean;
import model.StudentBean;

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
		int writtenFree = 0;	//answerNumberに入れる自由記述用の番号

		//データの追加
		AnswerDAO ansDAO = new AnswerDAO();
		AnswerBean ansBean = new AnswerBean();

		HttpSession session = request.getSession();
		StudentBean studentBean = (StudentBean)session.getAttribute("studentBean");
		String respondentID = studentBean.getId();

		ansBean.setRespondentID(respondentID);

		int i = 0;
		while(request.getParameter("q" + i) != null){
			String answerNumber;

			//回答の形式によって追加の方法を変化
			switch(request.getParameter("q" + i + "type")){
			case "radio":
				ansBean.setQuestionID(request.getParameter("questionID"));
				ansBean.setSmallQuestionRow(i+1);
				answerNumber = request.getParameter("q" + i);
				ansBean.setAnswerNumber(Integer.valueOf(answerNumber));
				ansBean.setFreeAnswer(null);
				ansDAO.insertDatabase(ansBean);
				break;

			case "select":
				String[] selectAnswers = request.getParameterValues("q" + i);	//データが配列で渡されるので一度避難
				for(int j=0; j<selectAnswers.length; j++){
					ansBean.setQuestionID(request.getParameter("questionID"));
					ansBean.setSmallQuestionRow(i+1);
					answerNumber = selectAnswers[j];
					ansBean.setAnswerNumber(Integer.valueOf(answerNumber));
					ansBean.setFreeAnswer(null);
					ansDAO.insertDatabase(ansBean);
					//一旦初期化
					ansBean = new AnswerBean();
				}
				break;

			case "free":
				if(!request.getParameter("q" + i).equals("")){
					ansBean.setQuestionID(request.getParameter("questionID"));
					ansBean.setSmallQuestionRow(i+1);
					ansBean.setAnswerNumber(writtenFree);
					ansBean.setFreeAnswer(request.getParameter("q" + i));
					ansDAO.insertDatabase(ansBean);
				}
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
