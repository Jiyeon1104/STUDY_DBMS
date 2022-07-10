--AS(ALIAS) : ��Ī
--SELECT : �÷��� �ڿ� AS �Ǵ� �� ĭ ���� �ۼ��Ѵ�.

--�����̸��� ���� ��ȸ
SELECT PLAYER_NAME "���� �̸�", BIRTH_DATE AS ���� FROM PLAYER;

--PLAYER ���̺��� BACK_NO�� "�� ��ȣ"��, NICKNAME�� "���� ����"���� �����Ͽ� �˻�
SELECT BACK_NO AS "�� ��ȣ", NICKNAME "���� ����" FROM PLAYER;

--CONCATENATION(����)
--	||
SELECT PLAYER_NAME || '�� ���� �̸��� ' || E_PLAYER_NAME || '�Դϴ�.' AS �ڱ�Ұ� FROM PLAYER;
SELECT '�ȳ�' FROM PLAYER;

-- ���������� ������ �Ӹ��̴�.
SELECT PLAYER_NAME || '�� ������ ' || NICKNAME || '�̴�.' AS �ڱ�Ұ� FROM PLAYER
WHERE NICKNAME IS NOT NULL;

-- ���������� �������� �Ӹ��̴�.
SELECT PLAYER_NAME || '�� �������� ' || "POSITION" || '�̴�.' AS �ڱ�Ұ� FROM PLAYER;
SELECT * FROM PLAYER WHERE "POSITION" IS NULL;

-- LIKE : ���Ե� ���ڿ� ���� ã��, ������ ������ ������ �� �� �ִ�.
--	% : ��� ��
--	_ : ���� ��

-- ����
-- '%A' : A�� ������ ��� ��(NDFLSNJFA, 123NFJA, ...)
-- 'A%' : A�� �����ϴ� ��� ��(AA, ANDKFS, AJD, ...)
-- 'A__' : A�� �����ϸ� 3������ ��(ABC, AAA, ADD, ...)
-- '_A' : A�� ������ 2������ ��(FA, CA, DA, ...)
-- '%A%' : A�� ���Ե� ��(APPLE, BANANA, TASK, ...)

--'õ��'�� ������ �� �̸� ã��
SELECT * FROM TEAM
WHERE TEAM_NAME LIKE '%õ��';

--PLAYER���̺��� �达 ã��
SELECT * FROM PLAYER
WHERE PLAYER_NAME LIKE '��%';

--PLAYER���̺��� �达 �� �� ã��
SELECT * FROM PLAYER
WHERE PLAYER_NAME LIKE '��_';

--PLAYER���̺��� �达�� �̾� ã��
SELECT * FROM PLAYER
WHERE PLAYER_NAME LIKE '��%' OR PLAYER_NAME LIKE '��%';

--PLAYER���̺��� �̾��� �ƴ� ��� ã��
SELECT * FROM PLAYER
WHERE PLAYER_NAME NOT LIKE '��%';

SELECT * FROM PLAYER
WHERE NOT PLAYER_NAME LIKE '��%';

--PLAYER���̺��� �� �ڰ� �ƴ� �达 ã��
SELECT * FROM PLAYER
WHERE NOT PLAYER_NAME LIKE '��__' AND PLAYER_NAME LIKE '��%';

--PLAYER���̺��� POSITION�� NULL�� ���� �˻�
SELECT * FROM PLAYER
WHERE "POSITION" IS NULL;

--PLAYER���̺��� POSITION�� NULL�̸� '����'���� ��� ����ϱ�
SELECT NVL("POSITION", '����') FROM PLAYER
WHERE "POSITION" IS NULL;

--PLAYER���̺��� NATION�� NULL�� �ƴϸ� '���', NULL�̸� '�̵��'���� �����ϰ� ���� �̸��� ���� ���� ����ϱ�
SELECT PLAYER_NAME, NVL(NICKNAME, '���� ����') ����, NVL2(NATION, '���', '�̵��') "���� ��� ����" FROM PLAYER;

------------------------------------------------------------------------------------------
-- ������ �Լ�(DUAL)

-- ���밪
SELECT ABS(-10) FROM DUAL;

-- ���� ����(1), ��(0), ��������(-1)
SELECT SIGN(4), SIGN(0), SIGN(-4) FROM DUAL;

-- ������
SELECT MOD(10, 3) FROM DUAL;

-- ������ ū �ֱ��� ����
SELECT CEIL(3.14), CEIL(-3.14) FROM DUAL;

-- ������ ���� �ֱ��� ����
SELECT FLOOR(3.14), FLOOR(-3.14)

-- �ݿø�
SELECT ROUND(3.55555555555616) FROM DUAL;
SELECT ROUND(3.55555555555616, 2) FROM DUAL;
SELECT ROUND(3.55555555555616, 1) FROM DUAL;

-- ����
SELECT TRUNC(3.9) FROM DUAL;
SELECT TRUNC(-3.9) FROM DUAL;

