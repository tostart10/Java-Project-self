--VIEW
--일반직원(상사제외) 중 부서코드가 30번인 직원을조회하는 VIEW 작성
--조회항목 : 직원번호, 직원명, 직급, 급여, 보너스
CREATE OR REPLACE VIEW V_EMP_DEPT20
AS (
    SELECT E.EMPNO, E.DEPTNO, E.ENAME, E.JOB, S.SAL, S.COMM
        FROM EMP E, SALARY S
        WHERE E.DEPTNO = '20'
        AND S.SALMONTH = '202306'
        AND S.EMPNO = E.EMPNO
        AND E.EMPNO NOT IN (SELECT DISTINCT A.EMPNO
                                FROM EMP A, EMP B
                                WHERE A.EMPNO = B.MGR));

--VIEW 정보조회
SELECT * FROM USER_VIEWS;  --현재 계정의 권한이 DBA 권한이기 때문에 SELECT * FROM DBA_VIEWS 도 같은 결과 나옴

SELECT *
    FROM V_EMP_DEPT20;  --일반적으로 VIEW는 FROM 절에 쓴다

--문제)VIEW를 이용하여 해당 팀의 팀원들의 부서명을 조회하는 쿼리 작성
--조회항목 : 직원번호, 부서코드, 부서명, 직원명
--단, 부서명을 제외한 나머지 조회항목은 VIEW 통해서 조회함
SELECT V1.EMPNO, V1.DEPTNO, D.DNAME, V1.ENAME
    FROM V_EMP_DEPT20 V1, DEPT D
    WHERE V1.DEPTNO = D.DEPTNO;

--인라인뷰와 뷰를 쓰는 경우를 어떻게 구분할까?
--뷰를 쓰는 이유중 하나 :코드의 중복성을 줄이기 위해
--뷰를 사용하면 테이블의 데이터를 부분적으로 수정할 수 있다?
--뷰의 단점 : 오라클의 데이터를 차지한다(오라클을 실행할때마다 뷰가 있는 거기 떄문에 메모리를 차지함)

--VIEW를CREATE 할 때 OR REPLACE를 안쓰면 기존에 있는 뷰를 삭제하고 다시 만들게 되므로 써쥬는 것이 좋음
--VIEW는 DBA에 따라 사용하는게 다름 -> DBA의 메모리가 모자르거나 성능이 않좋으면 메모리를 차지하는 뷰를 사용하지 않을 수 잇음


--인덱스에 쓰이는 사전은 필수로 알아야함!!

--문제)급여가 6500이상이면서 20230101이전 입사자중 상사을 제외한 팀원들만 조회하는 쿼리
--조회항목 : 직원번호, 직원명, 직급, 급여액, 입사일(YYYY-MM-DD)
--단, 쿼리는 VIEW를 이용함
--이 SELECT 절을 실행했을 떄 결과가 나와야함
SELECT V1.EMPNO, V1.ENAME, V1.JOB, S.SAL, V1.HIREDATE  --여기에서 (V1.EMPNO 가 의미하는 것은 V1.뷰 SELECT 절에 오는 컬럼의 별칭)이다 
    FROM SALARY S, V_EMP_V2 V1     --꼭 뷰를 만들때 별칭을 지어주고 그 별칭을 써줘야한다  (뷰테이블별칭.뷰만들때정해줬던 별칭)
    WHERE V1.EMPNO = S.EMPNO      --특히나 TO_CHAR(E.HIREDATE, 'YYYY-MM-DD')처럼 값을 바꿔준 경우에는 무조건 별칭을 정해주고 별칭으로 사용하기!!!ㄴ
    AND S.SALMONTH = '202306'
    AND S.SAL >= 6500;

