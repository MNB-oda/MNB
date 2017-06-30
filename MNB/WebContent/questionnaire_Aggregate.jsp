<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>＊日程管理システム・アンケート集計</title>
<style>
body {
	background-color: #ceecff;
}

.table1 {
	font-size: 20px;
	border: 2px solid #ffffff;
	width: 80%;
}
.table1 tr:nth-child(even) td {
	background-color: #eaeff7;
}
.table1 tr:nth-child(even) th {
	background-color: #eaeff7;
}
.table1 tr:nth-child(odd) td {
	background-color: #d7e2f4;
}
.table1 tr:nth-child(odd) th {
	background-color: #d7e2f4;
}

.table2{
	font-size: 20px;
	border: 5px solid #ffffff;
	width: 90%;
}
.table2 caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.table2 tr:nth-child(even) td {
	background-color: #eaeff7;
}
.table2 tr:nth-child(even) th {
	background-color: #eaeff7;
}

.table2 tr:nth-child(odd) td {
	background-color: #d7e2f4;
}

.table2 tr:nth-child(odd) th {
	background-color: #d7e2f4;
}
.table3{
	font-size: 20px;
	border: 5px solid #ffffff;
	width: 90%;
}
.table3 caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.table3 tr:nth-child(even) td {
	background-color: #eaeff7;
}
.table3 tr:nth-child(even) th {
	background-color: #eaeff7;
}

.table3 tr:nth-child(odd) td {
	background-color: #d7e2f4;
}

.table3 tr:nth-child(odd) th {
	background-color: #d7e2f4;
}
td {
	border: 1px solid #000000;
}

th {
	border: 1px solid #000000;
}
</style>
</head>

<body>

<div Align = "right">
<input type="button" name="CLOSE" onclick="window.close()" value="閉じる" >
</div>
<br>

<table class = "table1" align = "center">
			<tr>
				<td>タイトル</td>
				<th>[5/2]第2回　プログラム班講義アンケート</th>
			</tr>
			<tr>
				<td>回答者</td>
				<th>22人</th>
			</tr>
			</table>
			<br>
			<br>
<table class = "table2" align = "center">

	<caption>1.今回の講義開始時刻はどうでしたか？</caption>
	<tr>
	<td>早すぎ</td>
	<td>5</td>
	</tr>
	<tr>
	<td>ちょうど良い</td>
	<td>5</td>
	</tr>
	<tr>
	<td>遅い</td>
	<td>5</td>
	</tr>
	<tr>
	<td>無回答</td>
	<td>7</td>
	</tr>

</table >

<table class = "table3" align = "center">
	<caption>2.今回の講義資料時刻はどうでしたか？</caption>
	<tr>
	<td>早すぎ</td>
	<td>7</td>
	</tr>
	<tr>
	<td>ちょうどいい</td>
	<td>7</td>
	</tr>
	<tr>
	<td>遅い</td>
	<td>7</td>
	</tr>
	<tr>
	<td>無回答</td>
	<td>1</td>
	</tr>
</table>
</body>
</html>