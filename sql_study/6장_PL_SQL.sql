/*
   날짜 : 2025/07/17
   이름 : 김수진
   내용 : 6장 PL/SQL
*/
SET SERVEROUTPUT ON;

BEGIN
    BEGIN
      DBMS_OUTPUT.PUT_LINE('Hello, Oracle!');
END;
/
-- 실습 1-2
DECLARE
    NO NUMBER(4) := 1001;
    NAME VARCHAR2(10) := '홍길동';
    HP CHAR(13) := '010-1000-1001';
    ADDR VARCHAR2(100) := '부산광역시';
BEGIN
    --DBMS_OUTPUT.PUT_LINE('번호 : ' || NO);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('전화 : ' || HP);
    DBMS_OUTPUT.PUT_LINE('주소 : ' || ADDR);
END;
/
-- 실습 2-1
SET SERVEROUTPUT ON;
DECLARE
    NO   CONSTANT NUMBER(4) := 1001;
    NAME VARCHAR2(10);
    HP   CHAR(13) := '000-0000-0000';
    AGE  NUMBER(2) DEFAULT 1;
    ADDR VARCHAR2(10) NOT NULL := '부산';
BEGIN
    NAME := '김유신';
    HP := '010-1000-1001';
    DBMS_OUTPUT.PUT_LINE('번호 : ' || NO);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('전화 : ' || HP);
    DBMS_OUTPUT.PUT_LINE('나이 : ' || AGE);
    DBMS_OUTPUT.PUT_LINE('주소 : ' || ADDR);
END;
/

-- 실습 2-1

-- 실습 2-2
DECLARE
    NO DEPT.DEPTNO%TYPE;
    NAME DEPT.DNAME%TYPE;
    DTEL DEPT.DTEL%TYPE;
BEGIN
    SELECT * 
    INTO NO, NAME, DTEL
    FROM DEPT 
    WHERE DEPTNO = 30;
    DBMS_OUTPUT.PUT_LINE('부서번호 : ' || NO);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('전화번호 : ' || DTEL);
END;
/

-- 실습 2-3

DECLARE
 --선언
 ROW_DEPT DEPT%ROWTYPE;
BEGIN
    --처리
    SELECT *
    INTO ROW_DEPT
    FROM DEPT
    WHERE DEPTNO = 40;
    
    --출력
    DBMS_OUTPUT.PUT_LINE('부서번호 : ' || ROW_DEPT.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || ROW_DEPT.DNAME);
    DBMS_OUTPUT.PUT_LINE('전화번호 : ' || ROW_DEPT.DTEL);
END;
/

-- 실습 2-4.
// 이거 실행안됐음
DECLARE
    -- Record Define
    TYPE REC_DEPT IS RECORD (
        deptno  NUMBER(2),
        dname   DEPT.DNAME%TYPE,
        DTEL     DEPT.DTEL%TYPE
    );
    -- Record Declare
    dept_rec REC_DEPT;
