# 🏡 **매일의 집**
#### 인테리어 전문 쇼핑몰 프로젝트
* 개발 기간 : 2021.10.01. ~ 2021.10.24.
* 참여 인원 : 5명
<br/><br/>

## 프로젝트 소개
<오늘의 집>을 벤치마킹하여 커뮤니티 및 스토어 조합의 인테리어 웹 사이트를 구현하였다.
* 기능은 크게 6개 파트로 나뉜다.
  * 메인
  * 회원가입/마이페이지/판매자페이지/관리자페이지
  * 집들이
  * 스토어&
  * 고객센터
<br/><br/>

## 개발환경 및 사용기술
* **`OS`**&nbsp;&nbsp;Windows 10
* **`Tool`**&nbsp;&nbsp;JAVA JDK-1.7
* **`DBMS`**&nbsp;&nbsp;Oracle 11g Release2
* **`Server`**&nbsp;&nbsp;Apache Tomcat 9.0
* **`Front-end`**&nbsp;&nbsp;HTML5, CSS3, JavaScript, jQuery, Bootstrap
* **`Back-end`**&nbsp;&nbsp;Java, Spring Framework, MyBatis, JSP
<br/><br/>

## 시스템 설계
* ERD
![ERD](https://user-images.githubusercontent.com/83903563/148183561-6d8e7131-c14e-4af7-a17a-41a0b67c8f08.png)

* [UML] Class Diagram - 집들이 게시판
![Class_Diagram](https://user-images.githubusercontent.com/83903563/148193366-09453079-661d-479f-bf7d-40a375ea9435.jpg)

* [UML] Sequence Diagram - 집들이 게시판
<img width="70%" src="https://user-images.githubusercontent.com/83903563/148193756-7413f850-db35-4717-af4a-6bfa20baf370.jpg"/>

## 구축 화면
### `매일의집`
  * **[메인]**&nbsp;&nbsp;[전체 페이지](https://github.com/eehyeonzee/EverydayHome/tree/main2/springProject/src/main/webapp/WEB-INF/views)
  <img width="85%" src="https://user-images.githubusercontent.com/83903563/148885942-275e845b-be9c-4ee4-b727-95dabb5bd251.png"/>
<br/><br/>

  * **[메인]**&nbsp;&nbsp;[푸터](https://github.com/eehyeonzee/EverydayHome/blob/main2/springProject/src/main/webapp/WEB-INF/views/template/footer.jsp)
  ![01-1  메인-푸터](https://user-images.githubusercontent.com/83903563/148888601-101f1825-659b-41c1-94c2-0b6d6a7fe7c9.png)
<br/><br/>

### `커뮤니티 - 집들이`
  * **[글 목록]**
  <img width="90%" src="https://user-images.githubusercontent.com/83903563/148889970-8a8f850f-630e-457d-9196-0f032acfb989.png"/>
<br/><br/>

  * **[글 목록]**&nbsp;&nbsp;카테고리별 검색
  ![02-1  목록-카테고리 검색](https://user-images.githubusercontent.com/83903563/148891363-b9617e4a-ed33-4d18-b09e-b5fd26cefeb9.png)
<br/><br/>

  * **[글 작성]**
  <img width="95%" src="https://user-images.githubusercontent.com/83903563/148934295-b274ec7a-131c-49f6-b25c-a229b143fd46.png"/>
<br/><br/>

  * **[글 상세]**
  <img width="90%" src="https://user-images.githubusercontent.com/83903563/148938197-5aa5d801-8181-4972-9014-1993e602f287.png"/>
<br/><br/>

  * **[글 상세]**&nbsp;&nbsp;추천 및 스크랩
  ![04-3 추천 및 스크랩 완료(ajax)](https://user-images.githubusercontent.com/83903563/148918190-edf03c5a-8d93-479c-a6e5-d634add1ab4a.png)
<br/><br/>

  * **[글 상세]**&nbsp;&nbsp;카카오톡 공유API 외
  <img width="85%" src="https://user-images.githubusercontent.com/83903563/148931261-ac0da8b6-68ff-49d9-a7f1-9fd04fa4be36.png"/>
<br/><br/>

  * **[글 수정]**&nbsp;&nbsp;저장된 카테고리 불러오기 외
  <img width="85%" src="https://user-images.githubusercontent.com/83903563/148943779-9e165344-b600-404a-a1aa-d288243b7be5.png"/>
<br/><br/>

  * **[글 삭제]**
  <img width="80%" src="https://user-images.githubusercontent.com/83903563/149277146-233e3385-7ffd-421c-a147-9d6618156a1a.png"/>
<br/><br/>


