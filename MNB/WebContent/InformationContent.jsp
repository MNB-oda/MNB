<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.InformationBean"%>
<%@ page import="model.StudentBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
	InformationBean bean = (InformationBean)session.getAttribute("bean");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>お知らせ詳細情報</title>

<style>
body {
	background-color: #ceecff;
	text-align: center;
}

table {
	border: 1px solid #ffffff;
	margin-left:auto;margin-right:auto;
	width: 80%;
}

td {
	border: 1px solid #ffffff;
	text-align: left;
}
th {
	border: 1px solid #ffffff;
}

.contents td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.contents th {
	text-align: left;
	padding-right: 20px;
}

.contents tr:nth-child(even) td ,th{
	background-color: #eaeff7;
}

.contents tr:nth-child(odd) td ,th{
	background-color: #d7e2f4;
}

.widthMax {
	width: 100%;
}



</style>

</head>
<body>

		<p>
<%//管理者の場合に表示される
if(studentBean.isAdmin()){
	out.println("<div align = \"center\">");
	//更新ボタン
	out.println("<input type=\"button\" name=\"UPDATE\" value=\"更新\""
			+ " onClick = \"location.href = 'InformationAssignment?TYPE=update&ID=" + bean.getId() +"'\">");
	//削除ボタン
	out.println("<input type=\"button\" name=\"DELETE\" value=\"削除\""
			+ " onClick = \"location.href = 'InformationAssignment?TYPE=delete&ID=" + bean.getId() +"'\">");
	out.println("</div>");
}
%>
		<p>
		<table class= "contents">
			<tr>
				<td style="background:#5a9bd5">
					<%
					out.println(bean.getTitle());
					%>
				</td>
			</tr>

			<tr>
				<td>
					<%
					StringBuilder sb = new StringBuilder();
					sb.append(bean.getContent());
					while(true) {
						int i = sb.indexOf("\r");
						if(i == -1) {break;}
						else {
							sb.replace(i, i+1, "<br>");
						}
					}
					out.println(sb);
					%>
				</td>
			</tr>
		</table>


</body>
</html>
