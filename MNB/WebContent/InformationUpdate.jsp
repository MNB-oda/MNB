<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.InformationBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	InformationBean bean = (InformationBean)session.getAttribute("bean");
	session.setAttribute("bean", bean);
	session.setAttribute("type", "update");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>お知らせ更新</title>

<style>
body {
	background-color: #ceecff;
	text-align: center;
}

table {
	border: 2px solid #ffffff;
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

td {
	border: 1px solid #ffffff;
	text-align: left;
	vertical-align: top;
}

.information tr:nth-child(even) td, th {
	background-color: #d7e2f4;
}

.information tr:nth-child(odd) td, th {
	background-color: #eaeff7;
}

.information tr:first-child td {
	background-color: #0099f2;
	color: #ffffff;
}

.widthMax {
	width: 90%;
}

.button {
	text-align: right;
}

</style>

</head>
<body>
	<form action="InformationDatabaseProcessing" method="post">
		<div Align = "right">
			<input type="button" name="CLOSE" value="閉じる">
		</div>
		<table class = information>
		<%
			out.println("<tr>");
			out.println("<td>タイトル</td>");
			out.println("<td><input"
					+ " type=\"text\""
					+ " name=\"TITLE\""
					+ " value=" + bean.getTitle()
					+ " maxlength=\"100\""
					+ " class=\"widthMax\"></td>");
			out.println("</tr>");

			out.println("<tr>");
			out.println("<td>内容</td>");
			out.println("<td><textarea"
					+ " name=\"CONTENT\""
					+ " rows=\"15\""
					+ " wrap=\"virtual\""
					+ " class = \"widthMax\">"
					+ bean.getContent()
					+ "</textarea></td>");
			out.println("</tr>");
		%>
		</table>

		<p>
			<input type="submit" name="CONFIRM" value="確定">
		<p>
	</form>
</body>
</html>