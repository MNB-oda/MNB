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
	<input type="button" name="CLOSE" onClick = window.close() value="閉じる">
	</div>
		<input type="submit" name="ADD" onclick="location.href = 'StudentAssignment?TYPE=add'" value="追加">
		<table class="contents">
			<tr>
				<td colspan="3">登録者一覧</td>
			</tr>
<%
for(int i = 0; i < studentList.size() ; i++){
	//String handle = studentList.get(i).getHandle();
	String name =studentList.get(i).getName();
	String id = studentList.get(i).getId();
	//String pass = studentList.get(i).getPass();
	//String email = studentList.get(i).getEmail();
	//String group = studentList.get(i).getGroup();

    out.print("<tr>");
    out.print("<td>" + id + "</td>");
    out.print("<td>" + name + "</td>");

    //out.println("<td class=\"sche\"><a href=\"/MNB/StudentController?ID=" + id + "&NAME=" + name + "\">変更</a></td>");
    //out.println("<td><input type=\"submit\" name=\"UPDATE\" onclick=\"location.href = 'StudentController?ID=" + id + "&NAME=" + name+"'\" value=\"変更\"></td>");
    out.println("<td>");
    out.println("<input type=\"submit\" name=\"UPDATE\" onclick=\"location.href = 'StudentAssignment?TYPE=update&ID=" + id +"'\" value=\"変更\">");
    out.println("<input type=\"submit\" name=\"DELETE\" onclick=\"location.href = 'StudentAssignment?TYPE=delete&ID=" + id +"'\" value=\"削除\">");
    out.println("</td>");
    out.println("</tr>");
}
%>
		</table>
</body>
</html>