<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.StudentBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	StudentBean studentBean = (StudentBean) session.getAttribute("student");
	String title = studentBean.getId();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>削除確認</title>
<style>
body {
	background-color: #ceecff;
	text-align: center;
}

div {
	text-align: right;
}
</style>
</head>
<body>
	<form method = "post" action="./StudentDatabaseProcessing">
		<caption>
			<div>
				<input type="button" name="CLOSE" onClick = window.close() value="閉じる">
			</div>
			削除
		</caption>

		<p>
			<%
				out.println(title + "を削除しますか？");
			%>
		</p>

		<p>
			<input type="submit" name="CONFIRM" value="確定">
		<p>
	</form>
</body>
</html>