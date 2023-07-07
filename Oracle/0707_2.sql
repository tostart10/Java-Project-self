CREATE OR REPLACE PROCEDURE EX_PROC

IS
    P_ENAME EMP.ENAME%TYPE := '테스트'; --변수선언
    P_JOB VARCHAR2(10) := '사원';
    P_DEPTNO EMP.DEPTNO%TYPE := '20';

BEGIN
    FOR I IN 1..10 --여기서 .. 으로 점(.)은 두개를 넣어줘야함 3개넣으면 안됨. 문법임!
    LOOP
        DBMS_OUTPUT.PUT_LINE('순서 : ' || I);
        INSERT INTO EMP VALUES(EX_EMPNO_SEQ.NEXTVAL ,P_ENAME || I, P_JOB,NULL,  SYSDATE, P_DEPTNO );
    END LOOP;
    
    COMMIT;  --FOR문 다 끝나고 밖에서 COMMIT해줘야함
    
    DBMS_OUTPUT.PUT_LINE('프로시저 끝.');
    
END EX_PROC;
/
--이 프로시저는 인수값 넘기는거 없음


EXEC EX_PROC; 
--EXEC EX_PROC;바로 옆에 주석하면 오류남!!
--EXEC EX_PROC;는 프로시저 실행 명령어, 인수가 없으므로 그냥 ;찍어줌
--COMIIT의 위치 즁요!!!
--INSERT INTO~는 DBMS영역에서 가지고 있는 것


--문제)EMP 테이블에 EMPNO 3000번 이상인 직원을 삭제하는 프로시저 작성
--프로시저명 : EX_EMP_DEL
--COMMIT을 왜 다 끝나고 해주는지 -> 한번에 모아서 커밋해주는게 더 좋기 때문
CREATE OR REPLACE PROCEDURE EX_EMP_DEL

IS

BEGIN
    DELETE FROM EMP WHERE EMPNO >= '3000';
    --SQL%ROWCOUNT; --처리건수
    DBMS_OUTPUT.PUT_LINE('삭제건수 : ' || SQL%ROWCOUNT); --COMMIT 전에 해야함!!
    
    COMMIT;
    
    
END;
/
EXEC EX_EMP_DEL;
--실행전 END;뒤에 꼭 / 써주기!!
--SELECT는 반환값이
--DLELTE, UPDATE ,INSERT는 처리건수를 값으로 반환해줌
--만약 데이터 가 없어서 건수가 없을 수도 없으니까 처리건수가 0으로 반환되면 성공?

--SQL%ROWCOUNT가 COMMIT다음에 오는 것과 COMMIT전에 오는 것의 데이터 차이는 엄청남
--커밋전에 SQL%ROWCOUNT찍으면 아직 DELETE 되지 않아서 건수가 있지만
--커밋하고 나서 SQL%ROWCOUNT찍으면 0으로 나옴


--배치프로그램 : 온라인은 사용자가 뭔가 클릭했을 떄마로 실행되는거, 근데 배치프로그램은 특정 시점에 프로그램이 자동으로 돌수 있도록 하는것
--유닉스 리눅스는 크론이라고 하는거에 등록하는게 있음

--오라클 잡 등록
--오라클 잡 등록하는법 인터넷에 치면됨
BEGIN --BEGIN은 무조건 필수로 써줘야하는것!!!
    DBMS_SCHEDULER.CREATE_JOB
    (
        JOB_NAME => 'EX_JOB',   --잡명
        JOB_TYPE => 'STORED_PROCEDURE',
        JOB_ACTION => 'EX_PROC',    --프로시저 이름(프로시저 만들때 만들어준 그 이름)
        REPEAT_INTERVAL => 'FREQ=MINUTELY;INTERVAL=1',          --1분에 1번
        COMMENTS => 'EMP추가 객체'
    );

END;
/
--REPEAT_INTERVAL => 'FREQ=MINUTELY;INTERVAL=1'으로 1분에 1번씩 실행되도록 함  ,,인터넷에 분단위, 시단위 일단위 같은거 찾으면 나옴

--잡 객체 실행 로그 확인
SELECT * FROM USER_SCHEDULER_JOB_LOG;
SELECT * FROM USER_SCHEDULER_JOB_RUN_DETAILS;

--잡 실행/중지 (잡 스케줄러 시작)
BEGIN
    --DBMS_SCHEDULER.ENABLE('EX_JOB');  --잡 실행 이라기 보다는 스케줄러 실행이라고하는 게 맞는듯
    DBMS_SCHEDULER.DISABLE('EX_JOB'); --잡 중지  ()에는 잡명 넣어야함
END;
/

--JOB은 오라클에서만쓰는거
--스케줄러는 DB OS에 서도 실행가능?


