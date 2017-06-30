<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//String type = (String)request.getAttribute("type");
String type = "kosyu";
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

</style>
</head>
<body>
<div Align = "right">
<input type="button" name="CLOSE" onclick="window.close()" value="閉じる" >
</div>
<br>

<input type="button" name="ADD" value="追加" onClick = "location.href = '/MNB/addQuestion.jsp'">
<br>

<table class = "table">
			<tr>
				<th>
				<%
				switch(type){
				case "kosyu":
					out.println("講習アンケート一覧");
					break;
				case "event":
					out.println("イベントアンケート一覧");
					break;
				default :
					break;
				}
				%>
				</th>
			</tr>
			</table>

			<div style="overflow-y:scroll;">
		<table class = "table">
				<tr>
					<td><a href = "/MNB/QuestionMethodAssignment?TYPE=answer">[5/2]第2回　プログラム班の講義アンケート</a></td>
					<td align = "center"><input type="button" name="AGGREGATE" value="集計" onClick = "location.href = '/MNB/QuestionMethodAssignment?TYPE=aggregate'"></td>
					<td align = "center"><input type="button" name="DELETE" value="削除" onClick = "location.href = '/MNB/QuestionMethodAssignment?TYPE=delete'"></td>
				</tr>
		</table>
	</div>

</body>
</html>