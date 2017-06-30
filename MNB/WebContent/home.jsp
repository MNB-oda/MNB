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

/*botton*/
.square_btn{
    display: inline-block;
    padding: 0.5em 1em;
    text-decoration: none;
    border-radius: 3px;
    font-weight: bold;
    color: #FFF;
    background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
    transition: .4s;
}

.square_btn:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
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

	<Div Align = center>
	<a href="#"  onClick = "location.href = '/MNB/AccsessQuestions?TYPE=kosyu'" class="square_btn">講習アンケート</a>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="#"  onClick = "location.href = '/MNB/AccsessQuestions?TYPE=event'" class="square_btn">イベントアンケート</a>
	</Div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

<Div Align = center>
	<a href="#" class="square_btn">公式サイト</a>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="#" class="fl_tw2">
  	<span>ソフ研 公式Twitter(@sofken_tdu)</span>
	</a>

	</Div>

</body>
</html>

