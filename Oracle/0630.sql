--��������
--1.������ ��������
--�� ������ �������� �ص� �ǰ� ���������� �ص� ��
SELECT *
    FROM EMP
    WHERE DEPTNO =(SELECT DEPTNO
                    FROM DEPT
                    WHERE DNAME = '������');
--WHERE DEPTNO =(SELECT DEPTNO �� ���� DEPT�� ���̺��� DNAE�� �������� DEPTNO�� �������µ�,
--�� ������ ��(��������)�� �ٱ������� DEPTNO�� ���� �����͸� �������


--���� ������ ���� �Ͽ� �������� ���� ������ �μ������� ��ȸ�ϴ� ����
--��ȸ�׸� : �����ȣ, �����, ����, �μ��ڵ�, �μ���(�����������)
SELECT E.EMPNO AS �����ȣ, E.ENAME AS �����, E.JOB AS ����, E.DEPTNO AS �μ��ڵ�, D.DNAME AS �μ���
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = (SELECT DEPTNO
                        FROM DEPT
                        WHERE DNAME = '������')
    AND E.DEPTNO = D.DEPTNO;
    
--������ �޿����� �������� ������ ������ ��ȸ�ϴ� �����ۼ�(��������)
--��ȸ�׸� : ������ȣ, ������, ����, �޿���, ���ʽ�
--��, �޿��� 2323�� 6�� �������� ���� �ۼ�
SELECT E.EMPNO AS ������ȣ, E.ENAME AS ������, E.JOB AS ����, S.SAL AS �޿���, S.COMM AS ���ʽ�
    FROM EMP E, SALARY S
    WHERE S.SAL= (SELECT MIN(SAL)        --������������ ������ ���� SAL�̱� ������ WHERE �������� SAL ���� ���ؾ��ϹǷ� S.SAL =SAL �� ����
                        FROM SALARY
                        WHERE S.SALMONTH = '202306') --���������� 1�Ǹ� ����!!!  ������������ ���� 1���� ���ϴ� ����
    AND E.EMPNO = S.EMPNO
    AND S.SALMONTH ='202306'; --���� �޾��ΰ��� 5���� 6������ ���� ���� �� �����Ƿ� 6�� �ΰ͸� ������ �������
                        
--�׷��Լ��� ������ SELECT ���� �;���!!!
--GROUP BY��  SELECT ���� �����Լ��� ���� �ٸ� �÷��� �� ���� �� ���!!


--���� : ���� ��S.SALMONTH = '202306'�� �ι� �־���ϴ��� �˱� ����
SELECT E.EMPNO AS ������ȣ, E.ENAME AS ������, E.JOB AS ����, S.SAL AS �޿���, S.COMM AS ���ʽ�
    FROM EMP E, SALARY S
    WHERE S.SAL= (SELECT MIN(SAL)        --������������ ������ ���� SAL�̱� ������ WHERE �������� SAL ���� ���ؾ��ϹǷ� S.SAL =SAL �� ����
                        FROM SALARY
                        WHERE SALMONTH = '202306') --���������� 1�Ǹ� ����!!!  ������������ ���� 1���� ���ϴ� ����
                        --�� �ȿ� S.SALMONTH�� �ϸ� �ȵ�!!! -> S.���ϸ� �������� �ٱ��� �ִ� ���̺��� �������� �ǹǷ� WHERE ���� ������� ����!!
                        --���� ���̺��̶�� �������� ����!! �������� �ȿ����� �����ϼ�!!
    AND E.EMPNO = S.EMPNO;
--�������� �ۿ����� SALMONTH = '202306'�� �ϴ� ����
-->�������� ���� WHERE�� �������� �ȿ����� ������ ����Ǵ� ����!! ������������ 202306�ΰ� �� MIN(SAL)�ΰ��� �����°ſ��ٰ�
--�������� ������ ���ͼ� �ѹ��� ���ǵ��� ������ �����
--���������� ����� 1���� WHERE���� �������� ���̴� ���� => ��, �׳� �ϳ��� ������ �Ǵ� �ͻ���


--����߿� �޿����� ���� ���� ������ ���� ��ȸ
--��ȸ�׸�(���) : ������ȣ, ������, ����, �޿���
--��, �޿��� 2023��, 6�� ����
--������������ ���������ؾ���
--������������ ��翡 �� �޿����� ���� ��ȸ
SELECT DISTINCT A.EMPNO AS ������ȣ, A.ENAME AS ������, A.JOB AS ����, S.SAL AS �޿���
    FROM EMP A, EMP B, SALARY S
    WHERE A.EMPNO = B.MGR   --�̰��� �ؾ� �Ѵ� ���� ����ڵ��� ���� �Ǵ� ��
    AND A.EMPNO = S.EMPNO  --A.EMPNO�� B.MGR�� ���밡��(�ΰ��� ���) ��, ������ A.EMPNO = B.MGR�� ����Ǿ��ٴ� ���� ������, A.EMPNO = B.MGR�� ���� ������ B.MGR =S.EMPNO������
    AND S.SALMONTH = '202306'
    AND S.SAL = (SELECT MAX(SAL)
                         FROM EMP E1, EMP E2, SALARY S1  --WHERE ���� E1.EMPNO = E2.MGR�� ���ٸ� FROM ������ EMP E1�� �����ص� �ȴ�.
                        WHERE E1.EMPNO = E2.MGR  --�̰� ��縦 ���ϱ� ���� SELF JOIN
                        AND E2.MGR = S1.EMPNO --E2.MGR��� E1.EMPNO �ص� �� : �Ѵ� ����̱� ���� ��, E1.EMPNO = E2.MGR�� ���� �Դٴ� �����Ͽ� ���� ���� �ȿ´ٸ� E2.MGR=S2.EMPNO�� �������
                       --������ E2.EMPNO =SQ.EMPNO�� �ȵ�!!
                       AND S1.SALMONTH = '202306');
--FROM���� ���̺��� �������� �������⸸ �ϴ°� �ƴ϶� ���νý������� ���ؼ� �ڵ����� 1 : N �ؼ� �����ع���
--EMP E1, EMP E2, SALARY S1 ���� �������� ��, E1 �� 1 ,E2�� 3, S1�� 5�� �ִٸ�  
--���� �������� ������ �ɾ����� ������ 1 * 3 * 5 �̷������� ���� ������ �Ǽ� ������ �Ǽ��� ��û ���� ������ ��
--�׷��� WHERE���� '=' ���� JOIN�� �ɾ��༭ � Ư���÷��� �����ؼ� ������ �� �ֵ��� ������Ѵ�.

--�� ���� ������ ���� �ֵ鲨�� �޿� 9800���� �ٲٰ� ������ȣ�� ������ 0���� ǥ�� �̷��� �غ���



--������ ��������
SELECT DISTINCT E.DEPTNO, D.DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO IN (SELECT DEPTNO
                        FROM DEPT
                        WHERE DEPTNO > '20');

    
--�μ��ڵ尡 20�� �̻� �ش��ϴ� �������� �ο����� ��ȸ ���� �ۼ� (�μ��ڵ� 20�� ����)
--��ȸ �׸� : �μ��ڵ�, �μ���, �ο���(������ �������� �̿�)
SELECT NVL(E.DEPTNO, ' '), D.DNAME, COUNT(E.DEPTNO)   --� Ư�� �÷��� �ְ� �����Լ��� ������ ������ GROUP BY,, �����Լ� ������ �׳� DISTINCT
    FROM DEPT D, EMP E
    WHERE D.DEPTNO = E.DEPTNO
    AND E.DEPTNO IN (SELECT DEPTNO
                        FROM DEPT
                        WHERE DEPTNO >= '20')
    GROUP BY NVL(E.DEPTNO, ' '), D.DNAME;
    

--�������!!! ���߼��������� WHERE ���� '=' �� �ƴ϶� IN ��!!!!!!

--����)���� ��������, OUTER JOIN
--���� ������ �������� �μ������� ��ȸ�ϴ� ���� �ۼ�
--��ȸ�׸� : �μ��ڵ�, �μ���, �ο���(�μ����ο���)
--��, �μ����� ���� ���� ' '(�������ڸ�)�� ó����
--ȥ���غ��� -> �����ѰŴ� ���� �������� �ǹ̰� �����Ф�
SELECT NVL(E.DEPTNO, ' '), NVL(D.DNAME, ' '), COUNT(*)
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO(+)  --OUTER JOIN
    AND E.DEPTNO IN (SELECT DEPTNO
                        FROM EMP
                        WHERE DEPTNO IS NOT NULL)  --�̰� ��� WHERE E.DEPTNO = D.DEPTNO(+)�ص� �Ȱ��� �����µ� �̰Ŵ� IS NOT NULL�� �ᱹ ���� ��??
    GROUP BY NVL(E.DEPTNO, ' '), NVL(D.DNAME, ' ');
  

