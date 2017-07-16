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

p	{
	font-size: 150%;

}

a.square_btn_back{
	width: 150px;
	font-size: 150%;
	text-align: center;
	display: inline-block;
	padding: 0.7em 1.5em;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
	color: #fff;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #ff1d00 0%, #e5001e 100%);
	transition: .4s;
}
a.square_btn_back:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #ff657a 50%, #e790b5 100%);
}


a.square_btn_decide{
	width: 150px;
	font-size: 100%;
	text-align: center;
	display: inline-block;
	padding: 0.7em 1.5em;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
	color: #fff;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #ff1d00 0%, #e5001e 100%);
	transition: .4s;
}
a.square_btn_decide:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #ff657a 50%, #e790b5 100%);
}



</style>

</head>
<body>
	<form name = "delCheck"method = "post" action="./DatabaseProcessing">

		<div Align = "right">
		<a  onclick = history.back()   class="square_btn_back">戻る</a>
		</div>
		<br>
		<br>
		<p> 削除

		<p>
			<%
				out.println(title + "を削除しますか？");
			%>
		</p>

		<p>
			<a href="javascript:document.delCheck.submit()" class="square_btn_decide">確定</a>
			<input type="hidden" name="CONFIRM" value="確定">
		<p>
	</form>
</body>
</html>