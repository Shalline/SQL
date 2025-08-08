/*
   날짜 : 2025/08/08
   이름 : 김수진
   내용 : 4장 SQL 고급 실습하기
   4-17까지
*/

CREATE TABLE DEPARTMENT (
DEPNO INT PRIMARY KEY,
NAME VARCHAR(10) NOT NULL,
TEL VARCHAR(12) NOT NULL
);

INSERT INTO DEPARTMENT (DEPNO, NAME, TEL) VALUES
(101, '영업1부','051-512-1001'),
(102, '영업2부','051-512-1003'),
(103, '영업3부','051-512-1004'),
(104, '영업4부','051-512-1004'),
(105, '영업5부','051-512-1005'),
(106, '영업지원부','051-512-1006'),
(107, '인사부','051-512-1007');

select*FROM DEPARTMENT;

CREATE TABLE MEMBER(
UID VARCHAR(10) PRIMARY KEY,
NAME VARCHAR(10) NOT NULL,
HP VARCHAR(13) UNIQUE NOT NULL,
POS VARCHAR(10) NOT NULL DEFAULT '사원',
DEP INT,
RDATE DATETIME NOT NULL
);

INSERT INTO MEMBER(UID, NAME, HP, POS, DEP, RDATE) VALUES 
('A101','박혁거세','010-1234-1001','부장',101,'2020-11-19 11:39:48'),
('A102','김유신','010-1234-1002','차장',101,'2020-11-19 11:39:48'),
('A103','김춘추','010-1234-1003','사원',101,'2020-11-19 11:39:48'),
('A104','장보고','010-1234-1004','대리',102,'2020-11-19 11:39:48'),
('A105','강감찬','010-1234-1005','과장',102,'2020-11-19 11:39:48'),
('A106','이성계','010-1234-1006','차장',103,'2020-11-19 11:39:48'),
('A107','정철','010-1234-1007','차장',104,'2020-11-19 11:39:48'),
('A108','이순신','010-1234-1008','부장',104,'2020-11-19 11:39:48'),
('A109','허균','010-1234-1009','부장',104,'2020-11-19 11:39:48'),
('A110','정약용','010-1234-1010','사원',105,'2020-11-19 11:39:48'),
('A111','박지원','010-1234-1011','사원',105,'2020-11-19 11:39:48');

SELECT*FROM MEMBER;

CREATE TABLE SALES(
SEQ INT PRIMARY KEY auto_increment,
UID VARCHAR(10) NOT NULL,
YEAR YEAR NOT NULL,
MONTH INT NOT NULL,
SALE INT 
);

DROP table SALES;

INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2018, 1,  98100);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2018, 1, 136000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2018, 1,  80100);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2018, 1,  78000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2018, 1,  93000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2018, 2,  23500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2018, 2, 126000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2018, 2,  18500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2018, 2,  19000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a106', 2018, 2,  53000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2019, 1,  24000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2019, 1, 109000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2019, 1, 101000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2019, 1,  53500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a107', 2019, 1,  24000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2019, 2, 160000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2019, 2, 101000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2019, 2,  43000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2019, 2,  24000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a106', 2019, 2, 109000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2020, 1, 201000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2020, 1,  63000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2020, 1,  74000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a106', 2020, 1, 122000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a107', 2020, 1, 111000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2020, 2, 120000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2020, 2,  93000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2020, 2,  84000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2020, 2, 180000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a108', 2020, 2,  76000);

SELECT*FROM SALES;

SELECT * FROM Member WHERE name = '김유신';
SELECT * FROM Member WHERE pos = '차장' AND dep = 101;
SELECT * FROM Member WHERE pos = '차장' OR dep = 101;
SELECT * FROM Member WHERE name != '김춘추';
SELECT * FROM Member WHERE name <> '김춘추';
SELECT * FROM Member WHERE pos = '사원' OR pos = '대리';
SELECT * FROM Member WHERE pos IN ('사원', '대리');
SELECT * FROM Member WHERE dep IN (101, 102, 103);
SELECT * FROM Member WHERE name LIKE '%신';
SELECT * FROM Member WHERE name LIKE '김%';
SELECT * FROM Member WHERE name LIKE '김__';
SELECT * FROM Member WHERE name LIKE '_성_';
SELECT * FROM Member WHERE name LIKE '정_';
SELECT * FROM Sales WHERE sale > 50000;
SELECT * FROM Sales WHERE sale >= 50000 AND sale < 100000 AND month = 1;
SELECT * FROM Sales WHERE sale BETWEEN 50000 AND 100000;
SELECT * FROM Sales WHERE sale NOT BETWEEN 50000 AND 100000;
SELECT * FROM Sales WHERE year IN (2020);
SELECT * FROM Sales WHERE month IN (1, 2);

