/*
   날짜 : 2025/08/08
   이름 : 김수진
   내용 : 연습문제 실습하기
*/

USE STUDYDB;

/*
CREATE TABLE 테이블명(
변수명 변수타입() PRIMARY KEY,
변수명 변수타입() NOT NULL, => 특히 이름같은거
변수명 변수타입(),
VARCHAR쓸때 간단한건 10정도 애매하면 20, 주소는 100정도
핸드폰번호의 경우 딱맞게 CHAR(13)하는게 오류가 없을가능성이 많은듯
그리고 마약 국제전화번호가 있다면 나라별 번호도 칼럼따로 하는게 좋음
그래야 앱에서 영역나누고 만들때 편함
);
*/

CREATE TABLE TBLUSER (
	USER_ID VARCHAR (10) PRIMARY KEY,
    USER_NAME VARCHAR(10) NOT NULL,
    USER_HP CHAR(13),
    USER_AGE INT,
    USER_ADDR VARCHAR(100)
);

CREATE TABLE TBLPRODUCT (
	PROD_NO INT PRIMARY KEY,
    PROD_NAME VARCHAR(20),
    PROD_PRICE INT,
    PROD_STOCK INT,
    PROD_COMPANY VARCHAR(20),
    PROD_DATE DATE
);

INSERT INTO TblUser (user_id, user_name, user_hp, user_age, user_addr) VALUES
('p101', '김유신', '010-1234-1001', 25, '경남 김해시'),
('p102', '김춘추', '010-1234-1002', 23, '경남 경주시'),
('p103', '장보고', NULL, 31, '전남 완도군'),
('p104', '강감찬', NULL, NULL, '서울시 중구'),
('p105', '이순신', '010-1234-1005', 50, NULL);

INSERT INTO TblProduct (prod_no, prod_name, prod_price, prod_stock, prod_company, prod_date) VALUES
(1001, '냉장고',    800000,  25, 'LG전자',   '2022-01-06'),
(1002, '노트북',   1200000, 120, '삼성전자', '2022-01-07'),
(1003, '모니터',   350000,  35, 'LG전자',   '2023-01-13'),
(1004, '세탁기',  1000000,  80, '삼성전자', '2021-01-01'),
(1005, '컴퓨터',  1500000,  20, '삼성전자', '2023-10-01'),
(1006, '휴대폰',   950000, 102, NULL,       NULL);

/*
INSERT INTO TABLE명 (변수1, 변수2, 변수3, 변수4, 변수5) values
(변수1, '변수2', 변수3, '변수4', '변-수-5'),
(변수1, '변수2', 변수3, '변수4', '변-수-5'),
(변수1, '변수2', 변수3, '변수4', '변-수-5'),
(변수1, '변수2', 변수3, '변수4', '변-수-5'),
(변수1, '변수2', 변수3, '변수4', '변-수-5');
*/

SELECT * FROM TblUser;
SELECT user_name FROM TblUser;
SELECT user_name, user_hp FROM TblUser;
SELECT * FROM TblUser WHERE user_id='p102';
SELECT * FROM TblUser WHERE user_id='p104' OR user_id='p105';
SELECT * FROM TblUser WHERE user_addr='부산시 금정구';
SELECT * FROM TblUser WHERE user_age > 30;
SELECT * FROM TblUser WHERE user_hp IS NULL;
UPDATE TblUser SET user_age=42 WHERE user_id='p104';
UPDATE TblUser SET user_addr='부산시 진구' WHERE user_id='p105';
DELETE FROM TblUser WHERE user_id='p103';

SELECT * FROM TblProduct;
SELECT prod_name FROM TblProduct;
SELECT prod_name, prod_company, prod_price FROM TblProduct;
SELECT * FROM TblProduct WHERE prod_company='LG전자';
SELECT * FROM TblProduct WHERE prod_company='삼성전자';
UPDATE TblProduct SET 
	PROD_COMPANY='삼성전자', 
    PROD_DATE ='2024-01-01'
    WHERE
    PROD_NO=1006;
    
SELECT*FROM TBLUSER;
SELECT*FROM TBLPRODUCT;

















