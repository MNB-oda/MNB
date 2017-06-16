<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String title = "[5/3]学術発表会について";
	String content = "あああああおおおおおみょんみょんみょんみょん";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>お知らせ詳細情報</title>

<style>
body {
	background-color: #ceecff;
	text-align: center;
}

table {
	border: 1px solid #ffffff;
	margin-left:auto;margin-right:auto;
	width: 80%;
}

td {
	border: 1px solid #ffffff;
	text-align: left;
}
th {
	border: 1px solid #ffffff;
}

div {
	text-align: right;
}

.contents td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.contents th {
	text-align: left;
	padding-right: 20px;
}

.contents tr:nth-child(even) td ,th{
	background-color: #eaeff7;
}

.contents tr:nth-child(odd) td ,th{
	background-color: #d7e2f4;
}

.widthMax {
	width: 100%;
}



</style>

</head>
<body>

	<form method="post" action="">
		<table class= "contents">
		<caption><div><input type="button" name="CLOSE" value="閉じる"></div></caption>

			<tr>
				<td style="background:#5a9bd5">
					<%
						out.println(title);
					%>
				</td>
			</tr>

			<tr>
				<td>
					<%
						out.println(content);
					%>
				</td>
			</tr>
		</table>

		<p>
			<input type="submit" name="CONFIRM" value="確定">
		<p>
	</form>
</body>
</html>