SELECT * FROM Sales ORDER BY sale;
SELECT * FROM Sales ORDER BY sale ASC;
SELECT * FROM Sales ORDER BY sale DESC;
SELECT * FROM Member ORDER BY name;
SELECT * FROM Member ORDER BY name DESC;
SELECT * FROM Member ORDER BY rdate ASC;
SELECT * FROM Sales WHERE sale > 50000 ORDER BY sale DESC;
SELECT * FROM Sales 
	WHERE sale > 50000 
	ORDER BY year, month, sale DESC;

SELECT * FROM Sales LIMIT 3;
SELECT * FROM Sales LIMIT 0, 3;
SELECT * FROM Sales LIMIT 1, 2;
SELECT * FROM Sales LIMIT 5, 3;
SELECT * FROM Sales ORDER BY sale DESC LIMIT 3, 5;
SELECT * FROM Sales WHERE sale < 50000 ORDER BY sale DESC LIMIT 3;
SELECT * FROM Sales 
	WHERE sale > 50000 
	ORDER BY year DESC, month, sale DESC
	LIMIT 5;

SELECT SUM(sale) AS 합계 FROM Sales;
SELECT AVG(sale) AS 평균 FROM Sales;
SELECT MAX(sale) AS 최대값 FROM Sales;
SELECT MIN(sale) AS 최소값 FROM Sales;
SELECT CEILING(1.2);
SELECT CEILING(1.8);
SELECT FLOOR(1.2);
SELECT FLOOR(1.8);
SELECT ROUND(1.2);
SELECT ROUND(1.8);
SELECT RAND();
SELECT CEILING(RAND() * 10);
SELECT COUNT(sale) AS 갯수 FROM Sales;
SELECT COUNT(*) AS 갯수 FROM Sales;
SELECT LEFT('HelloWorld', 5);
SELECT RIGHT('HelloWorld', 5);
SELECT SUBSTRING('HelloWorld', 6, 5);
SELECT CONCAT('Hello', 'World');
SELECT CONCAT(uid, name, hp) FROM member WHERE uid = 'a108';
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
INSERT INTO Member VALUES ('a112', '유관순', '010-1234-1012', '대리', 107, NOW());
    
-- 실습 4-7
SELECT SUM(SALE) AS 총합
	FROM SALES
    WHERE YEAR = 2018 AND MONTH =1;
    
-- 실습 4-8
SELECT 
	SUM(SALE) AS 총합,
    AVG(SALE) AS 평균
FROM SALES
WHERE YEAR=2019 AND MONTH=2 AND SALE >=50000;

-- 실습 4-9
SELECT 
	MIN(SALE) AS 최저매출,
    MAX(SALE) AS 최고매출
FROM SALES 
WHERE YEAR=2020;

-- 실습 4-10 그룹화
-- 아래 3개 안된. * 하면안됨
SELECT UID FROM Sales GROUP BY UID;
SELECT YEAR FROM Sales GROUP BY year;
SELECT UID, YEAR FROM Sales GROUP BY uid, year;

SELECT uid, COUNT(*) AS 건수 FROM Sales GROUP BY uid;
SELECT uid, SUM(sale) AS 합계 FROM Sales GROUP BY uid;
SELECT uid, AVG(sale) AS 평균 FROM Sales GROUP BY uid;
SELECT uid, year, SUM(sale) AS 합계 
	FROM Sales 
	GROUP BY uid, year;
SELECT uid, year, SUM(sale) AS 합계 
	FROM Sales 
	GROUP BY uid, year
	ORDER BY year ASC, 합계 DESC;
SELECT uid, year, SUM(sale) AS 합계 
	FROM Sales
	WHERE sale >= 50000 
	GROUP BY uid, year
	ORDER BY 합계 DESC;

-- 실습 4-11
SELECT uid, SUM(sale) AS 합계 FROM Sales 
	GROUP BY uid 
	HAVING 합계 >= 200000;
SELECT uid, year, SUM(sale) AS 합계
	FROM Sales
	WHERE sale >= 100000
	GROUP BY uid, year 
	HAVING 합계 >= 200000
	ORDER BY 합계 DESC;

-- 실습 4-12
-- YEAR 연산안됨
CREATE TABLE Sales2 LIKE Sales;
INSERT INTO Sales2 SELECT * FROM Sales;

