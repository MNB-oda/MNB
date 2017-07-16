<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="model.BigQuestionBean"%>
<%@ page import="model.StudentBean"%>
<%
BigQuestionBean[] bigBean = (BigQuestionBean[])request.getAttribute("bigBeans");
String type = (String)request.getAttribute("type");
StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>講習会アンケート編集</title>
<style>
body {
	background-color: #ceecff;
}

table {
	font-size: 20px;
	border: 2px solid #ffffff;
	width: 100%;
}

td {
	border: 1px solid #000000;
}

th {
	border: 1px solid #000000;
}
.table{
  text-align: left;
}

.table td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
}

.table th {
	text-align: left;
	padding-right: 20px;
}

.table tr:nth-child(even) td, th {
	background-color: #d7e2f4;
}

.table tr:nth-child(odd) td, th {
	background-color: #eaeff7;
}


.table caption {
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 100%;
}



</style>
</head>
<body>
<div Align = "right">
<input type="button" name="CLOSE" onclick = history.back() value="戻る">
</div>
<br>
<%//管理者の場合に表示される
	if(studentBean.isAdmin()){
		out.println("<input type=\"button\" name=\"ADD\" value=\"追加\" onClick = \"location.href = '/MNB/QuestionMethodAssignment?TYPE=add&QUESTIONTYPE="+ type +"'\">");
	}
%>
<br>


			<div style="overflow-y:scroll;">
		<table class = "table">
				<%

				switch(type){
				case "講習アンケート":
					out.println("<caption> 講習アンケート一覧 </caption>");
					break;
				case "イベントアンケート":
					out.println("<caption> イベントアンケート一覧 </caption>");
					break;
				default :
					break;
				}

				//アンケートタイトルの表示
				for(int i=0; i<bigBean.length; i++){
					out.println("<tr>");
					out.println("<td><a href = \"/MNB/QuestionMethodAssignment?TYPE=answer&ID=" + bigBean[i].getId() + "\">" + bigBean[i].getTitle() + "</a></td>");
					if(studentBean.isAdmin()){
					out.println("<td align = \"center\"><input type=\"button\" name=\"AGGREGATE\" value=\"集計\" onClick = \"location.href = '/MNB/QuestionMethodAssignment?TYPE=aggregate&ID=" + bigBean[i].getId() + "'\"></td>");
					out.println("<td align = \"center\"><input type=\"button\" name=\"DELETE\" value=\"削除\" onClick = \"location.href = '/MNB/QuestionMethodAssignment?TYPE=delete&ID=" + bigBean[i].getId() + "'\"></td>");
					}
					out.println("</tr>");
				}
				%>
		</table>
	</div>

</body>
</html>