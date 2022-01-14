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
    * 사용자(판매자)는 [스토어]에 상품을 등록할 수 있고, [판매자페이지]에서 상품 등록 내역을 조회할 수 있다.
  * **`관리자`**
    * 관리자는 [이벤트]와 [공지사항]에 글을 작성할 수 있다.
    * 관리자는 [관리자페이지]에서 전체 회원(사용자)을 조회하고 관리할 수 있다.
    * 관리자는 [관리자페이지]에서 모든 커뮤니티 게시판을 관리할 수 있다.
    * 관리자는 [관리자페이지]에서 판매자 신청 내역을 조회하고 해당 회원을 판매자로 등록시킬 수 있다.
    * 관리자는 [관리자페이지]에서 이메일 문의 내역을 조회하고 답변을 작성할 수 있다.
<br>

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

* [UML] Class Diagram - 집들이 게시판
![Class_Diagram](https://user-images.githubusercontent.com/83903563/148193366-09453079-661d-479f-bf7d-40a375ea9435.jpg)

* [UML] Sequence Diagram - 집들이 게시판
<img width="70%" src="https://user-images.githubusercontent.com/83903563/148193756-7413f850-db35-4717-af4a-6bfa20baf370.jpg"/>

## 구축 화면
### **`매일의집`**
  * **[메인]**&nbsp;&nbsp;[전체](https://github.com/eehyeonzee/EverydayHome/tree/main2/springProject/src/main/webapp/WEB-INF/views)
  <img width="85%" src="https://user-images.githubusercontent.com/83903563/148885942-275e845b-be9c-4ee4-b727-95dabb5bd251.png"/>
  
  - 상단 메뉴에 통합 검색창 UI 구현
  - 사이트 전체에 구글 웹폰트 적용
  - <매일의 집> 프로젝트 UI 설계 ([초기 화면 설계](https://ovenapp.io/view/vJpCqYhjm8IaZ7Pbm36FjdGCYPQE8cJb/rwwOd))
<br><br>

  * **[메인]**&nbsp;&nbsp;[푸터](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/template/footer.jsp)
  <img width="95%" src="https://user-images.githubusercontent.com/83903563/148888601-101f1825-659b-41c1-94c2-0b6d6a7fe7c9.png"/>
  - 
  -
<br><br>

### **`커뮤니티`**&nbsp;&nbsp;[집들이 게시판](https://github.com/eehyeonzee/EverydayHome/tree/main2/springProject/src/main/java/kr/spring/houseBoard)
  * **[글 목록]** [카드형](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardList.jsp)
  <img width="90%" src="https://user-images.githubusercontent.com/83903563/148889970-8a8f850f-630e-457d-9196-0f032acfb989.png"/>
<br><br>

  * **[글 목록]**&nbsp;&nbsp;[카테고리별 검색](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardList.jsp#L45)
  ![02-1  목록-카테고리 검색](https://user-images.githubusercontent.com/83903563/148891363-b9617e4a-ed33-4d18-b09e-b5fd26cefeb9.png)
<br><br>

  * **[글 작성]**&nbsp;&nbsp;[위지윅 에디터(CKEditor) 적용 외](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardWrite.jsp)
  <img width="95%" src="https://user-images.githubusercontent.com/83903563/148934295-b274ec7a-131c-49f6-b25c-a229b143fd46.png"/>
<br><br>

  * **[글 상세]**&nbsp;&nbsp;[내용과 댓글](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardDetail.jsp)
  <img width="90%" src="https://user-images.githubusercontent.com/83903563/148938197-5aa5d801-8181-4972-9014-1993e602f287.png"/>
<br><br>

  * **[글 상세]**&nbsp;&nbsp;[추천 및 스크랩](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardDetail.jsp#L125)
  ![04-3 추천 및 스크랩 완료(ajax)](https://user-images.githubusercontent.com/83903563/148918190-edf03c5a-8d93-479c-a6e5-d634add1ab4a.png)
<br><br>

  * **[글 상세]**&nbsp;&nbsp;[카카오톡 공유API 외](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardDetail.jsp#L200)
  <img width="85%" src="https://user-images.githubusercontent.com/83903563/148931261-ac0da8b6-68ff-49d9-a7f1-9fd04fa4be36.png"/>
<br><br>

  * **[글 수정]**&nbsp;&nbsp;[저장된 카테고리 불러오기 외](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardModify.jsp)
  <img width="85%" src="https://user-images.githubusercontent.com/83903563/148943779-9e165344-b600-404a-a1aa-d288243b7be5.png"/>
<br><br>

  * **[글 삭제]**&nbsp;&nbsp;[삭제 후 경로 지우기](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/houseBoard/houseBoardDetail.jsp#L612)
  <img width="80%" src="https://user-images.githubusercontent.com/83903563/149277146-233e3385-7ffd-421c-a147-9d6618156a1a.png"/>
<br><br>


