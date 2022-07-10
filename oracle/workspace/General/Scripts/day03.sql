/*1. �䱸���� �м�
	-��
	���� ����, �̸�, ����, ����

	-����
	�̸�, ����, �ּ�, �ڵ��� ��ȣ

2. ������ ����
	��				����
	-----------------------
	��� ��ȣ			�� ��ȣ
	���� ����			�̸�
	���� �̸�			����
	���� ����			�ּ�
	���� ����			�ڵ�����ȣ

3. ���� ����
	��				����
	-----------------------
	��� ��ȣP			�� ��ȣP
	-----------------------
	���� ����			�̸�
	���� �̸�			����
	���� ����			�ּ�
	���� ����			�ڵ�����ȣU
	�� ��ȣF		

4. ������ ����
	OWNER
	-----------------------
	NUM : NUMBER
	-----------------------
	NAME : VARCHAR2(1000)
	AGE : NUMBER(3)
	ADDRESS : VARCHAR2(1000)
	PHONE : VARCHAR2(100)
	
	
	PET
	-----------------------
	registNum : NUMBER
	-----------------------
	petType : VARCHAR2(1000)
	name : VARCHAR2(1000)
	age : NUMBER(3)
	reason : VARCHAR2(3000)
	num : NUMBER
*/	
-- 5. ����
CREATE TABLE OWNER(
	NUM NUMBER CONSTRAINT PK_OWNER PRIMARY KEY,
	NAME VARCHAR2(1000),
	AGE NUMBER(3),
	ADDRESS VARCHAR2(1000),
	PHONE VARCHAR2(100) CONSTRAINT UK_OWNER UNIQUE
);

CREATE TABLE PET(
	registNum NUMBER CONSTRAINT PK_PET PRIMARY KEY,
	petType VARCHAR2(1000),
	name VARCHAR2(1000),
	age NUMBER(3),
	reason VARCHAR2(3000),
	num NUMBER,
	CONSTRAINT FK_PET FOREIGN KEY(num) REFERENCES OWNER(num)
);

SELECT * FROM TBL_FLOWER;
SELECT * FROM TBL_POT;
SELECT * FROM OWNER;
SELECT * FROM PET;

SELECT * FROM TBL_STUDENT;

INSERT INTO TBL_STUDENT
(NUM, ID, NAME, MAJOR, BIRTH)
VALUES(1, 'hds1234', '�ѵ���', '��ǻ�Ͱ���', TO_DATE('1999-12-04', 'YYYY-MM-DD'));

INSERT INTO TBL_STUDENT
(NUM, ID, NAME, MAJOR, GENDER, BIRTH)
VALUES(2, 'hgd1234', 'ȫ�浿', '��ǻ�Ͱ���', 'M', TO_DATE('1980-01-01', 'YYYY-MM-DD'));

INSERT INTO TBL_STUDENT
VALUES(3, 'hgd1234', 'ȫ�浿', '��ǻ�Ͱ���', 'M', TO_DATE('1980-01-01', 'YYYY-MM-DD'));

UPDATE TBL_STUDENT 
SET GENDER = 'M';

TRUNCATE TABLE TBL_STUDENT;
DELETE FROM TBL_STUDENT;

SELECT * FROM TBL_STUDENT
WHERE NAME = 'ȫ�浿';

UPDATE TBL_STUDENT 
SET GENDER = 'F'
WHERE NUM = 1;

-- ��ŷ�����а��� �ٴϴ� ȫ�浿�� �����ߴ�.
SELECT NUM FROM TBL_STUDENT
WHERE NAME = 'ȫ�浿' AND MAJOR = '��ŷ����';

DELETE FROM TBL_STUDENT
WHERE NUM = 2;

--����Ű(����Ű)
--	�� �� �̻��� �÷��� �ϳ��� PK�� ����
--	PRIMARY KEY(�÷���1, �÷���2)
--	FOREIGN KEY(�÷���1, �÷���2) REFERENCES �θ����̺��(�θ��÷���1, �θ��÷���2)

ALTER TABLE TBL_POT MODIFY(NUM VARCHAR2(1000));
ALTER TABLE TBL_POT DROP CONSTRAINT FK_POT;
ALTER TABLE TBL_FLOWER DROP CONSTRAINT SYS_C007023;

ALTER TABLE TBL_FLOWER ADD CONSTRAINT PK_FLOWER PRIMARY KEY(NAME, COLOR);
ALTER TABLE TBL_POT ADD CONSTRAINT FK_POT FOREIGN KEY(NAME, COLOR)
REFERENCES TBL_FLOWER(NAME, COLOR);
ALTER TABLE TBL_POT ADD CONSTRAINT FK_POT FOREIGN KEY(NAME, COLOR)
REFERENCES TBL_FLOWER(NAME, COLOR) ON DELETE CASCADE;

ALTER TABLE TBL_POT ADD(potColor VARCHAR2(1000));

--�߰�
--	���, ������, 1500��
INSERT INTO TBL_FLOWER
(NAME, COLOR, PRICE)
VALUES('���', '������', 1500);

--	���, ��ũ��, 1700��
INSERT INTO TBL_FLOWER
(NAME, COLOR, PRICE)
VALUES('���', '��ũ��', 1700);

