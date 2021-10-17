<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

<nav>${storeVO.prod_cate}</nav>
<div>
	<input type = "hidden" value = "${storeVO.prod_num}">
	<c:if test = "${!empty user_num && user_num == storeVO.mem_num}">
			<input type = "button" value = "수정" onclick="location.href='updateProduct.do?prod_num=${storeVO.prod_num}'">
			<input type = "button" value = "삭제" id = "delete_btn">
			<script type = "text/javascript">
				var delete_btn = document.getElementById('delete_btn');
				delete_btn.onclick=function() {
					var choice = confirm('삭제하시겠습니까?');
					if(choice) {
						location.replace('productDelete.do?prod_num=${storeVO.prod_num}');
					}
				};
			</script>
	</c:if>
</div>
<div>
	<c:if test = "${!empty storeVO.thumbnail_img}">
	<img src = "imageView.do?prod_num=${storeVO.prod_num}" style = "width:240px; height:240px; max-width:240px; max-height:240px;"><br>
	</c:if>
	<c:if test = "${empty storeVO.thumbnail_img}">
	<img src = "${pageContext.request.contextPath}/resources/images/gift.png">
	</c:if>
	${storeVO.prod_name}
	${storeVO.prod_price}원
	<c:if test = "${!empty storeVO.prod_option1}">
	<select id = "product">
		<option value = "" id = "selec_option">${storeVO.selec_product}</option>
		<option value = "${storeVO.prod_price}">${storeVO.prod_option1}</option>
		<c:if test = "${!empty storeVO.prod_option2}">
		<option value = "${storeVO.prod_price}">${storeVO.prod_option2}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option3}">
		<option value = "${storeVO.prod_price}">${storeVO.prod_option3}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option4}">
		<option value = "${storeVO.prod_price}">${storeVO.prod_option4}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option5}">
		<option value = "${storeVO.prod_price}">${storeVO.prod_option5}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option6}">
		<option value = "${storeVO.prod_price}">${storeVO.prod_option6}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option7}">
		<option value = "${storeVO.prod_price}">${storeVO.prod_option7}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option8}">
		<option value = "${storeVO.prod_price}">${storeVO.prod_option8}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option9}">
		<option value = "${storeVO.prod_price}">${storeVO.prod_option9}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option10}">
		<option value = "${storeVO.prod_price}">${storeVO.prod_option10}</option>
		</c:if>
	</select>
	</c:if>
	<c:if test = "${!empty storeVO.prod_img}">
	<img src = "contentImageView.do?prod_num=${storeVO.prod_num}"><br><br><br>
	</c:if>
	<div>
		<c:if test = "${!empty storeVO.prod_option1}">
			<script type = "text/javascript">
				$(document).ready(function() {
					$('select').val('');
					$('#quan').hide();
					$('#quan').val('0');
					
					$('#product').change(function() {
					  	var result = '';
						var price = 0;						

						var productOption = $('#product option:selected').text();
						var productPrice = $('#product option:selected').val();
												
						if($('#product').val() != '') {
							result += productOption + " ";
							price += parseInt(productPrice);
						}
						
						if(price != 0) {
							$('#result').text(result);
							$('#price').text(price + '원');
							
							if(result != '') {
								$('#quan').show();
							}
						}
						
						if($('#product').val() == '') {
							$('#result').text('');
							$('#price').text('');
							$('#quan').hide();
						}
						
						$('#quan').change(function() {							
							var last_price = 0;
							var quantity = $('#quan').val();
							
							last_price = quantity * price;
							
							$('#last_price').text(last_price + '원');
						});
						
					});					
				});
			</script>
		</c:if>
		<div>
			<span id = "result"></span>
			<span id = "price"></span>
			<div  class = "quantity">
				<input type = "number" id = "quan" min = "0">
			</div>
		</div>
		<div>
			<span id = "last_price"></span>
		</div>
		<script type = "text/javascript">
			$(document).ready(function() {
				$('#quan').val('0');				
				$('#quan').change(function() {							
					var last_price = 0;
					var quantity = $('#quan').val();
								
					last_price = quantity * ${storeVO.prod_price};
								
					$('#last_price').text(last_price + '원');
				});
			});
		</script>
		<div>
			<input type = "button" id = "btn_cart" value = "장바구니">
			<input type = "button" id = "btn_order" value = "구매하기" onclick = "location.href='${pageContext.request.contextPath}/order/orderMain.do'">
		</div>
		<script type = "text/javascript">
			$('#btn_cart').click(function() {
				var quan = $('#quan').val();
				if($('select').val() != '') {
					if(quan > 0) {
						$.ajax({
							type : 'post',
							url : '${pageContext.request.contextPath}/cart/cartInsert.do',
							data : {
								prod_num : ${storeVO.prod_num},
								user_num : ${user_num},
								cart_quan : quan
							},
							dataType : 'json',
							cache : false,
							timeout : 30000,
							success : function(param) {
								if(param.result == 'add_success') {
									var check = confirm('카트에 등록 되었습니다. 카트를 확인해보시겠습니까?');
									if(check) {
										location.assign('${pageContext.request.contextPath}/cart/cartList.do');					
									}
								}else if(param.result == 'cart_update') {
									var check = confirm('카트 수량이 변경 되었습니다. 카트를 확인해보시겠습니까?');
									if(check) {
										location.assign('${pageContext.request.contextPath}/cart/cartList.do');					
									}
								}else {
									alert('장바구니 오류!');
								}
							},
							error : function() {
								alert('네트워크 오류!');
							}
							
						});
					}else {
						alert('수량을 선택해주세요!');
					}
				}else{
					alert('${storeVO.selec_product}를 선택해주세요!');
				}
			});
		</script>
	</div>
</div>