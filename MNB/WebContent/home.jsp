<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.CalendarBean"%>
<%@ page import="model.ScheduleBean"%>
<%@ page import="model.StudentBean"%>
<%@ page import="model.InformationBean"%>
<%@ page import="java.util.*"%>

<%
	StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
	@SuppressWarnings("unchecked")
	ArrayList<InformationBean> infoList = (ArrayList<InformationBean>) request.getAttribute("infoList");

	int year = (Integer) request.getAttribute("year");
	int month = (Integer) request.getAttribute("month");
	int pointedDay = (Integer) request.getAttribute("pointedDay");
	int thisMonthLastDay = (Integer) request.getAttribute("thisMonthLastDay");
	ScheduleBean beans[] = (ScheduleBean[]) request.getAttribute("beans");
	String str1 = "プログラム班";
	String str2 = "2DCG班";
	String str3 = "3DCG班";
	String str4 = "サウンド班";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>スケジュール管理</title>
<style>
body {
	/*background-color: #ceecff;*/
	background: url(../MNB/back.png);
	margin: 0px;
	min-width: 880px;
	padding: 0;
	font-size: 80%;
}

#content {
	padding: 35px 0 10px;
}

#content div.container {
	width: 980px;
	margin: 10px 0px 0px 250px;
}

#header {
	padding-bottom: 1px;
}

#header div.top {
	margin-bottom: 4px;
	padding: 30px 0 16px;
}

#header h1.title {
	margin: 0 50px 0 100px;
}

#header a.square_btn_mypage {
	font-size: 200%;
	position: absolute;
	right: 50px;
	top: 50px;
	display: inline-block;
	padding: 0.5em 1em;
	text-decoration: none;
	border-radius: 3px;
	font-weight: bold;
	color: #FF0;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #0085C9 0%, #604dff 100%);
	transition: .4s;
}

#main {
	float: right;
	width: 660px;
}

#main div.calender {
	font-size: 150%;
	text-align: center;
}

#main div.NewsList {
	margin: 30px 0;
	width: 140%;
	font-size: 200%;
	text-align: center;
}

#main  p.month {
	margin: 0px 0px 0px 240px;
	font-size: 150%;
}

#main div.calender a.monthsize {
	font-size: 150%;
}

#main table.calendermain {
	border: 1px solid #000;
	width: 140%;
	height: 100%;
	border-collapse: collapse;
	float: center;
}

#main td {
	width: 14%;
	vertical-align: top;
	border-right: 1px solid #ccc;
}

#main td.week {
	color: #FFF;
	background-color: #55aaff;
	text-align: center;
	font-size: 150%;
}

#main td.sunday {
	color: #ff0000;
	background-color: #55aaff;
	text-align: center;
	font-size: 150%;
}

#main td.day {
	background-color: #95c9ff;
	font-weight: bold;
	text-align: center;
	border-top: 1px solid #ffffff;
	font-size: 100%;
}

#main holiday {
	background-color: #95c9ff;
	text-align: center;
}

#main table.calendermain td.sche {
	/*background-color: #95c9ff;*/
	font-weight: bold;
	text-align: center;
	height: 100px;
}

#main table.homeNewsList {
	border: 1px solid #000;
	width: 125%;
}

#main table.homeNewList caption {
	/*border: 1px solid #ffffff;*/
	background-color: #0099f4;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 150%;
}

#main table.homeNewList td {
	text-align: center;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 100%;
}

#main table.homeNewList tr:nth-child(even) td {
	background-color: #eaeff7;
}

#main table.homeNewList tr:nth-child(odd) td {
	background-color: #d7e2f4;
}

#nav {
	width: 300px;
	margin: 0 50px 0 -70px;
}

#nav a.square_btn {
	width: 250px;
	font-size: 200%;
	display: inline-block;
	padding: 0.7em 1.5em;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
	color: #FF0;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #0085C9 0%, #604dff 100%);
	transition: .4s;
}

#nav a.square_btn2 {
	width: 250px;
	font-size: 200%;
	display: inline-block;
	padding: 0.7em 1.5em;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
	color: #FF0;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #0085C9 0%, #604dff 100%);
	transition: .4s;
}

