COMMENT ON TABLE EMP IS '직원정보';
COMMENT ON COLUMN EMP.EMPNO IS '직원번호';
COMMENT ON COLUMN EMP.ENAME IS '직원병';
COMMENT ON COLUMN EMP.JOB IS '직급';
COMMENT ON COLUMN EMP.MGR IS '상사번호';
COMMENT ON COLUMN EMP.HIREDATE IS '입사일';
COMMENT ON COLUMN EMP.SAL IS '급여';
COMMENT ON COLUMN EMP.COMM IS '보너스';
COMMENT ON COLUMN EMP.DEPTNO IS '부서코드';

--테이블 생성 후  외래키(FK)설정
ALTER TABLE EMP ADD CONSTRAINTS FK_MGR  FOREIGN KEY(MGR)
REFERENCES EMP(EMPNO);

--ALL_, DBA_, USER_ 로 시작하는거 -> 데이터사전 임
--쿼리가 잘되어잇는지 확인하는 용도이다.


--테이블에 커럼 추가
ALTER TABLE EMP ADD USER_NAME VARCHAR2(10);  --ALTER ADD 컬럼추가 문법

--테이블 스키마정보 조회 
--DESC EMP;

--컬럼 타입 수정
ALTER TABLE EMP MODIFY(USER_NAME VARCHAR2(20));  --MODIFY는 데이터 타입 변경

--컬럼명 변경
ALTER TABLE EMP RENAME COLUMN USER_NAME TO  USER_F_NAME;

--컬럼 삭제
ALTER TABLE EMP DROP COLUMN USER_F_NAME;

--데이터 사전으로 데이터 확인
SELECT * FROM ALL_CONS_COLUMNS
WHERE TABLE_NAME = 'EMP' OR TABLE_NAME = 'DEPT';


--부서 DEPT 테이블에 INSERT문
INSERT INTO DEPT (DEPTNO, DNAME, LOC)
VALUES ('10','총무팀','서울강동구');
--DB접속정보를 세션이라고 함
--INSERT를 하고 COMMIT을 안하면 다른 세션에서 확인할 수 없다
--그래서 만약 내가 COMMIT안하면 다른 사람이 DB열어보았을때 없기 때문에 잘못될 수 잇음

INSERT INTO DEPT VALUES('20','인사팀','서울강서구');
--COMMIT을 안해주면 DB에서 LOCK이 걸려서 게속 대기 상태가 된다

INSERT INTO DEPT(DEPTNO, DNAME, LOC) VALUES('30','전산팀','서울마포구');
--PK는 반드시 넣어줘야하나, PK가 아닌 다른 것들은 NOT NULL로 지정하지 않았다면 값을 안넣었을 경우 NULL로 들어간다

--SQL DEVELOPER에서 지원해주는 툴
--테이블을 드레그앤 드롭해오면 기본적인 틀을 제시해 준다
INSERT INTO Dept (
    Deptno,
    Dname,
    Loc
) VALUES (
    '40',
    '영업팀',
    '서울종로구'
);

INSERT INTO DEPT VALUES('50', '경리팀', '서울관악구');
INSERT INTO DEPT VALUES('60', '생산팀', '서울강북구');

--EMP INSERT
INSERT INTO EMP(EMPNO, ENAME, JOB, HIREDATE, SAL, COMM)
VALUES('1001','정현진','사장', TO_DATE('2020-04-29', 'YYYY-MM-DD'), 9900, 1000);

INSERT INTO EMP VALUES('1002','송민기','팀장', '1001', TO_DATE('2020-06-14', 'YYYY-MM-DD'), 8500, 900, '20');
--VALUE 4번째는 상사코드로 FK인데 여기에 PK로 되어 잇는테이블에 없는 데이터를 넣으면 참조무결성 오류!

INSERT INTO EMP VALUES('1010','윤하나', '대리','1002', TO_DATE('2021-05-14', 'YYYY-MM-DD'), 6800, 50, '20');

INSERT INTO EMP VALUES('1011','배찬혁','사원','1002',TO_DATE('2022-12-22', 'YYYY-MM-DD'), 4500, 100, '20');

INSERT INTO EMP VALUES('1012', '김지현', '사원','1002', SYSDATE, 4500, 50, '20'); --SYSDATE는 현재 시스템의 날짜를 넣음

