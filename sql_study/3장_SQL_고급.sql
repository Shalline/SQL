/*
    날짜 : 2025/07/15
    이름 : 김수진
    내뇽 : 3장 SQL 고급
*/
-- 실습하기 3-1. 테이블 생성 및 데이터 입력

CREATE TABLE EMP (
EMPO NUMBER(4) NOT NULL,
NAME VARCHAR2(10) NOT NULL,
GENDER CHAR(1) NOT NULL,
JOB VARCHAR(10) NOT NULL,
DEPNO NUMBER(2),
REGDATE DATE
);

CREATE TABLE DEPT(
DEPTNO NUMBER(2) PRIMARY KEY,
DNAME VARCHAR2(20) NOT NULL,
DTEL VARCHAR2(20) NOT NULL
);

CREATE TABLE SALE (
NO     NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
EMPNO NUMBER(4) NOT NULL,
YEAR NUMBER(4) NOT NULL,
MONTH NUMBER(2) NOT NULL,
PRICE NUMBER(10)
);
 
 // 직원테이블데이터입력
 INSERT INTO EMP VALUES (1001, '김유신', 'M', '사원', 10, SYSDATE);
 INSERT INTO EMP VALUES (1002, '김춘추', 'M', '대리', 20, SYSDATE);
 INSERT INTO EMP VALUES (1003, '장보고', 'M', '과장', 10, SYSDATE);
 INSERT INTO EMP VALUES (1004, '강감찬', 'M', '부장', 30, SYSDATE);
 INSERT INTO EMP VALUES (1005, '신사임당', 'F', '대리', 20, SYSDATE);
 INSERT INTO EMP VALUES (1006, '이황', 'M', '사원', 40, SYSDATE);
 INSERT INTO EMP VALUES (1007, '이이', 'M', '과장', 20, SYSDATE);
 INSERT INTO EMP VALUES (1008, '이순신', 'M', '사원', NULL, SYSDATE);
 INSERT INTO EMP VALUES (1009, '허난설헌', 'F', '사원', NULL, SYSDATE);
 INSERT INTO EMP VALUES (1010, '정약용', 'M', '대리', 50, SYSDATE);

 // 부서테이블데이터입력
  INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (10, '영업1부', '051-511-1000');
  INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (20, '영업2부', '051-511-2000');
  INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (30, '영업3부', '051-511-3000');
  INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (40, '영업4부', '051-511-4000');
  INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (50, '영업지원부', '051-511-5000');
 
 // 매출테이블데이터입력
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1001, 2023, 1,  98100);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2023, 1, 136000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2023, 1,  80000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1004, 2023, 1,  78000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1005, 2023, 1,   NULL);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1001, 2023, 2,  23500);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2023, 2, 126000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2023, 2,  18500);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1005, 2023, 2,  19000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1010, 2023, 2,  53000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1001, 2024, 1,  24000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2024, 1, 109000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2024, 1,  80000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1004, 2024, 1,   NULL);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1007, 2024, 1,  24000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2024, 2, 160000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2024, 2, 101000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1004, 2024, 2,  43000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1005, 2024, 2,  24000);
  INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1006, 2024, 2, 109000);

// 해당 테이블 전체 확인하는 법
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALE;
// DROP TABLE EMP; 이런식으로 지우는거

-- 실습하기 
SELECT * FROM EMP WHERE NAME = '김유신';
SELECT * FROM EMP WHERE name != '김춘추';
SELECT * FROM EMP WHERE NAME <> '김춘추';

SELECT * FROM EMP WHERE job = '사원' OR job = '대리';
SELECT * FROM EMP WHERE job IN ('사원', '대리');

SELECT * FROM EMP WHERE name LIKE '김%';
SELECT * FROM EMP WHERE name LIKE '%신';
SELECT * FROM EMP WHERE name LIKE '이_';
SELECT * FROM EMP WHERE name LIKE '이__';

