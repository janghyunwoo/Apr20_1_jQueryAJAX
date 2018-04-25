<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="resources/jquery.js"></script>
<script type="text/javascript">

$(function() {
	
	$("#b1").click(function() {
		$.ajax(
		{
			url:"menu.get",
			success: function(xml) {
				$("table").empty();
				
				//������ xml ���Ͽ��� menu�� ã�Ƽ� foreach�� �Ľ�
				//i�� index ��ȣ, m�� �ش� index ��ȣ�� ��ü
				$(xml).find("menu").each(function(i, m) {
					//find : �ױ׸� ã��
					var name = $(m).find("m_name").text();
					var price = $(m).find("m_price").text();
					
					var td1 = $("<td></td>").text(name);
					var td2 = $("<td></td>").text(price);
					var tr1 = $("<tr></tr>").append(td1,td2);
					$("table").append(tr1);
					
				});
			}
		});
		
	});
	
	$("#b2").click(function() {
		var p = $("#i1").val();
		
		//$.ajax({
		//	url : "��û�ּ�",
		//	data : {�Ķ���͸�: ��, �Ķ���͸�:�� ..},
		//	success : function(xml){
		//		xml�� �����ο� ���� ������
		//	}
		//});
		
		$.ajax(
		{
			url:"menu.search.price",
			data :{
				m_price : p
			},
			success: function(xml) {
				$("table").empty();
				
				//������ xml ���Ͽ��� menu�� ã�Ƽ� foreach�� �Ľ�
				//i�� index ��ȣ, m�� �ش� index ��ȣ�� ��ü
				$(xml).find("menu").each(function(i, m) {
					var name = $(m).find("m_name").text();
					var price = $(m).find("m_price").text();
					
					var td1 = $("<td></td>").text(name);
					var td2 = $("<td></td>").text(price);
					var tr1 = $("<tr></tr>").append(td1,td2);
					$("table").append(tr1);
					
				});
			}
		});
	});
	
	$("#b3").click(function() {
		var p = $("#i2").val();
		// jquery�� �⺻ utf-8�� �����ؼ� �����Ѵ�. �׷��� ������ euc-kr ���ʹ� �� ����� ���Ѵ�.
		p = encodeURIComponent(p);
		
		$.ajax(
		{
			url:"menu.search.name",
			data :{
				m_name : p
			},
			success: function(xml) {
				$("table").empty();
				
				//������ xml ���Ͽ��� menu�� ã�Ƽ� foreach�� �Ľ�
				//i�� index ��ȣ, m�� �ش� index ��ȣ�� ��ü
				$(xml).find("menu").each(function(i, m) {
					var name = $(m).find("m_name").text();
					var price = $(m).find("m_price").text();
					
					var td1 = $("<td></td>").text(name);
					var td2 = $("<td></td>").text(price);
					var tr1 = $("<tr></tr>").append(td1,td2);
					$("table").append(tr1);
					
				});
			}
		});
	});
	
	//Ű���� �Է� �� �̺�Ʈ �߻� e�� ���� ��ư code ��
	$("#i1").keyup(function(e) {
		//if(e.keyCode == 13){//13:����
			// trigger ���� �̺�Ʈ �߻�
			// b2�� Ŭ�� �̺�Ʈ�� �߻� ��Ų��.
			$("#b2").trigger("click");
		//}
	});
	
	//Ű���� �Է� �� �̺�Ʈ �߻� e�� ���� ��ư code ��
	$("#i2").keyup(function(e) {
		//if(e.keyCode == 13){//13:����
			// trigger ���� �̺�Ʈ �߻�
			// b2�� Ŭ�� �̺�Ʈ�� �߻� ��Ų��.
			$("#b3").trigger("click");
		//}
	});
	
	//Ajax - Json ������ �޾ƿ���
	$("#b4").click(function() {
		
		$.ajax(
		{
			url:"student.getAll",
			success: function(json) {
				$("table").empty();
				var ar = json.student; // �迭 ���̴�. []����
				var key = Object.keys(json["student"][0]); //Ű�� ��������
				
				var td11 = $("<td></td>").text(key[0]);
				var td22 = $("<td></td>").text(key[1]);
				var td33 = $("<td></td>").text(key[2]);
				var td44 = $("<td></td>").text(key[3]);
				var tr1 = $("<tr></tr>").append(td11,td22,td33,td44);
				$("table").append(tr1);
				//������ json �����͸� foreach�� �Ľ�
				//i�� index ��ȣ, m�� �ش� index ��ȣ�� ��ü
				$.each(ar, function(i, s) { //s�� ��ü�̴�. {}����
					var name = s.s_name;
					var kor =s.s_kor;
					var eng = s.s_eng;
					var mat = s.s_mat;
					
					var td1 = $("<td></td>").text(name);
					var td2 = $("<td></td>").text(kor);
					var td3 = $("<td></td>").text(eng);
					var td4 = $("<td></td>").text(mat);
					tr1 = $("<tr></tr>").append(td1,td2,td3,td4);
					$("table").append(tr1);
					
				});
			}
		});
		
	});
	

	
	
});

</script>

</head>
<body>
	<h1>index</h1>
	<button id='b1'>��ü �˻�</button>
	<table>
	</table>
	<input id = "i1"><button id = 'b2'>���� �˻�</button><P>
	<input id = "i2"><button id = 'b3'>�̸� �˻�</button>
	<p>
	<button id = "b4">��ü �л� ���</button>
	
</body>
</html>