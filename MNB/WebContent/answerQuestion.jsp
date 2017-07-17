<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="model.BigQuestionBean"%>
<%@ page import="model.SmallQuestionBean"%>
<%@ page import="model.QuestionContentBean"%>
<%@ page import="java.util.ArrayList"%>
<%
BigQuestionBean bigBean = (BigQuestionBean)request.getAttribute("bigBean");
ArrayList<SmallQuestionBean> smallBeans = (ArrayList<SmallQuestionBean>)request.getAttribute("smallBeans");
ArrayList<QuestionContentBean> contentBeans = (ArrayList<QuestionContentBean>)request.getAttribute("contentBeans");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>アンケート回答</title>
<!--  <link rel="stylesheet" type="text/css" href="main.css"> -->
<%

%>
<style>
body {

	text-align: center;
}

table {
	border: 2px solid #ffffff;
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

td {
	border: 1px solid #ffffff;
}

th {
	border: 1px solid #ffffff;
}

.button {
	text-align: center;
}

.button tr:first-child td {
	background-color: #0099f2;
	color: #ffffff;
}

.button tr:nth-child(even) td {
	background-color: #d7e2f4;
}

.contents td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
}

.contents th {
	text-align: left;
	padding-right: 20px;
}

.contents tr:nth-child(even) td, th {
	background-color: #d7e2f4;
}

.contents tr:nth-child(odd) td, th {
	background-color: #eaeff7;
}

.contents tr:first-child td {
	background-color: #0099f2;
	color: #ffffff;
}


a.square_btn_back{
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
	color: #000;
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
	<div Align = "right">
	<a  onclick = history.back()   class="square_btn_back">戻る</a>
	</div>
	<br>
	<br>
	<form name = "answerQuestion" method="post" action="./AnswerDatabaseProcessing">
	<input type='hidden' name='questionID' value=<%= bigBean.getId() %>>
		<table class="contents">
			<tr>
				<td colspan="3"><%= bigBean.getTitle()%></td>
			</tr>
			<%
			//contentBeansのどこまで描画しているかの変数
			int pointer = 0;

			//回答の番号
			int answerNumber;

			//アンケート描画
			for(int i=0; i<smallBeans.size(); i++){
				out.println("<tr>");
				out.println("<td>" + smallBeans.get(i).getTitle() + "</td>");
				out.println("<td>");

				//アンケートの選択形式で描画を変更
				switch(smallBeans.get(i).getQuestionType()){

				//単体選択（ラジオボタン）
				case "単体":
					answerNumber = 1;
					for(int j=pointer; j<contentBeans.size(); j++){
						//今描こうとしてる部分の列が現在書いてる列のものじゃなかったら、pointerを更新して描画終了
						if(contentBeans.get(j).getRow() != i+1){
							pointer = j;
							break;
						}
						out.println("<input type=\"radio\" name=\"q" + i + "\" value=\""+ answerNumber + "\" />" + contentBeans.get(j).getContent());
						out.println("<input type=\"hidden\" name=\"q"+ i + "type\" value=\"radio\">");
						answerNumber++;
					}
					break;

				//複数選択（セレクトボックス）
				case "複数":
					answerNumber = 1;
					for(int j=pointer; j<contentBeans.size(); j++){
						//上と同様
						if(contentBeans.get(j).getRow() != i+1){
							pointer = j;
							break;
						}
						out.println("<input type=\"checkBox\" name=\"q" + i + "\" value=\""+ answerNumber + "\" />" + contentBeans.get(j).getContent());
						out.println("<input type=\"hidden\" name=\"q"+ i +"type\" value=\"select\">");
						answerNumber++;
					}
					break;

				//自由記入（テキストボックス）
				case "自由":
					out.println("<textarea name=\"q" + i + "\" rows=\"4\" cols=\"40\"></textarea>");
					out.println("<input type=\"hidden\" name=\"q"+ i +"type\" value=\"free\">");
					pointer++;
					break;

				default:
					break;
				}

				out.println("</td>");
				out.println("</tr>");
			}
			%>
		</table>
		<br>
		<a href="javascript:document.answerQuestion.submit()" class="square_btn_decide">送信</a>
		<input type="hidden" name="answer" value="送信">
		<br>
	</form>
</body>
</html>