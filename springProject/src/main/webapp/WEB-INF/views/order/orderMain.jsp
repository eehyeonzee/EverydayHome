<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<h2>주문/결제</h2>
<h3>주문자</h3>
<ul>
	<li>이름 <input type = "text" id = "name" value = "${memberVO.mem_name}"></li>
	<li>이메일 <input type = "email" id = "email" value = "${memberVO.email}"></li>
	<li>연락처 <input type = "text" id = "phone" value = "${memberVO.phone}"></li>
</ul>
<h3>배송지</h3>
<form>
	<ul>
		<li>받는 사람 <input type = "text" id = "receiver_name"><input type = "button" id = "equal" value = "위와 동일하게 채우기"></li>
		<li>연락처 <input type = "text" id = "receiver_phone"></li>
		<li>주소 <input type = "text" id = "order_zipcode" value = "${memberVO.zipcode}">
		<input class = "btn btn-outline-dark" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		</li>
		<li><input type = "text" id = "order_address1" value = "${memberVO.address1}"></li>
		<li><input type = "text" id = "order_address2" value = "${memberVO.address2}"></li>
	</ul>
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("order_address1").value = extraAddr;
	                
	                } else {
	                    document.getElementById("order_address1").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("order_zipcode").value = data.zonecode;
	                document.getElementById("order_address1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("order_address2").focus();
	            }
	        }).open();
	    }
  	</script>
	<script type = "text/javascript">
		$(document).ready(function() {
			$('#receiver_name').val('');
			$('#receiver_phone').val('');
			
			$('#equal').click(function() {
				var receiver_name = $('#name').val();
				var receiver_phone = $('#phone').val();
				$('#receiver_name').val(receiver_name);
				$('#receiver_phone').val(receiver_phone);
			});
			
			var price = ${storeVO.prod_price};
			var delive = ${storeVO.delive_price};
			
			var final_price = price + delive;
			$('#final_price').append(final_price);
			
		});
	</script>
	<h3>상품 정보</h3>
	<ul>
		<li>판매자명 : ${storeVO.buis_name}</li>
		<li>상품명 : ${storeVO.prod_name}</li>
		<li>상품 가격 : ${storeVO.prod_price}</li>
		<li>수량 : ${storeVO.quan}</li>
		<li>배송 방법 : ${storeVO.delive_type}</li>
		<li>배송비 : ${storeVO.delive_price}</li>
		<li>옵션 : ${storeVO.commit_option}</li>
		<li id = "final_price">최종 결제 금액 : </li>
	</ul>
</form>