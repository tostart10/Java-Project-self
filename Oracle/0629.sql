--����)������ �޿��� 5000�̻��̰� ���ʽ��� 500�̻��� ������ ���� �μ����� ��ȸ�ϴ� ���� �ۼ�(��, �޿��� 2023�� 6�� ����)
--��ȸ�׸� : ������ȣ, ������, �̹��� �޿�(�޿�+���ʽ�), �μ��ڵ�, �μ���
SELECT E.EMPNO AS ������ȣ, E.ENAME AS ������, S.SAL+ S.COMM AS "�̹��� �޿�" , D.DEPTNO AS �μ��ڵ�,D.DNAME �μ���
    FROM EMP E, DEPT D, SALARY S
    WHERE E.DEPTNO = D.DEPTNO
    AND S.EMPNO = E.EMPNO
    AND S.SALMONTH = '202306'
    AND S.SAL >= 5000
    and s.comm >=500;
--�����Լ��� ���� group by�� ���� ����

--���� ���� ����� INNER JOIN����
SELECT E.EMPNO AS ������ȣ, E.ENAME AS ������, (S.SAL + S.COMM) AS "�̹��� �޿�"
    FROM EMP E INNER JOIN SALARY S
    ON E.EMPNO = S.EMPNO  --INNER JOIN�� �ִ� �Ÿ� ����� , INNER ���ο� 3���� ���̺��� ������ ON ���� �ش��ϴ� Ű�� �;���(����Ű)
    --ON������ �տ��ִ� ���̺�EMP�� �ڿ����� SALARY���̺� �ִ� Ű�� �;���!
   -- AND E.EMPNO = S.EMPNO --�տ��ִ� EMP ���̺�� �ڿ� �ִ� ���̺��� Ű�� ���ձ�� ON�� ������ AND�� �´�
    WHERE S.SALMONTH = '202306'
    AND S.SAL >= 5000
    AND S.COMM >= 500;

--�μ��ڵ�, �μ��� �߰�(INNER JOIN ���)
--ȥ���غ���
SELECT E.EMPNO AS ������ȣ, E.ENAME AS ������, S.SAL+ S.COMM AS "�̹��� �޿�" , E.DEPTNO AS �μ��ڵ�,D.DNAME �μ���
    FROM EMP E INNER JOIN SALARY S
    ON E.EMPNO = S.EMPNO
    INNER JOIN DEPT D 
    ON E.DEPTNO = D.DEPTNO
    WHERE S.SALMONTH = '202306'
    AND S.SAL >= 5000
    AND S.COMM >=500;

--����ڵ�
SELECT E.EMPNO AS ������ȣ, E.ENAME AS ������, S.SAL+ S.COMM AS "�̹��� �޿�" , E.DEPTNO AS �μ��ڵ�,D.DNAME �μ���
    FROM EMP E INNER JOIN SALARY S
    ON E.EMPNO = S.EMPNO
    INNER JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    AND S.SALMONTH = '202306'
    AND S.SAL >= 5000
    AND S.COMM >=500;
    
--SELF JOIN (���� ���̺��ϳ��� ��Ī�� ������ �ּ� ��ġ �ٸ� �������̺��� ����ϴ� ��ó�� �ϴ� ��)( ���̺��ϳ��� PK FK�� ���� �ִ� ��)
SELECT DISTINCT A.EMPNO, A.ENAME, A.JOB, B.EMPNO, B.ENAME, B.JOB
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR;

--SELF JOIN
--������ ������ ����(����� ����)�� ��ȸ�ϴ� ���� �ۼ�
--��ȸ�׸�(������) : ������ȣ, ������, ���� : ��, �ߺ�����(������ �����̱� ������ �ߺ����Ÿ� �ؾ��ϴ°���, �Ϲ� ������ ���������� �ߺ����� �� �ʿ䰡 ����)
--���� ������ ��ȸ�׸�(����) -> ���� �������� �ϴ°ſ����� ����� �޶���
--B(�Ϲ�����)�� �� �ٸ� �����ͱ� ������ �ߺ����� �� �ʿ䰡 ����
--B�� ���������� INNER JOIN�̶�� �����ص���
SELECT DISTINCT A.EMPNO AS ������ȣ, A.ENAME AS ������, A.JOB AS ����
    FROM EMP A, EMP B
    WHERE A.EMPNO =B.MGR;
