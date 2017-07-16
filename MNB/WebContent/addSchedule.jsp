<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="model.ScheduleBean"%>
<%
	String han[] = { "プログラム班", "2DCG班", "3DCG班", "サウンド班" };
	String type = (String)session.getAttribute("type");
	ScheduleBean bean = (ScheduleBean) session.getAttribute("bean");

	String id = bean.getId();
	int year = bean.getYear();
	int month = bean.getMonth();
	int day = bean.getDay();
	String dayOfTheWeek = bean.getDayOfTheWeek();

	int hansNumber = 0;
	int number = 0;
	String title = "";
	String place = "";
	String belongings = "";
	String subjects = "";
	String contact = "";
	String content = "";

	//更新の画面なら現在のデータを表示
	if(type == "update"){
		switch(bean.getHan()){
		case "2DCG班":
			hansNumber = 1;
			break;
		case "3DCG班":
			hansNumber = 2;
			break;
		case "サウンド班":
			hansNumber = 3;
			break;
		default:
			break;
		}
		number = bean.getNumber();
		title = bean.getTitle();
		place = bean.getPlace();
		belongings = bean.getBelongings();
		subjects = bean.getSubjects();
		contact = bean.getContact();
		content = bean.getContent();
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>スケジュール追加</title>

<style>
body {
	background-color: #ceecff;
	text-align: center;
}

table {
	border: 1px solid #ffffff;
	margin-left:auto;margin-right:auto;
	width: 80%;
}

td {
	border: 1px solid #ffffff;
	text-align: left;
}
th {
	border: 1px solid #ffffff;
}

div {
	text-align: right;
}

.contents td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.contents th {
	text-align: left;
	padding-right: 20px;
}

.contents tr:nth-child(even) td ,th{
	background-color: #eaeff7;
}

.contents tr:nth-child(odd) td ,th{
	background-color: #d7e2f4;
}
.contents caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;

}


.widthMax {
	width: 100%;
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
	<form method="post" action="./DatabaseProcessing">
<div Align = "right">
<a  onclick = history.back()   class="square_btn_back">戻る</a>
</div>
<br>
<br>
		<table class= "contents">
		<%
		switch(type){
		case "add":
			out.println("<caption>講習追加</caption>");
			break;
		case "update":
			out.println("<caption>講習更新</caption>");
			break;
		default :
			break;
		}
		%>

			<tr>
				<td>ID</td>
				<td><%= id%></td>
			</tr>
			<tr>
				<td>講習班</td>
				<td><select name="HAN">
						<%
							for (int i = 0; i < han.length; i++) {
								out.println("<option value = \"" + han[i] + "\"");
								if (i == hansNumber) {
									out.println("selected");
								}
								out.println(">");
								out.println(han[i]);
								out.println("</option>");
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>講習回</td>
				<td>第<input type="text" name="NUMBER" value="<%= number %>" size="2" maxlength="3">回</td>
			</tr>

			<tr>
				<td>講習タイトル</td>
				<td><input type="text" name="TITLE" value="<%= title %>" maxlength="100" class = "widthMax"></td>
			</tr>

			<tr>
				<td>日時</td>
				<td><%= month%>月<%= day%>日(<%= dayOfTheWeek %>)</td>
			</tr>

			<tr>
				<td>場所</td>
				<td><input type="text" name="PLACE" value="<%= place %>" maxlength="100" class = "widthMax"></td>
			</tr>

			<tr>
				<td>持ち物</td>
				<td><input type="text" name="BELONGINGS" value="<%= belongings %>" maxlength="100" class = "widthMax"></td>
			</tr>

			<tr>
				<td>対象者</td>
				<td><input type="text" name="SUBJECTS" value="<%= subjects %>" maxlength="100" class = "widthMax"></td>
			</tr>

			<tr>
				<td>関係者連絡先</td>
				<td><textarea name="CONTACT" rows="3"  wrap="virtual" class = "widthMax"><%= contact %></textarea></td>
			</tr>

			<tr>
				<td>講習概要</td>
				<td><textarea name="CONTENT" rows="5"  wrap="virtual" class = "widthMax"><%= content %></textarea></td>
			</tr>
		</table>

		<p>
			<input type="submit" name="CONFIRM" value="確定">
		<p>
	</form>
</body>
</html>
