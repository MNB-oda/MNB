<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String han[] = { "プログラム班", "2DCG班", "3DCG班", "サウンド班" };
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>スケジュール追加</title>

<style>
body {
	background-color: #dbf1ff;
	text-align: center;
}

table {
	border: 1px solid #000000;
	border-collapse: collapse;
	margin-left:auto;margin-right:auto;
	width: 80%;
}

td {
	border: 1px solid #000000;
	text-align: left;
}


div {
	text-align: right;
}

.widthMax {
	width: 100%;
}

</style>

</head>
<body>

	<form method="post" action="">
		<table>
		<caption><div><input type="button" name="CLOSE" value="閉じる"></div>追加</caption>

			<tr>
				<td>講習班</td>
				<td><select name="HAN">
						<%
							for (int i = 0; i < han.length; i++) {
								out.println("<option value = \"");
								out.println(han[i]);
								out.println("\"");
								if (i == 0) {
									out.println("selected");
								}
								out.println(">");
								out.println(han[i]);
								out.println("</option>");
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>講習回</td>
				<td>第<input type="text" name="NUMBER" value="" size="2" maxlength="3"> 回
				</td>
			</tr>

			<tr>
				<td>講習タイトル</td>
				<td><input type="text" name="TITLE" value="" maxlength="100" class = "widthMax"></td>
			</tr>

			<tr>
				<td>日時</td>
				<td></td>
			</tr>

			<tr>
				<td>場所</td>
				<td><input type="text" name="PLACE" value="" maxlength="100" class = "widthMax"></td>
			</tr>

			<tr>
				<td>持ち物</td>
				<td><input type="text" name="BELONGINGS" value="" maxlength="100" class = "widthMax"></td>
			</tr>

			<tr>
				<td>対象者</td>
				<td><input type="text" name="SUBJECTS" value="" maxlength="100" class = "widthMax"></td>
			</tr>

			<tr>
				<td>関係者連絡先</td>
				<td><textarea name="CONTACT" rows="3"  wrap="virtual" class = "widthMax"></textarea></td>
			</tr>

			<tr>
				<td>講習概要</td>
				<td><textarea name="CONTENT" rows="5"  wrap="virtual" class = "widthMax"></textarea></td>
			</tr>
		</table>

		<p>
			<input type="submit" name="CONFIRM" value="確定">
		<p>
	</form>
</body>
</html>