--PLAYER ���̺����� Ű�� �Ҽ��� �� °�ڸ����� �ݿø�, �����Դ� �Ҽ��� �������� ��ȸ
SELECT PLAYER_NAME || '�� ' "�����̸�", NVL(ROUND(HEIGHT, 2), 180) || 'cm' Ű, NVL(TRUNC(WEIGHT), 70) || 'kg' ������
FROM PLAYER;

-- ���� �Լ�
-- ���� ���� ���� �ϳ��� ������ �����Ͽ� ��Ÿ����.
-- �� NULL�� �������� �ʴ´�.
-- �� WHERE �������� ����� �� ����.

--��� AVG()
--�ִ밪 MAX()
--�ּҰ� MIN()
--�� �� SUM()
--���� COUNT()

SELECT AVG(HEIGHT), MAX(HEIGHT), MIN(HEIGHT), SUM(HEIGHT), COUNT(HEIGHT) FROM PLAYER;
SELECT COUNT(*) FROM PLAYER;

-- PLAYER���̺��� HEIGHT ���� �˻�(NULL �����ؼ� COUNT)
SELECT COUNT(HEIGHT) FROM PLAYER;
SELECT COUNT(NVL(HEIGHT, 0)) "�� �ο�" FROM PLAYER;

--����(ORDER BY)
--ASC : ���� ����
--DESC :  ���� ����

SELECT * FROM PLAYER ORDER BY HEIGHT ASC;
SELECT * FROM PLAYER ORDER BY HEIGHT;
SELECT * FROM PLAYER ORDER BY HEIGHT DESC;
SELECT * FROM PLAYER ORDER BY 12 DESC;
SELECT * FROM PLAYER ORDER BY HEIGHT, WEIGHT;

--PLAYER ���̺��� Ű ��, ������ ������ ���� ���� �˻�
--NULL�� �ƴ� ���� �˻�
--ù��° �÷� ���� ������ �ι�° ������ �Ѵ�.
SELECT * FROM PLAYER
WHERE HEIGHT IS NOT NULL AND WEIGHT IS NOT NULL
ORDER BY 12, 13;
------------------------------------------------------------------------
-- CASE��
-- CASE WHEN THEN ELSE END

-- EMP ���̺��� SAL 3000�̻��̸� HIGH, 1000�̻��̸� MID, �� �ƴϸ� LOW
SELECT * FROM SALGRADE;

SELECT
ENAME,
CASE
	WHEN SAL >= 3000 THEN 'HIGH'
	WHEN SAL >= 1000 THEN 'MID'
	ELSE 'LOW'
END AS �޿�
FROM EMP;

--STADIUM ���̺��� SEAT_COUNT�� 0�̻� 30000�����̸� 'S'
--30001�̻� 50000���ϸ� 'M' �� �ƴϸ� 'L'
--��ȭ(CASE���� 2�� ����Ѵ�).
SELECT
	STADIUM_NAME, 
	CASE
		WHEN SEAT_COUNT BETWEEN 0 AND 30000 THEN 'S'
		ELSE
		(
			CASE
				WHEN SEAT_COUNT BETWEEN 30001 AND 50000
				THEN 'M'
				ELSE 'L'
			END
		)
	END �Ը�
FROM STADIUM;

-- ��� �� �޿��� 
-- 3000�̻�, 5000���ϸ� '���� ����'
-- 5001�̻�, 8000���ϸ� '���� ����'
-- �̿ܿ��� '���� �϶�'
-- BETWEEN ���
SELECT
FIRST_NAME, 
CASE
	WHEN SALARY BETWEEN 3000 AND 5000 THEN '���� ����'
	WHEN SALARY BETWEEN 5001 AND 8000 THEN '���� ����'
	ELSE '���� �϶�'
END AS "���� ���̺�"
FROM EMPLOYEES;
---------------------------------------------------------------
-- GROUP BY : ~��(�� : ������ �� ��� Ű)
-- GROUP BY �÷��� HAVING ���ǽ�
-- �� WHERE���� �켱������ ó���� ���ǽ��� �ۼ��ؾ� �ӵ��� ������.

-- PLAYER ���̺��� ������ ���� �˻�
SELECT "POSITION" FROM PLAYER
GROUP BY "POSITION"
HAVING "POSITION" IS NOT NULL;

SELECT "POSITION" FROM PLAYER
WHERE "POSITION" IS NOT NULL
GROUP BY "POSITION";

--PLAYER ���̺��� �����԰� 80�̻��� �������� ��� Ű�� 180�̻��� ������ �˻�
SELECT "POSITION", AVG(HEIGHT), MIN(WEIGHT) FROM PLAYER
WHERE WEIGHT >= 80
GROUP BY "POSITION"
HAVING AVG(HEIGHT) >= 180;

-- EMPLOYEES ���̺��� JOB_ID�� ��� SALARY�� 10000�̸��� JOB_ID �˻�
-- JOB_ID�� ���ĺ� ������ ����(��������)

-- PLAYER ���̺��� ��ü ��� Ű�� �����Ǻ� ��� Ű ���ϱ�
-- GROUP BY ���� �ʱ�
-- ��Ʈ! CASE�� ���.







