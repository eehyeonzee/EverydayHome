-- 21.10.12 16:30 회원 테이블 카카오 닉네임 추가
alter table member add kakao_nickname varchar2(30);

-- 21.10.12 17:00 회원테이블 제거 및 회원 상세테이블로 이동
alter table member drop column kakao_nickname;
alter table mem_detail add nickname varchar2(30);

-- 21.10.13 00 회원테이블 비밀번호 KEY, 비밀번호 답 삭제
alter table mem_detail drop column passwdkey;
alter table mem_detail drop column passwdq_uestion;

-- 21.10.13 01:00 카테고리 테이블 추가 및 상품 테이블 카테고리 컬럼 추가
alter table product add prod_cate varchar2(50) not null;
create table category (
    prod_cate varchar2(50) not null,
    cate_name varchar2(50) not null
);

-- 21.10.13 16:55 회원 팔로우 테이블 추가
CREATE TABLE follow
(
    follow_num          NUMBER    NOT NULL, 
    follow_mem_num      NUMBER    NOT NULL, 
    follower_mem_num    NUMBER    NOT NULL, 
    CONSTRAINT PK_follow_num PRIMARY KEY (follow_num)
);
/

CREATE SEQUENCE follow_SEQ
START WITH 1
INCREMENT BY 1;
/

--21.10.14 12:07 service_board 테이블 drop 후 create 해주세요
DROP TABLE service_board;

CREATE TABLE service_board
(
    service_num         NUMBER           NOT NULL, 
    service_title       VARCHAR2(150)    NOT NULL, 
    service_nickname    VARCHAR2(30)     NOT NULL, 
    service_content     CLOB             NOT NULL, 
    service_email       VARCHAR2(150)    NOT NULL, 
    service_keyword     VARCHAR2(50)     NOT NULL, 
    service_filename    VARCHAR2(150)    NULL, 
    service_file        BLOB             NULL, 
    mem_num             NUMBER           NULL, 
    CONSTRAINT PK_service_num PRIMARY KEY (service_num)
);