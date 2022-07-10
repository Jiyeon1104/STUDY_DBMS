create database test;
use test;

drop table guest;

create table guest(
	userNum int unsigned auto_increment primary key,
	userId varchar(1000),
	userPw varchar(1000),
	userAge tinyint unsigned
);

select * from guest;

alter table guest add column(birth date);

insert into guest(userId, userPw, userAge, birth)
values('hds1234', '1234', 20, '2002-12-04');

delete from guest where userId='hds1234';

/*��ȣȭ*/
insert into guest(userId, userPw, userAge, birth)
values('hds1234', hex(aes_encrypt('1234', 'abc')), 20, '2002-12-04');

/*��ȣȭ*/
select userNum, userId, aes_decrypt(unhex(userPw), 'abc') from guest;

/*���� ������ ��������*/
select `AUTO_INCREMENT` from information_schema.TABLES
where TABLE_SCHEMA = 'test' and TABLE_NAME = 'guest';

/*���ڿ� ��ġ��*/
select concat(userId, ', ', userAge, '��') from guest;

/*���� ��¥ : now()*/
select now() from dual;

/*��¥�� string���� ����: date_format(�ð�, '����')*/
select date_format(now(), '%Y�� %m�� %d�� %H:%i:%s') from dual;
/*����, ��~��: 0~6*/
select date_format(now(), '%y�� %m�� %d�� %w') from dual;

/*NULL�� ��� ���ϴ� ������ ��ü: ifnull(�÷���, 'null�� ��� ��')*/
insert into guest(userId, userPw, userAge)
values('hds4444', hex(aes_encrypt('1234', 'abc')), 20);

select userId, userPw, userAge, ifnull(birth, '�̵��') from guest;

/*
 * [mysql]
 * guest ��Ű�� ����
 * member ���̺� ����
 * ȸ����ȣ(auto_increment, PK), �̸�, ���� �÷� �߰�
 */
create database guest;
use guest;

create table `member`(
	memberNumber int unsigned auto_increment,
	memberName varchar(1000),
	memberBirth date,
	constraint pk_member primary key(memberNumber)
);

select * from `member`;

insert into `member`(memberName, memberBirth)
values('�ѵ���', '2000-12-04');
insert into `member`(memberName, memberBirth)
values('�ѵ���', '2008-12-04');
insert into `member`(memberName, memberBirth)
values('�����', '1996-10-24');

 /* [JAVA]
 * Model��ü ����
 * DAO��ü ����
 * DBConnecter�� ������ ����� ������ ���
 * �̸����� ���� ã�� ������ ����
 * */


