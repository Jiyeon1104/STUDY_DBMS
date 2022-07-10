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
values('�׽�Ʈ ����', '�׽�Ʈ ����', 1, now());

/*���� ������ ���� �� insert�� �÷� ������ŭ ���� ������ ����ؼ� select�� �����´�.*/
insert into tbl_board(boardTitle, boardContent, memberNumber, boardDate)
(select boardTitle, boardContent, memberNumber, boardDate from tbl_board);

/*
 * limit : ���� �������� ó���Ǵ� ��ɾ�
 * limit �����ε���, ����
 * �� �����ε����� 0���� �����Ѵ�.
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