package calendar;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddSchedule
 */
@WebServlet("/AddSchedule")
public class AddSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSchedule() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String han[] = {"プログラム班", "2DCG班", "3DCG班","サウンド班"};

		out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0.1//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">");


		out.println("<html lang=\"ja\">");
		out.println("<head>");
		out.println("<meta http-equiv=\"Content-Type\" Content=\"text/html;charset=Shift_JIS\">");


		out.println("<title>スケジュール追加</title>");


		out.println("<style>");
		out.println("body {"
					+ "background-color: #dbf1ff"
					+ "}");

        out.println("table{"
        			+ "border:1px solid #000000;"
        			+ "padding:0px;"
        			+ "margin:0px;"
        			+ "border-collapse:collapse;"
        			+ "}");

        out.println("td{"
        			+ "border: 1px solid #000000;"
        			+ "vertical-align:top;"
        			+ "margin:0px;padding:2px;"
        			+ "font-size:0.75em;"
        			+ "height:20px;"
        			+ "}");

        out.println("</style>");


		out.println("</head>");
		out.println("<body>");

		out.println("<form method=\"post\" action=\"\">");
		out.println("<table>");

		out.println("<tr>");
		out.println("<td nowrap>講習班</td>");
		out.println("<td><select name=\"HAN\">");
		for(int i=0; i<han.length; i++){
			out.println("<option value = \"");
			out.println(han[i]);
			out.println("\"");
			if(i==0){
				out.println("selected");
			}
			out.println(">");
			out.println(han[i]);
			out.println("</option>");
		}
		out.println("</select></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td>講習回</td>");
		out.println("<td>第");
		out.println("<input type = \"text\" name = \"NUMBER\" value = \"\" size = \"2\" maxlength = \"3\">");
		out.println("回</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td>講習タイトル</td>");
		out.println("<td><input type = \"text\" name = \"TITLE\" value = \"\" size = \"30\" maxlength = \"100\"></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td>場所</td>");
		out.println("<td><input type = \"text\" name = \"PLACE\" value = \"\" size = \"30\" maxlength = \"100\"></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td>持ち物</td>");
		out.println("<td><input type = \"text\" name = \"BELONGINGS\" value = \"\" size = \"30\" maxlength = \"100\"></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td>対象者</td>");
		out.println("<td><input type = \"text\" name = \"SUBJECTS\" value = \"\" size = \"30\" maxlength = \"100\"></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td>関係者連絡先</td>");
		out.println("<td><textarea name = \"CONTACT\" rows= \"3\" cols = \"30\" wrap = \"virtual\"></textarea></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td>講習概要</td>");
		out.println("<td><textarea name = \"CONTENT\" rows= \"5\" cols = \"30\" wrap = \"virtual\"></textarea></td>");
		out.println("</tr>");
		out.println("</table>");

		out.println("<p>");
		out.println("<input type=\"submit\" name=\"CONFIRM\" value=\"確定\">");
		out.println("<p>");
		out.println("</form>");

		out.println("</body>");
		out.println("</html>");
	}
}
