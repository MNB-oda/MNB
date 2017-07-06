<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.InformationBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	InformationBean bean = (InformationBean) session.getAttribute("bean");
	String title = bean.getTitle();
	session.setAttribute("bean", bean);
	session.setAttribute("type", "delete");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>お知らせ削除確認</title>
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
	<form action="./InformationDatabaseProcessing" method = "post">
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