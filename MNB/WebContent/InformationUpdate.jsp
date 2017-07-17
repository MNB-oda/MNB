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


.information caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}


.widthMax {
	width: 90%;
}

.button {
	text-align: right;
}

a.square_btn_decide{
	width: 150px;
	font-size: 150%;
	text-align: center;
	display: inline-block;
	padding: 0.7em 1.5em;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
	color: #fff;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #ff1d00 0%, #e5001e 100%);
	transition: .4s;
}
a.square_btn_decide:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #ff657a 50%, #e790b5 100%);
}

a.square_btn_back{
	width: 150px;
	font-size: 100%;
	text-align: center;
	display: inline-block;
	padding: 0.7em 1.5em;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
	color: #fff;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #ff1d00 0%, #e5001e 100%);
	transition: .4s;
}
a.square_btn_back:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #ff657a 50%, #e790b5 100%);
}
</style>

</head>
<body>
	<form name = "updateNews" action="InformationDatabaseProcessing" method="post">
	<div Align = "right">
	<a  onclick = history.back()   class="square_btn_back">戻る</a>
	</div>
	<br>
	<br>
		<table class = information>
		<%
			out.println("<tr>");
			out.println("<caption>お知らせ更新</caption>");
			out.println("</tr>");
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
			<a href="javascript:document.updateNews.submit()" class="square_btn_decide">確定</a>
			<input type=hidden name="CONFIRM" value="確定">
		<p>
	</form>
</body>
</html>