--������ ������������ ����� �������ִ��Ŀ� ���� ����� �޶���
--EMP ���̺��� ������
--���� ������ ���������� EMP�� EMPNO �ΰͿ� ���߼��������� �ϴ� ���
--ȥ���غ���
SELECT NVL(E.DEPTNO, ' '), NVL(D.DNAME, ' '), COUNT(E.DEPTNO)
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO(+)
    AND E.EMPNO IN (SELECT A.EMPNO     --EMP, DEPT �����ؼ� ���������ȿ��� OUTER JOIN �������, DEPTNO IS NOT NULL�� �����ϼ�
                        FROM EMP A, DEPT B
                        WHERE A.DEPTNO = B.DEPTNO(+)
                        AND A.DEPTNO IS NOT NULL) --���� �̰Ÿ� ���Ծ���
    GROUP BY E.DEPTNO, D.DNAME;


--����ڵ�
SELECT A.DEPTNO AS �μ��ڵ�, NVL(B.DNAME, ' ') AS �μ���, COUNT(A.DEPTNO) AS �ο���
    FROM EMP A, DEPT B
    WHERE A.EMPNO IN(SELECT EMPNO
                        FROM EMP E, DEPT D
                        WHERE E.DEPTNO IS NOT NULL
                        AND E.DEPTNO = D.DEPTNO(+))
    AND A.DEPTNO = B.DEPTNO(+)
    GROUP BY A.DEPTNO , NVL(B.DNAME, ' ');


