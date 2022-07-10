/*
 * test 스키마, guest 테이블 회원가입, 로그인 제작, 
 * 화면에서 input태그로 입력받아서 처리, 
 * 로그인 성공 시 000님 환영합니다로 000자리에 id넣어주기
 */
use test;
select * from guest;

select count(userId) from guest where userId = '1234';

create database form;
use form;

create table tbl_member(
	memberNum int unsigned auto_increment primary key,
	memberId varchar(1000),
	memberName varchar(500),
	memberPw varchar(1000),
	gender char(3),
	address varchar(2000),
	addressDetail varchar(1000)
);

select * from tbl_member;