--A�� �������� ���� �� 1001�� ����� EMPNO�̿��� ��簡 ��µ�
--B�� �������� ���� �� 1001�� �ش� ������ ����� �ڵ忩�� �ڵ尡 1001�� ��縦 �� ������ ��µȴ�
    
    
--������ ������ ������ ��ȸ�ϴ� �����ۼ�
--��ȸ�׸�(������) : ������ȣ, ������, ����, ������ (��, �ߺ�����)
SELECT A.EMPNO AS ������ȣ, A.ENAME AS ������, A.JOB AS ����, COUNT(A.EMPNO) AS ������ 
    FROM EMP A, EMP B 
    WHERE A.EMPNO = B.MGR
    group by A.EMPNO, A.ENAME, A.JOB;
--�����Լ��� �´�?-> ������ GROUP BY
--GROUP BY�� ��������(SELECT��) �÷��� �����Ϳ� ���� GROUP BY�� ���ִ� ���̹Ƿ� SELECT �������� �����Լ��� ������ ��� Į���� GROUP BY�� ������Ѵ�.
--GROUP BY �ϸ� �ߺ����Ÿ� �ڵ����� ���ֹǷ� DISTINCT �����൵ ��
--A.EMPNO, A.ENAME, A.JOB �� �ߺ����� ���ش����� COUNT()�� ���°ſ��� GROUP BY�� 3�� �ٽ������
--������(���)�� ���忡���� �����͸� �����;��ϱ� ������ A.~~�� �������

--�������� 2���� ���� ���常 ��ȸ
SELECT A.EMPNO, A.ENAME , A.JOB, COUNT(A.EMPNO)  --������ ���ڵ� �Ǽ��� ���� �ű� ������ COUNT(B.MGR)�� COUNT(B.EMPNO) �� �ص���
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR 
    GROUP BY A.EMPNO, A.ENAME , A.JOB
    HAVING COUNT(A.EMPNO) >2;

SELECT A.EMPNO, A.ENAME , A.JOB, COUNT(A.EMPNO) , LISTAGG(B.ENAME, ', ')
    WITHIN GROUP(ORDER BY B.ENAME) AS ������
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR 
    GROUP BY A.EMPNO, A.ENAME , A.JOB;


 --ȥ�� �м�
 --A�� ����
 SELECT A.EMPNO, A.ENAME , A.JOB, COUNT(A.EMPNO)
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR 
    GROUP BY A.EMPNO, A.ENAME , A.JOB;   

--B�� ����(������ ����)���� ���� ���� ���
SELECT  B.MGR, B.ENAME , B.JOB, B.EMPNO,COUNT(B.MGR) 
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR 
    GROUP BY B.EMPNO, B.ENAME , B.JOB, B.MGR ;
    
--OUTER JOIN
INSERT INTO EMP VALUES('2001', '����', '����', '1001', TO_DATE('2020-06-14','YYYY-MM-DD'),'70'); --�� �ڵ�� DEPTNO�� ���� �����̿��� ������!


ROLLBACK;

--�������� Ȯ��
SELECT * FROM ALL_CONSTRAINTS WHERE OWNER = 'C##SISTUSER';

--�������� ��Ȱ��ȭ
ALTER TABLE EMP DISABLE CONSTRAINTS FK_DEPTNO;
ALTER TABLE EMP DISABLE CONSTRAINTS FK_MGR;

--Ű�� �׿��� �����͸� ����??

--�������� Ȱ��ȭ
ALTER TABLE EMP ENABLE CONSTRAINTS FK_DEPTNO;

INSERT INTO EMP
VALUES('2002', '����', '�븮', '2001', TO_DATE('2021-03-14','YYYY-MM-DD'),'71');

