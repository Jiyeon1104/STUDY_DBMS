/*
 * test ��Ű��, guest ���̺� ȸ������, �α��� ����, 
 * ȭ�鿡�� input�±׷� �Է¹޾Ƽ� ó��, 
 * �α��� ���� �� 000�� ȯ���մϴٷ� 000�ڸ��� id�־��ֱ�
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




