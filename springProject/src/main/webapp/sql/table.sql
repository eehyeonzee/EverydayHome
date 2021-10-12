-- 21.10.12 16:30 회원 테이블 카카오 닉네임 추가
alter table member add kakao_nickname varchar2(30);

-- 21.10.12 17:00 회원테이블 제거 및 회원 상세테이블로 이동
alter table member drop column kakao_nickname;
alter table mem_detail add nickname varchar2(30);