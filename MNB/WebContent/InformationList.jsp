</html><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.InformationBean"%>
<%@ page import="model.StudentBean"%>
<%@ page import="java.util.*"%>
<%
	StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
	ArrayList<InformationBean> list = (ArrayList<InformationBean>)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>お知らせ一覧</title>
<style>
body {
	background-color: #ceecff;
}
table {
	font-size: 20px;
	border: 2px solid #ffffff;
	width: 100%;
	text-align: left;
}


td {
	border: 1px solid #ffffff;
}S

th {
	border: 1px solid #ffffff;
}



.newsList td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.newsList caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.newsList th {
	text-align: center;
}

.newsList tr:nth-child(even) td {
	background-color: #eaeff7;
}

.newsList tr:nth-child(odd) td {
	background-color: #d7e2f4;
}


</style>
</head>
<body>
<div Align = "right">
<input type="button" name="CLOSE" onclick = history.back() value="戻る">
</div>
<br>
<font size = "7"> *日程管理システム </font>
<br>
<font size = "2"> 東京電機大学　ソフトウェア研究部 </font>
<br>
<br>
	<p>
	<div align = "center">
	<%
	if(studentBean.isAdmin()){
		out.println("<input type=\"submit\" name=\"ADD\" onclick=\"location.href = 'InformationAssignment?TYPE=add'\" value=\"追加\">");
	}
	%>
	</div>

		<table class="newsList">


		<caption>お知らせ一覧</caption>

	<%
		//最新のものから表示
		if(list.size() > 0) {
			for(int i = list.size() - 1; i >= 0; i--) {
				out.println("<tr>");
				//タイトルをクリックすると内容を表示
				out.println("<td><a href = \"InformationAssignment?TYPE=display&ID=" + list.get(i).getId() +"\">"
						+ list.get(i).getTitle() + "</a></td>");
				if(studentBean.isAdmin()){
					//更新ボタン
					out.println("<td align = \"center\"><input type=\"button\" name=\"UPDATE\" value=\"更新\" "
							+ "onClick = \"location.href = 'InformationAssignment?TYPE=update&ID=" + list.get(i).getId() +"'\"</td>");
					//削除ボタン
					out.println("<td align = \"center\"><input type=\"button\" name=\"DELETE\" value=\"削除\" "
							+ "onClick = \"location.href = 'InformationAssignment?TYPE=delete&ID=" + list.get(i).getId() +"'\"</td>");
				}
				out.println("</tr>");
			}
		} else {
			out.println("<tr><td>");
			out.println("お知らせはありません。");
			out.println("</td></tr>");
		}
	%>



	</table>
</body>
</html>