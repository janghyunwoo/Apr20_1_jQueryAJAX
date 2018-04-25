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
				
				//가져온 xml 파일에서 menu를 찾아서 foreach로 파싱
				//i는 index 번호, m은 해당 index 번호의 객체
				$(xml).find("menu").each(function(i, m) {
					//find : 테그명 찾기
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
		//	url : "요청주소",
		//	data : {파라메터명: 값, 파라메터명:값 ..},
		//	success : function(xml){
		//		xml은 서버로온 응답 데이터
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
				
				//가져온 xml 파일에서 menu를 찾아서 foreach로 파싱
				//i는 index 번호, m은 해당 index 번호의 객체
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
		// jquery는 기본 utf-8로 포맷해서 전송한다. 그래서 서버에 euc-kr 필터는 재 기능을 못한다.
		p = encodeURIComponent(p);
		
		$.ajax(
		{
			url:"menu.search.name",
			data :{
				m_name : p
			},
			success: function(xml) {
				$("table").empty();
				
				//가져온 xml 파일에서 menu를 찾아서 foreach로 파싱
				//i는 index 번호, m은 해당 index 번호의 객체
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
	
	//키보드 입력 시 이벤트 발생 e는 누른 버튼 code 값
	$("#i1").keyup(function(e) {
		//if(e.keyCode == 13){//13:엔터
			// trigger 강제 이벤트 발생
			// b2의 클릭 이벤트를 발생 시킨다.
			$("#b2").trigger("click");
		//}
	});
	
	//키보드 입력 시 이벤트 발생 e는 누른 버튼 code 값
	$("#i2").keyup(function(e) {
		//if(e.keyCode == 13){//13:엔터
			// trigger 강제 이벤트 발생
			// b2의 클릭 이벤트를 발생 시킨다.
			$("#b3").trigger("click");
		//}
	});
	
	//Ajax - Json 데이터 받아오기
	$("#b4").click(function() {
		
		$.ajax(
		{
			url:"student.getAll",
			success: function(json) {
				$("table").empty();
				var ar = json.student; // 배열 값이다. []형태
				var key = Object.keys(json["student"][0]); //키값 가져오기
				
				var td11 = $("<td></td>").text(key[0]);
				var td22 = $("<td></td>").text(key[1]);
				var td33 = $("<td></td>").text(key[2]);
				var td44 = $("<td></td>").text(key[3]);
				var tr1 = $("<tr></tr>").append(td11,td22,td33,td44);
				$("table").append(tr1);
				//가져온 json 데이터를 foreach로 파싱
				//i는 index 번호, m은 해당 index 번호의 객체
				$.each(ar, function(i, s) { //s는 객체이다. {}형태
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
	<button id='b1'>전체 검색</button>
	<table>
	</table>
	<input id = "i1"><button id = 'b2'>가격 검색</button><P>
	<input id = "i2"><button id = 'b3'>이름 검색</button>
	<p>
	<button id = "b4">전체 학생 출력</button>
	
</body>
</html>