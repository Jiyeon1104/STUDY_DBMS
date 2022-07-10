use board;

create table tbl_reply(
	replyNumber int unsigned auto_increment primary key,
	boardNumber int unsigned,
	memberNumber int unsigned,
	replyContent varchar(3000),
	constraint fk_reply_boardNumber foreign key(boardNumber) references tbl_board(boardNumber)
);

alter table tbl_reply add 
constraint fk_reply_memberNumber foreign key(memberNumber) references tbl_member(memberNumber);

select * from tbl_reply;

insert into tbl_reply
(boardNumber, memberNumber, replyContent)
values(1020, 1, '�ѵ���¯2');