#nav a.square_btn3 {
	width: 250px;
	font-size: 200%;
	display: inline-block;
	padding: 0.7em 1.5em;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
	color: #FF0;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #0085C9 0%, #604dff 100%);
	transition: .4s;
}
</style>
<body>

	<div id="header">
		<div class="top">
			<div class="container">
				<h1 class="title">
					<img src="../MNB/titlelogo2-1.png" alt="タイトル" width="1200"
						height="200">
				</h1>
				<a href="#" onClick="location.href = 'myPage.jsp'"
					class="square_btn_mypage">マイページ</a>
			</div>
		</div>
	</div>
	<!-- ヘッダ終わり -->
	<!-- コンテンツ開始 -->
	<div id="content">
		<div class="container">
			<div id=main>
				<div class="calender">
					<p class="month">
						<a href="/MNB/MakeCalender?YEAR=<%=year%>&MONTH=<%=month - 1%>"><span>前月</span></a>
						<a class="monthsize"><%=month%>月</a> <a
							href="/MNB/MakeCalender?YEAR=<%=year%>&MONTH=<%=month + 1%>"><span>翌月</span></a>
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
							//日付部分
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

								//情報部分
								int beansPointer = 0;
								for (int i = 0; i < 7; i++) {
									//描画対象の月以外の部分はリンクを作らない
									if (pointer < 1 || pointer > thisMonthLastDay) {
										out.println("<td class=\"sche\"></td>");
										pointer++;
									} else {
										//描画している日付にデータが存在しているなら、タイトルと班名を描画
										if (beans[beansPointer] != null && pointer == beans[beansPointer].getDay()) {

											/*班による色表示を変える*/
											String han = beans[beansPointer].getHan();
											if (str1.equals(han))
												out.println("<td class=\"sche\" bgcolor= #ee87b4><a href=\"/MNB/AccsessContents?YEAR="
														+ year + "&MONTH=" + month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\">"
														+ beans[beansPointer].getTitle() + "</a></td>");
											else if (str2.equals(han))
												out.println("<td class=\"sche\" bgcolor= #7fff00><a href=\"/MNB/AccsessContents?YEAR="
														+ year + "&MONTH=" + month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\">"
														+ beans[beansPointer].getTitle() + "</a></td>");
											else if (str3.equals(han))
												out.println("<td class=\"sche\" bgcolor= #00a0e9 ><a href=\"/MNB/AccsessContents?YEAR="
														+ year + "&MONTH=" + month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\">"
														+ beans[beansPointer].getHan() + "<br>" + beans[beansPointer].getTitle()
														+ "</a></td>");
											else if (str4.equals(han))
												out.println("<td class=\"sche\" bgcolor= #f2e55c><a href=\"/MNB/AccsessContents?YEAR="
														+ year + "&MONTH=" + month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\">"
														+ beans[beansPointer].getTitle() + "</a></td>");
											/*例外：どの班にも所属してなかったら*/
											else
												out.println("<td class=\"sche\"><a href=\"/MNB/AccsessContents?YEAR=" + year + "&MONTH="
														+ month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\">"
														+ beans[beansPointer].getTitle() + "</a></td>");
											beansPointer++;
										} else {
											//データが無ければリンクを作るだけ
											out.println("<td class=\"sche\"><a href=\"/MNB/AccsessContents?YEAR=" + year + "&MONTH="
													+ month + "&DAY=" + pointer + "&DAYOFTHEWEEK=" + i + "\"></a></td>");
										}
										pointer++;
									}
								}
								out.println("</tr>");
							}
						%>
					</table>


					<br> <br> <br>
					<table class="homeNewList">
						<caption>
							<a href="/MNB/InformationListController"><u>お知らせ</u></a>
						</caption>
						<%
							//最新のものから表示
							if (infoList.size() > 0) {
								for (int i = infoList.size() - 1; i >= 0; i--) {
									out.println("<tr>");
									//タイトルをクリックすると内容を表示
									out.println("<td><a href = \"InformationAssignment?TYPE=display&ID=" + infoList.get(i).getId()
											+ "\">" + infoList.get(i).getTitle() + "</a></td>");
									out.println("</tr>");
									//最新5件まで表示
									if (i <= infoList.size() - 5) {
										break;
									}
								}
							} else {
								out.println("<tr><td>");
								out.println("お知らせはありません。");
								out.println("</td></tr>");
							}
						%>

					</table>
					<br>
					<br>
					<br>
					</div>
					</div>
					<div id=nav>
						<div class="SCQ">
							<a href="#"
								onClick="location.href = './AccsessQuestions?TYPE=kosyu'"
								class="square_btn">講習アンケート</a>
						</div>
						<br> <br> <br>
						<div class="EQ">
							<a href="#"
								onClick="location.href = './AccsessQuestions?TYPE=event'"
								class="square_btn2">イベントアンケート</a>
							<!-- 	<a href="#"  onClick = "location.href = '/MNB/AccsessQuestions?TYPE=event'" class="square_btn">イベントアンケート</a>	-->
						</div>
						<br> <br> <br>
						<div class="OFS">
							<a href="http://www.sg.dendai.ac.jp/s1g-src/" class="square_btn3">公式サイト</a>
						</div>

						<br> <br> <br>
						<div class="Twitter">
							<!-- 以下ウィジェット(SRC公式) -->
							<a class="twitter-timeline" width="300px" height="400px"
								href="https://twitter.com/sofken_tdu">Tweets by @sofken_tdu</a>
							<script async src="//platform.twitter.com/widgets.js"
								charset="utf-8"></script>
						</div>
					</div>
				</div>
			</div>
</body>
</html>