--���������� �������� �μ������� �μ��� �޿��Ѿװ� ���ʽ� �Ѿ��� ��ȸ�ϴ� �����ۼ�
--��ȸ�׸� : �μ��ڵ�, �μ���, �޿��Ѿ�, ���ʽ��Ѿ�
--��, �μ����� ���� ���� ' '(�������ڸ�)�� ó����. (���߼������� ���)
--�޿��Ѿװ� ���ʽ��Ѿ��� NULL�϶� 0���� ó��
--2023�� 6�� ����
--WHERE A.EMPNO IN() ���� �ϼ�
SELECT A.DEPTNO AS �μ��ڵ�, NVL(B.DNAME, ' ') AS, NVL(SUM(S.SAL), 0), NVL(SUM(S.COMM), 0)
    FROM EMP A, DEPT B, SALARY S
    WHERE A.DEPTNO = B.DEPTNO(+)
    AND A.EMPNO = S.EMPNO(+)    --���⼭ S�� OUTER JOIN�ɾ��� ������ �� �ڵ� �����γ����� S ���� ��� (+) �ɾ������
    AND S.SALMONTH(+) = '202306'  --���⿡ OUTER JOIN�Ȱɸ� ����ũ�� �ȳ���!!
    AND A.EMPNO IN (SELECT E.EMPNO
                        FROM EMP E, DEPT D
                        WHERE E.DEPTNO = D.DEPTNO(+)
                        AND E.DEPTNO IS NOT NULL)
    GROUP BY A.DEPTNO, NVL(B.DNAME, ' ');
--NVL(SUM(S.SAL), ' ')���� SUM(S.SAL)�� �����ε� ������' '�� �ٲٷ��� �ϸ� ������!!! ���ڴϱ� NVL(SUM(S.SAL), 0)ó�� ���ڴ� 0���� �������!!!

--����ڵ�
SELECT A.DEPTNO AS �μ��ڵ�, NVL(B.DNAME, ' ') AS �μ���, 
       NVL(SUM(S.SAL), 0) AS �޿��Ѿ�, NVL(SUM(S.COMM), 0) AS ���ʽ��Ѿ�
  FROM EMP A, DEPT B, SALARY S
 WHERE A.EMPNO IN (--EMP, DEPT �����ؼ� ó��:DEPTNO IS NOT NULL
                   SELECT EMPNO
                     FROM EMP E, DEPT D
                    WHERE E.DEPTNO IS NOT NULL
                      AND E.DEPTNO = D.DEPTNO(+)
                   )
   AND A.DEPTNO = B.DEPTNO(+)
   AND S.EMPNO(+) = A.EMPNO
   AND S.SALMONTH(+) = '202306'
 GROUP BY A.DEPTNO, NVL(B.DNAME, ' ');

                
