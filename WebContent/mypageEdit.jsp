<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.StudentBean"%>
<%
String handle = (String) request.getAttribute("handle");
String name = (String) request.getAttribute("name");
String id = (String) request.getAttribute("id");
String pass = (String) request.getAttribute("pass");
String email = (String) request.getAttribute("email");
String group = (String) request.getAttribute("group");
/*
String type = (String)session.getAttribute("type");
StudentBean bean = (StudentBean) session.getAttribute("bean");

String handle = "";
String name = "";
String id = "";
String pass = "";
String email = "";
String group = "";
handle = bean.getHandle();
name = bean.getName();
id = bean.getId();
pass = bean.getPass();
email = bean.getEmail();
group = bean.getGroup();
*/
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



</style>

</head>
<body>
	<form method="post" action="./StudentDatabaseProcessing">
	<p><font size ="5">ソフトウェア研究部</font></p>


	<p>登録情報変更</p>

		<table class= "myPageTable">
			<caption>登録者一覧</caption>

			<tr>
				<td>ハンドルネーム</td>
				<td><input type="text" name="handle" value="<%=handle %>"size = "16"  maxlength="16"></td>
			</tr>

			<tr>
				<td>本名</td>
				<td><input type="text" name="name" value="<%=name %>" size = "16" maxlength="16"></td>
			</tr>

			<tr>
				<td>学籍番号</td>
				<td><input type="text" name="id" value="<%=id %>" size = "7" maxlength="7"></td>
			</tr>

			<tr>
				<td>パスワード</td>
				<td><input type="text" name="pass" value="<%=pass %>" size = "16" maxlength="16"></td>
			</tr>

			<tr>
				<td>メールアドレス</td>
				<td><input type="text" name="email" value="<%=email %>" size = "30" maxlength="50"></td>
			</tr>

			<tr>
				<td>所属班</td>
				<td>
				<% switch(group){
				case "プログラム班":
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"1\" checked=\"checked\">プログラム班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"2\" >2DCG班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"3\" >3DCG班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"4\" >サウンド班");
					break;
				case "2DCG班":
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"1\" >プログラム班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"2\" checked=\"checked\">2DCG班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"3\" >3DCG班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"4\" >サウンド班");
					break;
				case "3DCG班":
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"1\" >プログラム班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"2\" >2DCG班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"3\" checked=\"checked\">3DCG班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"4\" >サウンド班");
					break;
				case "サウンド班":
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"1\" >プログラム班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"2\" >2DCG班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"3\" >3DCG班");
					out.println("<input type=\"checkbox\" name = \"HAN\" value=\"4\" checked=\"checked\">サウンド班");
					break;
				default :
					break;
				}
				%>

				</td>
			</tr>

	</table>

		<p>
			<input type="submit" name="CONFIRM" value="確定">
		<p>
	</form>
</body>
</html>