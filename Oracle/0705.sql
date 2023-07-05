--����)�μ��� 6�� �ѱ޿�(�޿�+���ʽ�)�� 20000�̻��� ���� ��ȸ�ϰ�, ��ȸ�� �μ��� ���ϴ� ������ �߿�,
--������� �ѱ޿����� ���� ������ ��ȸ�ϴ� ���� �ۼ�  (202305�� - �������)
--��ȸ�׸� : ������ȣ, �μ��ڵ�, �ѱ޿���(SAL + COMM)
--��, ��ȸ�� �ѱ޿����� ���� ������ ������
SELECT A.EMPNO, A.DEPTNO, (B.SAL + B.COMM) AS �ѱ޿���
    FROM EMP A, SALARY B,
        (SELECT DEPTNO, SUM(SAL + COMM) AS SAL1
            FROM EMP E, SALARY S
            WHERE S.SALMONTH = '202306'
            AND S.EMPNO = E.EMPNO
            GROUP BY DEPTNO
            HAVING SUM(SAL + COMM) >= 25000) C
    WHERE A.DEPTNO = C.DEPTNO
    AND A.EMPNO = B.EMPNO
    AND B.SALMONTH = '202306'
    ORDER BY (B.SAL + B.COMM) DESC;  --ORDER BY �� �� �������� ����Ǳ� ������ ��Ī�� �ѱ޿��� ��� (B.SAL + B.COMM)�� �� �� ����
    
--���� ��������� ������ ������ �ۼ��ϴ� ���� ������ ���⼭�� �ϵ��ڵ���
--����(ORDER BY)�� �Ҷ����̹� SELECT���� �� �͵��� �����͸� DBMS�� �÷����� �����ϱ� ������ ��Ī�� ����� �� �ִ� ����
SELECT T1.EMPNO, T1.DEPTNO, T1.SAL2
    FROM SALARY S2,
        (SELECT A.EMPNO, A.DEPTNO, (SS.SAL + SS.COMM) SAL2 --SAL2�� ������ �ѱ޿���
            FROM EMP A, SALARY SS,
                (SELECT DEPTNO, SUM(SAL+ COMM) AS SAL1  --SAL1�� �μ��� �� �޿���
                    FROM EMP E, SALARY S
                    WHERE S.SALMONTH = '202306'
                    AND S.EMPNO = E.EMPNO
                    GROUP BY DEPTNO
                    HAVING SUM(SAL+ COMM)>=20000) C
            WHERE SS.SALMONTH = '202306'
            AND A.EMPNO = SS.EMPNO
            AND A.DEPTNO = C.DEPTNO) T1
    WHERE S2.SALMONTH = '202305'
    AND S2.EMPNO = T1.EMPNO
    AND (S2.SAL+ S2.COMM) <= T1.SAL2;  --S2�� 5����, T1�� 6����

--�ζ��κ� ���� ���
--1.FROM���� ���� ���̺� ���� ���� ������ �� �� ������
--2.������ �Ǽ��� �ʹ� Ŀ�� Ư������ �̾Ƽ� �װ��� ������ ���Ϸ��� �� 

--from���� ���� ���̺���� ������ ������ �ؾ���
--�Ȱ��� ���̺��� ������ ������ �ؾ��ϴµ�

--WHERE���� ���������� ���� ��� (�̰� �³�?? 1��2�� �������ε� ���� �ٸ����Ѱ�?
--1.FROM���� ������ ���� �� Ư������ ���ؾ��Ҷ�
--2.���� ������ FROM���� ���� ���̺��� ������� �ʰų� WHERE���� ���������

--�����ý��� ERD�� ���� ������


--�����Ͼ� ����
--����) �μ����� 6���� �ѱ޿�(���ʽ�����)�� 25000 �̻��� ���� ��ȸ�ϰ�,
--��ȸ�� �μ��߿� ���� ���� �ѱ޿��� ���� �μ��� ��������, ������� �޿��� ���� �������� ��ȸ.
--��ȸ�׸� : �����ȣ, �޿���, �μ���
--(1006 �������� ���ʽ� COMM�� 1700 �� ������)
SELECT A1.EMPNO, B2.SAL + B2.COMM, A2.DNAME
  FROM EMP A1, DEPT A2, SALARY B2, 
       (SELECT DEPTNO, MAX(AA.SAL2) AS KK
          FROM (SELECT A.EMPNO, A.DEPTNO, (SS.SAL + SS.COMM) SAL2 --������ �ѱݾ� ���Ѱ�
                  FROM EMP A, SALARY SS, 
                       (SELECT DEPTNO, SUM(SAL + COMM) AS SAL1  --�μ��� ������, ����� ��! (�μ��� �ѱݾ��� ���Ѱ�)
                          FROM EMP E, SALARY S
                         WHERE S.SALMONTH = '202306'
                           AND S.EMPNO = E.EMPNO
                         GROUP BY DEPTNO
                        HAVING SUM(SAL + COMM) >= 20000) C
                 WHERE SS.SALMONTH = '202306'
                   AND A.EMPNO = SS.EMPNO
                   AND A.DEPTNO = C.DEPTNO) AA
        GROUP BY AA.DEPTNO )  B3,
        SALARY C1
WHERE A1.EMPNO = B2.EMPNO
  AND B2.SALMONTH = '202306'
  AND B2.SAL+B2.COMM = B3.KK
  AND A1.DEPTNO = B3.DEPTNO
  AND A1.DEPTNO = A2.DEPTNO
  AND C1.SALMONTH = '202305'
  AND C1.EMPNO = A1.EMPNO
  AND C1.SAL + C1.COMM <= B2.SAL + B2.COMM;  --B2  6��,   C1  5��
  
  
--����������  
SELECT A.EMPNO, ENAME, B.SAL, B.COMM, B.SAL +B.COMM
  FROM EMP A, SALARY B
 WHERE DEPTNO = 60  --�μ��ڵ� ���� ����
   AND SALMONTH = '202306'
   AND A.EMPNO = B.EMPNO;
   
   
--DDL�� Ȱ���� ���̺� ����
CREATE TABLE EMP_20230705 AS
SELECT * FROM EMP;
--�DB���ٴ� ���� DB���� ���Ǵ� �����
--��������� �ϳ��� ���簡 ���� ����( ��Ű������, �����ʹ� ���� ��������� ��������� ������� ����)
DROP TABLE EMP_20230705;

--���̺��� EMP_20230705�� �����ϰ�, �����ʹ� ���� �������̺��� ��� ������ ��ȸ�Ͽ� �����ϴ� DDL���� �ۼ�
CREATE TABLE EMP_20230705 AS
SELECT A.*   --���� �׳� �̷��� �ع�����... A.EMPNO, A.ENAME , A.JOB,A.MGR, A.HIREDATE, A.DEPTNO
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR;

--���̺��� EMP_20230705�� �����ϰ�, �����ʹ� �����������̺��� ��������� ��ȸ�Ͽ� �����ϴ� DDL�����ۼ�
--�÷��� EMP ��������� �μ����� �����Ͽ� ������
CREATE TABLE EMP_20230705 AS
SELECT DISTINCT A.* , D.DNAME
    FROM EMP A, EMP B, DEPT D
    WHERE A.EMPNO = B.MGR
    AND A.DEPTNO = D.DEPTNO;

--���嵵 ������ �ҷ���?
SELECT DISTINCT A.* , D.DNAME
    FROM EMP A, EMP B, DEPT D
    WHERE A.EMPNO = B.MGR  --�� ���⿡�� (+)���� �ȵǴ���? -> EQUI JOIN�� NULL�� ���� ���ʿ� ���ܸ� �ϰ� �����͸� ������ �񱳸� �ϱ� ������ (+)�Ұ� �������� �Ⱥٿ��� �� 
    AND A.DEPTNO = D.DEPTNO(+);

