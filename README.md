# 🏡 **매일의 집**
#### 인테리어 전문 쇼핑몰 프로젝트
  * 개발 기간 : 2021.10.01. ~ 2021.10.24.
  * 참여 인원 : 5명
<br><br>

## 프로젝트 소개
<오늘의 집>을 벤치마킹하여 커뮤니티 및 스토어 조합의 인테리어 웹 사이트 <매일의 집>을 구현하였다.<br>
주요 기능은 크게 5개 파트로 나뉜다.
  * **`메인`**&nbsp;&nbsp;최신글/통합검색
  * **`회원`**&nbsp;&nbsp;가입 및 로그인/마이페이지(일반&판매자&관리자)
  * **`커뮤니티`**&nbsp;&nbsp;집들이 게시판
  * **`커뮤니티`**&nbsp;&nbsp;이벤트/공지사항/고객센터
  * **`스토어`**&nbsp;&nbsp;상품 게시판/장바구니

<매일의 집>의 시나리오는 다음과 같다.
  * **`사용자`**&nbsp;&nbsp;일반&판매자
    * 사용자는 [집들이]에 사진을 올려 자신의 집 인테리어를 공유하거나, 댓글로 다른 사용자와 소통할 수 있다.
    * 사용자는 [스토어]에서 상품을 주문/결제하고 리뷰를 작성할 수 있으며 [장바구니] 기능을 이용할 수 있다.
    * 사용자는 [고객센터]에서 문의 사항을 작성하고 이메일로 제출할 수 있다.
    * 사용자는 [마이페이지]에서 나의 상태(내가 쓴 글/나의 쇼핑/나의 리뷰 등)를 확인하거나, 프로필 및 개인 정보를 수정할 수 있다.
    * 사용자(일반)는 [마이페이지]에서 판매자 신청을 할 수 있다.
    * 사용자(판매자)는 [스토어]에 상품을 등록할 수 있고, [판매자페이지]에서 자신의 상품 등록 내역을 조회할 수 있다.
  * **`관리자`**
    * 관리자는 [이벤트]와 [공지사항]에 글을 작성할 수 있다.
    * 관리자는 [관리자페이지]에서 전체 회원(사용자)을 조회하고 관리할 수 있다.
    * 관리자는 [관리자페이지]에서 모든 커뮤니티 게시판을 관리할 수 있다.
    * 관리자는 [관리자페이지]에서 판매자 신청 내역을 조회하고 해당 회원을 판매자로 등록시킬 수 있다.
    * 관리자는 [관리자페이지]에서 이메일 문의 내역을 조회하고 답변을 작성할 수 있다.
<br><br>

## 담당 업무
  * **`메인`**&nbsp;&nbsp;헤더/푸터
  * **`커뮤니티`**&nbsp;&nbsp;집들이 게시판
<br><br>

## 개발환경 및 사용기술
  * **`OS`**&nbsp;&nbsp;Windows 10
  * **`Tool`**&nbsp;&nbsp;JAVA JDK-1.7
  * **`DBMS`**&nbsp;&nbsp;Oracle 11g Release2
  * **`Server`**&nbsp;&nbsp;Apache Tomcat 9.0
  * **`Front-end`**&nbsp;&nbsp;HTML5, CSS3, JavaScript, jQuery, Bootstrap
  * **`Back-end`**&nbsp;&nbsp;Java, Spring Framework, MyBatis, JSP
<br><br>

