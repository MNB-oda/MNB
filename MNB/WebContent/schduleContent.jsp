<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang=>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>講習情報</title>
<style>
body {
	background-color: #ceecff;
}

table {
	border: 2px solid #ffffff;
	width: 80%;
	margin-left:auto;margin-right:auto;
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

.contents tr:nth-child(even) td ,th{
	background-color: #d7e2f4;
}

.contents tr:nth-child(odd) td ,th{
	background-color: #eaeff7;
}

.contents tr:first-child td {
	background-color: #0099f2;
	color: #ffffff;
}


</style>

</head>
<body>

	<input type="button" name="CLOSE" value="閉じる">
	<form method="post" action="">
		<table class="button">
			<p>
			<tr>
				<td colspan="3">5月18日（木）</td>
			</tr>

			<tr>
				<td><input type="submit" name="ADD" value="追加"></td>
				<td><input type="submit" name="UPDATE" value="更新"></td>
				<td><input type="submit" name="DELETE" value="削除"></td>
			</tr>

			</form>
		</table>

		<p>
		<table class = "contents">
			<tr>
				<td>講習ID</td>
				<td>2017521-1-01</td>
			</tr>

			<tr>
				<td>講習班</td>
				<td>プログラム班</td>
			</tr>

			<tr>
				<td>講習回</td>
				<td>第2回</td>
			</tr>

			<tr>
				<td>講習タイトル</td>
				<td>Unityの基本操作①</td>
			</tr>

			<tr>
				<td>日時</td>
				<td>5月18日(木)</td>
			</tr>

			<tr>
				<td>場所</td>
				<td>21003教室</td>
			</tr>

			<tr>
				<td>持ち物</td>
				<td>PC、ACアダプター、Unity操作は3Dなのでマウスがあると良い</td>
			</tr>

			<tr>
				<td>対象者</td>
				<td>3Dゲームを作りたい方</td>
			</tr>

			<tr>
				<td>関係者連絡先</td>
				<td>東京電機大学 未来科学部 情報メディア学科 <br>ソフトウェア研究部 プログラム班班長 <br>JK
					太郎 <br>15FI999@ms.dendai.ac.jp
				</td>
			</tr>

			<tr>
				<td>講習概要</td>
				<td>今回の講習は新入生向けです。 <br>・Unityソフトのインストールからユーザ登録 <br>・Unityの基本操作
					<br>不明な点などございましたら、記載されている連絡先にてお願いします。
				</td>
			</tr>

		</table>
</body>
</html>