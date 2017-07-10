package servlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.InformationDAO;
import model.InformationBean;

/**
 * Servlet implementation class InformationDatabaseProcessing
 */
@WebServlet("/InformationDatabaseProcessing")
public class InformationDatabaseProcessing extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InformationDatabaseProcessing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		InformationBean bean = new InformationBean();
		InformationDAO dao;

		// 追加、更新、削除のどれなのかを判断し、それぞれを実行
		switch ((String) session.getAttribute("type")) {
		case "add":
			bean.setTitle((String) request.getParameter("TITLE"));
			bean.setContent((String) request.getParameter("CONTENT"));
			dao = new InformationDAO();
			bean.setId(createId(dao));
			dao.insertDatabase(bean);
			break;

		case "update":
			bean = (InformationBean) session.getAttribute("bean");
			bean.setTitle((String) request.getParameter("TITLE"));
			bean.setContent((String) request.getParameter("CONTENT"));
			dao = new InformationDAO();
			dao.updateDatabase(bean);
			break;

		case "delete":
			bean = (InformationBean) session.getAttribute("bean");
			dao = new InformationDAO();
			dao.deleteDatabase(bean);
			break;

		default:
			break;
		}

		// sessionスコープをまっさらにする
		session.invalidate();

		// endへ飛ぶ
		RequestDispatcher dispatcher = request.getRequestDispatcher("/end.jsp");
		dispatcher.forward(request, response);
	}

	private String createId(InformationDAO dao) {
		String id = "";
		ArrayList<InformationBean> list = dao.createInformationList();
		Calendar cal = Calendar.getInstance();
		DecimalFormat dformat = new DecimalFormat("00");
		id = id + cal.get(Calendar.YEAR);
		id = id + dformat.format(cal.get(Calendar.MONTH)+1);
		id = id + dformat.format(cal.get(Calendar.DATE));
		id = dao.getNewId(id);
		System.out.println(id);
		return id;
	}
}