SELECT * FROM EMP WHERE JOB = '사원' AND DEPNO = 40;
SELECT * FROM EMP WHERE JOB = '사원' AND DEPNO = 10;
SELECT * FROM EMP WHERE NAME LIKE '_순%';
SELECT * FROM DEPT WHERE DTEL LIKE '%1000';
SELECT DNAME FROM DEPT WHERE DTEL LIKE '%1000';

-- 실습하기 2-2
SELECT * FROM  SALE ORDER BY PRICE DESC;
SELECT * FROM SALE ORDER BY PRICE ASC;
SELECT * FROM EMP ORDER BY NAME;
SELECT * FROM EMP ORDER BY NAME ASC;
SELECT * FROM EMP ORDER BY NAME DESC;

SELECT * FROM EMP ORDER BY REGDATE ASC;
SELECT * FROM SALE
    WHERE PRICE >50000
    ORDER BY YEAR, MONTH, PRICE DESC;
SELECT * FROM SALE
    WHERE PRICE >50000
    ORDER BY YEAR DESC, MONTH, PRICE DESC;

SELECT * FROM SALE FETCH FIRST 3 ROWS ONLY;
SELECT * FROM SALE OFFSET 0 ROWS FETCH NEXT 3 
    ROWS ONLY;
SELECT * FROM SALE OFFSET 5 ROWS FETCH NEXT 3
    ROWS ONLY;
SELECT * FROM SALE ORDER BY PRICE DESC OFFSET 3
    ROWS FETCH NEXT 5 ROWS ONLY;
SELECT * FROM SALE
    WHERE PRICE < 50000
    ORDER BY PRICE DESC
    FETCH FIRST 3 ROWS ONLY;
SELECT * FROM SALE
    WHERE PRICE > 50000
    ORDER BY YEAR DESC,MONTH,PRICE DESC
    FETCH FIRST 5 ROWS ONLY;

-- 실습하기 2-3
SELECT DISTINCT DEPNO FROM EMP;
SELECT DISTINCT JOB, DEPNO FROM EMP;
SELECT EMPO AS 사번, NAME AS 이름, GENDER AS "성별" FROM EMP;
SELECT EMPO E, NAME N, GENDER G FROM EMP;

-- 실습하기 3-1. 다양한 SQL 숫자 함수 실습
SELECT SUM(PRICE) AS 합계 FROM SALE;
SELECT COUNT(*) AS 직원수 FROM EMP;
SELECT COUNT(DEPNO) AS 직원수 FROM EMP;
SELECT COUNT(DEPNO) AS 부서수 FROM EMP;

// DUAL은 값을 보기위한 가상의 테이블
SELECT CEIL(1.2) FROM DUAL;
SELECT CEIL(1.0) FROM DUAL;
SELECT FLOOR(1.2) FROM DUAL;
SELECT FLOOR(1.8) FROM DUAL;
SELECT ROUND(1.2) FROM DUAL;
SELECT ROUND(1.8) FROM DUAL;

SELECT DBMS_RANDOM.VALUE FROM DUAL;
SELECT CEIL(DBMS_RANDOM.VALUE*10) FROM DUAL;
// 1~10사이 정수 랜덤

-- 실습하기 3-2.다양한 SQL 문자 함수 실습
SELECT 'HELLO ORACLE', LENGTH ('HELLO ORACLE!') FROM DUAL;
SELECT
    'HELLO ORACLE',
    SUBSTR('HELLO ORACLE',1,3),
    SUBSTR('HELLO ORACLE',3,2),
    SUBSTR('HELLO ORACLE',5)
FROM DUAL;

SELECT
    INSTR('HELLO ORACLE','L') AS INSTR_1,
    INSTR('HELLO ORACLE','L',-1) AS INSTR_2
FROM DUAL;
// REPLACE : 문자교체
SELECT '010-1234-5678', REPLACE('010-1234-5678', '-', '') 
    FROM DUAL;
// LPAD, RPAD : 문자채우기
SELECT LPAD('Oracle', 10, '#') AS LPAD, 
    RPAD('Oracle', 10, '*') AS RPAD 
    FROM DUAL;

