--문제)직원중 급여가 5000이상이고 보너스가 500이상인 직원에 대한 부서명을 조회하는 쿼리 작성(단, 급여는 2023년 6월 기준)
--조회항목 : 직원번호, 직원명, 이번달 급여(급여+보너스), 부서코드, 부서명
SELECT E.EMPNO AS 직원번호, E.ENAME AS 직원명, S.SAL+ S.COMM AS "이번달 급여" , D.DEPTNO AS 부서코드,D.DNAME 부서명
    FROM EMP E, DEPT D, SALARY S
    WHERE E.DEPTNO = D.DEPTNO
    AND S.EMPNO = E.EMPNO
    AND S.SALMONTH = '202306'
    AND S.SAL >= 5000
    and s.comm >=500;
--집계함수를 쓸때 group by를 많이 쓴다

--위에 같은 결과를 INNER JOIN으로
SELECT E.EMPNO AS 직원번호, E.ENAME AS 직원명, (S.SAL + S.COMM) AS "이번달 급여"
    FROM EMP E INNER JOIN SALARY S
    ON E.EMPNO = S.EMPNO  --INNER JOIN에 있는 거만 오면됨 , INNER 조인에 3개의 테이블이 있으면 ON 절에 해당하는 키가 와야함(복합키)
    --ON절에는 앞에있는 테이블EMP과 뒤에오는 SALARY테이블에 있는 키가 와야함!
   -- AND E.EMPNO = S.EMPNO --앞에있는 EMP 테이블과 뒤에 있는 테이블의 키가 복합기면 ON절 다음에 AND가 온다
    WHERE S.SALMONTH = '202306'
    AND S.SAL >= 5000
    AND S.COMM >= 500;

--부서코드, 부서명 추가(INNER JOIN 사용)
--혼자해보기
SELECT E.EMPNO AS 직원번호, E.ENAME AS 직원명, S.SAL+ S.COMM AS "이번달 급여" , E.DEPTNO AS 부서코드,D.DNAME 부서명
    FROM EMP E INNER JOIN SALARY S
    ON E.EMPNO = S.EMPNO
    INNER JOIN DEPT D 
    ON E.DEPTNO = D.DEPTNO
    WHERE S.SALMONTH = '202306'
    AND S.SAL >= 5000
    AND S.COMM >=500;

--모범코드
SELECT E.EMPNO AS 직원번호, E.ENAME AS 직원명, S.SAL+ S.COMM AS "이번달 급여" , E.DEPTNO AS 부서코드,D.DNAME 부서명
    FROM EMP E INNER JOIN SALARY S
    ON E.EMPNO = S.EMPNO
    INNER JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    AND S.SALMONTH = '202306'
    AND S.SAL >= 5000
    AND S.COMM >=500;
    
--SELF JOIN (같은 테이블하나를 별칭만 여러개 둬서 마치 다른 여러테이블을 사용하는 것처럼 하는 것)( 테이블하나에 PK FK가 같이 있는 것)
SELECT DISTINCT A.EMPNO, A.ENAME, A.JOB, B.EMPNO, B.ENAME, B.JOB
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR;

--SELF JOIN
--직원의 관리자 정보(상사의 정보)를 조회하는 쿼리 작성
--조회항목(관리자) : 직원번호, 직원명, 직급 : 단, 중복제거(관리자 관점이기 때문에 중복제거를 해야하는것임, 일반 직원의 관점에서는 중복제거 할 필요가 없음)
--만약 조건이 조회항목(팀원) -> 팀원 기준으로 하는거였으면 결과가 달라짐
--B(일반직원)은 다 다른 데이터기 때문에 중복제거 할 필요가 없음
--B의 관점에서는 INNER JOIN이라고 생각해도됨
SELECT DISTINCT A.EMPNO AS 직원번호, A.ENAME AS 직원명, A.JOB AS 직급
    FROM EMP A, EMP B
    WHERE A.EMPNO =B.MGR;
--A의 관점에서 봤을 때 1001은 상사의 EMPNO이여서 상사가 출력됨
--B의 관점에서 봤을 때 1001은 해당 직원의 상사의 코드여서 코드가 1001인 상사를 둔 직원이 출력된다
    
    
--직원의 관리자 정보를 조회하는 쿼리작성
--조회항목(관리자) : 직원번호, 직원명, 직급, 팀원수 (단, 중복제거)
SELECT A.EMPNO AS 직원번호, A.ENAME AS 직원명, A.JOB AS 직급, COUNT(A.EMPNO) AS 팀원수 
    FROM EMP A, EMP B 
    WHERE A.EMPNO = B.MGR
    group by A.EMPNO, A.ENAME, A.JOB;
--집계함수가 온다?-> 무조건 GROUP BY
--GROUP BY는 가져오는(SELECT한) 컬럼의 데이터에 대해 GROUP BY를 해주는 것이므로 SELECT 절에오는 집계함수를 제외한 모든 칼럼을 GROUP BY에 써줘야한다.
--GROUP BY 하면 중복제거를 자동으로 해주므로 DISTINCT 안해줘도 됨
--A.EMPNO, A.ENAME, A.JOB 를 중복제거 해준다음에 COUNT()가 들어가는거여서 GROUP BY에 3개 다써줘야함
--관리자(상사)의 입장에서의 데이터를 가져와야하기 때문에 A.~~로 해줘야함

--팀원수가 2명보다 많은 팀장만 조회
SELECT A.EMPNO, A.ENAME , A.JOB, COUNT(A.EMPNO)  --데이터 레코드 건수로 세는 거기 때문에 COUNT(B.MGR)나 COUNT(B.EMPNO) 로 해도됨
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR 
    GROUP BY A.EMPNO, A.ENAME , A.JOB
    HAVING COUNT(A.EMPNO) >2;