--혼자해보기 -> 성공은 했지만 뷰를 만들때 안써도 되는 테이블을 썼음
CREATE OR REPLACE VIEW V_EMP_V2
AS (
    SELECT E.EMPNO AS EMPNO, E.ENAME AS ENAME, E.JOB AS JOB, S.SAL AS SAL, TO_CHAR(E.HIREDATE, 'YYYY-MM-DD') AS HIREDATE
        FROM EMP E, SALARY S   --여기서 SALARY 테이블 안써줬어도 됬음 -> 뷰 테이블 데이터를 조회하는 조건에 SAL에 대한 조건을 지정해 줬기 떄문
        WHERE  E.EMPNO NOT IN (SELECT DISTINCT A.EMPNO
                                FROM EMP A, EMP B
                                WHERE A.EMPNO = B.MGR)
        AND E.EMPNO = S.EMPNO
        AND S.SALMONTH = '202306'
        AND S.SAL >= 6500
        AND E.HIREDATE < TO_DATE('20230101' , 'YYYYMMDD'));
         --AND E.HIREDATE < TO_CHAR('20230101' , 'YYYY-MM-DD') 왜 이거 넣으면 안되지??
         -->E.HIREDATE는 DATE타입이기 떄문에 TO_CHAR가 아닌 새_DATE 여야하고
         --('20230101' , 'YYYY-MM-DD')에서 '20230101'의 형식과 'YYYY-MM-DD'의 형식이 틀려서 안됨 -> 형식 일치시켜줘야함
         --'20230101'이 그냥 숫자였다면 가능했겠지만 현재 DATE타입이기 때문에 오류난다
         --따라서, ('20230101', 'YYYYMMDD')으로 맞춰줘야 한다.
         

SELECT E.EMPNO , E.ENAME , E.JOB 
        FROM EMP E
        WHERE  E.EMPNO NOT IN (SELECT DISTINCT A.EMPNO
                                FROM EMP A, EMP B
                                WHERE A.EMPNO = B.MGR)
        AND E.EMPNO = S.EMPNO
        AND S.SALMONTH = '202306'
        AND S.SAL >= 6500


-- 위의 별칭에 대한 주석의이해를 돕기위한 예
SELECT V1.직원번호, V1.직원명, V1.직급, S.급여, V1.고용일  --여기에서 (V1.EMPNO 가 의미하는 것은 V1.뷰 SELECT 절에 오는 컬럼의 별칭)이다 
    FROM SALARY S, V_EMP_V2 V1     --꼭 뷰를 만들때 별칭을 지어주고 그 별칭을 써줘야한다  (뷰테이블별칭.뷰만들때정해줬던 별칭)
    WHERE V1.EMPNO = S.EMPNO
    AND S.SALMONTH = '202306'
    AND S.SAL >= 6500;

CREATE OR REPLACE VIEW V_EMP_V2
AS (
    SELECT E.EMPNO AS 직원번호, E.ENAME AS 직원명, E.JOB AS 직급, S.SAL AS 급여, TO_CHAR(E.HIREDATE, 'YYYY-MM-DD') AS 고용일
        FROM EMP E, SALARY S
        WHERE  ~~~~~~);


--모범코드(뷰를 생성하는 코드)
CREATE OR REPLACE  VIEW V_EMP_V2--OR REPLACE는 UPDATE처럼 엎어쳐주는 것
AS (SELECT EMPNO, ENAME, JOB, HIREDATE
        FROM EMP
        WHERE HIREDATE < TO_CHAR('20230101' , 'YYYY-MM-DD')
    MINUS
    SELECT A.EMPNO, A.ENAME, A.JOB, A.HIREDATE
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR);

--항상 생성하기 전에 데이터가 제대로 나오는지 검증
SELECT * FROM V_EMP_V2;


--ROWID조회
SELECT ROWID, A.*
    FROM EMP A;
--ROWID는 중복이 없음!!


--INDEX
SELECT * FROM USER_INDEXES;  --여기서는 FK에 대한 정보는 안나오고 PK에 대한 정보만 나옴!

--
SELECT * FROM USER_IND_COLUMNS
    WHERE INDEX_NAME = 'PK_EMP';

--
SELECT * FROM USER_IND_COLUMNS
    WHERE TABLE_NAME ='SALARY';



--인덱스 추가
CREATE INDEX EX_EMPNO ON SALARY(EMPNO, SAL);
--옵티마이저의 판단을 흐리지 않기 위해 인덱스를 잡음
--인덱스는 언제 제일 많이 사용? WHERE절에 들어가는 컬럼의 빈도수가 높을때
--인덱스에 들어가면 안되는것!! -> 예를 들어 성별이라면 확률이 반(50%)이므로 이거는 인덱스로 잡는거 보다 그냉 처음부터 데이터를 돌리는게 더 빠름
--해당테이블의 데이터의 빈도를 보고 인덱스를 잡아야함!!
--WHERE절에 들어간다고 모두 인덱스를 잡는게 아님
--해당데이터의 빈도를 봤을때 40%까지는 인덱스를 잡지 마셈

