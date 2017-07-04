<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.CalendarBean"%>
<%@ page import="model.ScheduleBean"%>

<%
	int year = (Integer) request.getAttribute("year");
	int month = (Integer) request.getAttribute("month");
	int pointedDay = (Integer) request.getAttribute("pointedDay");
	int thisMonthLastDay = (Integer) request.getAttribute("thisMonthLastDay");
	ScheduleBean beans[] = (ScheduleBean[])request.getAttribute("beans");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>スケジュール管理</title>

<style>
table {
	border: 1px solid #ffffff;
	width: 90%;
}

td {
	width: 12%;
	border-top: 1px solid #ffffff;
	border-left: 1px solid #ffffff;
	vertical-align: top;
	padding: 2px;
}

td.week {
	color: #ffffff;
	background-color: #55aaff;
	text-align: center;
}

td.sunday {
	color: #ff0000;
	background-color: #55aaff;
	text-align: center;
}

td.day {
	background-color: #95c9ff;
	text-align: left;
}

td.holiday {
	background-color: #95c9ff;
	text-align: left;
}

td.sche {
	background-color: #95c9ff;
	text-align: left;
	height: 80px;
}

td.sche a{
	display: block;
	width: 100%;
	height: 100%
}


.homeNewList td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.homeNewList caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.homeNewList th {
	text-align: center;
}

.homeNewList tr:nth-child(even) td {
	background-color: #eaeff7;
}

.homeNewList tr:nth-child(odd) td {
	background-color: #d7e2f4;
}


.homeNewList {
	width: 100%;
}




</style>

</head>
<body>
	<p>ソフトウェア研究部</p>

	<Div Align = right>
	<input type="submit" name="CONFIRM" value="マイページ">
	</Div>

	<p>
		<a href="/MNB/MakeCalender?YEAR=<%=year%>&MONTH=<%=month-1%>"><span>前月</span></a>
		<%=month%>月
		<a href="/MNB/MakeCalender?YEAR=<%=year%>&MONTH=<%=month+1%>"><span>翌月</span></a>
	</p>



	<table>
		<tr>
			<td class="sunday">SUN</td>
			<td class="week">MON</td>
			<td class="week">TUE</td>
			<td class="week">WED</td>
			<td class="week">THU</td>
			<td class="week">FRI</td>
			<td class="week">SAT</td>
		</tr>

		<%
			while (pointedDay <= thisMonthLastDay) {
				out.println("<tr>");

				int pointer = pointedDay;

				for (int i = 0; i < 7; i++) {
					if (pointedDay < 1 || pointedDay > thisMonthLastDay) {
						out.println("<td class=\"day\"></td>");
						pointedDay++;
					} else {
						out.println("<td class=\"day\">" + pointedDay + "</td>");
						pointedDay++;
					}
				}
				out.println("</tr>");

				out.println("<tr>");

				int beansPointer = 0;
				for (int i = 0; i < 7; i++) {
					if (pointer < 1 || pointer > thisMonthLastDay) {
						out.println("<td class=\"sche\"></td>");
						pointer++;
					} else {
						if(beans[beansPointer] != null && pointer == beans[beansPointer].getDay()){
							out.println("<td class=\"sche\"><a href=\"/MNB/AccsessContents?YEAR=" + year + "&MONTH=" + month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\">" + beans[beansPointer].getTitle() + "</a></td>");
							beansPointer++;
						}else{
							out.println("<td class=\"sche\"><a href=\"/MNB/AccsessContents?YEAR=" + year + "&MONTH=" + month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\"></a></td>");
						}
						pointer++;
					}
				}
				out.println("</tr>");
			}
		%>
	</table>


	<br>
	<br>
	<br>
		<table class= "homeNewList">
			<caption>お知らせ</caption>

			<tr>
				<td>講習情報はありません</td>
			</tr>

			<tr>
				<td>講習情報はありません</td>
			</tr>

			<tr>
				<td>講習情報はありません</td>
			</tr>

			<tr>
				<td>講習情報はありません</td>
			</tr>

			<tr>
				<td>講習情報はありません</td>
			</tr>

			<tr>
				<td>講習情報はありません</td>
			</tr>
		</table>

	<br>
	<br>

	<Div Align = left>
	<input type="submit" name="CONFIRM" value="講習アンケート" onClick = "location.href = '/MNB/AccsessQuestions?TYPE=kosyu'">
	<input type="submit" name="CONFIRM" value="イベントアンケート" onClick = "location.href = '/MNB/AccsessQuestions?TYPE=event'">
	</Div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

<Div Align = left>
	<input type="submit" name="CONFIRM" value="公式サイト">
	<input type="submit" name="CONFIRM" value="公式Twitter">
	</Div>

</body>
</html>

