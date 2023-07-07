--PL/SQL 기본 문법
--PL/SQL는 호출할때만 생성되고 끝나면 사라짐
SET SERVEROUTPUT ON;  --출력을 해줄려면 세팅을 미리 해줘야함 -> SELECT구문 실행전에 이거 먼저 실행해줘야함

DECLARE --여기에 변수선언함  ,, 이거는 재사용 안함, 호출될 떄만 시행됨
    DATA EMP%ROWTYPE;  --ROWTYPE는 한행이랑 똑같이 하겠다는 뜻
BEGIN
    DBMS_OUTPUT.PUT_LINE('PL/SQL 시작...');
    
    SELECT *
    INTO DATA  --DATA는 변수
    FROM EMP
    WHERE EMPNO = '2001';

--여기서 출력 : DBMS_OUTPUT.PUT_LINE이라는게 출력해주는 함수
    DBMS_OUTPUT.PUT_LINE(DATA.ENAME || ',' || DATA.JOB);

END;
/
--이거는 변수담아서 넣어주거나 오라클내부에서 조인등을 거치고 INSERT 해주는것

--프로시저 : 한번 만들어놓고 나서 호출해서 쓰는것
--OR REPLACE을 써줘서 여러번 실행해도 문제 없음
CREATE OR REPLACE PROCEDURE InsertEMP
(--매개변수로 받을 변수를 여기에 씀
    P_ENAME IN VARCHAR2
)
AS
--사용하는 변수를 써줄것임
    P_EMPNO CHAR(4);

BEGIN
--로직이 들어감
    DBMS_OUTPUT.PUT_LINE('InsertEMP 시작...');
    
    INSERT INTO EMP (EMPNO, ENAME, HIREDATE)  --이전에 EMPNO에 대한 시퀀스를 생성해줬기 때문에
    VALUES (EX_EMPNO_SEQ.NEXTVAL, P_ENAME, SYSDATE);  --()에 시퀀스 이름.NEXTVAL
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('이름은 ' || P_ENAME);
END;
/


EXEC InsertEMP('홍길동'); 
--인수값이 없으면 바로 세미콜론 해도 됨  EXEC InsertEMP;

