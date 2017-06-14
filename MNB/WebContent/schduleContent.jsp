<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.ScheduleBean"%>
<%
	int month = (Integer) request.getAttribute("month");
	int day = (Integer) request.getAttribute("day");
	String dayOfTheWeek = (String) request.getAttribute("dayOfTheWeek");
	String id = (String) request.getAttribute("id");
	String han = (String) request.getAttribute("han");
	int number = (Integer) request.getAttribute("number");
	String title = (String) request.getAttribute("title");
	String place = (String) request.getAttribute("place");
	String belongings = (String) request.getAttribute("belongings");
	String subjects = (String) request.getAttribute("subjects");
	String contact = (String) request.getAttribute("contact");
	String content = (String) request.getAttribute("content");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>講習情報</title>
<style>
body {
	background-color: #ceecff;
}

table {
	border: 2px solid #ffffff;
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

td {
	border: 1px solid #ffffff;
}

th {
	border: 1px solid #ffffff;
}

.button {
	text-align: center;
}

.button tr:first-child td {
	background-color: #0099f2;
	color: #ffffff;
}

.button tr:nth-child(even) td {
	background-color: #d7e2f4;
}

.contents td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
}

.contents th {
	text-align: left;
	padding-right: 20px;
}

.contents tr:nth-child(even) td, th {
	background-color: #d7e2f4;
}

.contents tr:nth-child(odd) td, th {
	background-color: #eaeff7;
}

.contents tr:first-child td {
	background-color: #0099f2;
	color: #ffffff;
}
</style>

</head>
<body>

	<input type="button" name="CLOSE" value="閉じる" onClick = window.close()>

	<table class="button">
		<p>
		<tr>
			<td colspan="3"><%=month %>月<%=day %>日（<%=dayOfTheWeek %>）</td>
		</tr>

		<tr>
			<td><input type="submit" name="ADD" onclick="location.href = '/MNB/ScheduleAssignment?TYPE=add'" value="追加" ></td>
			<td><input type="submit" name="UPDATE" onclick="location.href = '/MNB/ScheduleAssignment?TYPE=update '" value="更新"></td>
			<td><input type="submit" name="DELETE" onclick="location.href = '/MNB/ScheduleAssignment?TYPE=delete'" value="削除"></td>
		</tr>


		</table>

		<p>
		<table class="contents">
			<tr>
				<td>講習ID</td>
				<td><%= id%></td>
			</tr>

			<tr>
				<td>講習班</td>
				<td><%= han%></td>
			</tr>

			<tr>
				<td>講習回</td>
				<td>第<%= number%>回</td>
			</tr>

			<tr>
				<td>講習タイトル</td>
				<td><%= title%></td>
			</tr>

			<tr>
				<td>日時</td>
				<td><%= month%>月<%= day%>日(<%= dayOfTheWeek%>)</td>
			</tr>

			<tr>
				<td>場所</td>
				<td><%= place%></td>
			</tr>

			<tr>
				<td>持ち物</td>
				<td><%= belongings%></td>
			</tr>

			<tr>
				<td>対象者</td>
				<td><%= subjects%></td>
			</tr>

			<tr>
				<td>関係者連絡先</td>
				<td><%= contact%>
				</td>
			</tr>

			<tr>
				<td>講習概要</td>
				<td><%= content%>
				</td>
			</tr>

		</table>
</body>
</html>