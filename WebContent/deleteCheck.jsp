<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.ScheduleBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ScheduleBean bean = (ScheduleBean) session.getAttribute("bean");
	String title = bean.getHan() + " 第" + bean.getNumber() + "回 " + " " + bean.getTitle() + " "
			+ bean.getMonth() + "月" + bean.getDay() + "日 (" + bean.getDayOfTheWeek() + ")";
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
	<form method = "post" action="./DatabaseProcessing">
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