## 시스템 설계
  * [ERD] 논리/물리 모델
  ![ERD](https://user-images.githubusercontent.com/83903563/148183561-6d8e7131-c14e-4af7-a17a-41a0b67c8f08.png)
<br>

  * [UML] Class Diagram - 집들이 게시판
  ![Class_Diagram](https://user-images.githubusercontent.com/83903563/148193366-09453079-661d-479f-bf7d-40a375ea9435.jpg)
<br>

  * [UML] Sequence Diagram - 집들이 게시판
  <img width="70%" src="https://user-images.githubusercontent.com/83903563/148193756-7413f850-db35-4717-af4a-6bfa20baf370.jpg"/>

## 구축 화면
### **`매일의집`**
  * **[메인]**&nbsp;&nbsp;[페이지 전체](https://github.com/eehyeonzee/EverydayHome/tree/main2/springProject/src/main/webapp/WEB-INF/views)
  <img width="85%" src="https://user-images.githubusercontent.com/83903563/148885942-275e845b-be9c-4ee4-b727-95dabb5bd251.png"/>
  
  - 메인페이지 상단 메뉴에 통합 검색창 UI 구현
  - 사이트 전체에 구글 웹 폰트 적용
  - <매일의 집> 프로젝트 UI 설계 ([초기 화면 설계](https://ovenapp.io/view/vJpCqYhjm8IaZ7Pbm36FjdGCYPQE8cJb#rwwOd, "카카오 오븐"))
<br><br>
  
  * **[메인]**&nbsp;&nbsp;[푸터](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/template/footer.jsp)
  <img width="95%" src="https://user-images.githubusercontent.com/83903563/148888601-101f1825-659b-41c1-94c2-0b6d6a7fe7c9.png"/>
  
  - 메인페이지 하단에 사업자정보조회 기능 추가
  - '사업자정보확인' 링크를 누르면 팝업창이 열리고 사업자 정보를 조회할 수 있음
  - '서비스가입사실 확인' 링크를 누르면 은행지급보증서 스캔본을 열람할 수 있음
<br><br>

### **`커뮤니티`**&nbsp;&nbsp;[집들이 게시판](https://github.com/eehyeonzee/EverydayHome/tree/main2/springProject/src/main/java/kr/spring/houseBoard)
  * **[글 목록]** [카드형](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardList.jsp)
  <img width="90%" src="https://user-images.githubusercontent.com/83903563/148889970-8a8f850f-630e-457d-9196-0f032acfb989.png"/>

  - 등록된 게시물이 있으면 카드형 글목록 출력 (없을 경우 '등록된 게시물이 없습니다' 메시지가 결과 화면에 뜸)
  - 최신순으로 정렬하고 페이징 처리
  - [집들이]의 총 게시물 수 표시
  - 글 작성자의 프로필 사진/닉네임 노출
  - 작성자가 프로필 사진을 설정하지 않은 경우 기본 프로필 이미지가 보이도록 구현
  - 썸네일 사진으로 게시물 미리보기 가능
  - 작성자가 썸네일 파일을 등록하지 않은 경우 기본 썸네일 이미지가 보이도록 구현
  - 제목을 누르면 [글 상세] 페이지로 이동
<br><br>

  * **[글 목록]**&nbsp;&nbsp;[카테고리 검색 필터](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardList.jsp#L45)
  ![02-1  목록-카테고리 검색](https://user-images.githubusercontent.com/83903563/148891363-b9617e4a-ed33-4d18-b09e-b5fd26cefeb9.png)

  - 카테고리 내에서 원하는 게시물을 쉽게 찾아볼 수 있도록 별도의 검색 필터 배치
  - '평수'부터 '주거형태'/'스타일'/'공간'까지 다중 선택 및 검색 가능
  - 각각의 카테고리 선택 시 선택값들이 일렬로 나란히 정렬되도록 구현
  - 각 카테고리 하단에 있는 '취소' 버튼을 누르면 해당 카테고리 선택값만 취소됨
  - '초기화' 버튼을 누르면 모든 선택값이 취소되고 [집들이] 목록으로 복귀
<br><br>

  * **[글 작성]**&nbsp;&nbsp;[위지윅 에디터 외](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardWrite.jsp)
  <img width="95%" src="https://user-images.githubusercontent.com/83903563/148934295-b274ec7a-131c-49f6-b25c-a229b143fd46.png"/>
  
  - 로그인 여부 체크
  - 로그인하지 않은 상태에서 [헤더 메뉴]-'글쓰기'-'사진 올리기'를 누르면 [로그인] 페이지로 이동
  - 로그인 후 '사진 올리기'를 누르면 글쓰기 폼으로 이동
  - 제목/카테고리/내용은 유효성 검사 기능을 추가하여 필수 입력(선택) 항목으로 처리
  - 사용자 편의를 위해 내용 입력폼에 CKEditor 적용
  - 필수 항목이 누락된 상태에서 '등록' 버튼을 누르면 경고창이 뜨고 글 등록 불가
  - 썸네일 사진을 업로드할 수 있도록 별도의 파일 첨부 기능 추가
  - 글 작성 도중 '목록' 버튼을 누르면 [집들이] 목록으로 복귀
  - 글 작성 완료 후 '등록' 버튼을 누르면 [집들이] 목록으로 이동
  - 글목록의 총 게시물 수 변동
  - [마이페이지]-'내가 쓴 글' 목록에도 새 글이 반영됨
  - 로그인이 풀린 상태에서 '등록' 버튼을 누르면 경고창이 뜨고 [로그인] 페이지로 이동
<br><br>

  * **[글 상세]**&nbsp;&nbsp;[게시물](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardDetail.jsp#L528)과 [댓글](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardDetail.jsp#L246)
  <img width="90%" src="https://user-images.githubusercontent.com/83903563/150299509-1ec22608-e95e-48d0-a0d1-7c9877820656.png"/>
  
  **`게시물`**
  - 글 작성자의 프로필 사진/닉네임 노출
  - 작성자가 프로필 사진을 설정하지 않은 경우 기본 프로필 이미지가 보이도록 구현
  - 글의 카테고리(4개)/등록일/조회 수/내용 출력
  - 등록일은 글 작성 완료의 경과 시간으로 표기 (예: 1시간 전)
  - 조회 수는 제목을 눌러 게시물을 읽는 순간 +1 증가되도록 구현
  - '목록' 버튼을 누르면 [집들이] 목록으로 복귀
  - '수정'/'삭제' 버튼은 권한 검증을 통해 글 작성자와 관리자에게만 나타남
  - 추천(좋아요)/스크랩/SNS 공유 기능 구현
  
  **`댓글`**
  - 해당 게시물의 총 댓글 수 표시
  - 댓글 작성자의 프로필 사진/닉네임 노출
  - 댓글 작성자가 프로필 사진을 설정하지 않은 경우 기본 프로필 이미지가 보이도록 구현
  - 댓글 등록일/내용 출력
  - 등록일은 댓글 작성 완료의 경과 시간으로 표기 (예: 1시간 전)
  - R 제외 CUD 로그인 여부 체크
  - 로그인하지 않은 경우 댓글 작성폼 비활성화 
  - 로그인한 경우 작성폼이 활성화되고 '등록' 버튼이 나타남
  - 작성폼/수정폼은 유효성 검사 기능을 추가하여 필수 입력으로 처리
  - 폼을 비운 상태에서 '등록' 버튼을 누르면 경고창이 뜨고 등록 불가
  - 내용 입력 시 글자수가 체크되도록 구현 (최대 300자)
  - 댓글 입력 후 '등록' 버튼을 누르면 페이지 새로고침 없이 댓글 등록 완료 (Ajax 방식)
  - 로그인이 풀린 상태에서 '등록' 버튼을 누르면 경고창이 뜨고 등록 불가
  - '수정'/'삭제' 버튼은 권한 검증을 통해 댓글 작성자와 관리자에게만 나타남
  - '삭제' 버튼을 누르면 알림창이 뜨고 페이지 새로고침 없이 댓글 삭제 완료
  - '수정' 버튼을 누르면 원댓글 내용을 반환하는 수정폼과 '등록'/'취소' 버튼이 나타남
  - 내용 수정 후 '등록' 버튼을 누르면 알림창이 뜨고 페이지 새로고침 없이 댓글 수정 완료
  - '취소' 버튼을 누르면 폼이 초기화되고 댓글 목록으로 복귀
  - 로그인이 풀린 상태에서 '수정'/'삭제' 버튼을 누르면 경고창이 뜨고 수정/삭제 불가
<br><br>

  * **[글 상세]**&nbsp;&nbsp;[추천/스크랩](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardDetail.jsp#L125)
  ![04-3 추천 및 스크랩 완료(ajax)](https://user-images.githubusercontent.com/83903563/148918190-edf03c5a-8d93-479c-a6e5-d634add1ab4a.png)
  
  - 로그인 여부 체크
  - 로그인하지 않은 상태에서 추천/스크랩 버튼을 누르면 경고창이 뜨고 [로그인] 페이지로 이동
  - 로그인한 경우 버튼 클릭 가능
  - 버튼을 누르면 알림창이 뜨고 빈 아이콘이 빨간색/노란색으로 채워지면서 추천/스크랩 수 변동 (Ajax 방식)
  - 버튼을 한번 더 누르면 추천/스크랩이 취소됐다는 알림창이 뜨고 아이콘 색깔 및 추천/스크랩 수 원상복귀
  - 로그인이 풀린 상태에서 버튼을 누르면 경고창이 뜨고 [로그인] 페이지로 이동
  - 추천/스크랩 기능 사용 시 [마이페이지]-'좋아요'/'스크랩북' 목록에도 반영됨
<br><br>

  * **[글 상세]**&nbsp;&nbsp;[카카오톡 공유 API 외](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardDetail.jsp#L200)
  <img width="85%" src="https://user-images.githubusercontent.com/83903563/150103918-407a0054-8333-4dbc-982d-7577165a8657.png"/>
  
  - 페이스북/카카오톡/트위터 아이콘을 누르면 해당 SNS를 통해 게시물 공유 가능
  - 카카오 계정으로 로그인한 경우 나의 카카오톡 친구들에게/채팅방에 즉시 공유 가능
  - URL 아이콘을 누르면 URL이 복사되고 알림창이 뜸
<br><br>

  * **[글 수정]**&nbsp;&nbsp;[저장된 카테고리 값 불러오기 외](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardModify.jsp)
  <img width="85%" src="https://user-images.githubusercontent.com/83903563/148943779-9e165344-b600-404a-a1aa-d288243b7be5.png"/>
  
  - 로그인 여부 체크
  - 권한 검증을 거친 글 작성자/관리자가 '수정' 버튼을 누르면 원글을 반환하는 수정폼으로 이동
  - 글 작성 시 지정해놓은 카테고리 값이 기본값으로 고정되도록 구현
  - 이미 등록된 썸네일 파일이 있으면 메시지와 함께 파일명 출력
  - '파일삭제' 버튼을 누르면 페이지 새로고침 없이 기존 썸네일 파일이 삭제됨 (Ajax 방식)
  - 로그인이 풀린 상태에서 버튼을 누르면 경고창이 뜨고 [로그인] 페이지로 이동
  - 그 외 [글 작성]과 동일
<br><br>

  * **[글 삭제]**&nbsp;&nbsp;[삭제 후 경로 지우기](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardDetail.jsp#L612)
  <img width="80%" src="https://user-images.githubusercontent.com/83903563/149277146-233e3385-7ffd-421c-a147-9d6618156a1a.png"/>
  
  - 로그인 여부 체크
  - 권한 검증을 거친 글 작성자/관리자가 '삭제' 버튼을 누르면 경고창이 뜸
  - '확인' 버튼을 누르면 글이 삭제되고 [집들이] 목록으로 이동 (경로가 지워지므로 이전페이지로 이동 불가)
  - 글목록의 총 게시물 수 변동
  - [마이페이지]-'내가 쓴 글' 목록에서도 해당 글이 삭제됨
  - 로그인이 풀린 상태에서 '삭제' 버튼을 누르면 경고창이 뜨고 [로그인] 페이지로 이동
<br><br>

## 개인 피드백


