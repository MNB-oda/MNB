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
	background-color: #ceecff;
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
</style>
</head>
<body>
	<div align = "right">
	<input class = "button" type="button" name="CLOSE" value="閉じる">
	</div>
	<form method="post" action="">
		<table class="contents">
			<tr>
				<td colspan="3"><%= bigBean.getTitle()%></td>
			</tr>
			<%
			//contentBeansのどこまで描画しているかの変数
			int pointer =0;

			//アンケート描画
			for(int i=0; i<smallBeans.size(); i++){
				out.println("<tr>");
				out.println("<td>" + smallBeans.get(i).getTitle() + "</td>");
				out.println("<td>");

				//アンケートの選択形式で描画を変更
				switch(smallBeans.get(i).getQuestionType()){

				//単体選択（ラジオボタン）
				case "単体":
					for(int j=pointer; j<contentBeans.size(); j++){
						//今描こうとしてる部分の列が現在書いてる列のものじゃなかったら、pointerを更新して描画終了
						if(contentBeans.get(j).getRow() != i+1){
							pointer = j;
							break;
						}
						out.println("<input type=\"radio\" name=\"q" + i + "\" value=\""+ contentBeans.get(j).getContent() + "\" />" + contentBeans.get(j).getContent());
					}
					break;

				//複数選択（セレクトボックス）
				case "複数":
					for(int j=pointer; j<contentBeans.size(); j++){
						//上と同様
						if(contentBeans.get(j).getRow() != i+1){
							pointer = j;
							break;
						}
						out.println("<input type=\"checkBox\" name=\"q" + i + "\" value=\""+ contentBeans.get(j).getContent() + "\" />" + contentBeans.get(j).getContent());
					}
					break;

				//自由記入（テキストボックス）
				case "自由":
					out.println("<textarea name=\"q" + i + "\" rows=\"4\" cols=\"40\"></textarea>");
					//たぶんここがおかしい
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
		<input type="submit" name="answer" value="送信">
		<br>
	</form>
</body>
</html>