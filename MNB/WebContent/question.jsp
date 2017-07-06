<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>アンケート回答</title>
<!--  <link rel="stylesheet" type="text/css" href="main.css"> -->
<style>
body {
	background-color: #ceecff;
	text-align: center;
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
	<div align = "right">
	<input class = "button" type="button" name="CLOSE" value="閉じる">
	</div>
	<form method="post" action="">
		<table class="contents">
			<tr>
				<td colspan="3">第2回　プログラム班講義アンケート</td>
			</tr>
			<tr>
				<td>今回の講義開始時刻</td>
				<td>
				<input type="radio" name="q1" value="早すぎ" />早すぎ
				<input type="radio" name="q1" value="ちょうど良い" />ちょうど良い
				<input type="radio" name="q1" value= "遅い"/>遅い
				</td>
			</tr>
			<tr>
				<td>今回の講義終了時刻</td>
				<td>
				<input type="radio" name="q2" value="早すぎ" />早すぎ
				<input type="radio" name="q2" value="ちょうど良い" />ちょうど良い
				<input type="radio" name="q2" value= "遅い"/>遅い
				</td>
			</tr>
			<tr>
				<td>今回の講義時間</td>
				<td>
				<input type="radio" name="q3" value="短い" />短い
				<input type="radio" name="q3" value="ちょうど良い" />ちょうど良い
				<input type="radio" name="q3" value= "長い"/>長い
				</td>
			</tr>
			<tr>
				<td>今回の講義の難易度</td>
				<td>
				<input type="radio" name="q4" value="難しい" />難しい
				<input type="radio" name="q4" value="ちょうど良い" />ちょうど良い
				<input type="radio" name="q4" value= "簡単すぎ"/>簡単すぎ
				</td>
			</tr>
			<tr>
				<td>Unityを学びたい？</td>
				<td>
				<input type="radio" name="q5" value="はい" />はい
				<input type="radio" name="q5" value="いいえ" />いいえ
				</td>
			</tr>
			<tr>
				<td>次の中から何が作りたい？(複数可)</td>
				<td>
				<input type="checkbox" name="q6" value="2Dゲーム" />2Dゲーム<br>
				<input type="checkbox" name="q6" value="3Dゲーム" />3Dゲーム<br>
				<input type="checkbox" name="q6" value="Winソフトウェア" />Winソフトウェア<br>
				<input type="checkbox" name="q6" value="ここにない" />ここにない<br>
				</td>
			</tr>
			<tr>
				<td>何か質問、要望があればどうぞ(120字)</td>
				<td>
				<textarea name="q7" rows="4" cols="40"></textarea>
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" name="transmission" value="送信">
		<br>
	</form>
</body>
</html>