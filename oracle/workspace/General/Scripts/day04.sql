--AS(ALIAS) : 별칭
--SELECT : 컬럼명 뒤에 AS 또는 한 칸 띄어쓰고 작성한다.

--선수이름과 생일 조회
SELECT PLAYER_NAME "선수 이름", BIRTH_DATE AS 생일 FROM PLAYER;

--PLAYER 테이블에서 BACK_NO를 "등 번호"로, NICKNAME을 "선수 별명"으로 변경하여 검색
SELECT BACK_NO AS "등 번호", NICKNAME "선수 별명" FROM PLAYER;

--CONCATENATION(연결)
--	||
SELECT PLAYER_NAME || '의 영어 이름은 ' || E_PLAYER_NAME || '입니다.' AS 자기소개 FROM PLAYER;
SELECT '안녕' FROM PLAYER;

-- 누구누구의 별명은 머머이다.
SELECT PLAYER_NAME || '의 별명은 ' || NICKNAME || '이다.' AS 자기소개 FROM PLAYER
WHERE NICKNAME IS NOT NULL;

-- 누구누구의 포지션은 머머이다.
SELECT PLAYER_NAME || '의 포지션은 ' || "POSITION" || '이다.' AS 자기소개 FROM PLAYER;
SELECT * FROM PLAYER WHERE "POSITION" IS NULL;

-- LIKE : 포함된 문자열 값을 찾고, 문자의 개수도 제한을 줄 수 있다.
--	% : 모든 것
--	_ : 글자 수

-- 예시
-- '%A' : A로 끝나는 모든 값(NDFLSNJFA, 123NFJA, ...)
-- 'A%' : A로 시작하는 모든 값(AA, ANDKFS, AJD, ...)
-- 'A__' : A로 시작하며 3글자인 값(ABC, AAA, ADD, ...)
-- '_A' : A로 끝나며 2글자인 값(FA, CA, DA, ...)
-- '%A%' : A가 포함된 값(APPLE, BANANA, TASK, ...)

--'천마'로 끝나는 팀 이름 찾기
SELECT * FROM TEAM
WHERE TEAM_NAME LIKE '%천마';

--PLAYER테이블에서 김씨 찾기
SELECT * FROM PLAYER
WHERE PLAYER_NAME LIKE '김%';

--PLAYER테이블에서 김씨 두 자 찾기
SELECT * FROM PLAYER
WHERE PLAYER_NAME LIKE '김_';

--PLAYER테이블에서 김씨와 이씨 찾기
SELECT * FROM PLAYER
WHERE PLAYER_NAME LIKE '김%' OR PLAYER_NAME LIKE '이%';

--PLAYER테이블에서 이씨가 아닌 사람 찾기
SELECT * FROM PLAYER
WHERE PLAYER_NAME NOT LIKE '이%';

SELECT * FROM PLAYER
WHERE NOT PLAYER_NAME LIKE '이%';

--PLAYER테이블에서 세 자가 아닌 김씨 찾기
SELECT * FROM PLAYER
WHERE NOT PLAYER_NAME LIKE '김__' AND PLAYER_NAME LIKE '김%';

--PLAYER테이블에서 POSITION이 NULL인 선수 검색
SELECT * FROM PLAYER
WHERE "POSITION" IS NULL;

--PLAYER테이블에서 POSITION이 NULL이면 '미정'으로 결과 출력하기
SELECT NVL("POSITION", '미정') FROM PLAYER
WHERE "POSITION" IS NULL;

--PLAYER테이블에서 NATION이 NULL이 아니면 '등록', NULL이면 '미등록'으로 변경하고 선수 이름과 선수 별명 출력하기
SELECT PLAYER_NAME, NVL(NICKNAME, '별명 없음') 별명, NVL2(NATION, '등록', '미등록') "국가 등록 여부" FROM PLAYER;

------------------------------------------------------------------------------------------
-- 숫자형 함수(DUAL)

-- 절대값
SELECT ABS(-10) FROM DUAL;

-- 양의 정수(1), 영(0), 음의정수(-1)
SELECT SIGN(4), SIGN(0), SIGN(-4) FROM DUAL;

-- 나머지
SELECT MOD(10, 3) FROM DUAL;

-- 값보다 큰 최근접 정수
SELECT CEIL(3.14), CEIL(-3.14) FROM DUAL;

-- 값보다 작은 최근접 정수
SELECT FLOOR(3.14), FLOOR(-3.14)

-- 반올림
SELECT ROUND(3.55555555555616) FROM DUAL;
SELECT ROUND(3.55555555555616, 2) FROM DUAL;
SELECT ROUND(3.55555555555616, 1) FROM DUAL;