--데이터 분포도 가 3: 7인 경우도 하지말라고 함 7인경우에는 인덱스 없는경우가 더 빠르거든,,
--오라클의 힌트라는것은 옵티마이저의 경로를 변경해주는 명령임


--인덱스 리빌드
ALTER INDEX PK_EMP REBUILD; --이름이 PK_EMP인것을 다시 정의해 라는 뜻
--인덱스 리빌드는 데이터를 잘 쓰지 않을때 해줘야한다 -> 인덱스 리빌드가 끝날때까지 DB에 락걸리기 떄문
SELECT 'ALTER INDEX' || INDEX_NAME || ' REBUILD;'  --작은따옴표 안에 세미콜론; 꼭 넣어줘야함
    FROM USER_INDEXES
    WHERE TABLE_OWNER = 'C##SISTUSER' --오라클 계정  //계정만 바꿔서 넣으면 됨
    AND INDEX_NAME LIKE 'PK_%';   --이자리에는 인덱스명 / 현업에가서 이쿼리 그대로 가져가서 이줄만 없애거나

ALTER INDEX PK_DEPT REBUILD;
ALTER INDEX PK_EMP REBUILD;
ALTER INDEX PK_SALARY REBUILD;


--어떻게 --해당데이터의 빈도를 봤을때 40% 인지 아는지?


--시퀀스
--시퀀스 생성
CREATE SEQUENCE EX_SEQ
INCREMENT BY 1  --1씩증가
START WITH 60
MINVALUE 10
MAXVALUE 99
NOCYCLE
NOCACHE;

--USER_SEQUENCES는 데이터 사전임
SELECT * FROM USER_SEQUENCES;

INSERT INTO DEPT VALUES(EX_SEQ.NEXTVAL, '기획팀', '서울시마포구');
--NEXTVAL는 현재시퀀스 값의 다음값을 가져옴
--현재 시퀀스의 값이 60이라면,  시퀀스를 생성할 때INCREMENT BY 1 라고 했다면 1씩증가되는데 그렇다면 다음 시퀀스의 값은 61이다.

-- ~는 시퀀스를 호출할때 마다 생성된다
--캐시는 디폴트가 20개임, 만약 캐시 5하면 5만 가져다놓음

--현재 시퀀스가 몇번인지 조회(확인)
--EX_SEQ.CURRVAL(시퀀스명.CURRVAL)  CURRVAL는 현재 시퀀스의 값을 가져옴
SELECT EX_SEQ.CURRVAL
FROM DUAL;


CREATE SEQUENCE EX_SEQ2
INCREMENT BY 1  --1씩증가
START WITH 1
MINVALUE 1
MAXVALUE 99
NOCYCLE
NOCACHE;

SELECT EX_SEQ2.NEXTVAL
FROM DUAL;
--시퀀스의 특징 : NEXTVAL을 하고 실행해야 나온다
--USER_SEQUENCES로 등록만 해놓은 상태임 아직 메모리는 올라가지 않음, 자동으로 메모리가 올라가지 않기 떄문에 NEXTVAL을 해줘야 메모리에 올라간다.
--시퀀스를 시작할때 NEXTVAL을 안하면 CREATE SEQUENCE로 등록만 해놓고 메모리가 올라가지 않으상태
--NEXTVAL을 하면 메모리 생성(할당?)이 되어 시퀀스가 시작되는 것?

CREATE SEQUENCE EX_EMPNO_SEQ
INCREMENT BY 1  --1씩증가
START WITH 3000  --3000부터 시작
MINVALUE 1     --가장 작은 값  -> CYCLE로 해놓았을떄 9999까지 갔으면 다음값으로 1부터 시작됨
MAXVALUE 9999
NOCYCLE   --3000부터 시작해서 9999까지 끝났을때 돌아가지 않고 오류남
NOCACHE;   --DEFAULT가 NOCACHE임,  캐시메모리에 최대 20개씩 메모리를 올려놓고 호출할때 올려놓은 메모리를 던져준다
--오라클 내부 메모리를 사용하기 때문에 CACHE 잘 안씀

--생성
INSERT INTO EMP(EMPNO, ENAME, HIREDATE, DEPTNO)
VALUES (EX_EMPNO_SEQ.NEXTVAL, '테스트1', SYSDATE, '20');
--시퀀스는 단독임
--동시접속이 전제조건임
--현재시퀀스 : 현재 테이블의 커밋상태에서의 현재상태
--NEXTVAL을 하면 참조무결성오류는 나지 않음
--***시퀀스는 특정 테이블에 특정값을 넣는데 PK에 해당하는 값이 1씩 증가되어야할 떄 사용
--시퀀스(EX_EMPNO_SEQ.NEXTVAL)는 기본적인 데이터타입이 NUMBER임

