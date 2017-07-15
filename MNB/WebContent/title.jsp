<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body{
	background-color: #ceecff;
	margin:0px;
	min-width: 1260px; /* 全体の最小幅 */
	height:100%;
	margin: 0;
	padding: 0;
}

#header div.container,
{
	width: 1260px;
	margin: 0 auto;
}

#header div.top{
	margin-bottom: 4px;
	padding: 30px 0 16px;
}
#header div.top div.container {
position: relative; /* 相対配置（ガイドメニューのために設定） */
}
#header h1.title{
margin:0 50px 0 100px;
}

a.title{
margin:30px 0px 0px 130px;
}
.square_btn_mypage{
	position:absolute;right:30px;top:30px;
    display: inline-block;
    padding: 0.5em 1em;
    text-decoration: none;
    border-radius: 3px;
    font-weight: bold;
    color: #FF0;
    background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #0085C9 0%, #604dff 100%);
    transition: .4s;
}
</style>
<title>Insert title here</title>

</head>
<body>
<div id=header>
		<div class="top">
			<div class="container">
	 			<h1 class="title">
	 			<img src = "../MNB/titlelogo2-1.png" alt="タイトル" width="1200" height="200" >
	 			</h1>
			</div>
		</div>
	</div>
		<a href="#"  onClick = "location.href = 'myPage.jsp'" class="square_btn_mypage">マイページ</a>

</body>
</html>