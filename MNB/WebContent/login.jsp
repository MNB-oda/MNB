<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login画面</title>
</head>
<body>

	<%
		if (session.getAttribute("login") != null && !(Boolean) session.getAttribute("login")) {
			out.println("<p>ユーザ名またはパスワードが違います</p>");
		}
	%>


	<div align="center">
		<p>
			<font size="7">＊日程管理システム</font>
		</p>
		<p>東京電機大学 ソフトウェア研究部</p>
		<form action="StudentLogin" method="post">
			<dl>
				<br>
				<dt>学籍番号</dt>
				<dd>
					<input type="text" name="id" />
				</dd>
				<br>
				<dt>Password</dt>
				<dd>
					<input type="password" name="pass" />
				</dd>
			</dl>
			<br>
			<button type="submit" name="login">ログイン</button>
		</form>
	</div>
</body>
</html>