--	�عٶ��, �����, 3500��
INSERT INTO TBL_FLOWER
(NAME, COLOR, PRICE)
VALUES('�عٶ��', '�����', 3500);

SELECT * FROM TBL_FLOWER;

--	APPLE001, GREEN, ������, ���
INSERT INTO TBL_POT
(NUM, COLOR, SHAPE, NAME, POTCOLOR)
VALUES('APPLE001', '������', '������', '���', 'GREEN');

INSERT INTO TBL_POT
(NUM, COLOR, SHAPE, NAME, POTCOLOR)
VALUES('APPLE002', '��ũ��', '������', '���', 'GREEN');

--	POT001, WHITE, �����, �عٶ��
INSERT INTO TBL_POT
(NUM, COLOR, SHAPE, NAME, POTCOLOR)
VALUES('POT001', '�����', '�����', '�عٶ��', 'WHITE');

--	POT002, BLACK, ���簢��, �عٶ��
INSERT INTO TBL_POT
(NUM, COLOR, SHAPE, NAME, POTCOLOR)
VALUES('POT002', '�����', '���簢��', '�عٶ��', 'BLACK');

SELECT * FROM TBL_POT;

--����
--	��̲� ����
DELETE FROM TBL_FLOWER
WHERE NAME = '���';

-- 	1500������ ��� �� ����
DELETE FROM TBL_POT
WHERE NAME = '�عٶ��';

DELETE FROM TBL_FLOWER
WHERE PRICE > 1500;

-- 	��̲��� ���� �� �ִ� ȭ�� ����
DELETE FROM TBL_POT
WHERE NAME = '���';

--����
--	������ ��� ���� 10% �λ�
SELECT * FROM TBL_FLOWER
WHERE NAME = '���' AND COLOR = '������';

UPDATE TBL_FLOWER
SET PRICE = PRICE * 1.1
WHERE NAME = '���' AND COLOR = '������';

--	��ũ�� ��� ������ 100�� �λ�
SELECT * FROM TBL_FLOWER
WHERE NAME = '���' AND COLOR = '��ũ��';

UPDATE TBL_FLOWER
SET PRICE = PRICE * 100
WHERE NAME = '���' AND COLOR = '��ũ��';

--	���簢���� ȭ���� ���簢������ ����
UPDATE TBL_POT
SET SHAPE = '���簢��'
WHERE SHAPE = '���簢��';

SELECT * FROM TBL_POT;
---------------------------------------------------------------------
SELECT * FROM PLAYER;
--PLAYER ���̺��� TEAM_ID�� 'K01'�� ���� �˻�
SELECT * FROM PLAYER
WHERE TEAM_ID = 'K01';

--PLAYER ���̺��� TEAM_ID�� 'K01'�� �ƴ� ���� �˻�
SELECT * FROM PLAYER
WHERE TEAM_ID ^= 'K01';

--PLAYER ���̺��� WEIGHT�� 70�̻��̰� 80������ ���� �˻�
SELECT * FROM PLAYER
WHERE WEIGHT >= 70 AND WEIGHT <= 80;

--PLAYER ���̺��� TEAM_ID�� 'K03'�̰� HEIGHT�� 180�̸��� ���� �˻�
SELECT * FROM PLAYER
WHERE TEAM_ID = 'K03' AND HEIGHT < 180;

--PLAYER ���̺��� TEAM_ID�� 'K06'�̰� NICKNAME�� '����'�� ���� �˻�
SELECT * FROM PLAYER
WHERE TEAM_ID = 'K06' AND NICKNAME = '����';

--PLAYER ���̺��� HEIGHT�� 170�̻��̰� WEIGHT�� 80�̻��� ���� �̸� �˻�
SELECT PLAYER_NAME, HEIGHT, WEIGHT FROM PLAYER
WHERE HEIGHT >= 170 AND WEIGHT >= 80;

--STADIUM ���̺��� SEAT_COUNT�� 30000�ʰ��̰� 41000������ ����� �˻�
SELECT * FROM STADIUM
WHERE SEAT_COUNT > 30000 AND SEAT_COUNT <= 41000;

--PLAYER ���̺��� TEAM_ID�� 'K02'�̰ų� 'K07'�̰� �������� 'MF'�� ���� �˻�
SELECT * FROM PLAYER
WHERE (TEAM_ID = 'K02' OR TEAM_ID = 'K07') AND "POSITION" = 'MF';

--PLAYER ���̺��� TEAM_ID�� 'K01'�� ���� �̸��� �� �̸����� �ٲٱ�
UPDATE PLAYER
SET PLAYER_NAME = '�ѵ���'
WHERE TEAM_ID = 'K01';

SELECT * FROM PLAYER WHERE TEAM_ID = 'K01';

--PLAYER ���̺��� POSITION�� 'MF'�� ���� �����ϱ�
DELETE FROM PLAYER
WHERE "POSITION" = 'MF';

SELECT * FROM PLAYER
WHERE "POSITION" = 'MF';

--PLAYER ���̺��� HEIGHT�� 180�̻��� ���� �����ϱ�
DELETE FROM PLAYER
WHERE HEIGHT >= 180;

SELECT * FROM PLAYER
WHERE HEIGHT >= 180;


