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

/*암호화*/
insert into guest(userId, userPw, userAge, birth)
values('hds1234', hex(aes_encrypt('1234', 'abc')), 20, '2002-12-04');

/*복호화*/
select userNum, userId, aes_decrypt(unhex(userPw), 'abc') from guest;

/*현재 시퀀스 가져오기*/
select `AUTO_INCREMENT` from information_schema.TABLES
where TABLE_SCHEMA = 'test' and TABLE_NAME = 'guest';

/*문자열 합치기*/
select concat(userId, ', ', userAge, '살') from guest;

/*현재 날짜 : now()*/
select now() from dual;

/*날짜를 string으로 변경: date_format(시간, '형식')*/
select date_format(now(), '%Y년 %m월 %d일 %H:%i:%s') from dual;
/*요일, 일~토: 0~6*/
select date_format(now(), '%y년 %m월 %d일 %w') from dual;

/*NULL일 경우 원하는 값으로 대체: ifnull(컬럼명, 'null일 경우 값')*/
insert into guest(userId, userPw, userAge)
values('hds4444', hex(aes_encrypt('1234', 'abc')), 20);

select userId, userPw, userAge, ifnull(birth, '미등록') from guest;

/*
 * [mysql]
 * guest 스키마 생성
 * member 테이블 생성
 * 회원번호(auto_increment, PK), 이름, 생일 컬럼 추가
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
values('한동석', '2000-12-04');
insert into `member`(memberName, memberBirth)
values('한동석', '2008-12-04');
insert into `member`(memberName, memberBirth)
values('배상혁', '1996-10-24');

 /* [JAVA]
 * Model객체 생성
 * DAO객체 생성
 * DBConnecter는 기존에 연결된 것으로 사용
 * 이름으로 생일 찾기 콘텐츠 구현
 * */


