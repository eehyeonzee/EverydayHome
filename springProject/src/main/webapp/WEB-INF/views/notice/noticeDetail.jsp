<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('f4e504e4b5cdc1dd1e665e04d1d5dc9f');
Kakao.isInitialized();
</script>
<style>
.main-container{
width:1000px;
margin : 0 auto;
}
.title-item{
text-align: left;
}
.date-item{
text-align: left;
}
.content-item{
text-align: left;
padding: 50px 0px 140px 10px;
}
.hits-item{
text-align: right;
border-bottom : 1px solid #dbdbdb;
padding : 0px 8px 0px 10px;
}
.icon-item{
border-top : 1px solid #dbdbdb;
text-align: right;
padding : 40px 8px 0px 100px;

}
</style>
<!-- 공유하기 API -->
<script type="text/javascript">
  function kakaoshare() {
	  var content = document.getElementById("content").innerHTML;
	  console.log("값:"+content);
    Kakao.Link.sendDefault({
      objectType: 'text',
      text:
		content,
      link: {
        mobileWebUrl: 'https://developers.kakao.com',
        webUrl: 'https://developers.kakao.com',
      },
    })
  }
</script>

 <div class="container">
<div class="main-container"> 
 	<div class="title-item" align="center">
 	<h2  id="title" style="font-family: 'Gowun Dodum', sans-serif;">${notice.notice_title}</h2>
 	</div>
 	<div class="date-item" align="center">
 	<p style="font-family: 'Gowun Dodum', sans-serif;">${notice.notice_reg_date}</p>
 	</div>
 	<div class="hits-item" align="center">
 	<p style="font-family: 'Gowun Dodum', sans-serif;">hits : ${notice.notice_hits}  |  작성자 : 관리자</p>
 	</div>
 	<div class="content-item" align="center">
 	<p id="content" style="font-family: 'Gowun Dodum', sans-serif;">${notice.notice_content}</p>
 	</div>
 	 <div class="icon-item" align="center">
 	<a href="${pageContext.request.contextPath}/notice/noticeList.do" class="btn btn-success">목록으로 돌아가기</a>
 	<button type="button" onclick="kakaoshare()" class="btn btn-warning">공유하기 </button>
 	<c:if test="${user_auth==4}">
 	<a href="${pageContext.request.contextPath}/notice/noticeUpdate.do?notice_num=${notice.notice_num}" class="btn btn-info">수정</a>
	<a href="${pageContext.request.contextPath}/notice/noticeDelete.do?notice_num=${notice.notice_num}" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
	</c:if>
 	</div>
 	</div>
 </div>
