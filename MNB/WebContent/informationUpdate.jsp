<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>お知らせ追加・更新</title>

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
	text-align: left;
	vertical-align: top;
}

.information tr:nth-child(even) td, th {
	background-color: #d7e2f4;
}

.information tr:nth-child(odd) td, th {
	background-color: #eaeff7;
}

.information tr:first-child td {
	background-color: #0099f2;
	color: #ffffff;
}

.widthMax {
	width: 90%;
}

.button {
	text-align: right;
}

</style>

</head>
<body>
	<form action="post" method="">
		<p>
			<input type="button" name="CLOSE" value="閉じる">
		<p>
		<table class = information>
			<tr>
				<td>タイトル</td>
				<td>[5/3]  <input type="text" name="TITLE" value="学術発表会について" maxlength="100" class="widthMax"></td>
			</tr>
			<tr>
				<td>概要</td>
				<td><textarea name="CONTENT" rows="15"  wrap="virtual" class = "widthMax">概要ぶちこめやオラァ!!</textarea></td>
			</tr>
		</table>

		<p>
			<input type="submit" name="CONFIRM" value="確定">
		<p>
	</form>
</body>
</html>