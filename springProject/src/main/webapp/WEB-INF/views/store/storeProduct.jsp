<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

<nav>${storeVO.prod_cate}</nav>
<div>
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
	<img src = "imageView.do?prod_num=${storeVO.prod_num}" style = "width:240px; height:240px; max-width:240px; max-height:240px;"><br>
	${storeVO.prod_name}
	${storeVO.prod_price}
	<img src = "contentImageView.do?prod_num=${storeVO.prod_num}">
</div>