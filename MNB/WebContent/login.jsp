<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SRCES-login-</title>
<style>
body{
	font:21px;
}
.notice{
	width:100%;
	background-color: #ffffff;
	color:#e34848;
	position: fixd;
	margin-top:20px;
	font-size:30px;
	font-weight:bold;
	height:45px;
}
.notice p{
	text-align:center;
	line-height:45px;
}
p{
	margin:0 0 5px;
}

#header div.title{
	margin:55px 50px 0 100px;
}
#main {
	 margin-left:auto;    /* 左側マージンを自動的に空ける */
     margin-right:auto;   /* 右側マージンを自動的に空ける */
     text-align:center;     /* 中身を中央表示に戻す */
     width:960px;         /* 幅を決定する */
}

#main div.form-bg{
	width:400px;
	height:300px;
	border-radius:10px;
	margin:10px auto 0;
	padding:0px 0 0 8px;

}

#main .form-bg form h2{
		font-size: 45px;
		font-weight: bold;
		color: #555555;
		font-family:"HelveticaNeue", "Helvetica Neue", Helvetica, Arial, sans-serif;
		text-shadow: 0 4px 0 #fff;
		filter: dropshadow(color=#fff, offx=0, offy=1);
		line-height: 45px;
		margin-bottom: 25px;
		margin-left:5px;
}
#main .form-bg dt{
		font-size: 30px;
		font-family:"HelveticaNeue", "Helvetica Neue", Helvetica, Arial, sans-serif;
		text-shadow: 0 4px 0 #fff;

}

#main input[type="text"], input[type="password"]{
		box-shadow: 0px 0px 0px 4px #f2f5f7;
		width: 310px;
		height: 33px;

		padding: 0 10px 0 10px;
		margin: 10px auto;
		border: 1px solid #bec2c4;
	}

#main button {
  position:relative;

  margin-bottom:10px;
  margin-left: 35px;
  padding:17px;
  width:290px;
  font-size:1.2em;
  background:#f26964;
  color:#f4f4f4;
  box-shadow:0px 3px 0px #ab4b47;
  cursor:pointer;
}

#main button:active {
  top:3px;
  box-shadow:none;
}

#main footer{
	margin:50px 10px 50px 30px;

	font-size: 30px;
	font-family:"HelveticaNeue", "Helvetica Neue", Helvetica, Arial, sans-serif;
	text-shadow: 0 4px 0 #fff;

}

</style>
</head>
<body>
	<div class="notice">
	<%
		if (session.getAttribute("login") != null && !(Boolean) session.getAttribute("login")) {
			out.println("<p>学籍番号 または パスワード が違います!</p>");
		}
	%>
	</div>
	<div id=header>
	<div class="title" align="center">
		<h1><img src = "../MNB/titlelogo2-1.png" alt="タイトル" width="1050" height="200" ></h1>
		<br>
		</div>
	</div>
		<div id=main>
			<div class="form-bg">
		<form action="StudentLogin" method="post">
		<h2><img src = "../MNB/login.png" alt="ログイン" width="40" height="40" >Login</h2>
			<dl>
				<dt>学籍番号</dt>
				<dd>
					<input type="text" name="id" class="id"/>
				</dd>

				<dt>Password</dt>
				<dd>
					<input type="password" name="pass" class="pass"/>
				</dd>
			</dl>
			<br>
			<button type="submit" name="login" class="login">Login</button>
		</form>
		<footer>
		supported by Team.MNB
		</footer>
		</div>
	</div>
</body>
</html>