--�� ������ EQUI JOIN���ε� �غ���

--�� ������ �μ����� ����ߴµ�, �����κ��� ��µǰ��غ���
SELECT A.DEPTNO, A.ENAME, B.DNAME, NVL(SUM(S.SAL), 0), NVL(SUM(S.COMM), 0)
    FROM EMP A, DEPT B, SALARY S
    WHERE S.SALMONTH = '202306' 
   AND S.EMPNO = A.EMPNO
    AND A.DEPTNO = B.DEPTNO
    AND A.EMPNO IN (SELECT E.EMPNO
                        FROM EMP E, DEPT D
                        WHERE E.DEPTNO = D.DEPTNO)
    GROUP BY A.DEPTNO,A.ENAME, B.DNAME;
--A.ENAME �̰� �ϳ��� ����� �޶����µ� ��?
--> A.ENAME�÷��� SELECT ������ ���������Ƿ� ��¿ �� ���� ����ؾ��ϴϱ�? DEPTNO�� ���ٸ� DNAME, SUM(S.SAL),SUM(S.COMM)�� ��¥�� ���� ���̴ϱ� �״�� �־��ָ� �Ǽ� ���� ����?
--A.ENAME�� ������ ������ ���� ��� ������
--A.ENAME�� ������ �μ����θ� ������ ��µ�
--���� DEPTNO 10���� ���� ����� 3���̸� 3���� 1���Ը� ��ǥ�� SUM(S.SAL),SUM(S.COMM)�� ��µǰ� �ٸ� ����� �Ŵ� �������� ��µǰ� �� ���� �ֳ�?



SELECT *   
    FROM DEPT D, EMP E, SALARYS
--�̷��� *�� �ϸ� DEPT���̺� �մ� �÷� ������� ��µ�   

--OUTER JOIN , INNER����, ��������, ���߼������� ����� ������!!!


--������ �μ������� ��ȸ�ϴ� ������ ���� ���������� �̿��Ͽ� ���� �ۼ�
--��ȸ�׸�(���) : ������ȣ, ������, ����, �μ��ڵ�, �μ���
--��, ����� �޿��� 8500(����)�̻��� ��縸 ��ȸ
--WHERE DEPTNO IN()  ���� �ϱ�
--�� ������ OUTER JOIN ����!!
--0630�� ȥ�� Ǭ��(���� ���������� ������� �־���ϴ��� �ľ��� ����)
SELECT E.EMPNO AS ������ȣ, E.ENAME AS ������, E.JOB AS ����, NVL(D.DEPTNO, ' ') AS �μ��ڵ�, NVL(D.DNAME, ' ') AS �μ���
    FROM EMP E , DEPT D, SALARY S
    WHERE E.DEPTNO = D.DEPTNO(+)
    AND S.EMPNO(+) = E.EMPNO
    AND S.SALMONTH(+) = '202306'
    AND S.SAL > 8500
    AND A.DEPTNO IN (SELECT E.DEPTNO
                        FROM EMP A, EMP B, DEPT C 
                        WHERE A.EMPNO = B.MGR
                        AND A.DEPTNO = C.DEPTNO);
                
--����� -> SELF JOIN
--ȥ�� Ǯ���
SELECT DISTINCT A.EMPNO, A.ENAME, A.JOB, A.DEPTNO, D.DNAME, S.SAL 
    FROM EMP A, EMP B, DEPT D, SALARY S
    WHERE A.EMPNO = B.MGR
    AND A.DEPTNO = D.DEPTNO
    AND S.EMPNO = A.EMPNO
    AND S.SAL > 8500
    AND S.SALMONTH = '202306'
    AND A.EMPNO IN(SELECT E1.EMPNO
                        FROM EMP E1, EMP E2 ,SALARY S1
                        WHERE E1.EMPNO = E2.MGR
                        AND E1.EMPNO = S1.EMPNO
                        AND S1.SAL > 8500);
--S.SALMONTH = '202306'�� �����ָ� 5���� 6���� ��� ���ͼ� �� 4���� ��µ