INSERT INTO EMP(EMPNO, ENAME, HIREDATE, DEPTNO)
VALUES (TRIM(TO_CHAR(EX_EMPNO_SEQ.NEXTVAL, '0009')), '테스트1', SYSDATE, '20');  --TO_CHAR(EX_EMPNO_SEQ.NEXTVAL, '0009')이렇게만 하면 공백들어가서 4자리가아닌 5자리가 되서 오류남
COMMIT;

INSERT INTO EMP(EMPNO, ENAME, HIREDATE, DEPTNO)
VALUES ('A' || TRIM(TO_CHAR(EX_EMPNO_SEQ.NEXTVAL, '0009')), '테스트1', SYSDATE, '20');  --EX_EMPNO_SEQ.NEXTVAL이게 숫자인것임
--0009는 4자리를 꼭 채워야하는데, 000부분은 숫자가 없으면 공백대신 0을 넣으라는뜻

--위랑 같음
--회사에서도 이런식으로 사용함
SELECT 'A' || TRIM(TO_CHAR(EX_EMPNO_SEQ.NEXTVAL, '0009')), FROM DUAL;

--REPLACE(문자열, 찾을문자, 변경문자)
--REPLACE(문자열, ' ', '') --문자열에서 공백하나를 없애기 위함

--이렇게하면 동시접속시에 무결성 위반 문제가 생김(무결성제약조건 위반)
INSERT INTO EMP(EMPNO, ENAME, HIREDATE, DEPTNO)
VALUES ((SELECT MAX(EMPNO)+1 FROM EMP) , '테스트1', SYSDATE, '20'); --안에 서브쿼리 써줌
--INSERT하는 시점에 +1을 함