// CONCAT : 문자연결
SELECT CONCAT(EMPO, NAME) FROM EMP WHERE NAME = '이순신';
SELECT EMPO || NAME FROM EMP WHERE NAME = '정약용';

// TRIM : 문자공백제거
SELECT
    '[ _Oracle_ ]' AS BEFORE,
    '[' || TRIM(' _Oracle_ ') || ']' AS TRIM
    FROM DUAL;


-- 
// SYSDATE: 오라클에서 현재 날짜시간을 구하는  오라클 내장 컬럼
SELECT
    SYSDATE,
    SYSDATE -1,
    SYSDATE +1
FROM
    DUAL;

// ADD_MONTHS(d, n) : 몇개월이후날짜조회
SELECT 
    ADD_MONTHS(SYSDATE, 1), 
    ADD_MONTHS(SYSDATE, -1) 
FROM DUAL;    
// MONTHS_BETWEEN(d1, d2) : 두날짜간개월수계산
SELECT 
    MONTHS_BETWEEN(DATE '2025-07-13', DATE '2024-07-13') AS 개월차
FROM DUAL;
// NEXT_DAY(d, '요일') : d 이후의특정요일날짜
SELECT 
    NEXT_DAY(SYSDATE, '월요일') AS 다음_월요일
FROM DUAL;    

-- 실습하기 3-4. SQL 기타 함수 실습
// TO_CHAR : 날짜데이터를문자데이터로변환
SELECT
    TO_CHAR(SYSDATE, 'YYYY')  AS YYYY,
    TO_CHAR(SYSDATE, 'MM')    AS MM,
    TO_CHAR(SYSDATE, 'DD')    AS DD,
    TO_CHAR(SYSDATE, 'HH24')  AS HH24,
    TO_CHAR(SYSDATE, 'MI')    AS MI,
    TO_CHAR(SYSDATE, 'SS')    AS SS,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 날짜시간
FROM DUAL;

