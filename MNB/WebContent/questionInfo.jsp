<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="model.BigQuestionBean"%>
<%@ page import="model.StudentBean"%>
<%
	BigQuestionBean[] bigBean = (BigQuestionBean[]) request.getAttribute("bigBeans");
	String type = (String) request.getAttribute("type");
	StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>講習会アンケート編集</title>
<style>
body {
	/* background-color: #ceecff; */

}

table {
	font-size: 20px;
	border: 2px solid #ffffff;
	width: 100%;
}

td {
	border: 1px solid #000000;
}

th {
	border: 1px solid #000000;
}

.table {
	text-align: left;
}

.table td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
	width: 90%;
}

.table th {
	text-align: left;
	padding-right: 20px;
}

.table tr:nth-child(even) td, th {
	background-color: #d7e2f4;
}

.table tr:nth-child(odd) td, th {
	background-color: #eaeff7;
}

.table caption {
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 100%;
}

a.square_btn_add {
	width: 150px;
	font-size: 100%;
	text-align: center;
	display: inline-block;
	padding: 0.7em 1.5em;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
	color: #000;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #0085C9 0%, #604dff 100%);
	transition: .4s;
}

a.square_btn_add:hover {
	background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
}

a.square_btn_back {
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

a.square_btn_back:hover {
	background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #ff657a 50%, #e790b5 100%);
}

a.square_btn_update_list {
	width: 50px;
	height: 20px;
	font-size: 80%;
	text-align: center;
	display: inline-block;
	padding: 0.7em 1.5em;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
	color: #000;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #0bda51 0%, #6bbf3f 100%);
	transition: .4s;
}

a.square_btn_update_list:hover {
	background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #47ea7e 0%, #10c98d 100%);
}

a.square_btn_del_list {
	width: 50px;
	height: 20px;
	font-size: 80%;
	text-align: center;
	display: inline-block;
	padding: 0.7em 1.5em;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
	color: #000;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #ff1d00 0%, #e5001e 100%);
	transition: .4s;
}

a.square_btn_del_list:hover {
	background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #ff657a 50%, #e790b5 100%);
}
</style>
</head>
<body>
	<div Align="right">
		<a onclick=history.back() class="square_btn_back">戻る</a>

	</div>
	<br>
	<%
		//管理者の場合に表示される
		if (studentBean.isAdmin()) {
			out.println(" <a  onClick=\"location.href = '/MNB/QuestionMethodAssignment?TYPE=add&QUESTIONTYPE="
					+ type + "'\" class=\"square_btn_add\">追加</a>");
		}
	%>
	<br>
	<br>
	<br>


	<div style="overflow-y: scroll;">
		<table class="table">
			<%
				switch (type) {
				case "講習アンケート":
					out.println("<caption> 講習アンケート一覧 </caption>");
					break;
				case "イベントアンケート":
					out.println("<caption> イベントアンケート一覧 </caption>");
					break;
				default:
					break;
				}

				//アンケートタイトルの表示
				for (int i = 0; i < bigBean.length; i++) {
					out.println("<tr>");
					out.println("<td><a href = \"/MNB/QuestionMethodAssignment?TYPE=answer&ID=" + bigBean[i].getId() + "\">"
							+ bigBean[i].getTitle() + "</a></td>");
					if (studentBean.isAdmin()) {
						out.println(
								"<td align = \"center\"> <a  onClick=\"location.href ='/MNB/QuestionMethodAssignment?TYPE=aggregate&ID="
										+ bigBean[i].getId() + "'\"class=\"square_btn_update_list\"> 集計</td>");
						out.println(
								"<td align = \"center\"> <a  onClick=\"location.href ='/MNB/QuestionMethodAssignment?TYPE=delete&ID="
										+ bigBean[i].getId() + "'\"class=\"square_btn_del_list\"> 削除</td>");
					}
					out.println("</tr>");
				}
			%>
		</table>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>