--동시접속 : 여러사람이 동시에 같은 네트워크에 접속하는것 (디도스공격의 목적이 동시접속을 줄이는것임

--미니프로젝트위한 테이블 만들기
/*1. 회원테이블(사용자)
테이블명은 T_USER로 정의, 회원가입시 필요한 컬럼을 정의하고, 회원상태(사용(Y), 정지(N))가 관리될 수 있도록 정의
각 컬럼에 대한 COMMENT를 적용하여 컬럼의 의미를 전달할 수 있도록
사용자 아이디를 PK로 정의함.(단, 테이블 생성 후 PK적용)
(타입과 길이를 왜 이렇게 정했는지
이 컬럼이 왜 필요한지
이 테이블이 왜 필요하다고 생각해서 넣었는지를 설명할 수 있으면 됨)
(회원테이블과 게시판 테이블 만들기)
(메인에 대한 댓글을 만들건지 대댓글까지 할건지)

2. 게시판 테이블(댓글 관련 자율)
게시판글번호는 NUMBER(12)로 정하고 시퀀스는 SEQ_BOARD로 하여 정의함  -> PK,FK에 대한거 다 정의해야함
각 컬럼에 대한 COMMENT를 적용하여 컬럼의 의미를 전달할 수 있도록
게시판 글번호를 PK로 정의함.(단, 테이블 생성 후 PK적용)
게시판 조회갯수를 관리한다. 크기는 게시판 글번호와 동일하게 적용.
게시판 테이블은 글제목, 글내용(TEXTAREA), 조회갯수(몇번조회됬는지) 등..
글내용은 CLOB()이용?

파일첨부, 이미지 첨부 이런거 없음
*/

/*1. 회원테이블(사용자)
테이블명은 T_USER로 정의, 회원가입시 필요한 컬럼을 정의하고, 회원상태(사용(Y), 정지(N))가 관리될 수 있도록 정의
각 컬럼에 대한 COMMENT를 적용하여 컬럼의 의미를 전달할 수 있도록
사용자 아이디를 PK로 정의함.(단, 테이블 생성 후 PK적용)
*/
CREATE TABLE T_USER(
    --USERNO CHAR(2) CONSTRAINT PK_DEPT PRIMARY KEY,  
    USERID VARCHAR2(20) CONSTRAINT PK_T_USER PRIMARY KEY,
    UNAME VARCHAR2(20),
    REGISTDATE DATE,
    UPW VARCHAR2(20),
    EMAIL VARCHAR2(20),
    BDAY DATE,
    PHNOENUM VARCHAR2(11),
    USTAUTS CHAR(1)   --CHECK 속성으로 Y,N만 올 수 있도록/ 테이블 생성시 컬럼값 체크라고 검색하면 됨(CHECK라는 문법이 있음)
);

--CHECK속성 추가
ALTER TABLE T_USER ADD CONSTRAINT USTAUTS_CK CHECK(USTAUTS IN ('Y', 'N'));

COMMENT ON TABLE T_USER IS '회원테이블';
--COMMENT ON COLUMN T_USER.USERNO IS '사용자번호';
COMMENT ON COLUMN T_USER.UNAME IS '사용자이름';
COMMENT ON COLUMN T_USER.REGISTDATE IS '가입일';
COMMENT ON COLUMN T_USER.UPW IS '비밀번호';
COMMENT ON COLUMN T_USER.EMAIL IS '이메일';
COMMENT ON COLUMN T_USER.BDAY IS '생년월일';
COMMENT ON COLUMN T_USER.PHNOENUM IS '전화번호';
COMMENT ON COLUMN T_USER.USTAUTS IS '회원상태';


/*
2. 게시판 테이블(댓글 관련 자율)
게시판글번호는 NUMBER(12)로 정하고 시퀀스는 SEQ_BOARD로 하여 정의함  -> PK,FK에 대한거 다 정의해야함
각 컬럼에 대한 COMMENT를 적용하여 컬럼의 의미를 전달할 수 있도록
게시판 글번호를 PK로 정의함.(단, 테이블 생성 후 PK적용)
게시판 테이블은 글제목, 글내용(TEXTAREA), 조회갯수(몇번조회됬는지)
*/
CREATE TABLE BOARD(
    POSTNO NUMBER(12) CONSTRAINT PK_BOARD PRIMARY KEY, --PK
    BTITEL VARCHAR2(20),
    TCONTENT CLOB,
    VIEWS VARCHAR2(1000),
    USERID VARCHAR2(20) CONSTRAINT FK_T_USER REFERENCES T_USER, --FK
    CREATED DATE,
    LIKES VARCHAR2(20)
    --카테고리도 만들기 -> 카테고리에 따라 어떤 테이블을 만들지가 결정되니까
);



COMMENT ON TABLE BOARD IS '게시판';
COMMENT ON COLUMN BOARD.POSTNO IS '글번호';
COMMENT ON COLUMN BOARD.BTITEL IS '글제목';
COMMENT ON COLUMN BOARD.TCONTENT IS '글내용';
COMMENT ON COLUMN BOARD.VIEWS IS '조회수';
COMMENT ON COLUMN BOARD.USERID IS '사용자이름';
COMMENT ON COLUMN BOARD.CREATED IS '만들어진일자';
COMMENT ON COLUMN BOARD.LIKES IS '좋아요';

--인덱스 추가
CREATE INDEX EX_BOARD ON BOARD(POSTNO, USERID);


--시퀀스 생성
CREATE SEQUENCE EX_SEQ_BOARD
INCREMENT BY 1  --1씩증가
START WITH 1
MINVALUE 1
MAXVALUE 99
NOCYCLE
NOCACHE;

--USER_SEQUENCES는 데이터 사전임
SELECT * FROM USER_SEQUENCES;

--현재 시퀀스가 몇번인지 조회(확인)
SELECT EX_SEQ_BOARD.CURRVAL   --아직 EX_SEQ_BOARD.NEXTVAL을 안해줘서 오류
FROM DUAL;

--시퀀스를 CREATE하고 나서 EX_SEQ_BOARD.NEXTVAL를 하지 않고 SELECT EX_SEQ_BOARD.CURRVAL 를 하면 오류!!
--왜? => 시퀀스를 CREATE하고 나서 EX_SEQ_BOARD.NEXTVAL를 해야 CREATE를 할때 START WITH 1로 해줬기 떄문에 1부터 시작을 하게 된다
--그래서 NEXTVAL을 하고 나서 CURRVAL을 하면 1부터 시작하는것임
--만약 START WITH 100으로 했다면 CURRVAL을 했을 때 100부터 시작됨

--시퀀스에 NOORDER옵션도 있음
--회원이 탈퇴해도 데이터는 남겨놓는 용
--테이블 생성시 컬럼값 체크(CHECK라는 문법이 있음)

