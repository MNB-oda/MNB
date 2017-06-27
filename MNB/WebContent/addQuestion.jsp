<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>アンケート追加</title>



<style>
body {
	background-color: #ceecff;
	text-align: center;
}

table {
	border: 1px solid #ffffff;
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

td {
	border: 1px solid #ffffff;
	text-align: left;
	vertical-align: top;
}

.question tr:nth-child(even) td, th {
	background-color: #d7e2f4;
}

.question tr:nth-child(odd) td, th {
	background-color: #eaeff7;
}

.question tr:first-child td {
	background-color: #0099f2;
	color: #ffffff;
}

.widthMax {
	width: 90%;
}

.button {
	text-align: right;
}
</style>

<script language = "JavaScript">
<!--
	var i = 1;
    function add() {
        i++;
        // Tbody への参照を取得します
        var mybody=document.getElementById("tablebody");
        // セルを生成します
            // タグ名が TR である要素を生成します
            mycurrent_row=document.createElement("tr");
            mycurrent_row.setAttribute("id","row"+i);
                // -------
                // タグ名が TD である要素を生成します
                mycurrent_cell=document.createElement("td");
                mycurrent_cell.id = "num";
                //mycurrent_cell.setAttribute("id","num");
                // テキストノードを生成します。
                currenttext = document.createTextNode(i + ". ");
                // 生成したテキストノードを TD セルへと付加します
                mycurrent_cell.appendChild(currenttext);

                mycurrent_form = document.createElement("INPUT");
                mycurrent_form.type = "TEXT";
        		mycurrent_form.name = "TITLE";
        		mycurrent_form.value = "";
        		mycurrent_form.maxlength = "100";
        		mycurrent_form.setAttribute("class","widthMax");
        		mycurrent_cell.appendChild(mycurrent_form);
            // その TD セルを TR 行へと付加します
            mycurrent_row.appendChild(mycurrent_cell);

                // -------
                // タグ名が TD である要素を生成します
                mycurrent_cell=document.createElement("td");

        		mycurrent_form = document.createElement("INPUT");
        		mycurrent_form.type = "radio";
        		mycurrent_form.name = "TYPE"+ i;
        		mycurrent_form.value = "単体";
        		mycurrent_cell.appendChild(mycurrent_form);
        		currenttext = document.createTextNode("単体");
        		mycurrent_cell.appendChild(currenttext);

        		mycurrent_form = document.createElement("INPUT");
        		mycurrent_form.type = "radio";
        		mycurrent_form.name = "TYPE"+ i;
        		mycurrent_form.value = "複数";
        		mycurrent_cell.appendChild(mycurrent_form);
        		currenttext = document.createTextNode("複数");
        		mycurrent_cell.appendChild(currenttext);

        		mycurrent_form = document.createElement("INPUT");
        		mycurrent_form.type = "radio";
        		mycurrent_form.name = "TYPE"+ i;
        		mycurrent_form.value = "自由";
        		mycurrent_cell.appendChild(mycurrent_form);
        		currenttext = document.createTextNode("自由");
        		mycurrent_cell.appendChild(currenttext);

        		mycurrent_form = document.createElement("p");
        		mycurrent_cell.appendChild(mycurrent_form);

        		currenttext = document.createTextNode("項目数");
        		mycurrent_cell.appendChild(currenttext);

        		mycurrent_form = document.createElement("SELECT");
        		mycurrent_form.name = "KOMOKUSU";
        		mycurrent_form.id = "KOMOKUSU";

        		option = document.createElement("option");
        		option.value = "1";
        		option.appendChild(document.createTextNode("1"));
        		mycurrent_form.appendChild(option);

        		option = document.createElement("option");
        		option.value = "2";
        		option.appendChild(document.createTextNode("2"));
        		mycurrent_form.appendChild(option);

        		option = document.createElement("option");
        		option.value = "3";
        		option.appendChild(document.createTextNode("3"));
        		mycurrent_form.appendChild(option);

        		mycurrent_cell.appendChild(mycurrent_form);

        		mycurrent_form = document.createElement("p");
        		mycurrent_cell.appendChild(mycurrent_form);

        		currenttext = document.createTextNode(1 + ". ");
        		mycurrent_cell.appendChild(currenttext);

        		mycurrent_form = document.createElement("INPUT");
        		mycurrent_form.type = "TEXT";
        		mycurrent_form.name = "ANSWER";
        		mycurrent_form.value  = "";
        		mycurrent_form.maxlength = "100";
        		mycurrent_form.setAttribute("class","widthMax");

        		mycurrent_cell.appendChild(mycurrent_form);

        		mycurrent_form = document.createElement("p");
        		mycurrent_cell.appendChild(mycurrent_form);

            // その TD セルを TR 行へと付加します
            mycurrent_row.appendChild(mycurrent_cell);
        // その TR 行を TBODY へと付加します
        mybody.appendChild(mycurrent_row);

        document.question.deleteRow.disabled = false;
    }

    var delRow = function() {
        var mytable = document.getElementById("tablebody");
        var removeTable = document.getElementById("row"+i);
        mytable.removeChild(removeTable);
        i--;
        // テーブルの数（行の数）が0の場合は
        // 削除ボタンを無効にする
        if(i==1){
        	document.question.deleteRow.disabled =true;
        }
    }

 -->
</script>

</head>
<body onload="document.question.deleteRow.disabled = true;">
		<p>
			<input type="button" name="CLOSE" value="閉じる" onClick = "window.close();">
		<p>

		<form action="post" method ="" name = "question">
		<table class = question>
		<tbody id = tablebody>
			<tr>
				<td>タイトル</td>
				<td> <input type="text" name="TITLE" value="" maxlength="100" class="widthMax"></td>
			</tr>
			<tr>
				<td>アンケート種類</td>
				<td><input type = "radio" name = "QUESTIONTYPE" value = "講習アンケート" checked>講習アンケート
					<input type = "radio" name = "QUESTIONTYPE" value = "イベントアンケート">イベントアンケート
				</td>
			</tr>
			<tr id = "row1">
				<td>1．<input type="text" name="QUESTION" value="" maxlength="100" class="widthMax"></td>
				<td><input type = "radio" name = "TYPE" value = "単体" checked>単体
					<input type = "radio" name = "TYPE" value = "複数">複数
					<input type = "radio" name = "TYPE" value = "自由">自由
					<p>

					項目数<select name="KOMOKUSU" id = "KOMOKUSU">
							<option value = "1" selected>1</option>
							<option value = "2">2</option>
							<option value = "3">3</option>
						</select>
						<p>
					1．<input type="text" name="ANSWER" value="" maxlength="100" class="widthMax">
				</td>
			</tr>
		</tbody>
		</table>

		<p>
			<input type="button" name="ADD" value="追加" onClick = "add();">
		<p>
		<p>
			<input type="button" name="DELETE" value="削除" id = deleteRow onClick = "delRow();" disabled = "true" >
		<p>
		<p>
			<input type="submit" name="CONFIRM" value="確定">
		<p>

		</form>
</body>
</html>

