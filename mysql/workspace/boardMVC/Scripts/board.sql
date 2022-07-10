drop table tbl_board;

create table tbl_board(
	boardNumber int unsigned auto_increment primary key,
	boardTitle varchar(2000),
	boardContent varchar(5000),
	memberNumber int unsigned,
	boardDate date,
	readCount int unsigned default 0,
	constraint fk_board foreign key(memberNumber) references tbl_member(memberNumber)
);

select * from tbl_board;

insert into tbl_board(boardTitle, boardContent, memberNumber, boardDate)
values('테스트 제목', '테스트 내용', 1, now());

/*더미 데이터 생성 시 insert할 컬럼 개수만큼 서브 쿼리를 사용해서 select로 가져온다.*/
insert into tbl_board(boardTitle, boardContent, memberNumber, boardDate)
(select boardTitle, boardContent, memberNumber, boardDate from tbl_board);

/*
 * limit : 가장 마지막에 처리되는 명령어
 * limit 시작인덱스, 개수
 * ※ 시작인덱스는 0부터 시작한다.
 * */
select * from tbl_board order by 1 desc
limit 20, 10

select boardNumber from tbl_board
order by 1 desc limit 0, 1;

select count(boardNumber) from tbl_board;

create table tbl_files(
	fileName varchar(765) primary key,
	boardNumber int unsigned,
	fileNameOriginal varchar(2000)
);

alter table tbl_files add constraint fk_files foreign key(boardNumber)
references tbl_board(boardNumber);

select * from tbl_files;