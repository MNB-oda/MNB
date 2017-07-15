<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>


body {
	background-color: #ceecff;
	margin:0px;
	min-width: 1260px; /* 全体の最小幅 */
	height:100%;
	margin: 0;
	padding: 0;
}

#header div.container,
#content div.container,
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

#content{
padding:35px 0px 10px
}




#nav{
	float:center;
	width:400px;
}

#nav div.SCQ{
	padding:2px;
}

/*--------------------------------------------------------*/



/*ボタン---------------------------------------------------------------------------------------*/
/*ボタン1*/
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
.square_btn{
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
.square_btn:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #709dff 50%, #604dff 100%);
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

/*Twitter*/
.fl_tw2{/*ボタンの背景*/
  color: #FFF;/*文字・アイコン色*/
  border-radius: 7px;/*角丸に*/
  display: inline-block;
  height: 50px;/*高さ*/
  width: 400px;/*幅*/
  text-align: center;/*中身を中央寄せ*/
  font-size: 25px;/*文字のサイズ*/
  line-height: 50px;/*高さと合わせる*/
  vertical-align: middle;/*垂直中央寄せ*/
  background: #1da1f3;
  overflow: hidden;/*はみ出た部分を隠す*/
  text-decoration:none;/*下線は消す*/
}

.fl_tw2 .fa-twitter {
    text-shadow: 2px 2px 0px #4287d6;
    font-size: 30px;
}

.fl_tw2 span {/*テキスト*/
  display:inline-block;
  transition: .5s}

.fl_tw2:hover span{/*ホバーで一周回転*/
  -webkit-transform: rotateX(360deg);
  -ms-transform: rotateX(360deg);
  transform: rotateX(360deg);
}

a.title{
margin:30px 0px 0px 130px;
}

</style>
<title>Insert title here</title>

</head>
<body>
<div id=nav>
				<div class="SCQ">
			<a href="#"  onClick = "location.href = 'questionInfo.jsp?TYPE=kosyu'" class="square_btn">講習アンケート</a>
				</div>
			<br>
			<br>
			<br>
				<div class="EQ">
			<a href="#"  onClick = "location.href = 'eventQuestionList.jsp?TYPE=event'" class="square_btn">イベントアンケート</a>
			<!-- 	<a href="#"  onClick = "location.href = '/MNB/AccsessQuestions?TYPE=event'" class="square_btn">イベントアンケート</a>	-->
				</div>
			<br>
			<br>
			<br>
					<div class="OFS">
				<a href="http://www.sg.dendai.ac.jp/s1g-src/" class="square_btn">公式サイト</a>
					</div>

			<br>
			<br>
    		<br>
				<div class="Twitter">
	 			<!-- 以下ウィジェット(SRC公式) -->
				<a class="twitter-timeline" width = "300px" height = "400px"
	 			href="https://twitter.com/sofken_tdu">Tweets by @sofken_tdu</a>
				<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
				</div>
			</div>
</body>
</html>