INSERT INTO EMP
VALUES('2003', '����', '���', '2001', TO_DATE('2021-11-10','YYYY-MM-DD'),'72');

INSERT INTO EMP
VALUES('2004', '����', '���', '2001', SYSDATE ,'73');

COMMIT;

--OUTER JOIN
SELECT E.EMPNO, E.ENAME, E.DEPTNO, NVL(D.DNAME, ' ')
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO(+);
    --�������� �ִ� �ʿ� (+)�� ���δ�
    --E���̺��� �ְ� D���̺��� ���� �����͵� ����ϰ� ���� ��
    --NVL(D.DNAME, ' ') �� ���� �����Ͱ� NULL�� �����°� �����ϱ� NULL ��� ������ �������� NVL()�� �Ἥ �ٲ��ش�.


UPDATE EMP
    SET MGR = '2000'
    WHERE MGR = '2001';
    
COMMIT;

--OUTER JOIN(SELF JOIN�� ���� ���Ḧ �ؾ� Ǯ ������)
--������ ������ ������ ��ȸ�ϴ� �����ۼ�
--��ȸ�׸�(������) : ������ȣ, ������, ����, �Ի���(YYYY.MM.DD)
--��, ������ ������ ���� ���� ������ȣ�� B.MGR ���� ó����(�ߺ�����)
--������ȣ�� ������ �÷��� NULL�� ��� �������� ó��
SELECT DISTINCT NVL(A.EMPNO, B.MGR) AS ������ȣ, NVL(A.ENAME, ' ') AS ������, 
      NVL(A.JOB, ' ') AS ����, NVL(TO_CHAR(A.HIREDATE, 'YYYY.MM.DD'), ' ') AS �Ի���
    FROM EMP A, EMP B
    WHERE A.EMPNO(+) = B.MGR
    AND B.MGR IS NOT NULL;  --���⼭ != �̰� �ϸ� ���� �ȵ�!!! IS NOT NULL�� �ؾ���
    --EMPNO�� �������� �ʴµ� MGR���� �����ϴ� 2000���� �����Ƿ� EMPNO�� (+)�� �ٿ��� ��
    --A���� ���µ� B���� �ִ°Ű� �������� A�� OUTER JOIN (+)�� �ɾ������ 
    --MGR�� ���� �÷��� ��µǴ°ű� ������ MGR���� ��ġ�� ���� ���Ƽ� DISTINCT���ִ� ����
--NVL(A.EMPNO, B.MGR)�� ����� ����ڵ尡 �������� �˱� ���� �ڵ�


--OUTER JOIN
--����� �޿������� ��ȸ�ϴ� ���� �ۼ�
--��ȸ�׸� : ������ȣ, ������, ����, �޿�, ���ʽ�
--��, �޿���2023�� 6�� �����̸�, �޿������� ���� ������ 0���� ó����.
SELECT E.EMPNO AS ������ȣ, E.ENAME AS ������, E.JOB AS ����, NVL(S.SAL, 0) AS �޿�, NVL(S.COMM, 0) AS ���ʽ�
    FROM EMP E, SALARY S
    WHERE S.SALMONTH(+) = '202306'  --���⼭ (+)�� ������ ������ OUTER JOIN�� �ȵǼ� S���̺� ���� �����ʹ� ������ �ʴ´�
    AND  S.EMPNO(+) = E.EMPNO ;
--SELECT ������ �ٸ��÷��� ��Ī�� �����ص� ������ EMPNO�� �� ���̺� ����־ �����ϸ� �ȵ�
--��Ī�� �������ϴ°� ����!!  �����ͻ��¸� �� �𸣴� ����� ������ �ľ��ϱ� ��Ʊ� ����
--WHERE���� SALMONTH�� 202306�ΰ͵��� �����ͼ� ���ϴ°���
--E.EMPNO = S.EMPNO(+)�� �����ϴ� �ͺ��� �������� ���� �� ��� ���α׷��� ������ ���ư���
  


