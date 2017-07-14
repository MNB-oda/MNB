<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.StudentBean"%>
<%
	String type = (String) session.getAttribute("type");
	StudentBean studentBean = (StudentBean) session.getAttribute("student");

	String handle = "";
	String name = "";
	String id = "";
	String pass = "";
	String email = "";
	String han = "";
	boolean isprogram = false;
	boolean is2dcg = false;
	boolean is3dcg = false;
	boolean ismusic = false;

	//更新の画面なら現在のデータを表示
		if(type == "update"){
			handle = studentBean.getHandle();
			name = studentBean.getName();
			id = studentBean.getId();
			pass = studentBean.getPass();
			email = studentBean.getEmail();
			isprogram = studentBean.isProhan();
			is2dcg = studentBean.isIs2dcghan();
			is3dcg = studentBean.isIs3dcghan();
			ismusic = studentBean.isMusichan();
		}
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
	margin-left: auto;
	margin-right: auto;
	margin-center: auto;
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

.myPageTable caption {
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
		<p>
			<font size="5">ソフトウェア研究部</font>
		</p>

		<%
			switch (type) {
			case "add":
				out.println("<p>登録情報追加</p>");
				break;
			case "update":
				out.println("<p>登録情報変更</p>");
				break;
			default:
				break;
			}
		%>
		<br>
		<table class="myPageTable">
			<caption>登録者一覧</caption>

			<tr>
				<td>ハンドルネーム</td>
				<td><input type="text" name="handle" value="<%=handle%>"
					size="16" maxlength="16"></td>
			</tr>

			<tr>
				<td>本名</td>
				<td><input type="text" name="name" value="<%=name%>" size="16"
					maxlength="16"></td>
			</tr>

			<tr>
				<td>学籍番号</td>
				<%
					switch (type) {
					case "add":
						out.println("<td><input type=\"text\" name=\"id\" value=\"\" size = \"7\" maxlength=\"7\"></td>");
						break;
					case "update":
						out.println("<td><input type=\"text\" name=\"id\" value=" + id
								+ " size = \"7\" maxlength=\"7\" readonly>　変更出来ません</td>" );
						break;
					default:
						break;
					}
				%>
			</tr>
			<tr>
				<td>パスワード</td>
				<td><input type="text" name="pass" value="<%=pass%>" size="16"
					maxlength="16"></td>
			</tr>

			<tr>
				<td>メールアドレス</td>
				<td><input type="text" name="email" value="<%=email%>"
					size="30" maxlength="50"></td>
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
			<input type="submit" name="CONFIRM" value="確定">
		<p>
	</form>
</body>
</html>