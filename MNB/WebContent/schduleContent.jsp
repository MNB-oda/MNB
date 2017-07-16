
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.ScheduleBean"%>
<%@ page import="model.StudentBean"%>
<%
	StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
	int month = (Integer) request.getAttribute("month");
	int day = (Integer) request.getAttribute("day");
	String dayOfTheWeek = (String) request.getAttribute("dayOfTheWeek");

	String id = "";
	String han = "";
	int number = 0;
	String title = "";
	String place = "";
	String belongings = "";
	String subjects = "";
	String contact = "";
	String content = "";
	ScheduleBean bean = null;

	if((boolean) request.getAttribute("exist")){
		bean = (ScheduleBean) session.getAttribute("bean");
		id = bean.getId();
		han = bean.getHan();
		number = bean.getNumber();
		title = bean.getTitle();
		place = bean.getPlace();
		belongings = bean.getBelongings();
		subjects = bean.getSubjects();
		contact = bean.getContact();
		content = bean.getContent();
	}
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


a.square_btn_add_list{
	width: 50px;
	height:20px;
	font-size: 80%;
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
a.square_btn_add_list:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
}


a.square_btn_update_list{
	width: 50px;
	height:20px;
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
a.square_btn_update_list:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #47ea7e 0%, #10c98d 100%);
}



a.square_btn_del_list{
	width: 50px;
	height:20px;
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
a.square_btn_del_list:hover{
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

<div Align = "right">
<a  onclick = history.back()   class="square_btn_back">戻る</a>
</div>
<br>
<br>
	<table class="button">
		<tr>
			<td colspan="3"><%=month %>月<%=day %>日（<%=dayOfTheWeek %>）</td>
		</tr>

		<tr>
			<%
			if(studentBean.isAdmin()){
				if((boolean) request.getAttribute("exist")){
					out.println("<td align = \"center\"> <a  onClick=\"location.href ='/MNB/ScheduleAssignment?TYPE=update'\"class=\"square_btn_update_list\"> 更新</td>");
					out.println("<td align = \"center\"> <a  onClick=\"location.href ='/MNB/ScheduleAssignment?TYPE=delete'\"class=\"square_btn_del_list\"> 削除</td>");
				}else{
					out.println("<td align = \"center\"> <a  onClick=\"location.href ='/MNB/ScheduleAssignment?TYPE=add'\"class=\"square_btn_add_list\"> 追加</td>");
					//out.println("<td><a onClick=\"location.href = '/MNB/ScheduleAssignment?TYPE=add'\" class=\"square_btn_add_list\">追加</td>");
				}
			}
			%>
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
				<%
				//改行の表示処理
				StringBuilder sb = new StringBuilder();
				sb.append("<td>"+ contact + "</td>");
				while(true) {
					int l = sb.indexOf("\r");
					if(l == -1) {break;}
					else {
						sb.replace(l, l+1, "<br>");
					}
				}
				out.println(sb);
				%>
			</tr>

			<tr>
				<td>講習概要</td>
				<%
				//改行の表示処理
				sb = new StringBuilder();
				sb.append("<td>"+ content + "</td>");
				while(true) {
					int l = sb.indexOf("\r");
					if(l == -1) {break;}
					else {
						sb.replace(l, l+1, "<br>");
					}
				}
				out.println(sb);
				%>
				</tr>
		</table>
</body>
</html>