--�ζ��κ� �� �ٸ����̺�� ������ �� ����� �÷���
--select ���� �;���??

--����)�޿����� 6500�̻��̸鼭 20230101 ���� �Ի����� ������ ������ �����鸸 ��ȸ�ϴ� ����
--��ȸ�׸� : ������ȣ, ������, ����, �޿���, �Ի���(YYYY-MM-DD)
SELECT E.EMPNO, E.ENAME, E.JOB, S.SAL, TO_CHAR(E.HIREDATE, 'YYYY-MM-DD')
  FROM EMP E, SALARY S
 WHERE S.SALMONTH = '202306'
   AND S.EMPNO = E.EMPNO
   AND S.SAL >= 6500
   AND E.HIREDATE < TO_DATE('20230101','YYYYMMDD')
MINUS
SELECT DISTINCT A.EMPNO, A.ENAME, A.JOB, C.SAL, TO_CHAR(A.HIREDATE, 'YYYY-MM-DD')
  FROM EMP A, EMP B, SALARY C 
 WHERE A.EMPNO = B.MGR
   AND A.EMPNO = C.EMPNO
   AND C.SALMONTH = '202306'; 
   
   
--���� ������ �ζ��κ��
--ȥ���غ���..Ʋ���¤�
--�ζ��κ信 SALARY JOIN�� ���� �ʿ� ����
SELECT EE.EMPNO, EE.ENAME, EE.JOB, S.SAL, TO_CHAR(EE.HIREDATE, 'YYYY-MM-DD')
    FROM  SALARY S
        ,(SELECT E1.EMPNO
                FROM EMP E1, SALARY S1
                WHERE S1.EMPNO = E1.EMPNO
                AND S1.SAL  >= 6500
                AND S1.SALMONTH = '202306'
                AND E1.HIREDATE < '20230101'
                MINUS
                SELECT A.EMPNO
                FROM EMP A, EMP B, SALARY S2
                WHERE A.EMPNO = B.MGR
                AND S2.EMPNO = A.EMPNO
                AND S2.SAL  >= 6500
                AND S2.SALMONTH = '202306'
                AND A.HIREDATE < '20230101') EE
    WHERE S.EMPNO = EE.EMPNO;
   
--������ ����� ������ ���� �������� �ʰ� �����ͽ��� �ؼ� ���ܳ��´�

--����ڵ�
SELECT C1.EMPNO, C1.ENAME, C1.JOB, S1.SAL, C1.HIREDATE  --�������� �ȿ��� TO_CHAR�� ����� ������ �ۿ��� �����൵ �ȴ�
    FROM SALARY S1,
        (SELECT E.EMPNO, E.ENAME AS ENAME, E.JOB AS JOB, TO_CHAR(E.HIREDATE, 'YYYY-MM-DD') AS HIREDATE
                  FROM EMP E
                 WHERE  E.HIREDATE < TO_DATE('20230101','YYYYMMDD')
                MINUS
                SELECT DISTINCT A.EMPNO, A.ENAME AS ENAME, A.JOB AS JOB, TO_CHAR(A.HIREDATE, 'YYYY-MM-DD') AS HIREDATE
                  FROM EMP A, EMP B
                 WHERE A.EMPNO = B.MGR) C1
    WHERE S1.SALMONTH = '202306'
    AND S1.EMPNO = C1.EMPNO
    AND S1.SAL >= 6500;
--�ζ��κ信�� �����Ұ�!
--> ��Ī�� ���� ���ִ� ���� �ƴ�!!
--�ζ��κ��� SELECT �� Į���鿡 ��Ī�� �־��ٸ� ���� SELECT ������ ��Ī �״�θ� ������ϰ�
--���� ��Ī�� ���ٸ� �ζ��κ��� SELECT�� Į������ �״�� ������Ѵ�!!!!
--��� �����Ҷ��� ����� ���̺�
--��� ���̺��̱� ���ÿ� �츮�� ������ �ۼ��� �� SELECT ���� ���̺� Į���� ������
--���� �÷����� ������ �ٱ� ������ SELECT ���� �ζ��κ��� Į���� ������Ѵ�
--�ζ��κ信�� ��Ī�� ���� ������ TO_CHAR(E.HIREDATE, 'YYYY-MM-DD')��쿡��
--E.HIREDATE�� TO_CHAR�� ��ȯ(����)�ع��ȱ� ������ �ٱ������� SELECT ������ TO_CHAR(E.HIREDATE, 'YYYY-MM-DD')��� �״�� ��ߵǰ� �ȴ�
--������ AS HIREDATE�� ��Ī�� �ָ� �ζ��κ��.��Ī ������ C1.HIREDATE�� ���� �ִ�
--�ڹٿ��� �о�Ë� ��Ī�� ����� �ű� ������ Į���� �� ��Ī�� �ٿ�����Ѵ�
--��, ��Ī�� DB�� ������ ������ �������� �÷����� ��



