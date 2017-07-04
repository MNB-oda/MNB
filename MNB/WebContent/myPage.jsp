<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.StudentBean"%>
<%
	String handle = (String) request.getAttribute("handle");
	String name = (String) request.getAttribute("name");
	String id = (String) request.getAttribute("id");
	String pass = (String) request.getAttribute("pass");
	String email = (String) request.getAttribute("email");
	String group = (String) request.getAttribute("group");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>マイページ</title>
<style>


body {
	background-color: #ceecff;
	text-align: center;
}

table {
	border: 1px solid #ffffff;
	margin-left:auto;margin-right:auto;margin-center:auto;
	width: 80%;
}

td {
	border: 1px solid #ffffff;
	text-align: left;
}

.myPageTable td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.myPageTable caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.myPageTable th {
	text-align: center;
}

.myPageTable tr:nth-child(even) td {
	background-color: #eaeff7;
}

.myPageTable tr:nth-child(odd) td {
	background-color: #d7e2f4;
}


.widthMax {
	width: 100%;
}
/*ボタン2*/
.square_btn2{
    display: inline-block;
    padding: 0.5em 1em;
    text-decoration: none;
    border-radius: 3px;
    font-weight: bold;
    color: #FFF;
    background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #0085C9 0%, #604dff 100%);
    transition: .4s;
}

.square_btn2:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #709dff 50%, #604dff 100%);
}



</style>

</head>
<body>
	<p><font size ="5">ソフトウェア研究部</font></p>


	<p>マイページ</p>
	<Div Align = left>
	<a href="#"  onClick = "location.href = 'studentList.jsp'" class="square_btn2">登録者一覧へ</a>
	</Div>
		<table class= "myPageTable">
			<caption>登録者一覧</caption>

			<tr>
				<td>ハンドルネーム</td>
				<td><%=handle %></td>
			</tr>

			<tr>
				<td>本名</td>
				<td><%=name %></td>
			</tr>

			<tr>
				<td>学籍番号</td>
				<td><%=id %></td>
			</tr>

			<tr>
				<td>パスワード</td>
				<td><%=pass %></td>
			</tr>

			<tr>
				<td>メールアドレス</td>
				<td><%=email %></td>
			</tr>

			<tr>
				<td>所属班</td>
				<td><%=group %></td>
			</tr>

	</table>

		<p>
			<input type="submit" name="CONFIRM" onclick="location.href = '/MNB/StudentAssignment?TYPE=update'"value="変更">
		<p>

</body>
</html>