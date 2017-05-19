package calendar;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class schedule
 */
@WebServlet("/schedule")
public class schedule extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public schedule() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0.1//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">");

		out.println("<html lang=\"ja\">");
		out.println("<head>");
		out.println("<meta http-equiv=\"Content-Type\" Content=\"text/html;charset=Shift_JIS\">");

		out.println("<title>講習情報</title>");

		out.println("<style>");

		out.println("body {"
						+ "background-color: #ceecff;"
						+ "}");

		out.println("table {"
						+ "font-size: 20px;"
						+ "border:2px solid #ffffff;"
						+ "}");

		out.println("td {"
						+ "border: 1px solid #000000;"
						+ "}");
		out.println("th {"
						+ "border: 1px solid #000000;"
						+ "}");

		out.println(".button {"
						+ "text-align: center;"
						+ "}");
		out.println(".button tr:first-child td{"
						+ "background-color: #0099f2;"
						+ "color: #ffffff;"
						+ "}");
		out.println(".button tr:nth-child(even) td{"
						+ "background-color: #d7e2f4;"
						+ "}");

		out.println(".contents td{"
						+ "text-align: left;"
						+ "padding-right: 20px;"
						+ "}");
		out.println(".contents th{"
						+ "text-align: left;"
						+ "padding-right	: 20px"
						+ "}");
		out.println(".contents tr:nth-child(even) td{"
						+ "background-color: #d7e2f4;"
						+ "}");
		out.println(".contents tr:nth-child(odd) td{"
						+ "background-color: #eaeff7;"
						+ "}");
		out.println(".contents tr:first-child td{"
						+ "background-color: #0099f2;"
						+ "color: #ffffff;"
						+ "}");

		out.println("</style>");

		out.println("</head>");
		out.println("<body>");

		out.println("<input type = \"button\" name = \"CLOSE\" value = \"閉じる\"");

		out.println("<form method=\"post\" action=\"\">");
		out.println("<table class = \"button\">");
		out.println("<p>");

		out.println("<tr>");
		out.println("<td colspan = \"3\">5月18日（木）</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td><input type=\"submit\" name=\"ADD\" value=\"追加\"></td>");
		out.println("<td><input type=\"submit\" name=\"UPDATE\" value=\"更新\"></td>");
		out.println("<td><input type=\"submit\" name=\"DELETE\" value=\"削除\"></td>");
		out.println("</tr>");

		out.println("<p>");
		out.println("</form>");
		out.println("</table>");

		out.println("<p>");

		out.println("<table class = \"contents\">");

		out.println("<td>講習ID</td>");
		out.println("<td>2017521-1-01</td>");

		out.println("<tr>");
		out.println("<th>講習班</th>");
		out.println("<td>プログラム班</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>講習回</th>");
		out.println("<td>第2回</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>講習タイトル</th>");
		out.println("<td>Unityの基本操作①</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>開催日</th>");
		out.println("<td>5月2日(火)</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>場所</th>");
		out.println("<td>21003教室</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>持ち物</th>");
		out.println("<td>PC、ACアダプター、Unity操作は3Dなのでマウスがあると良い</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>対象者</th>");
		out.println("<td>3Dゲームを作りたい方</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>関係者連絡先</th>");
		out.println("<td>東京電機大学　未来科学部　情報メディア学科 "
						+ "<br>ソフトウェア研究部　プログラム班班長</br>"
						+ "<br>JK　太郎</br>"
						+ "<br>15FI999@ms.dendai.ac.jp</br></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>講習概要</th>");

		out.println("<td>今回の講習は新入生向けです。"
						+ "<br>・Unityソフトのインストールからユーザ登録</br>"
						+ "<br>・Unityの基本操作</br>"
						+ "<br>不明な点などございましたら、記載されている連絡先にてお願いします。</br></td>");
		out.println("</tr>");

		out.println("</table>");

		out.println("</body>");
		out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
