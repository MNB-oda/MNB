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
<title>スケジュール管理</title>

<style>


body {
	background-color: #ceecff;
	margin:0px;
}
#header h1.title{
   margin: 0px 0px 0px 170px;
}

#calender p.month{

	font-size: 225%;
	margin: 0 auto;
	text-align: center;
}

#calender a.monthsize{
	font-size: 1.5em;
	font-size: 150%;
}

table {
	border: 1px solid #000;
	width: 90%;
	border-collapse: collapse;
	margin-left:68px;
}

td {
	width: 14%;
	vertical-align: top;
	border-right: 1px solid #ccc;


}

td.week {
	color: #FFF;
	background-color: #55aaff;
	text-align: center;
	font-size:200%;
}

td.sunday {
	color: #ff0000;
	background-color: #55aaff;
	text-align: center;
	font-size:200%;
}

td.day {
	background-color: #95c9ff;
	font-weight: bold;
	text-align: center;
	border-top: 1px solid #ffffff;
	font-size:175%;
}

td.holiday {
	background-color: #95c9ff;
	text-align: center;

}

td.sche {
	/*background-color: #95c9ff;*/
	font-weight: bold;
	text-align: center;
	height: 100px;
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
	font-size:125%;
}

.homeNewList caption{
	/*border: 1px solid #ffffff;*/
	background-color: #0099f4;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size:150%;
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
	width: 90%;
}

/*ボタン---------------------------------------------------------------------------------------*/
/*ボタン1*/
.square_btn_mypage{
	position:absolute;right:30px;top:30px;
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
.square_btn{
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
.square_btn:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #709dff 50%, #604dff 100%);
}

/*ボタン2*/
.square_btn2{
    display: inline-block;
    padding: 0.5em 1em;
    text-decoration: none;
    border-radius: 3px;
    font-weight: bold;
    color: #FFF;
    background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #0085C9 0%, #604dff 100%);
    transition: .4s;
}

.square_btn2:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #709dff 50%, #604dff 100%);
}

/*Twitter*/
.fl_tw2{/*ボタンの背景*/
  color: #FFF;/*文字・アイコン色*/
  border-radius: 7px;/*角丸に*/
  display: inline-block;
  height: 50px;/*高さ*/
  width: 400px;/*幅*/
  text-align: center;/*中身を中央寄せ*/
  font-size: 25px;/*文字のサイズ*/
  line-height: 50px;/*高さと合わせる*/
  vertical-align: middle;/*垂直中央寄せ*/
  background: #1da1f3;
  overflow: hidden;/*はみ出た部分を隠す*/
  text-decoration:none;/*下線は消す*/
}

.fl_tw2 .fa-twitter {
    text-shadow: 2px 2px 0px #4287d6;
    font-size: 30px;
}

.fl_tw2 span {/*テキスト*/
  display:inline-block;
  transition: .5s}

.fl_tw2:hover span{/*ホバーで一周回転*/
  -webkit-transform: rotateX(360deg);
  -ms-transform: rotateX(360deg);
  transform: rotateX(360deg);
}

a.title{
margin:30px 0px 0px 130px;
}

</style>

</head>
<body>
<div id=header>
	 <h1 class="title"><img src = "../MNB/titlelogo2-1.png" alt="タイトル" width="1600" height="250" ></h1>

</div>
		<a href="#"  onClick = "location.href = 'myPage.jsp'" class="square_btn_mypage">マイページ</a>

<br>
<br>
 <div id=calender>
	<p class="month">
		<a href="/MNB/MakeCalender?YEAR=<%=year%>&MONTH=<%=month-1%>"><span>前月</span></a>
		<a class="monthsize"><%=month%>月</a>
		<a href="/MNB/MakeCalender?YEAR=<%=year%>&MONTH=<%=month+1%>"><span>翌月</span></a>
	</p>
</div>


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
	<br>
	<br>
	<div id=newsListtable>
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
	<br>
	<br>

	<Div Align = center>
	<a href="#"  onClick = "location.href = 'questionInfo.jsp?TYPE=kosyu'" class="square_btn">講習アンケート</a>

	<br>
	<br>
	<br>

	<a href="#"  onClick = "location.href = 'eventQuestionList.jsp?TYPE=event'" class="square_btn">イベントアンケート</a>
	<!-- 	<a href="#"  onClick = "location.href = '/MNB/AccsessQuestions?TYPE=event'" class="square_btn">イベントアンケート</a>	-->
	</Div>

	<br>
	<br>

<Div Align = center>
	<a href="http://www.sg.dendai.ac.jp/s1g-src/" class="square_btn">公式サイト</a>
	<!-- &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; --> <!--(半角スペース用)-->

	<br>
	<br>
    <br>

	 <!-- 以下ウィジェット(SRC公式) -->
	<a class="twitter-timeline" width = "680px" height = "400px"
	 href="https://twitter.com/sofken_tdu">Tweets by @sofken_tdu</a>
	<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>


	</Div>

</body>
</html>

