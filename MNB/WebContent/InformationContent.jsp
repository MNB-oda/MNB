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

.contents caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;

}

.widthMax {
	width: 100%;
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


a.square_btn_update{
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
	background-image: linear-gradient(45deg, #0bda51 0%, #6bbf3f 100%);
	transition: .4s;
}
a.square_btn_update:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #47ea7e 0%, #10c98d 100%);
}


a.square_btn_del{
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
a.square_btn_del:hover{
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
		<p>
<%//管理者の場合に表示される
if(studentBean.isAdmin()){
	out.println("<div align = \"center\">");
	//更新ボタン
	out.println("<td align = \"center\"> <a  onClick=\"location.href ='InformationAssignment?TYPE=update&ID=" + bean.getId() +"'\"class=\"square_btn_update\"> 更新</a></td>");
	//out.println("<input type=\"button\" name=\"UPDATE\" value=\"更新\""+ " onClick = \"location.href = 'InformationAssignment?TYPE=update&ID=" + bean.getId() +"'\">");
	//削除ボタン

	out.println("<td align = \"center\"> <a  onClick=\"location.href ='InformationAssignment?TYPE=delete&ID=" + bean.getId() +"'\"class=\"square_btn_del\"> 削除</a></td>");

	//out.println("<input type=\"button\" name=\"DELETE\" value=\"削除\""+ " onClick = \"location.href = 'InformationAssignment?TYPE=delete&ID=" + bean.getId() +"'\">");
	out.println("</div>");
}
%>
		<p>
		<table class= "contents">
			<tr>
					<%
					out.println("<caption>" +bean.getTitle()+ "</caption>");
					%>
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
