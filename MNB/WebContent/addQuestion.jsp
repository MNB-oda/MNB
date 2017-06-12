<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>アンケート追加</title>



<style>
body {
	background-color: #ceecff;
	text-align: center;
}

table {
	border: 1px solid #ffffff;
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

td {
	border: 1px solid #ffffff;
	text-align: left;
	vertical-align: top;
}

.question tr:nth-child(even) td, th {
	background-color: #d7e2f4;
}

.question tr:nth-child(odd) td, th {
	background-color: #eaeff7;
}

.question tr:first-child td {
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
	<form action="post" method ="">
		<p>
			<input type="button" name="CLOSE" value="閉じる">
		<p>
		</form>


		<table class = question>
			<tr>
				<td>タイトル</td>
				<td> <input type="text" name="TITLE" value="" maxlength="100" class="widthMax"></td>
			</tr>
			<tr>
				<td>アンケート種類</td>
				<td><input type = "radio" name = "QUESTIONTYPE" value = "講習アンケート" checked>講習アンケート
					<input type = "radio" name = "QUESTIONTYPE" value = "イベントアンケート">イベントアンケート
				</td>
			</tr>
			<tr>
				<td>１．<input type="text" name="QUESTION" value="" maxlength="100" class="widthMax"></td>
				<td><input type = "radio" name = "TYPE" value = "単体" checked>単体
					<input type = "radio" name = "TYPE" value = "複数">複数
					<input type = "radio" name = "TYPE" value = "自由">自由
					<p>

					項目数<select name="KOMOKUSU" id = "KOMOKUSU">
							<option value = "1" selected>１</option>
							<option value = "2">２</option>
							<option value = "3">３</option>
						</select>
						<p>
					１．<input type="text" name="ANSWER" value="" maxlength="100" class="widthMax">
				</td>
			</tr>
		</table>

		<p>
			<input type="submit" name="CONFIRM" value="確定">
		<p>
</body>
</html>