BEGIN
    -- Record Initialize
    dept_rec.deptno := 10;
    dept_rec.dname := '개발부';
    dept_rec.DTEL := '051-512-1001';    
    -- Record Print
    DBMS_OUTPUT.PUT_LINE('deptno : ' || dept_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('dname : ' || dept_rec.dname);
    DBMS_OUTPUT.PUT_LINE('DTEL : ' || dept_rec.DTEL);    
    DBMS_OUTPUT.PUT_LINE('PL/SQL 종료...');
END;
/

-- 실습 2-7
DECLARE
    TYPE ARR_CITY IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    arrCity ARR_CITY;
BEGIN
    arrCity(1) := '서울';
    arrCity(2) := '대전';
    arrCity(3) := '대구';
    
    DBMS_OUTPUT.PUT_LINE('arrCity(1) : ' || arrCity(1));
    DBMS_OUTPUT.PUT_LINE('arrCity(2) : ' || arrCity(2));
    DBMS_OUTPUT.PUT_LINE('arrCity(3) : ' || arrCity(3));
    DBMS_OUTPUT.PUT_LINE('PL/SQL 종료...');
END;
/

-- 실습 4-1
DECLARE
    -- 커서 데이터를 저장할 변수 선언
    V_DEPT_ROW DEPT%ROWTYPE;
    
    -- 커서 선언
    CURSOR c1 IS SELECT * FROM DEPT WHERE DEPTNO = 40;
BEGIN
    -- 커서 열기
    OPEN c1;
    
    -- 커서 데이터 입력
    FETCH c1 INTO V_DEPT_ROW;
    -- 커서 데이터 출력
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('DTEL : ' || V_DEPT_ROW.DTEL);
    
    -- 커서 종료
    CLOSE c1;
END;
/

-- 실습 4-2 워크북이랑 다르게 EMP TABLE로 작업
// 부서테이블의 로타입을 참조한다. 젤위 INDEX말하는거임.
DECLARE
    V_EMP_ROW EMP%ROWTYPE;
    CURSOR EMP_CURSOR IS SELECT * FROM EMP;
BEGIN    
    OPEN EMP_CURSOR;    
    LOOP
        FETCH EMP_CURSOR INTO V_EMP_ROW;
        EXIT WHEN EMP_CURSOR%NOTFOUND;
    
        DBMS_OUTPUT.PUT_LINE('------------------------------');
        DBMS_OUTPUT.PUT_LINE('EMPO : ' || V_EMP_ROW.EMPO);
        DBMS_OUTPUT.PUT_LINE('NAME : ' || V_EMP_ROW.NAME);
        DBMS_OUTPUT.PUT_LINE('REGDATE : ' || V_EMP_ROW.REGDATE);
    END LOOP;
    
    CLOSE EMP_CURSOR;
END;
/

-- 실습 4-3

DECLARE    
    CURSOR c1 IS SELECT * FROM DEPT;
BEGIN    
    FOR c1_rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE('------------------------------');
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || c1_rec.DNAME);
        DBMS_OUTPUT.PUT_LINE('DTEL : ' || c1_rec.DTEL);
    END LOOP;
END;
/

-- 실습 5-1
-- 프로시저 생성
CREATE PROCEDURE hello_procedure (
    p_name IN VARCHAR2
    )
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('안녕하세요, ' || p_name || '님!');
    DBMS_OUTPUT.PUT_LINE('환영합니다.');
END;
/

-- 프로시저 실행1
EXECUTE hello_procedure('홍길동');
-- 프로시저 실행2
EXECUTE hello_procedure('김철수');
-- 프로시저 삭제
DROP PROCEDURE hello_procedure;

-- 실습 5-2
-- 함수 생성
CREATE FUNCTION get_emp_name (p_empo NUMBER)
 RETURN VARCHAR2
 IS
    v_name VARCHAR2(010);
BEGIN
    SELECT NAME
    INTO v_name
    FROM EMP
    WHERE EMPO = p_empo;
    RETURN v_name;
END;
 /
 
DROP FUNCTION GET_EMP_NAME;
 
SELECT get_emp_name(0000) FROM DUAL;

-- 실습 5-3
CREATE TABLE emp_log (
 log_date DATE,
 empno NUMBER,
 action VARCHAR2(10)
 );

DROP TRIGGER trgg_emp_insert;

// 트리거는 **:NEW.empo → emp_log.empno**로 삽입하는 구조
// emp_log 테이블에는 컬럼명이 empno
// emp 테이블에는 컬럼명이 empo

-- 트리거 생성
CREATE TRIGGER trgg_emp_insert
 AFTER INSERT ON emp
 FOR EACH ROW
BEGIN
 INSERT INTO emp_log (log_date, empno, action)
 VALUES (SYSDATE, :NEW.empo, 'INSERT');
END;
/
-- INSERT 테스트
INSERT INTO emp VALUES (2001, '김유신','M',
    '대리',10,SYSDATE);

-- 로그 확인
SELECT * FROM emp_log;

DESC emp_log;


