-- 모듈 끄고 아래 연산하면 돌아감.
SET SQL_SAFE_UPDATES=0;

UPDATE Sales2 SET year = year + 3;
SELECT * FROM Sales UNION SELECT * FROM Sales2;
SELECT * FROM Sales WHERE sale >= 100000
	UNION
SELECT * FROM Sales2 WHERE sale >= 100000;
SELECT uid, year, sale FROM Sales
	UNION 
SELECT uid, year, sale FROM Sales2;
SELECT uid, year, SUM(sale) AS 합계 
	FROM Sales 
	GROUP BY uid, year
UNION
SELECT uid, year, SUM(sale) AS 합계 
	FROM Sales2 
	GROUP BY uid, year
	ORDER BY year ASC, 합계 DESC;

-- 실습 4-13
SELECT * FROM Sales INNER JOIN Member ON Sales.uid = Member.uid;
SELECT * FROM Member INNER JOIN Department ON Member.dep = Department.depNo;
SELECT * FROM Sales AS a JOIN Member AS b ON a.uid = b.uid;
SELECT * FROM Member AS a JOIN Department AS b ON a.dep = b.depNo;
SELECT * FROM Sales AS a, Member AS b WHERE a.uid = b.uid;
SELECT * FROM Member AS a, Department AS b WHERE a.dep = b.depNo;

SELECT a.seq, a.uid, sale, name, pos
FROM Sales AS a 
JOIN Member AS b ON a.uid = b.uid;

SELECT a.seq, a.uid, sale, name, pos
FROM Sales AS a 
JOIN Member AS b USING (uid);

SELECT a.seq, a.uid, sale, name, pos
FROM Sales AS a 
JOIN Member AS b ON a.uid = b.uid
WHERE sale >= 100000;

-- 이것도 안됨
SELECT a.uid, a.year, SUM(sale) AS 합계
FROM Sales AS a
JOIN Member AS b ON a.uid = b.uid
GROUP BY a.uid, a.year
HAVING 합계 >= 100000
ORDER BY a.year ASC, 합계 DESC;

SELECT * FROM Sales AS a 
JOIN Member AS b ON a.uid = b.uid
JOIN Department AS c ON b.dep = c.depNo;

SELECT a.seq, a.uid, a.sale, b.name, b.pos, c.name
FROM Sales AS a 
JOIN Member AS b ON a.uid = b.uid
JOIN Department AS c ON b.dep = c.depNo;

SELECT a.seq, a.uid, a.sale, b.name, b.pos, c.name
FROM Sales AS a 
JOIN Member AS b ON a.uid = b.uid
JOIN Department AS c ON b.dep = c.depNo
WHERE sale > 100000
ORDER BY sale DESC;

-- 실습 4-14
SELECT * FROM Sales AS a LEFT JOIN Member AS b ON a.uid = b.uid;
SELECT * FROM Sales AS a RIGHT JOIN Member AS b ON a.uid = b.uid;

SELECT a.seq, a.uid, sale, name, pos  
FROM Sales AS a 
LEFT JOIN Member AS b USING(uid);

SELECT a.seq, a.uid, sale, name, pos  
FROM Sales AS a 
RIGHT JOIN Member AS b USING(uid);

-- 실습 4-15 모든직원의아이디,이름,직급,부서명을조회하시오.
SELECT M.UID, M.NAME, M.POS, D.NAME AS 부서명
	FROM MEMBER AS m
    JOIN DEPARTMENT AS d ON M.DEP = D.DEPNO;

-- 실습 4-16  '김유신'직원의2019년도매출의합을조회하시오.
SELECT M.NAME, SUM(S.SALE) AS 매출합
FROM SALES AS S
JOIN MEMBER AS M ON S.UID= M.UID
WHERE M.NAME = '김유신' AND S.YEAR =2019;

-- 실습 4-17  2019년50,000이상매출에대해직원별매출의합이100,000원이상인직원이름,
-- 부서명,직급,년도,매출합을조회하시오.단,매출합이큰순서부터정렬
SELECT M.NAME AS 이름, D.NAME AS 부서명, M.POS AS 직급, S.YEAR AS 년도,
	SUM(S.SALE) AS 매출합 FROM SALES AS S
JOIN MEMBER AS M ON S.UID= M.UID
JOIN DEPARTMENT AS D ON M.DEP=D.DEPNO
WHERE S.YEAR=2019 AND S.SALE >=50000
GROUP BY S.UID, S.YEAR
HAVING SUM(S.SALE) >= 100000
ORDER BY 매출합 DESC;


