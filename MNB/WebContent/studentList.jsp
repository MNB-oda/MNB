<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentBean"%>

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

  try {

    // PostgreSQL JDBC 接続

    String driverClassName = "org.postgresql.Driver";
    String url = "jdbc:postgresql://localhost/tutorial";
    String user = "wspuser";      // ここはユーザ名
    String password = "hogehoge"; // ここはパスワード
    Connection connection;
    Statement statement;
    ResultSet resultSet;
    String sql = "SELECT id,name FROM student";

    // PostgreSQL JDBC ドライバロード
    Class.forName(driverClassName);

    connection = DriverManager.getConnection(url, user, password);

    // PostgreSQL JDBC 問い合わせ SQL 作成
    statement = connection.createStatement();

    // PostgreSQL JDBC レコードセットオープン
    resultSet = statement.executeQuery(sql);

    //out.println("<table border=\"1\">");

    //out.println("<tr><th>学籍番号</th><th>名前</th><th>変更</th></tr>");

    // PostgreSQL JDBC レコードセットリード
    while (resultSet.next()) {
      String id = resultSet.getString("id");
      String name = resultSet.getString("name");

      out.print("<tr>");
      out.print("<td>" + id + "</td>");
      out.print("<td>" + name + "</td>");
      out.print("<td>");
      out.print("<form method="+"get"+" action="+"StudentController"+">");
      out.print("<input type="+"submit"+" name="+"change"+" value="+"変更>");
      out.print("</form>");
      out.print("</td>");
      out.println("</tr>");
    }

    //out.println("</table>");

    // PostgreSQL JDBC レコードセットクローズ
    resultSet.close();

    // PostgreSQL JDBC ステートメントクローズ
    statement.close();

    // PostgreSQL JDBC 接続クローズ
    connection.close();

  }
  catch (Exception e) {
    // エラー処理
    out.println(e);
  }
/*<input type="button" name="change" value="変更">*/
%>
		</table>
</body>
</html>