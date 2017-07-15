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
	String str1 = "プログラム班";
	String str2 = "2DCG班";
	String str3 = "3DCG班";
	String str4 = "サウンド班";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#content div.container,
{
	width: 1260px;
	margin: 0 auto;
}

#main div.calender p.month{
	font-size: 225%;
	margin: 0 auto;
	text-align: center;
}

#main div.calender a.monthsize{
	font-size: 1.5em;
	font-size: 150%;
}
#main div.calender table.calendermain,
#main div.NewsList table.homeNewList{
	border: 1px solid #000;
	width: 100%;
	border-collapse: collapse;
	float:center;

}
#main div.calender table.calendermain td{
	width: 14%;
	vertical-align: top;
	border-right: 1px solid #ccc;
}
#main div.calender table.calendermain td.week{
	color: #FFF;
	background-color: #55aaff;
	text-align: center;
	font-size:200%;
}
#main div.calender table.calendermain td.sunday{
	color: #ff0000;
	background-color: #55aaff;
	text-align: center;
	font-size:200%;
}

#main div.calender table.calendermain td.day {
	background-color: #95c9ff;
	font-weight: bold;
	text-align: center;
	border-top: 1px solid #ffffff;
	font-size:175%;
}
#main div.calender table.calendermain holiday {
	background-color: #95c9ff;
	text-align: center;

}
#main div.calender table.calendermain td.sche {
	/*background-color: #95c9ff;*/
	font-weight: bold;
	text-align: center;
	height: 100px;
}

#main div.calender table.calendermain td.sche a{
	display: block;
	width: 100%;
	height: 100%
}

#main div.NewsList table.homeNewList td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size:125%;
}

#main div.NewsList table.homeNewList caption{
	/*border: 1px solid #ffffff;*/
	background-color: #0099f4;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size:150%;
}


</style>
<title>Insert title here</title>
</head>
<body>
<div id=content>
		<div id=container>
			<div id=main>
				<div class="calender">
				<p class="month">
				<a href="/MNB/MakeCalender?YEAR=<%=year%>&MONTH=<%=month-1%>"><span>前月</span></a>
				<a class="monthsize"><%=month%>月</a>
				<a href="/MNB/MakeCalender?YEAR=<%=year%>&MONTH=<%=month+1%>"><span>翌月</span></a>
				</p>
					<table class="calendermain">
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

										/*班による色表示を変える*/
										String han = beans[beansPointer].getHan();
										if(str1.equals(han))out.println("<td class=\"sche\" bgcolor= #ee87b4><a href=\"/MNB/AccsessContents?YEAR=" + year + "&MONTH=" + month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\">" + beans[beansPointer].getTitle() + "</a></td>");
										else if(str2.equals(han))out.println("<td class=\"sche\" bgcolor= #7fff00><a href=\"/MNB/AccsessContents?YEAR=" + year + "&MONTH=" + month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\">" + beans[beansPointer].getTitle() + "</a></td>");
										else if(str3.equals(han))out.println("<td class=\"sche\" bgcolor= #00a0e9 ><a href=\"/MNB/AccsessContents?YEAR=" + year + "&MONTH=" + month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\">" + beans[beansPointer].getHan() +"<br>"+ beans[beansPointer].getTitle() +"</a></td>");
										else if(str4.equals(han))out.println("<td class=\"sche\" bgcolor= #f2e55c><a href=\"/MNB/AccsessContents?YEAR=" + year + "&MONTH=" + month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\">" + beans[beansPointer].getTitle() + "</a></td>");
										/*例外：どの班にも所属してなかったら*/
										else	out.println("<td class=\"sche\"><a href=\"/MNB/AccsessContents?YEAR=" + year + "&MONTH=" + month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\">" + beans[beansPointer].getTitle() + "</a></td>");
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
			</div>
			<div class="NewsList">
				<table class= "homeNewList">
				<caption><a href = "newsList.jsp"><u>お知らせ</u></a></caption>
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
			</div>
		</div>
		</div>
		</div>

</body>
</html>