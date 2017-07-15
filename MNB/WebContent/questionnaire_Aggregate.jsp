<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="model.BigQuestionBean"%>
<%@ page import="model.SmallQuestionBean"%>
<%@ page import="model.QuestionContentBean"%>
<%@ page import="model.AnswerContainer"%>
<%@ page import="java.util.ArrayList"%>
<%
BigQuestionBean bigBean = (BigQuestionBean)request.getAttribute("bigBean");
ArrayList<SmallQuestionBean> smallBeans = (ArrayList<SmallQuestionBean>)request.getAttribute("smallBeans");
ArrayList<QuestionContentBean> contentBeans = (ArrayList<QuestionContentBean>)request.getAttribute("contentBeans");
int respondentAmount = (int)request.getAttribute("respondentAmount");
ArrayList<AnswerContainer> answersAmount = (ArrayList<AnswerContainer>)request.getAttribute("answersAmount");
ArrayList<ArrayList<String>> allFreeAnswer = (ArrayList<ArrayList<String>>)request.getAttribute("allFreeAnswer");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>＊日程管理システム・アンケート集計</title>
<style>
body {
	background-color: #ceecff;
}

.table1 {
	font-size: 20px;
	border: 2px solid #ffffff;
	width: 80%;
}

.table1 tr:nth-child(even) td {
	background-color: #eaeff7;
}

.table1 tr:nth-child(even) th {
	background-color: #eaeff7;
}

.table1 tr:nth-child(odd) td {
	background-color: #d7e2f4;
}

.table1 tr:nth-child(odd) th {
	background-color: #d7e2f4;
}

.answerTable {
	font-size: 20px;
	border: 5px solid #ffffff;
	width: 90%;
}

.answerTable caption {
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.answerTable tr:nth-child(even) td {
	background-color: #eaeff7;
}

.answerTable tr:nth-child(even) th {
	background-color: #eaeff7;
}

.answerTable tr:nth-child(odd) td {
	background-color: #d7e2f4;
}

.answerTable tr:nth-child(odd) th {
	background-color: #d7e2f4;
}
td {
	border: 1px solid #000000;
}

th {
	border: 1px solid #000000;
}
</style>
</head>

<body>

	<div Align="right">
		<input type="button" name="CLOSE" onclick = history.back() value="戻る">
	</div>
	<br>

	<table class="table1" align="center">
		<tr>
			<td>タイトル</td>
			<th><%= bigBean.getTitle() %></th>
		</tr>
		<tr>
			<td>回答者</td>
			<th><%= respondentAmount %>人</th>
		</tr>
	</table>
	<br>
	<br>


	<%
	int contentPointer = 0;
	int answersPointer = 0;
	int freeAnswersPointer = 0;
	for(int i=0; i<smallBeans.size(); i++){

		out.println("<table class=\"answerTable\" align=\"center\">");
		out.println("<caption>" + (i+1) + "." + smallBeans.get(i).getTitle() + "</caption>");

		for(int j=contentPointer; j<contentBeans.size(); j++){
			//描画する回答の行が変わったらbreak
			if(contentBeans.get(j).getRow() != i+1){
				contentPointer = j;
				break;
			}

			//単体選択、複数選択の場合
			if(contentBeans.get(j).getContent() != null){
				out.println("<tr>");
				out.println("<td>" + contentBeans.get(j).getContent() + "</td>");
				out.println("<td>" + answersAmount.get(answersPointer).getAnswersAmount() + "</td>");
				out.println("</tr>");
				answersPointer++;
			}else{
				//自由回答の場合
				for(int k=0; k<allFreeAnswer.get(freeAnswersPointer).size(); k++){
					out.println("<tr>");
					out.println("<td>回答" + (k+1) + "</td>");

					//改行の表示処理
					StringBuilder sb = new StringBuilder();
					sb.append("<td>"+ allFreeAnswer.get(freeAnswersPointer).get(k) + "</td>");
					while(true) {
						int l = sb.indexOf("\r");
						if(l == -1) {break;}
						else {
							sb.replace(l, l+1, "<br>");
						}
					}
					out.println(sb);

					//out.println("<td>"+ allFreeAnswer.get(freeAnswersPointer).get(k) + "</td>");
					out.println("</tr>");
				}
				freeAnswersPointer++;
			}

		}
		out.println("</table>");
	}
	%>
</body>
</html>