INSERT INTO EMP VALUES (1011, '안중근', 'M', '부장', 30, 
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'));

 // TO_DATE : 문자데이터를날짜데이터로변환
SELECT 
    TO_DATE('20250714', 'YYYY/MM/DD') AS 날짜1,
    TO_DATE('250714', 'YY-MM-DD') AS 날짜2,
    TO_DATE(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 날짜시간
FROM DUAL;

INSERT INTO EMP VALUES (1012, '유관순', 'F', '차장', 20, SYSDATE);
// 특별한 차이가 없어서 위에꺼 쓰면 될듯
//INSERT INTO EMP VALUES (1013, '윤봉길', 'M', '과장', 30,
//    TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'));

 // NVL, NVL2 : NULL 체크함수
SELECT NO, EMPNO,YEAR,MONTH,NVL(PRICE,0)
    FROM SALE;
SELECT EMPO,NAME, GENDER,JOB,NVL2(DEPNO,'정규직','비정규직')
    FROM EMP;

-- 실습 4-1.그룹화
// GROUPBY-여러 데이터에서 의미있는 하나의 결과를 특정열값별로 묶어서 조회
// GROUPBY절로 먼저 지정한 열로 대그룹을 나누고 그다음 소그룹으로 그룹화
SELECT EMPNO FROM SALE GROUP BY EMPNO;
SELECT YEAR FROM SALE GROUP BY YEAR;
SELECT EMPNO, YEAR FROM SALE GROUP BY EMPNO, YEAR;

SELECT EMPNO, COUNT(*) AS 판매건수 FROM SALE GROUP BY EMPNO;
SELECT EMPNO, SUM(PRICE) AS 합계 FROM SALE GROUP BY EMPNO;

SELECT EMPNO, YEAR, SUM(PRICE) AS 합계
    FROM SALE
    GROUP BY EMPNO, YEAR;

//SALE 테이블에서 가격이 50,000 이상인 거래를 직원과 연도별로 묶어 합계를 구하고, 
//그 합계를 기준으로 내림차순 정렬하는 쿼리입니다.
//각 직원과 연도별로 **PRICE(판매금액)**의 총합을 계산해서
//그 결과에 **별칭(컬럼 이름)**으로 '합계'를 붙인다는 의미
SELECT EMPNO, YEAR, SUM(PRICE) AS 합계
    FROM SALE
    WHERE PRICE >= 50000
    GROUP BY EMPNO, YEAR
    ORDER BY 합계 DESC;

//SALE 테이블에서 가격이 50,000 이상인 거래 중 직원과 연도별 합계가 200,000 
//이상인 경우만 골라 내림차순으로 정렬하는 쿼리
SELECT EMPNO, YEAR, SUM(PRICE) AS 합계
    FROM SALE
    WHERE PRICE >= 50000
    GROUP BY EMPNO, YEAR
    HAVING SUM(PRICE) >= 200000
    ORDER BY 합계 DESC;

-- 실습하기 5-1
//NION-UNION은두SELECT결과의모든행을합친후,
//중복된행은제거-UNIONALL은UNION과같지만중복을제거하지않음

SELECT EMPNO, MONTH, PRICE FROM SALE WHERE YEAR=2023
    UNION
SELECT EMPNO, MONTH, PRICE FROM SALE WHERE YEAR=2024;
SELECT EMPNO, MONTH, PRICE FROM SALE WHERE YEAR=2023
    UNION ALL
SELECT EMPNO, MONTH, PRICE FROM SALE WHERE YEAR=2024;

// 2023년과 2024년의 직원별 판매합계를 각각 구한 뒤 중복 없이 합쳐서, 
// 연도 오름차순·합계 내림차순으로 정렬하는 쿼리
SELECT EMPNO, YEAR, SUM(PRICE) AS 합계
    FROM SALE
    WHERE YEAR = 2023
    GROUP BY EMPNO, YEAR
    UNION
    SELECT EMPNO, YEAR,SUM(PRICE) AS 합계
    FROM SALE
    WHERE YEAR = 2024
    GROUP BY EMPNO, YEAR
    ORDER BY YEAR ASC, 합계 DESC;

-- 실습하기 5-2
//  INTERSECT- INTERSECT는두SELECT결과에서공통으로존재하는행만출력,교집합
SELECT EMPNO FROM SALE WHERE YEAR = 2023
INTERSECT
SELECT EMPNO FROM SALE WHERE YEAR = 2024;

-- 실습하기 5-3
SELECT EMPNO FROM SALE WHERE YEAR = 2023
MINUS
SELECT EMPNO FROM SALE WHERE YEAR = 2024;

-- 실습하기 6-1
//내부조인(INNER JOIN)-두개 이상의 테이블을 연결하여 하나의 테이블처럼조회
//-내부 조인은JOIN대상이되는 양쪽테이블 모두일치하는 데이터를 출력하는 조인

SELECT
    *
FROM EMP E
JOIN DEPT D
ON E.DEPNO = D.DEPTNO;

SELECT * FROM EMP E, DEPT D WHERE E.DEPNO = D.DEPTNO;

SELECT
    S.NO,S.EMPNO, E.NAME, E.JOB, 
    E.REGDATE, E.DEPNO, D.DNAME
FROM SALE S
JOIN EMP E ON S.EMPNO = E.EMPO
JOIN DEPT D ON E.DEPNO = D.DEPTNO
WHERE PRICE > 100000 AND YEAR = 2024
ORDER BY S.PRICE DESC;

// 외부조인(OUTER JOIN)-두개이상의 테이블을 연결할때
// 어느한쪽(LEFT, RIGHT)의 모든 데이터를 포함하는 조인
DELETE FROM EMP WHERE EMPO = 1006;

SELECT * FROM SALE  S
    JOIN EMP E ON S.EMPNO = E.EMPO;
SELECT * FROM SALE  S
    LEFT JOIN EMP E ON S.EMPNO = E.EMPO;
SELECT * FROM SALE S 
    RIGHT JOIN EMP E ON S.EMPNO = E.EMPO;










