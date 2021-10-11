<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- 
 * 작성일 : 2021. 10. 10.
 * 작성자 : 오상준
 * 설명 : 회원 로그인 폼
 * 수정일 : 
--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- 중앙 내용 시작 -->
<div class="page-main">
	<h2>회원 로그인</h2>
	<form:form id="login_form" action="login.do" modelAttribute="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="mem_id">아이디</label>
				<form:input path="mem_id"/>
				<form:errors path="mem_id" cssClass="error-color"/>
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<form:password path="passwd"/>
				<form:errors path="passwd" cssClass="error-color"/>
			</li>
			<li>
				<span id="test">${ response.id }</span>
			</li>
			
		</ul>
		<ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <img width="150" height="33" src="../resources/images/kakao_login_img.png"/>
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('16010447afb451f74b595f91fc611d31'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		var rediret_url = "";
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response) 
		        	  $.ajax({
		        		  url:"kakaologin.do",
		        		  type:"POST",
		        		  data:{
		        			  id : response.id,
		        			  nickname : response.kakao_account.profile.nickname,
		        			  profile_image_url : response.kakao_account.profile.profile_image_url
		        			  },
		        		  dataType:"json",
		        		  success:function(param){
		        			  alert(param.kid);
		        			  alert(param.knickname);
		        			  alert(param.kprofile_image_url);
		        			  location.href='${pageContext.request.contextPath}/main/main.do';
		        		  },
		  				  error : function(request,status,error){      // 에러메세지 반환
				               alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				          }
		        	  })
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		//카카오로그아웃  
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        	
		        	
		        },
		        fail: function (error) {
		          console.log(error)
		          
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  
	</script>
		<br>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="홈으로" 
			       onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			 

		</div>
	</form:form>
</div>
<!-- 중앙 내용 끝 -->