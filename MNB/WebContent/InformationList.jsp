</html><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.InformationBean"%>
<%@ page import="model.StudentBean"%>
<%@ page import="java.util.*"%>
<%
	StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
	ArrayList<InformationBean> list = (ArrayList<InformationBean>)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>お知らせ一覧</title>
<style>
body {
	/*background-color: #ceecff;*/
}
table {
	font-size: 20px;
	border: 2px solid #ffffff;
	width: 100%;
	text-align: left;
}


td {
	border: 1px solid #ffffff;
}S

th {
	border: 1px solid #ffffff;
}



.newsList td {
	width: 95%;
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.newsList caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.newsList th {
	text-align: center;
}

.newsList tr:nth-child(even) td {
	background-color: #eaeff7;
}

.newsList tr:nth-child(odd) td {
	background-color: #d7e2f4;
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
<body>

<div Align = "right">
<a  onclick = history.back()   class="square_btn_back">戻る</a>
</div>
<br>
<br>
<br>
	<p>
	<div align = "center">
	<%
	if(studentBean.isAdmin()){
		out.println("<td align = \"center\"> <a  onClick=\"location.href ='InformationAssignment?TYPE=add' \"class=\"square_btn_add\"> 追加</a></td>");
	}
	%>

	</div>
	<br>
	<table class="newsList">


		<caption>お知らせ一覧</caption>

	<%
		//最新のものから表示
		if(list.size() > 0) {
			for(int i = list.size() - 1; i >= 0; i--) {
				out.println("<tr>");
				//タイトルをクリックすると内容を表示
				out.println("<td><a href = \"InformationAssignment?TYPE=display&ID=" + list.get(i).getId() +"\">"
						+ list.get(i).getTitle() + "</a></td>");
				if(studentBean.isAdmin()){
					//更新ボタン
					 out.println("<td align = \"center\"> <a  onClick=\"location.href ='InformationAssignment?TYPE=update&ID=" + list.get(i).getId() +"' \"class=\"square_btn_update_list\"> 更新</td>");
					//削除ボタン
					 out.println("<td align = \"center\"> <a  onClick=\"location.href ='InformationAssignment?TYPE=delete&ID=" + list.get(i).getId() +"' \"class=\"square_btn_del_list\"> 削除</td>");
				}
				out.println("</tr>");
			}
		} else {
			out.println("<tr><td>");
			out.println("お知らせはありません。");
			out.println("</td></tr>");
		}
	%>



	</table>
</body>
</html>