<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String type = (String)request.getAttribute("questionType");

%>

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


.title caption{
	border: 1px solid #ffffff;
	background-color: #0099f4;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}
.widthMax {
	width: 90%;
}

.button {
	text-align: right;
}






a.square_btn_decide{
	width: 150px;
	font-size: 150%;
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
a.square_btn_decide:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #ff657a 50%, #e790b5 100%);
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

input.square_btn_del{
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
input.square_btn_del:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #ff657a 50%, #e790b5 100%);
}

input.square_btn_add{
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
input.square_btn_add:hover{
    background-image: -webkit-linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
    background-image: linear-gradient(45deg, #709dff 50%, #b0c9ff 100%);
}





</style>

<script language = "JavaScript">
<!--
	var i = 1;
	//
	var selectBefore = [1];

	//質問を追加
    function add() {
        i++;
        var mybody=document.getElementById("tablebody");
            mycurrent_row=document.createElement("tr");
            mycurrent_row.setAttribute("id","row"+i);

                mycurrent_cell=document.createElement("td");
                mycurrent_cell.id = "num";
                currenttext = document.createTextNode(i + ". ");
                mycurrent_cell.appendChild(currenttext);

                mycurrent_form = document.createElement("INPUT");
                mycurrent_form.type = "TEXT";
        		mycurrent_form.name = "QUESTION" + i;
        		mycurrent_form.value = "";
        		mycurrent_form.maxlength = "100";
        		mycurrent_form.setAttribute("class","widthMax");
        		mycurrent_cell.appendChild(mycurrent_form);

            mycurrent_row.appendChild(mycurrent_cell);


                mycurrent_cell=document.createElement("td");

	             	//質問の形式
	        		mycurrent_form = document.createElement("INPUT");
	        		mycurrent_form.type = "radio";
	        		mycurrent_form.name = "TYPE"+ i;
	        		mycurrent_form.value = "単体";
	        		mycurrent_form.setAttribute("onChange", "hideKomoku(" + i + ")");
	        		mycurrent_form.setAttribute("checked", "checked");
	        		mycurrent_cell.appendChild(mycurrent_form);
	        		currenttext = document.createTextNode("単体");

        		mycurrent_cell.appendChild(currenttext);

	        		mycurrent_form = document.createElement("INPUT");
	        		mycurrent_form.type = "radio";
	        		mycurrent_form.name = "TYPE"+ i;
	        		mycurrent_form.value = "複数";
	        		mycurrent_form.setAttribute("onChange", "hideKomoku(" + i + ")");
	        		mycurrent_cell.appendChild(mycurrent_form);
	        		currenttext = document.createTextNode("複数");

	        	mycurrent_cell.appendChild(currenttext);

	        		mycurrent_form = document.createElement("INPUT");
	        		mycurrent_form.type = "radio";
	        		mycurrent_form.name = "TYPE"+ i;
	        		mycurrent_form.value = "自由";
	        		mycurrent_form.setAttribute("onChange", "hideKomoku(" + i + ")");
	        		mycurrent_cell.appendChild(mycurrent_form);
	        		currenttext = document.createTextNode("自由");

        		mycurrent_cell.appendChild(currenttext);

        			mycurrent_form = document.createElement("p");

        		mycurrent_cell.appendChild(mycurrent_form);

	        		//表示非表示のためのdiv
	        		notFree = document.createElement("div");
	        		notFree.id = "notFree" + i;

		        		//selectbox
		        		currenttext = document.createTextNode("項目数");

	        		notFree.appendChild(currenttext);

		        		mycurrent_form = document.createElement("SELECT");
		        		mycurrent_form.name = "KOMOKUSU" + i;
		        		mycurrent_form.id = "KOMOKUSU" + i;
		        		mycurrent_form.setAttribute("onChange","selectChange("+ i +");");

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

	        		notFree.appendChild(mycurrent_form);

		        		//選択形式質問内容入力フォーム
		        		div = document.createElement("div");
						div.id = "row" + i + "div1";

							currenttext = document.createTextNode(1 + ". ");

						div.appendChild(currenttext);

				        	mycurrent_form = document.createElement("INPUT");
				        	mycurrent_form.type = "TEXT";
				        	mycurrent_form.name = "ROW" + i + "ANSWER1";
				        	mycurrent_form.value  = "";
				        	mycurrent_form.maxlength = "100";
				        	mycurrent_form.setAttribute("class","widthMax");

	        			div.appendChild(mycurrent_form);

	        		notFree.appendChild(div);

        		mycurrent_cell.appendChild(notFree);

            mycurrent_row.appendChild(mycurrent_cell);

        mybody.appendChild(mycurrent_row);

        //削除を可能に
        document.question.deleteRow.disabled = false;
        selectBefore.push(1);
    }

    //質問を削除
    var delRow = function() {
        var mytable = document.getElementById("tablebody");
        var removeTable = document.getElementById("row"+i);
        mytable.removeChild(removeTable);

        //lengthを一つ短くして、最後尾のデータを削除
        selectBefore.length = selectBefore.length-1;
        i--;

        // テーブルの数（行の数）が0の場合は
        // 削除ボタンを無効にする
        if(i==1){
        	document.question.deleteRow.disabled =true;
        }
    }

    //selectboxの値が変化した時に、その値と同じ数に内容入力フォームを変更
    //rowNumberは変更された行が何行目か
    function selectChange(rowNumber){
    	var thisKomoku = document.getElementById("KOMOKUSU" + rowNumber);
    	var selectNow = thisKomoku.selectedIndex + 1;
    	var myQuestion = document.getElementById("notFree" + rowNumber);

    	//値が変更前より大きくなった時
    	if(selectBefore[rowNumber-1] < selectNow){
	    	for(var i = selectBefore[rowNumber-1]; i < selectNow; i++){
				div = document.createElement("div");
				var number = i+1;
				div.id = "row" + rowNumber + "div" + number;

		    		currenttext = document.createTextNode(number + ". ");

				div.appendChild(currenttext);

			    	mycurrent_form = document.createElement("INPUT");
			        mycurrent_form.type = "TEXT";
					mycurrent_form.name = "ROW" + rowNumber + "ANSWER" + number;
					mycurrent_form.value = "";
					mycurrent_form.id = "komoku" + number;
					mycurrent_form.maxlength = "100";
					mycurrent_form.setAttribute("class","widthMax");

				div.appendChild(mycurrent_form);

				myQuestion.appendChild(div);
	    	}

	    //値が変更前より小さくなった時
    	}else if(selectBefore[rowNumber-1] > selectNow){
    		for(var i = selectBefore[rowNumber-1]; i > selectNow ; i--){
	    		var removeInput = document.getElementById("row" + rowNumber + "div" + i);
				myQuestion.removeChild(removeInput);
    		}
    	}

    	//値の更新
    	selectBefore[rowNumber-1] = selectNow;
    }

    //自由が選択された際に項目数を非表示にする
    function hideKomoku(rowNumber){
    	radio = document.getElementsByName('TYPE' + rowNumber);
    	if(radio[2].checked){
    		document.getElementById('notFree' + i).style.display = "none";
    	}else{
    		document.getElementById('notFree' + i).style.display = "";
    	}
    }

 -->
</script>

</head>
<body onload="document.question.deleteRow.disabled = true;">

<div Align = "right">
<a  onclick = history.back()   class="square_btn_back">戻る</a>
</div>
<br>
<br>
		<form  name = "question" method="post" action ="./QuestionDatabaseProcessing">
		<input type='hidden' name='methodType' value="add">
		<table class = title>

		<caption>集計</caption>
		</table>

		<table class = question>

		<tbody id = tablebody>

			<tr>
				<td>タイトル</td>
				<td> <input type="text" name="TITLE" value="" maxlength="100" class="widthMax"></td>
			</tr>
			<tr>
				<td>アンケート種類</td>
				<td><input type = "radio" name = "QUESTIONTYPE" value = "講習アンケート" <%if(type.equals("講習アンケート")){out.print("checked");} %>>講習アンケート
					<input type = "radio" name = "QUESTIONTYPE" value = "イベントアンケート" <%if(type.equals("イベントアンケート")){out.print("checked");} %>>イベントアンケート
				</td>
			</tr>
			<tr id = "row1">
				<td>1．<input type="text" name="QUESTION1" value="" maxlength="100" class="widthMax"></td>
				<td><input type = "radio" name = "TYPE1" value = "単体" onClick = "hideKomoku(1)" checked>単体
					<input type = "radio" name = "TYPE1" value = "複数" onClick = "hideKomoku(1)">複数
					<input type = "radio" name = "TYPE1" value = "自由" onClick = "hideKomoku(1)">自由

					<p>
					<div id = notFree1>
					項目数<select name="KOMOKUSU1" id = "KOMOKUSU1" onChange = "selectChange(1);">
							<option value = "1" selected>1</option>
							<option value = "2">2</option>
							<option value = "3">3</option>
						</select>

					<div id = "row1div1">1.
					<input type="text" name="ROW1ANSWER1" value="" id = "komoku1" maxlength="100" class="widthMax">
					</div>
					</div>
				</td>
			</tr>
		</tbody>
		</table>

		<p>


			<input class ="square_btn_add" type="button" name="ADD" value="追加" onClick = "add();">

		<p>
		<p>
			<input  class="square_btn_del" type="button" name="DELETE" value="削除" id = deleteRow onClick = "delRow();" disabled = "true" >
		<p>
		<p>
		<br>
			<a href="javascript:document.question.submit()" class="square_btn_decide">確定</a>
			<input type=hidden name="CONFIRM" value="確定">
		<p>

		</form>
</body>
</html>