--����) ������ ������ ALL
--����߿��� ���ʽ��� 800�̻� �޴� ��縸 ��ȸ�ϴ� ���� �ۼ�
--��ȸ�׸� : ������ȣ, ������, ����
--ALL -> ���������� ������ ����� ��� ���� �����͸� ������
SELECT EMPNO, ENAME, JOB
    FROM EMP
    WHERE EMPNO IN(SELECT A1.EMPNO
                    FROM EMP A1, EMP B1, SALARY S1
                    WHERE A1.EMPNO =B1.MGR
                    AND A1.EMPNO = S1.EMPNO
                    AND S1.COMM >= ALL(SELECT DISTINCT S.COMM    --��������� 950�� ���ų� ū�Ű� ����
                                        FROM SALARY S, EMP A, EMP B
                                        WHERE S.COMM >= 800
                                        AND A.EMPNO  = B.MGR
                                        AND S.EMPNO = A.EMPNO
                                        AND S.SALMONTH = '202306'));

-- >=ALL�� �ϸ� 800 AND 850 AND 950 �� �Ǽ� ���������� 950���� ũ�� �� ��
--������  >�� ���ְ� =�� �ϸ� �÷��ϳ��� ���ؼ� �������� ���ԵǼ� ���ϰ� �Ǳ� ������ ���� �ȵǼ� �ƹ��͵� ��¾ȵ�

--ALL�� ANY�� �����Ƿ� �� �������� �Ǵ� ��

--�������� ALL�� ANY�� �ٲٸ� ������ ����
--ANY�� OR����, ALL�� AND ����

--����ڵ�
SELECT E.EMPNO, E.ENAME, E.JOB
    FROM EMP E
    WHERE E.EMPNO IN(SELECT DISTINCT A1.EMPNO
                    FROM EMP A1, EMP B1, SALARY S1
                    WHERE A1.EMPNO =B1.MGR
                    AND A1.EMPNO = S1.EMPNO
                    AND S1.SALLMONTH = '202306'
                    AND S1.COMM >=ALL(SELECT DISTINCT S.COMM    --��������� 950�� ���ų� ū�Ű� ����
                                        FROM SALARY S, EMP A, EMP B
                                        WHERE S.COMM >= 800
                                        AND A.EMPNO  = B.MGR
                                        AND S.EMPNO = A.EMPNO
                                        AND S.SALMONTH = '202306'));


--MGR�� �������ξ��ϰ� ��籸�ϱ�
SELECT E.EMPNO, E.ENAME, E.JOB
    FROM EMP E
    WHERE E.EMPNO IN(SELECT A1.EMPNO
                    FROM EMP A1, EMP B1, SALARY S1
                    WHERE A1.EMPNO =B1.MGR
                    AND A1.EMPNO = S1.EMPNO
                    AND S1.SALMONTH = '202306'
                    AND S1.COMM >=ALL(SELECT DISTINCT S.COMM    --DISTINCT�� ����� ������ ����
                                        FROM SALARY S, EMP A  
                                        WHERE S.COMM >= 800
                                        AND S.EMPNO =A.MGR   --���⼭ �������� ���ϰ� MGR�� �ٷ� ����ڵ带 �־ ���ã��
                                        AND S.SALMONTH = '202306'));

--ó�� ������ ���� FROM, WHERE���� ���� -> ERD���� PK,FK ����Ȯ�� -> �ٽ� FROM,WHERE�� �м��ϼ�


--����)�λ����� 6�� �޿��� �����ڵ带 ��ȸ�ϴ� �����ۼ�
--��, ���������θ� �����(WHERE�������� ���)
--�λ����� �μ��ڵ�� �𸣹Ƿ� �λ��������� �˻�
--��ȸ �׸� : �����ȣ, �޿���
--���������ȿ� ���������� �� �� �� �ִ�.
SELECT S2.EMPNO, S2.SAL
    FROM  SALARY S2  --SALARY���� EMPNO�� �ֱ⋚���� ���� �ٱ��������� EMP ���̺��� �� �ʿ䰡 ����
    WHERE S2.EMPNO IN (SELECT E.EMPNO 
                    FROM EMP E, DEPT D1
                    WHERE E.DEPTNO = D1.DEPTNO
                    AND E.DEPTNO IN (SELECT D.DEPTNO  --ANY�� �ص� �ǰ� IN���� �ص���(�Ѱ��̱⶧����)
                                         FROM DEPT D
                                        WHERE D.DNAME = '�λ���'))
    AND S2.SALMONTH = '202306';

--����ڵ�
SELECT EMPNO, SAL
    FROM  SALARY 
    WHERE SALMONTH = '202306'
    AND EMPNO  IN (SELECT EMPNO 
                        FROM EMP 
                        WHERE DEPTNO IN (SELECT DEPTNO
                                         FROM DEPT 
                                         WHERE DNAME = '�λ���'))

--ALL, ANY ����� �ٸ��ڵ�
SELECT EMPNO, SAL
    FROM  SALARY 
    WHERE SALMONTH = '202306'
    AND EMPNO  IN (SELECT EMPNO 
                        FROM EMP 
                        WHERE DEPTNO IN (SELECT DEPTNO --IN ��� ANY�� �ᵵ ������,  ALL�� �ȵ�!!
                                         FROM DEPT 
                                         WHERE DNAME = '�λ���'));

--�� ������ �ζ��κ�������
--�λ����� 6�� �޿��� �����ڵ带 ��ȸ�ϴ� �����ۼ�
SELECT DISTINCT S.EMPNO, S.SAL
    FROM SALARY S
        ,(SELECT  E.EMPNO
            FROM DEPT D, SALARY S1, EMP E
            WHERE S1.SALMONTH = '202306'
            AND E.DEPTNO = D.DEPTNO
            AND S1.EMPNO = E.EMPNO
            AND D.DNAME = '�λ���') EE
    WHERE S.SALMONTH = '202306'
    AND S.EMPNO = EE.EMPNO;

--����ڵ�
SELECT S.EMPNO, S.SAL
    FROM  SALARY S
        ,(SELECT EMPNO 
                FROM EMP 
                WHERE DEPTNO = (SELECT DEPTNO 
                                     FROM DEPT 
                                     WHERE DNAME = '�λ���')) A
    WHERE S.EMPNO = A.EMPNO
    AND S.SALMONTH = '202306';


--����)�λ����� 6�� �ְ� �޿����� �����ڵ�� �޿��� ��ȸ�ϴ� �����ۼ�
--��, ���������θ� �����(WHERE ������)( ���������θ���� = JOIN������� ����)
--��ȸ�׸� : ������ȣ, �޿���
--�λ��� �ڵ�� �� �� ����
--ó������ ��
SELECT EMPNO, SAL
    FROM SALARY   
    WHERE  SAL =(SELECT  MAX(SAL)
                FROM SALARY
                WHERE SALMONTH = '202306'
                AND EMPNO IN (SELECT EMPNO
                                    FROM EMP
                                    WHERE DEPTNO IN (SELECT DEPTNO
                                                        FROM DEPT 
                                                        WHERE DNAME = '�λ���')));

--�ٽ� �����غ��� ��
SELECT EMPNO, SAL
    FROM SALARY
    WHERE EMPNO IN (SELECT EMPNO
                        FROM EMP
                        WHERE DEPTNO IN (SELECT DEPTNO
                                            FROM DEPT 
                                            WHERE DNAME = '�λ���'))
    AND SAL =(SELECT MAX(SAL)
                FROM SALARY
                WHERE SALMONTH = '202306'
                AND EMPNO IN (SELECT EMPNO
                                FROM EMP
                                WHERE DEPTNO IN (SELECT DEPTNO
                                                    FROM DEPT 
                                                    WHERE DNAME = '�λ���')));
                
