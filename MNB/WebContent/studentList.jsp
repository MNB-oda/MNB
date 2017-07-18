<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentBean"%>
<%@ page import="java.util.*"%>
<%
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
	text-align: center;
}

table {
	border: 1px solid #ffffff;
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

td {

}

th {

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
	width: 50%;
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



.contents caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
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
a.square_btn_add{
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
	background-image: linear-gradient(45deg, #0085C9 0%, #604dff 100%);
	transition: .4s;
}
a.square_btn_add:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
}



a.square_btn_update_list{
	width: 50px;
	height:20px;
	font-size: 80%;
	text-align: center;
	display: inline-block;
	padding: 0.7em 1.5em;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
	color: #000;
	background-image: -webkit-linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
	background-image: linear-gradient(45deg, #0bda51 0%, #6bbf3f 100%);
	transition: .4s;
}
a.square_btn_update_list:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #47ea7e 0%, #10c98d 100%);
}



a.square_btn_del_list{
	width: 50px;
	height:20px;
	font-size: 80%;
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
a.square_btn_del_list:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #ff657a 50%, #e790b5 100%);
}




</style>
</head>
<div Align = "right">
	<a  onclick = history.back()   class="square_btn_back">戻る</a>

</div>
<div Align = "left">
		<a  onClick="location.href = 'StudentAssignment?TYPE=add'" class="square_btn_add">追加</a>
</div>
	<br>
	<br>
		<table class="contents">
			<tr>
				<caption>登録者一覧</caption>
			</tr>
<%
for(int i = 0; i < studentList.size() ; i++){
	String name =studentList.get(i).getName();
	String id = studentList.get(i).getId();

    out.print("<tr>");
    out.print("<td>" + id + "</td>");
    out.print("<td>" + name + "</td>");

    out.println("<td align = \"center\"> <a  onClick=\"location.href ='StudentAssignment?TYPE=update&ID=" + id +"'\"class=\"square_btn_update_list\"> 変更</td>");
	out.println("<td align = \"center\"> <a  onClick=\"location.href ='StudentAssignment?TYPE=delete&ID=" + id +"'\"class=\"square_btn_del_list\"> 削除</td>");

    out.println("</tr>");
}
%>
		</table>
</body>
</html>