INSERT INTO EMP VALUES('1003', '류경민', '팀장', '1001', TO_DATE('2021-03-07', 'YYYY-MM-DD'), 8500, 800, '30');
--쿼리문을 하려면 검증을 해야해서 데이터 틀리면 안됨

INSERT INTO EMP VALUES('1013', '김지현', '대리', '1003', TO_DATE('2022-07-02', 'YYYY-MM-DD'), 6000, 100, '30');

INSERT INTO EMP VALUES('1004','김시형', '팀장', '1001', TO_DATE('2021-12-10', 'YYYY-MM-DD'), 8300, 850, '40');

INSERT INTO EMP VALUES('1014','서동호', '대리', '1004', TO_DATE('2022-01-23', 'YYYY-MM-DD'), 7500, 700, '40');

INSERT INTO EMP VALUES('1015','이한솔', '사원', '1004', TO_DATE('2022-01-30', 'YYYY-MM-DD'), 7800, 650, '40');

INSERT INTO EMP VALUES('1005','원종연', '팀장', '1001', TO_DATE('2020-02-10', 'YYYY-MM-DD'), 8500, 900, '50');

INSERT INTO EMP VALUES('1016','박영재', '대리', '1005', TO_DATE('2021-11-05', 'YYYY-MM-DD'), 7000, 550, '50');

INSERT INTO EMP VALUES('1017','허인호', '사원', '1005', TO_DATE('2022-06-20', 'YYYY-MM-DD'), 6800, 550, '50');

INSERT INTO EMP VALUES('1006','윤예서', '팀장', '1001', TO_DATE('2020-01-22', 'YYYY-MM-DD'), 8800, 750, '60');

INSERT INTO EMP VALUES('1018','이지완', '대리', '1006', TO_DATE('2020-03-22', 'YYYY-MM-DD'), 6700, 550, '60');

INSERT INTO EMP VALUES('1019','박수현', '사원', '1006', TO_DATE('2021-08-20', 'YYYY-MM-DD'), 6000, 600, '60');

INSERT INTO EMP VALUES('1007','이용효', '팀장', '1001', TO_DATE('2020-03-22', 'YYYY-MM-DD'), 8900, 800, '10');

INSERT INTO EMP VALUES('1020','임려종', '대리', '1007', TO_DATE('2020-06-21', 'YYYY-MM-DD'), 6900, 700, '10');

INSERT INTO EMP VALUES('1021','권미리', '사원', '1007', SYSDATE, 6100, 580, '10');
--RR/MM/DD에서 RR은 연도에서 앞 두자리 자르고 뒤에 두자리만 표시하겠다는 뜻

COMMIT;
ROLLBACK;


--FK 설정 시 PK가 아닌경우 오류
ALTER TABLE EMP ADD(DNAME VARCHAR2(20));

ALTER TABLE EMP
ADD CONSTRAINTS FK_ENAME FOREIGN KEY(ENAME) REFERENCES DEPT(DNAME);

SELECT * FROM ALL_CONS_COLUMNS WHERE TABLE_NAME = 'DEPT';

ALTER TABLE EMP DROP COLUM DNAME;

--UPDATE
UPDATE EMP
    SET COMM = COMM + 10;
--하나의 레코드 단위의 COMM
--WHERE이 없으므로 테이블의 모든 레코드가 대상이 되어서 모든 데이터가 10씩 늘어남

UPDATE EMP
    SET COMM = COMM + 500  -- 오라클에서 =는 오른쪽의 값을 왼쪽에 대입해라
WHERE EMPNO = '1001';
--오라클에서 UPDATE절의 업데이트시 반환값은 처리 건수이다.

--오라클에서 같다는 =, 다르다는 != 또는 <>
ROLLBACK;

--DELETE 삭제
--이런거는 운영DB가 아닌 개발DB(시험DB)에서 씀
--테이블 복사(PK, FK는 복사되지 않음)
CREATE TABLE EMP_TMP1 AS
SELECT * FROM EMP;       --이렇게 하면 EMP를 그대로 복사해서 EMP_TMP1을 생성함
--단 테이블 스키마와 데이터만 복사되는 것이지 PK, FK같은 것들은 복사되지 않는다

