package servlet;

import java.io.IOException;
import java.util.Calendar;

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
 * Servlet implementation class addQuestion
 */
@WebServlet("/QuestionDatabaseProcessing")
public class QuestionDatabaseProcessing extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDatabaseProcessing() {
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

		BigQuestionDAO bigDAO = new BigQuestionDAO();
		SmallQuestionDAO smallDAO = new SmallQuestionDAO();
		QuestionContentDAO contentDAO = new QuestionContentDAO();

		switch(request.getParameter("methodType")){
		case "add":
			//共通のidの作成
			BigQuestionBean subBean = new BigQuestionBean();
			subBean.setType(request.getParameter("QUESTIONTYPE"));
			int count = bigDAO.getLines(subBean);
			Calendar calendar = Calendar.getInstance();
			String id = String.valueOf(calendar.get(Calendar.YEAR)) + String.valueOf(calendar.get(Calendar.MONTH)) + String.valueOf(calendar.get(Calendar.DATE)) + count;

			//大きなくくりの挿入
			BigQuestionBean bigBean = new BigQuestionBean();
			bigBean.setId(id);
			bigBean.setTitle(request.getParameter("TITLE"));
			bigBean.setType(request.getParameter("QUESTIONTYPE"));
			bigDAO.insertDatabase(bigBean);

			//行数に制限が無いので無限ループでsmallBeanを挿入
			int rowNumber = 1;
			while(true){
				if(request.getParameter("ROW" + rowNumber + "ANSWER" + 1) == null){
					break;
				}
				SmallQuestionBean smallBean = new SmallQuestionBean();
				smallBean.setId(id);
				smallBean.setTitle(request.getParameter("QUESTION" + rowNumber));
				smallBean.setQuestionType(request.getParameter("TYPE" + rowNumber));
				smallBean.setRow(rowNumber);
				smallDAO.insertDatabase(smallBean);


				//項目数には制限があるのでfor文でcontentBeanを挿入
				//自由の場合は項目数などが無いので、id以外を0とnullに
				if(smallBean.getQuestionType().equals("自由")){
					QuestionContentBean contentBean = new QuestionContentBean();
					contentBean.setId(id);
					contentBean.setChoicesNumber(0);
					contentBean.setRow(rowNumber);
					contentBean.setContent(null);
					contentDAO.insertDatabase(contentBean);
				}else{
					for(int answerNumber = 1; answerNumber < Integer.valueOf(request.getParameter("KOMOKUSU" + rowNumber)) + 1; answerNumber++){
						QuestionContentBean contentBean = new QuestionContentBean();
						contentBean.setId(id);
						contentBean.setChoicesNumber(answerNumber);
						contentBean.setRow(rowNumber);
						contentBean.setContent(request.getParameter("ROW" + rowNumber + "ANSWER" + answerNumber));
						contentDAO.insertDatabase(contentBean);

					}
				}

				rowNumber++;
			}
			break;

		case "delete":
			HttpSession session = request.getSession();
			BigQuestionBean deleteBean = (BigQuestionBean)session.getAttribute("deleteBean");
			//データベースのCASCADE設定によって、bigを削除すればsmall,contentも削除される
			bigDAO.deleteDatabase(deleteBean);
			break;

		default:
			break;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/end.jsp");
		dispatcher.forward(request, response);
	}

}