SELECT * FROM EMP_20230705;

TRUNCATE TABLE EMP_20230705; --DELETE FROM EMP_20230705�� ���� DELETE�� COMMIT �� �������

INSERT INTO EMP_20230705
SELECT * FROM EMP;

CREATE TABLE EMP_20230705 AS  --AS�� CREATE������ ���
SELECT * FROM EMP WHERE EMPNO = '3000';  --SELECT �ҋ� ���µ����͸� �������Բ� �Ϻη� �־���

--DELETE�� WHERE���� �����ָ� �� ���̺� ������ ��� ��������!!
DELETE FROM EMP_20230705;

COMMIT;

--���� �� ������ �ϱ��� ����, ����, ������ MGR�ڵ带 2001�� �ٲ㼭 ������ �������� �ٲ�
--����)EMP ���̺� ����(�������) ������ ��ȸ�Ͽ� EMP_20230705���̺� INSERT �ϴ� ����
INSERT INTO EMP_20230705 
SELECT *
    FROM EMP
    WHERE EMPNO NOT IN(SELECT DISTINCT A.EMPNO
                            FROM EMP A, EMP B
                            WHERE A.EMPNO = B.MGR);
--�ļ��� WHERE MGR != '1001' �� ��簡 �ƴѰŸ� �̷��� ����
--MINUS�� ����ΰ͸� ���ִ� ����� ����
--���� ���� ����� �ٸ� �������
INSERT INTO EMP_20230705
SELECT *
    FROM EMP
MINUS
SELECT A.*
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR;


--UPDATE
CREATE TABLE SALARY_202307 AS
SELECT * FROM SALARY WHERE EMPNO = '30000';

INSERT INTO SALARY_202307
SELECT '202307' ,EMPNO,SAL,COMM
FROM SALARY WHERE SALMONTH='202306';
COMMIT;

--����� ������ ����
SELECT * FROM SALARY_202307;

UPDATE SALARY_202307
    SET COMM = 50;
    
--�μ��ڵ尡60���� �����鿡 ���ؼ� ���� ���ʽ��� 50�� �߰��Ͽ� ����
SELECT * FROM EMP WHERE DEPTNO = '60';

UPDATE SALARY_202307
    SET COMM = COMM + 50
    WHERE SALMONTH = '202307'
    AND EMPNO = ANY(SELECT EMPNO
                        FROM EMP E
                        WHERE E.DEPTNO ='60');
                        
DELETE FROM SALARY_202307;

--����)��縦 ������ �Ϲݻ������ ���ʽ��� �������ʽ�+150 ���� �Ͽ� UPDATE���� �ۼ�
--������ ���� 4���� NULL�� ����
UPDATE SALARY_202307
    SET COMM = NULL
    WHERE COMM IN(0, 50);  --WHERE ���ǿ� NULLüũ�� �ݵ�� IS NULL�̶�� �ؾ���
    --���⼭WHERE COMM IN(NULL, 50)�̷��� �ϸ� �ȵ�!!
    --WHERE COMM IS NULL�� �ؾ���
COMMIT;

--��縦 ������ �Ϲݻ������ ���ʽ��� �������ʽ�+150 ���� �Ͽ� UPDATE���� �ۼ�
UPDATE SALARY_202307
    SET COMM = NVL(COMM, 0) + 150  --���� NULL�� ��� +150�� �� �� ���� ������ NULL�� ����0���� �ٲ��ְ� +150�� ������Ѵ�.
    WHERE EMPNO IN (SELECT EMPNO
                        FROM EMP
                        WHERE EMPNO NOT IN (SELECT DISTINCT A.EMPNO -- A.ENAME, A.JOB
                                                FROM EMP A, EMP B
                                                WHERE A.EMPNO = B.MGR));