DELETE FROM EMP_TMP1;  --WHERE 없이 DELETE -> 19개행 전부 삭제됨

DELETE FROM EMP_TMP1
    WHERE MGR = '1001';  --MGR 이 1001인 데이터 6개만 삭제됨

ROLLBACK;

DROP TABLE EMP_TMP1;

TRUNCATE TABLE EMP_TMP1;  --TMP1이 잘렸습니다 라고 뜨면서 데이터 사라짐


--SELECT 조회
SELECT *
    FROM EMP;  --모든 컬럼, 데이터 정보가 출력됨
    
SELECT EMPNO, ENAME, JOB         --직원번호, 직원명, 직급
    FROM EMP
    WHERE EMPNO = '1001';
    
SELECT *
    FROM EMP
    WHERE EMPNO > '1015'; -- 1016~1021

SELECT *
    FROM EMP
    WHERE COMM > 550; 

SELECT *
    FROM EMP
    WHERE EMPNO >'1015'
    AND COMM > 550;

SELECT *
    FROM EMP
    WHERE EMPNO >'1015'
    OR COMM > 550;


--직원번호가 1020번 이상이면서 보너스가 500만원 이상인 직원정보조회
SELECT EMPNO, ENAME, JOB --직원번호, 직원명 , 직급
    FROM EMP
    WHERE EMPNO >= '1020'
    AND COMM >= 500;


--조회항목이 직원번호, 직원명, 직급, 급여+보너스, 부서코드
--상사코드가'1001'에 대한 직원정보조회
SELECT EMPNO, ENAME, JOB, SAL + COMM, DEPTNO  --SELECT절에는 값(결과)만 와야한다.
    FROM EMP
    WHERE  MGR = '1001';

--조회항목이 직원번호, 직원명, 직급, 급여+보너스, 부서코드
--직원번호가 '1010' 이상인 직원이면서 총급여(급여+보너스) 9500이상인 직원정보 조회
SELECT EMPNO AS 직원번호, ENAME 직원명, JOB 직급, SAL + COMM AS 이달급여, DEPTNO 부서코드
    FROM EMP
    WHERE EMPNO >= '1010'
    AND SAL+COMM >= 8000;
    --EMP의 pk는 EMPNO이기 때문에 AND SAL+COMM로 써도 영향주지 않음
    --오라클은 위에서 아래,왼쪽에서 오른쪽으로실행하기 때문에 and와 or을 같이 쓰면 더 앞에(왼쪽)쓰여진것을 실행
    
SELECT DEPTNO
    FROM EMP
    WHERE EMPNO = '1001';
    
--오라클에서 제공하는 함수 사용
SELECT NVL(DEPTNO, '00') AS "부서 코드"
    FROM EMP
    WHERE EMPNO = '1001';

--급여 테이블 생성
CREATE TABLE SALARY(
    SALMONTH CHAR(6),
    EMPNO CHAR(4),
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    CONSTRAINT PK_SALARY PRIMARY KEY(SALMONTH, EMPNO)
    );

INSERT INTO SALARY
SELECT '202305', EMPNO, SAL, COMM
    FROM EMP;
    
--새로만듦
INSERT INTO SALARY
SELECT '202306', EMPNO, SAL-100, COMM-50
    FROM SALARY
    WHERE SALMONTH = '202305';
    
COMMIT;

ALTER TABLE EMP DROP COLUMN SAL; --PK가 아니기 때문에 DROP가능
ALTER TABLE EMP DROP COLUMN COMM;
    
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'SALARY';
SELECT * FROM ALL_CONS_COLUMNS WHERE TABLE_NAME = 'SALARY';

SELECT *
    FROM SALARY
    WHERE SALMONTH = '202305'
    AND EMPNO = '1001';   --현재 급여테이블은 EMPNO만으로만 할 수 가 없어서 년월이 필요한것'
    --SALARY 테이블에서 EMPNO는 FK임
    --복합키 순서를 PK 순서대로 하는게 좋음 -> CONSTRAINT PK_SALARY PRIMARY KEY(SALMONTH, EMPNO)로 했기때문에
    --PK의 순서가 SALMONTH이 먼저,  EMPNO이 두번째 PK가 되는 것이다
    