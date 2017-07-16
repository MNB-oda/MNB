<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.StudentBean"%>
<%
	StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
	String handle = studentBean.getHandle();
	String name = studentBean.getName();
	String id = studentBean.getId();
	String pass = studentBean.getPass();
	String email = studentBean.getEmail();
	boolean isprogram = studentBean.isProhan();
	boolean is2dcg = studentBean.isIs2dcghan();
	boolean is3dcg = studentBean.isIs3dcghan();
	boolean ismusic = studentBean.isMusichan();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>マイページ</title>
<style>


body {
	background-color: #ceecff;
	text-align: center;
}

table {
	border: 1px solid #ffffff;
	margin-left:auto;margin-right:auto;margin-center:auto;
	width: 80%;
}

td {
	border: 1px solid #ffffff;
	text-align: left;
}

.myPageTable td {
	text-align: left;
	padding-right: 20px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.myPageTable caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.myPageTable th {
	text-align: center;
}

.myPageTable tr:nth-child(even) td {
	background-color: #eaeff7;
}

.myPageTable tr:nth-child(odd) td {
	background-color: #d7e2f4;
}


.widthMax {
	width: 100%;
}


a.square_btn_studentList{
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
a.square_btn_studentList:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
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


</style>

</head>
<body>
	<p><font size ="5">ソフトウェア研究部</font></p>


	<p>マイページ</p>
	<Div Align = left>
	<%//管理者の場合に表示される
	if(studentBean.isAdmin()){
		out.println(" <a  onClick=\"location.href = '/MNB/StudentListController'\" class=\"square_btn_studentList\">登録者一覧</a>");

		//out.println("<input type=\"submit\" name=\"CONFIRM\" onclick=\"location.href = '/MNB/StudentListController'\" value=\"登録者管理\">");

	}
	%>
	</Div>
		<table class= "myPageTable">
			<caption>登録情報一覧</caption>

			<tr>
				<td>ハンドルネーム</td>
				<td><%=handle %></td>
			</tr>

			<tr>
				<td>本名</td>
				<td><%=name %></td>
			</tr>

			<tr>
				<td>学籍番号</td>
				<td><%=id %></td>
			</tr>

			<tr>
				<td>パスワード</td>
				<td><%=pass %></td>
			</tr>

			<tr>
				<td>メールアドレス</td>
				<td><%=email %></td>
			</tr>

			<tr>
				<td>所属班</td>
				<td>
					<%
						if (isprogram) {
							out.println("<input type=\"checkbox\" name = \"han\" value=\"プログラム班\" checked=\"checked\">プログラム班");
						} else {
							out.println("<input type=\"checkbox\" name = \"han\" value=\"プログラム班\">プログラム班");
						}
						if (is2dcg) {
							out.println("<input type=\"checkbox\" name = \"han\" value=\"2DCG班\"  checked=\"checked\">2DCG班");
						} else {
							out.println("<input type=\"checkbox\" name = \"han\" value=\"2DCG班\" >2DCG班");
						}
						if (is3dcg) {
							out.println("<input type=\"checkbox\" name = \"han\" value=\"3DCG班\"  checked=\"checked\">3DCG班");
						} else {
							out.println("<input type=\"checkbox\" name = \"han\" value=\"3DCG班\" >3DCG班");
						}
						if (ismusic) {
							out.println("<input type=\"checkbox\" name = \"han\" value=\"サウンド班\"  checked=\"checked\">サウンド班");
						} else {
							out.println("<input type=\"checkbox\" name = \"han\" value=\"サウンド班\" >サウンド班");
						}
					%>
				</td>
			</tr>

	</table>

		<p>
		<a  onClick="location.href = '/MNB/StudentAssignment?TYPE=update&ID=<%=id%>'" class="square_btn_update">変更</a>
		<p>

</body>
</html>