--NVL(COMM, 0) �̰� �� ����ϼ�!!!!
--WHERE EMPNO =( SELECT 0
--���� �� �� �ִ� -> ������ ����� NULL�� ��� 
--���� ���� ���ϋ��ΰ��� ���������� �ߴٸ� �� �ٸ� ���������� �������� ���� �ƴҶ��� ��쵵 �־�����Ѵ�.

--****�߿�**UPDATE�� �ҷ��� �����Ͱ� ��� ��ġ�ؾ��ϹǷ� �������� ���̺��� �����Ͱ� ��Ȯ�� ��ġ�ؾ���
-->�׷��� �������� NULL�϶� �ΰͿ� ���Ѱ͸� ���ָ�ȵǰ� ���� NULL�϶��� NULL�� �ƴҶ� ��� ������ ������ϴ� ��!!

----��縦 ������ �Ϲݻ������ ���ʽ��� �������ʽ�+150 ���� �Ͽ� UPDATE���� �ۼ� -> NOT IN ���
UPDATE SALARY_202307
    SET COMM = NVL(COMM, 0) + 150  --���� NULL�� ��� +150�� �� �� ���� ������ NULL�� ����0���� �ٲ��ְ� +150�� ������Ѵ�.
    WHERE EMPNO NOT IN (SELECT DISTINCT A.EMPNO --���⿡ DISTINCT�� ���ִ°� ��������� �پ��� ������ �ٱ������� ���Ұ� �پ�� �ӵ��� ������!!
                            FROM EMP A, EMP B   --���� DISTINCT�� ���ִ°� ����!!
                            WHERE A.EMPNO = B.MGR);

--�̷��� �ϸ�NULL �ΰ� 150���� ��ȯ��
--�ؼ� : COMM�� ���̸� 150�� ��ȯ�Ѵ�
SELECT 150
    FROM SALARY_202307
    WHERE COMM IS NULL;

--�ؼ� : COMM�� ���̸� 0�� ��ȯ�Ѵ�
--������ �̰� UPDATE���� ������ NULL���ΰ� 0���� UPDATE�ȴ�.
SELECT 0
    FROM SALARY_202307
    WHERE COMM IS NULL;
 
 --�� �ڵ�� COMM �� NULL�̸� ���� �߻��� ->NULL�� ���ڴ� +�� �� �� ���  
SELECT COMM + 150
    FROM SALARY_202307
    WHERE COMM IS NULL;


ROLLBACK;

--�����ϰ� NULL�� ��ü�� ����ϴ� ���� �ڹٽ�ũ��Ʈ �ۿ� ����


--DELETE �� Ư�����ڵ� ��ü�� ���������Ǵ� ��

--���������� �̿��� DML - DELETE
--������ '�ѹ���'�� �μ��� ���ϴ� ������ ����
DELETE FROM EMP_20230705
    WHERE DEPTNO IN(SELECT DEPTNO
                        FROM DEPT
                        WHERE DNAME = '�ѹ���');
COMMIT;

--����)�μ����� �������� �ʴ� ������ ���� ���ڵ� ����
--EMP_20230705 ���̺� ����(���������� �̿��Ͽ� ����)
--������ ���� �Ϻη� ������
UPDATE EMP_20230705
    SET DEPTNO = NULL
    WHERE DEPTNO = '20';

SELECT EMPNO, DEPTNO
    FROM EMP_20230705
    WHERE DEPTNO NOT IN (SELECT DISTINCT D.DEPTNO
                        FROM DEPT D, EMP_20230705 E
                        WHERE D.DEPTNO = E.DEPTNO);
--�̹����� ������ �����ϵ��� �ǵ��� ���� : ���°��� ã�°� ���� �ִ°��� ã�°� ���϶��� �ִ�~~~
--�����ϴ� �͵��� ã�� ��ü���� ���� �������� �ʴ� �͵��� ã�� �� �����ϱ� �װ� DELETE�ϸ� ��

--1.MINUS ���
DELETE FROM EMP_20230705
    WHERE EMPNO IN (SELECT EMPNO    --�̰Ŵ� ��ü ������
                        FROM EMP_20230705
                    MINUS
                        SELECT E.EMPNO     --�μ��� �����ϴ� ������
                            FROM DEPT D, EMP_20230705 E
                            WHERE D.DEPTNO = E.DEPTNO);
--> ��, ��ü�����Ϳ��� �μ��� �����ϴ� �����͸� ���� �������� �ʴ� �����͸� ����
--�� ���µ����͸� DELETE������ ������

--���2 : �������� �̿�
DELETE FROM EMP_20230705
    WHERE EMPNO IN (SELECT EMPNO
                        FROM EMP_20230705
                        WHERE EMPNO NOT IN (SELECT EMPNO
                                                FROM EMP E, DEPT D
                                                WHERE E.DEPTNO = D.DEPTNO));
                                                
--��� 3
DELETE FROM EMP_20230705
        WHERE NOT EMPNO = ANY (SELECT EMPNO
                                FROM EMP E, DEPT D
                                WHERE E.DEPTNO = D.DEPTNO));


--����)�Ϲ�����(�������)�߿� �޿���(SAL)�� 5000�̸��� ������ �����ϴ� ����
--������EMP_20230705 ���̺�� �ϰ�, �޿������� SALARY ���̺� 6�� ����.
TRUNCATE TABLE EMP_20230705;
SELECT * FROM EMP_20230705;--TRUNCATE�Ѱ� ���� -> �ƹ��͵� �ȳ��;���

INSERT INTO EMP_20230705
SELECT * FROM EMP;
COMMIT; --��������� ������ ���� ������ ������ذ���

--ȥ���غ��� -> ����!
DELETE FROM EMP_20230705
    WHERE EMPNO IN(SELECT E.EMPNO --E.JOB, E.ENAME
                        FROM EMP_20230705 E, SALARY S
                        WHERE E.EMPNO = S.EMPNO
                        AND S.SALMONTH = '202306'
                        AND S.SAL <5000
                        AND E.EMPNO NOT IN (SELECT A.EMPNO
                                            FROM EMP_20230705 A, EMP_20230705 B
                                            WHERE A.EMPNO = B.MGR));

--����ڵ�
DELTE FROM EMP_20230705
    WHERE EMPNO IN(SELECT A.EMPNO
                    FROM EMP_20230705 A, SALARY S
                    WHERE A.EMPNO =B.EMPNO
                    AND B.SALMONTH = '202306'
                    AND B.SAL < 5000
                    AND A.EMPNO NOT IN(SELECT E1.EMPNO
                                        FROM EMP_20230705 E1, EMP_20230705 E2
                                        WHERE E1.EMPNO = E2.MGR));
                                        
--���2 : �߰� �������� ������ �Ƚᵵ �Ǵ� ���
DELTE FROM EMP_20230705
    WHERE EMPNO IN(SELECT A.EMPNO
                    FROM  SALARY A    --���⼭ EMP ���̺��� ���� �Ƚᵵ ��
                    WHERE A.SALMONTH = '202306'
                    AND A.SAL < 5000
                    AND A.EMPNO NOT IN(SELECT E1.EMPNO
                                        FROM EMP_20230705 E1, EMP_20230705 E2
                                        WHERE E1.EMPNO = E2.MGR)
                                        
  --���3
  DELETE FROM EMP_20230705
    WHERE EMPNO IN(SELECT A.EMPNO
                    FROM EMP_20230705 A, SALARY S --SALARY���� EMPNO�� �ֱ� ������ ������������ �������� �� �ʿ䰡 ����
                    WHERE A.EMPNO =B.EMPNO
                    AND B.SALMONTH = '202306'
                    AND B.SAL < 5000
                    AND A.MGR != B.EMPNO;
                                   
--��������
SELECT *
    FROM SALARY
    WHERE SALMONTH = '202306'
    AND SAL < 5000;
    
DROP TABLE EMP_20230705;
DROP TABLE SALARY_20230705;

