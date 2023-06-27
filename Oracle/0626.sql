CREATE TABLE DEPT(
    DEPTNO CHAR(2) CONSTRAINT PK_DEPT PRIMARY KEY,  --pk�� �̸��� �Է����� �ʰ� �����ϸ� �ڵ��̸��� �ٴµ� ���߿� �˾ƺ��� �����ϱ� �̸� ����!
    DNAME VARCHAR2(20),
    LOC VARCHAR2(20)
);

--comment�� �ּ��� ���Ƽ� DB�� ���� ����!
COMMENT ON TABLE DEPT IS '�μ�';
COMMENT ON COLUMN DEPT.DEPTNO IS '�μ��ڵ�';
COMMENT ON COLUMN DEPT.DNAME IS '�μ���';
COMMENT ON COLUMN DEPT.LOC IS '�μ���ġ';

SELECT * FROM DBA_TAB_COLUMNS WHERE TABLE_NAME = 'DEPT';
SELECT * FROM DBA_TAB_COMMENTS WHERE TABLE_NAME = 'DEPT';

--�������̺� ����
CREATE TABLE EMP(
    EMPNO CHAR(4) CONSTRAINT PK_EMP PRIMARY KEY, --������ȣ,  �ű����� ����
    ENAME VARCHAR2(20),   --������
    JOB VARCHAR2(10),   --����
    MGR CHAR(4),   -- ����ڵ� -> EMP���̺��� MGR�� FK ��!!!
    --FK�� ���̺� �ٸ� ���̺��� PK�� Ŀ������ ���� ����
    --������ ��ϵǾ� �մ� �ڵ尡 MGR�� �;���
    --DEPTNO�� �մ� �������ڵ尡 �;���
    HIREDATE DATE, --�Ի����� �ٲ�� �ȵǴϱ� CHARŸ������ �ϴ°� ����,����� �� �ʿ��ϹǷ� DATEŸ������ �����ָ��
    SAL NUMBER(7, 2), --�޿�
    COMM NUMBER(7, 2),  --���ʽ�
    DEPTNO CHAR(2)CONSTRAINT FK_DEPTNO REFERENCES DEPT --�μ��ڵ�,  �ܷ�Ű ����
);