-- 버림
SELECT TRUNC(3.9) FROM DUAL;
SELECT TRUNC(-3.9) FROM DUAL;

--PLAYER 테이블에서는 키는 소수점 둘 째자리까지 반올림, 몸무게는 소수점 버림으로 조회
SELECT PLAYER_NAME || '님 ' "선수이름", NVL(ROUND(HEIGHT, 2), 180) || 'cm' 키, NVL(TRUNC(WEIGHT), 70) || 'kg' 몸무게
FROM PLAYER;

-- 집계 함수
-- 여러 개의 값을 하나의 값으로 집계하여 나타낸다.
-- ※ NULL은 포함하지 않는다.
-- ※ WHERE 절에서는 사용할 수 없다.

--평균 AVG()
--최대값 MAX()
--최소값 MIN()
--총 합 SUM()
--개수 COUNT()

SELECT AVG(HEIGHT), MAX(HEIGHT), MIN(HEIGHT), SUM(HEIGHT), COUNT(HEIGHT) FROM PLAYER;
SELECT COUNT(*) FROM PLAYER;

-- PLAYER테이블에서 HEIGHT 개수 검색(NULL 포함해서 COUNT)
SELECT COUNT(HEIGHT) FROM PLAYER;
SELECT COUNT(NVL(HEIGHT, 0)) "총 인원" FROM PLAYER;

--정렬(ORDER BY)
--ASC : 오름 차순
--DESC :  내림 차순

SELECT * FROM PLAYER ORDER BY HEIGHT ASC;
SELECT * FROM PLAYER ORDER BY HEIGHT;
SELECT * FROM PLAYER ORDER BY HEIGHT DESC;
SELECT * FROM PLAYER ORDER BY 12 DESC;
SELECT * FROM PLAYER ORDER BY HEIGHT, WEIGHT;

--PLAYER 테이블에서 키 순, 몸무게 순으로 오름 차순 검색
--NULL이 아닌 값만 검색
--첫번째 컬럼 값이 같으면 두번째 정렬을 한다.
SELECT * FROM PLAYER
WHERE HEIGHT IS NOT NULL AND WEIGHT IS NOT NULL
ORDER BY 12, 13;
------------------------------------------------------------------------
-- CASE문
-- CASE WHEN THEN ELSE END

-- EMP 테이블에서 SAL 3000이상이면 HIGH, 1000이상이면 MID, 다 아니면 LOW
SELECT * FROM SALGRADE;

SELECT
ENAME,
CASE
	WHEN SAL >= 3000 THEN 'HIGH'
	WHEN SAL >= 1000 THEN 'MID'
	ELSE 'LOW'
END AS 급여
FROM EMP;

--STADIUM 테이블에서 SEAT_COUNT가 0이상 30000이하이면 'S'
--30001이상 50000이하면 'M' 다 아니면 'L'
--심화(CASE문을 2번 사용한다).
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
	END 규모
FROM STADIUM;

-- 사원 별 급여가 
-- 3000이상, 5000이하면 '연봉 증가'
-- 5001이상, 8000이하면 '연봉 동결'
-- 이외에는 '연봉 하락'
-- BETWEEN 사용
SELECT
FIRST_NAME, 
CASE
	WHEN SALARY BETWEEN 3000 AND 5000 THEN '연봉 증가'
	WHEN SALARY BETWEEN 5001 AND 8000 THEN '연봉 동결'
	ELSE '연봉 하락'
END AS "연봉 테이블"
FROM EMPLOYEES;
---------------------------------------------------------------
-- GROUP BY : ~별(예 : 포지션 별 평균 키)
-- GROUP BY 컬럼명 HAVING 조건식
-- ※ WHERE절에 우선적으로 처리할 조건식을 작성해야 속도가 빠르다.

-- PLAYER 테이블에서 포지션 종류 검색
SELECT "POSITION" FROM PLAYER
GROUP BY "POSITION"
HAVING "POSITION" IS NOT NULL;

SELECT "POSITION" FROM PLAYER
WHERE "POSITION" IS NOT NULL
GROUP BY "POSITION";

--PLAYER 테이블에서 몸무게가 80이상인 선수들의 평균 키가 180이상인 포지션 검색
SELECT "POSITION", AVG(HEIGHT), MIN(WEIGHT) FROM PLAYER
WHERE WEIGHT >= 80
GROUP BY "POSITION"
HAVING AVG(HEIGHT) >= 180;

-- EMPLOYEES 테이블에서 JOB_ID별 평균 SALARY가 10000미만인 JOB_ID 검색
-- JOB_ID는 알파벳 순으로 정렬(오름차순)

-- PLAYER 테이블에서 전체 평균 키와 포지션별 평균 키 구하기
-- GROUP BY 쓰지 않기
-- 힌트! CASE문 사용.







