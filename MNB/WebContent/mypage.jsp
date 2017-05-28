<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.CalendarBean"%>

<%
	int year = (Integer) request.getAttribute("year");
	int month = (Integer) request.getAttribute("month");
	int pointedDay = (Integer) request.getAttribute("pointedDay");
	int thisMonthLastDay = (Integer) request.getAttribute("thisMonthLastDay");
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
</style>

</head>
<body>
	<p>ソフトウェア研究部</p>

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

				int aaa = pointedDay;

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
				for (int i = 0; i < 7; i++) {
					out.println("<td class=\"sche\"><a href=\"/MNB/AccsessContents?YEAR=" + year + "&MONTH=" + month + "&DAY=" + aaa + "&DAYOFTHEWEEK=" + i + "\">OK</a></td>");
					aaa++;
				}
				out.println("</tr>");
			}
		%>
	</table>
</body>
</html>

