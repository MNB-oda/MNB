<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentBean"%>
<%@ page import="java.util.*"%>
<%
	//String id = (String) request.getAttribute("id");
	request.setCharacterEncoding("UTF-8");
	@SuppressWarnings("unchecked")
	ArrayList<StudentBean> studentList = (ArrayList<StudentBean>)request.getAttribute("studentList");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登録者一覧</title>
<!--  <link rel="stylesheet" type="text/css" href="main.css"> -->
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
	<input type="button" name="CLOSE" value="閉じる">
	</div>
		<table class="contents">
			<tr>
				<td colspan="3">登録者一覧</td>
			</tr>
<%
for(int i = 0; i < studentList.size() ; i++){
	String id = studentList.get(i).getId();
	String name =studentList.get(i).getName();

	//out.print("<form method="+"get"+" action="+"StudentController"+">");
    out.print("<tr>");
    out.print("<td>" + id + "</td>");
    out.print("<td>" + name + "</td>");
    //out.print("<td>");
    //out.print("<input type="+"submit"+" name="+"change"+" value="+"変更>");
    //out.print("</td>");
    out.println("<td class=\"sche\"><a href=\"/MNB/StudentController?ID=" + id + "&NAME=" + name + "\">変更</a></td>");
    out.println("</tr>");
    //out.print("</form>");
}
%>
		</table>
</body>
</html>