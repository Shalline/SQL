/* 제 3장 
   날짜 : 2025/08/08
   이름 : 김수진
   내용 : 3장 제약조건 실습하기

*/

-- ORACLE에서는 BYTE, MYSQL은 LENGTH 

CREATE TABLE USER2(
UID VARCHAR(10) PRIMARY KEY,
NAME VARCHAR(10),
BIRTH CHAR(10),
ADDR VARCHAR(50)
);

INSERT INTO USER2 (UID, NAME, BIRTH, ADDR) VALUES
('u001', '홍길동', '1990-01-01', '서울시 강남구'),
('u002', '이순신', '1985-05-15', '경남 통영시'),
('u003', '강감찬', '1978-12-05', '서울시 중구'),
('u004', '김유신', '1992-03-10', '경북 경주시'),
('u005', '장보고', '1980-08-25', '전남 완도군');

SELECT*FROM USER2;

CREATE TABLE USER3(
UID VARCHAR(10) primary KEY,
NAME VARCHAR(10),
BIRTH CHAR(10),
HP CHAR(13) UNIQUE,  -- 중복된 값을 허용하지 않음
ADDR VARCHAR(50)
);
-- 하지만 UNIQUE자리 NULL값은 중복허용함!!


INSERT INTO USER3 (UID, NAME, BIRTH, HP, ADDR) VALUES
('u001', '홍길동', '1990-01-01', '010-1111-1111', '서울시 강남구'),
('u002', '이순신', '1985-05-15', '010-2222-2222', '경남 통영시'),
('u003', '강감찬', '1978-12-05', '010-3333-3333', '서울시 중구'),
('u004', '김유신', '1992-03-10', '010-4444-4444', '경북 경주시'),
('u005', '장보고', '1980-08-25', '010-5555-5555', '전남 완도군');

SELECT *FROM USER3;

-- FOREIGN KEY를 위한 실습
 CREATE TABLE Parent (
 pid VARCHAR(10) PRIMARY KEY,
 name VARCHAR(10),
 birth  CHAR(10),
 addr  VARCHAR(100)
 );
 
 CREATE TABLE Child (
 cid VARCHAR(10) PRIMARY KEY,
 name  VARCHAR(10),
 hp CHAR(13) UNIQUE,
 parent VARCHAR(10),
 FOREIGN KEY (parent) REFERENCES Parent (pid)
 );

INSERT INTO Parent (pid, name, birth, addr) VALUES
('p001', '홍길동', '1970-01-01', '서울시 강남구'),
('p002', '이순신', '1965-05-15', '경남 통영시'),
('p003', '강감찬', '1972-03-10', '서울시 중구');

INSERT INTO Child (cid, name, hp, parent) VALUES
('c001', '홍영희', '010-1111-1111', 'p001'),
('c002', '이철수', '010-2222-2222', 'p002'),
('c003', '강민수', '010-3333-3333', 'p003'),
('c004', '홍미영', '010-4444-4444', 'p001');  -- p001 자녀가 둘인 경우
-- 만약 P999의 CHILD가 있다면 PARENT에 존재하지 않으므로 무결성이 깨지게 됨

SELECT*FROM PARENT;
SELECT*FROM CHILD;

-- DEFAULT와 NOT NULL
CREATE TABLE User4(
 uid VARCHAR(10) PRIMARY KEY,
 name VARCHAR(10) NOT NULL, -- 반드시 입력 허용
 gender CHAR(1), -- 모든 컬럼은 DERAULT는 NULL
 age INT DEFAULT 1,
 hp CHAR(13) UNIQUE, -- UNIQUE DEFAULT는 NULL
 addr VARCHAR(20)
);
 
 INSERT INTO User4 (uid, name, gender, age, hp, addr) VALUES
('u001', '홍길동', 'M', 30, '010-1111-1111', '서울 강남구'),
('u002', '이순신', 'M', 45, '010-2222-2222', '경남 통영시'),
('u003', '신사임당', 'F', 38, '010-3333-3333', '강원 강릉시'),
('u004', '김유신', 'M', DEFAULT, '010-4444-4444', '경북 경주시'),
('u005', '장보고', NULL, NULL, '010-5555-5555', '전남 완도군');
 
 -- CHECK와 AUTO_INCREMENT
CREATE TABLE User5(
 seq INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(10) NOT NULL,
 gender CHAR(1) CHECK (gender IN ('M', 'F')),
 age INT DEFAULT 1 CHECK (age > 0 AND age < 100),
 addr  VARCHAR(20) 
);

INSERT INTO User5 (name, gender, age, addr) VALUES
('홍길동', 'M', 30, '서울 강남구'),
('이순신', 'M', 45, '경남 통영시'),
('신사임당', 'F', 38, '강원 강릉시'),
('김유신', 'M', DEFAULT, '경북 경주시'),
('장보고', 'M', 25, '전남 완도군');

SELECT*FROM USER1;
SELECT*FROM USER2;
SELECT*FROM USER3;
SELECT*FROM USER4;
SELECT*FROM USER5;