--����ڵ�
SELECT EMPNO, SAL
    FROM SALARY
    WHERE SALMONTH = '202306'
    AND SAL IN (SELECT MAX(SAL)
                FROM SALARY
                WHERE SALMONTH = '202306'
                AND EMPNO IN (SELECT EMPNO
                                FROM EMP
                                WHERE DEPTNO = (SELECT DEPTNO
                                                FROM DEPT
                                                WHERE DNAME = '�λ���')))
    AND EMPNO IN(SELECT EMPNO
                    FROM EMP
                    WHERE DEPTNO = (SELECT DEPTNO
                                    FROM DEPT
                                    WHERE DNAME = '�λ���'));

--�������� ������ ����
--FROM���� �������� �����ϱ�
--SELECT ���� ���������� �ƹ����� �� �� ����
SELECT EMPNO, (SELECT ENAME FROM EMP WHERE EMPNO = S.EMPNO) AS ������,SAL  --SELECT����  FROM�� �ϰ� �׿� ���� ������ WHERE�� �����ϰ� �ɷ��������͵� �߿���
    FROM SALARY S   --SELECT ���� �������� �ű� ������ SELECT �� �� �������� ����ȴ�.
    WHERE SALMONTH = '202306'  --�׷��� (SELECT ENAME FROM EMP WHERE EMPNO = S.EMPNO)ó�� S.EMPNO�� �ؿ����� FROM �� ���̺��� ��Ī S�� ���� �ִ°�
    AND SAL IN (SELECT MAX(SAL)
                FROM SALARY
                WHERE SALMONTH = '202306'
                AND EMPNO IN (SELECT EMPNO
                                FROM EMP
                                WHERE DEPTNO = (SELECT DEPTNO
                                                FROM DEPT
                                                WHERE DNAME = '�λ���')))
    AND EMPNO IN(SELECT EMPNO
                    FROM EMP
                    WHERE DEPTNO = (SELECT DEPTNO
                                    FROM DEPT
                                    WHERE DNAME = '�λ���'));

--�μ��� 6�� �ѱ޿�(�޿�+���ʽ�)�� 25000�̻��� ���� ��ȸ�ϰ�, ��ȸ�� �μ��� ���ϴ� �������� ������ ��ȸ�ϴ� ���� �ۼ�
--��ȸ�׸� : ������ȣ, �μ��ڵ�, �ѱ޿���(SAL + COMM)
--�� ��ȸ�� �� �޿����� ���� ������ ������
--ȥ���غ���
SELECT E.EMPNO AS ������ȣ, E.DEPTNO AS �μ��ڵ�, (S.SAL + S.COMM) AS �ѱ޿���
    FROM E.EMP, S.SALARY
    WHERE E.EMPNO IN(SELECT EE.EMPNO
                        FROM DEPT D, SALARY S1, EMP EE
                        WHERE SUM(S1.SAL + S1.COMM) >= 25000
                        AND EE.DEPTNO = D.DEPTNO
                        AND S1.EMPNO = EE.EMPNO
                        AND S1.SALMONTH = '202306')
    AND E.EMPNO = S.EMPNO
    AND S.SALMONTH = '202306'
    AND (S.SAL + S.COMM) >= 25000
    OREDER BY (S.SAL + S.COMM) DESC;
    
--����ڵ�
--�μ����̶�� �߱� ������ GROUB BY�� ������
--WHERE���� SUM(SAL + COMM) >= 25000�� �ϸ� ������ ���� SUM(SAL + COMM) >= 25000�� ���ϴ� ���̰�
--HAVING ���� SUM(SAL + COMM) >= 25000�� �ϸ� GROUP BY�� ���� �Ϳ� ���� ������ �������ִ� �ű� ������
--GROUP BYFH �μ������� ������ �߿���  SUM(SAL + COMM) >= 25000 �� ����Ǵ� ���̴�
--�ζ��κ並 �����
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
    AND B.SALMONTH = '202306';

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
            HAVING SUM(SAL + COMM) >= 20000) C
    WHERE A.DEPTNO = C.DEPTNO
    AND A.EMPNO = B.EMPNO
    AND B.SALMONTH = '202306'
    AND SUM(B.SAL + B.COMM) >(SELECT SUM(S1.SAL + S1.COMM)
                                FROM SALARY S1 , EMP EE
                                WHERE S1.SALMONTH = '202305'
                                AND S1.EMPNO = EE.EMPNO);
    
    