SELECT A.EMPNO, A.ENAME , A.JOB, COUNT(A.EMPNO) , LISTAGG(B.ENAME, ', ')
    WITHIN GROUP(ORDER BY B.ENAME) AS 팀원명
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR 
    GROUP BY A.EMPNO, A.ENAME , A.JOB;


 --혼자 분석
 --A의 관점
 SELECT A.EMPNO, A.ENAME , A.JOB, COUNT(A.EMPNO)
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR 
    GROUP BY A.EMPNO, A.ENAME , A.JOB;   

--B의 관점(직원의 관점)에서 봤을 때의 결과
SELECT  B.MGR, B.ENAME , B.JOB, B.EMPNO,COUNT(B.MGR) 
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR 
    GROUP BY B.EMPNO, B.ENAME , B.JOB, B.MGR ;
    
--OUTER JOIN
INSERT INTO EMP VALUES('2001', '지수', '팀장', '1001', TO_DATE('2020-06-14','YYYY-MM-DD'),'70'); --이 코드는 DEPTNO가 조건 위반이여서 오류남!


ROLLBACK;

--제약조건 확인
SELECT * FROM ALL_CONSTRAINTS WHERE OWNER = 'C##SISTUSER';

--제약조건 비활성화
ALTER TABLE EMP DISABLE CONSTRAINTS FK_DEPTNO;
ALTER TABLE EMP DISABLE CONSTRAINTS FK_MGR;

--키를 죽여서 데이터를 넣음??

--제약조건 활성화
ALTER TABLE EMP ENABLE CONSTRAINTS FK_DEPTNO;

INSERT INTO EMP
VALUES('2002', '제니', '대리', '2001', TO_DATE('2021-03-14','YYYY-MM-DD'),'71');

INSERT INTO EMP
VALUES('2003', '로제', '사원', '2001', TO_DATE('2021-11-10','YYYY-MM-DD'),'72');

INSERT INTO EMP
VALUES('2004', '리사', '사원', '2001', SYSDATE ,'73');

COMMIT;

--OUTER JOIN
SELECT E.EMPNO, E.ENAME, E.DEPTNO, NVL(D.DNAME, ' ')
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO(+);
    --없을수도 있는 쪽에 (+)를 붙인다
    --E테이블에는 있고 D테이블에는 없는 데이터도 출력하고 싶을 때
    --NVL(D.DNAME, ' ') 로 없는 데이터가 NULL로 나오는게 싫으니까 NULL 대신 공백이 나오도록 NVL()을 써서 바꿔준다.


UPDATE EMP
    SET MGR = '2000'
    WHERE MGR = '2001';
    
COMMIT;

--OUTER JOIN(SELF JOIN에 대해 이햐를 해야 풀 수있음)
--직원의 관리자 정보를 조회하는 쿼리작성
--조회항목(관리자) : 직원번호, 직원명, 직급, 입사일(YYYY.MM.DD)
--단, 관리자 정보가 없는 경우는 직원번호를 B.MGR 으로 처리함(중복제거)
--직원번호를 나머지 컬럼은 NULL인 경우 공백으로 처리
SELECT DISTINCT NVL(A.EMPNO, B.MGR) AS 직원번호, NVL(A.ENAME, ' ') AS 직원명, 
      NVL(A.JOB, ' ') AS 직급, NVL(TO_CHAR(A.HIREDATE, 'YYYY.MM.DD'), ' ') AS 입사일
    FROM EMP A, EMP B
    WHERE A.EMPNO(+) = B.MGR
    AND B.MGR IS NOT NULL;  --여기서 != 이거 하면 절대 안됨!!! IS NOT NULL로 해야함
    --EMPNO는 존재하지 않는데 MGR에는 존재하는 2000번이 있으므로 EMPNO에 (+)를 붙여야 함
    --A에는 없는데 B에는 있는거가 나오려면 A에 OUTER JOIN (+)을 걸어줘야함 
    --MGR에 대한 컬럼이 출력되는거기 때문에 MGR에는 겹치는 값이 많아서 DISTINCT해주는 것임
--NVL(A.EMPNO, B.MGR)는 어떤것이 상사코드가 없는지를 알기 위한 코드


--OUTER JOIN
--사원의 급여정보를 조회하는 쿼리 작성
--조회항목 : 직원번호, 직원명, 직급, 급여, 보너스
--단, 급여는2023년 6월 기준이며, 급여정보가 없는 직원은 0으로 처리함.
SELECT E.EMPNO AS 직원번호, E.ENAME AS 직원명, E.JOB AS 직급, NVL(S.SAL, 0) AS 급여, NVL(S.COMM, 0) AS 보너스
    FROM EMP E, SALARY S
    WHERE S.SALMONTH(+) = '202306'  --여기서 (+)을 써주지 않으면 OUTER JOIN이 안되서 S테이블에 없는 데이터는 나오지 않는다
    AND  S.EMPNO(+) = E.EMPNO ;
--SELECT 문에서 다른컬럼은 별칭을 생략해도 되지만 EMPNO는 두 테이블에 모두있어서 생략하면 안됨
--별칭은 생략안하는게 좋음!!  데이터상태를 잘 모르는 사람이 봤을때 파악하기 어렵기 떄문
--WHERE절에 SALMONTH가 202306인것들을 가져와서 비교하는것이
--E.EMPNO = S.EMPNO(+)을 먼저하는 것보다 데이터의 양이 더 적어서 프로그램이 더빨리 돌아간다
  


