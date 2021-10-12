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