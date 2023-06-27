CREATE TABLE DEPT(
    DEPTNO CHAR(2) CONSTRAINT PK_DEPT PRIMARY KEY,  --pk의 이름을 입력하지 않고 생성하면 자동이름이 붙는데 나중에 알아보기 어려우니까 이름 정해!
    DNAME VARCHAR2(20),
    LOC VARCHAR2(20)
);

--comment는 주석과 같아서 DB에 영향 안줌!
COMMENT ON TABLE DEPT IS '부서';
COMMENT ON COLUMN DEPT.DEPTNO IS '부서코드';
COMMENT ON COLUMN DEPT.DNAME IS '부서명';
COMMENT ON COLUMN DEPT.LOC IS '부서위치';

SELECT * FROM DBA_TAB_COLUMNS WHERE TABLE_NAME = 'DEPT';
SELECT * FROM DBA_TAB_COMMENTS WHERE TABLE_NAME = 'DEPT';

--직원테이블 생성
CREATE TABLE EMP(
    EMPNO CHAR(4) CONSTRAINT PK_EMP PRIMARY KEY, --직원번호,  신규직원 생성
    ENAME VARCHAR2(20),   --직원명
    JOB VARCHAR2(10),   --직급
    MGR CHAR(4),   -- 상사코드 -> EMP테이블의 MGR은 FK 임!!!
    --FK은 테이블에 다른 테이블의 PK가 커럼을로 들어와 있음
    --기존에 등록되어 잇는 코드가 MGR로 와야함
    --DEPTNO에 잇는 데이터코드가 와야함
    HIREDATE DATE, --입사일은 바뀌면 안되니까 CHAR타입으로 하는게 좋고,년월일 만 필요하므로 DATE타입으로 정해주면됨
    SAL NUMBER(7, 2), --급여
    COMM NUMBER(7, 2),  --보너스
    DEPTNO CHAR(2)CONSTRAINT FK_DEPTNO REFERENCES DEPT --부서코드,  외래키 지정
);
