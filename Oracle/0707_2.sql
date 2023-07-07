CREATE OR REPLACE PROCEDURE EX_PROC

IS
    P_ENAME EMP.ENAME%TYPE := '�׽�Ʈ'; --��������
    P_JOB VARCHAR2(10) := '���';
    P_DEPTNO EMP.DEPTNO%TYPE := '20';

BEGIN
    FOR I IN 1..10 --���⼭ .. ���� ��(.)�� �ΰ��� �־������ 3�������� �ȵ�. ������!
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� : ' || I);
        INSERT INTO EMP VALUES(EX_EMPNO_SEQ.NEXTVAL ,P_ENAME || I, P_JOB,NULL,  SYSDATE, P_DEPTNO );
    END LOOP;
    
    COMMIT;  --FOR�� �� ������ �ۿ��� COMMIT�������
    
    DBMS_OUTPUT.PUT_LINE('���ν��� ��.');
    
END EX_PROC;
/
--�� ���ν����� �μ��� �ѱ�°� ����


EXEC EX_PROC; 
--EXEC EX_PROC;�ٷ� ���� �ּ��ϸ� ������!!
--EXEC EX_PROC;�� ���ν��� ���� ��ɾ�, �μ��� �����Ƿ� �׳� ;�����
--COMIIT�� ��ġ �O��!!!
--INSERT INTO~�� DBMS�������� ������ �ִ� ��


--����)EMP ���̺� EMPNO 3000�� �̻��� ������ �����ϴ� ���ν��� �ۼ�
--���ν����� : EX_EMP_DEL
--COMMIT�� �� �� ������ ���ִ��� -> �ѹ��� ��Ƽ� Ŀ�����ִ°� �� ���� ����
CREATE OR REPLACE PROCEDURE EX_EMP_DEL

IS

BEGIN
    DELETE FROM EMP WHERE EMPNO >= '3000';
    --SQL%ROWCOUNT; --ó���Ǽ�
    DBMS_OUTPUT.PUT_LINE('�����Ǽ� : ' || SQL%ROWCOUNT); --COMMIT ���� �ؾ���!!
    
    COMMIT;
    
    
END;
/
EXEC EX_EMP_DEL;
--������ END;�ڿ� �� / ���ֱ�!!
--SELECT�� ��ȯ����
--DLELTE, UPDATE ,INSERT�� ó���Ǽ��� ������ ��ȯ����
--���� ������ �� ��� �Ǽ��� ���� ���� �����ϱ� ó���Ǽ��� 0���� ��ȯ�Ǹ� ����?

--SQL%ROWCOUNT�� COMMIT������ ���� �Ͱ� COMMIT���� ���� ���� ������ ���̴� ��û��
--Ŀ������ SQL%ROWCOUNT������ ���� DELETE ���� �ʾƼ� �Ǽ��� ������
--Ŀ���ϰ� ���� SQL%ROWCOUNT������ 0���� ����


--��ġ���α׷� : �¶����� ����ڰ� ���� Ŭ������ ������ ����Ǵ°�, �ٵ� ��ġ���α׷��� Ư�� ������ ���α׷��� �ڵ����� ���� �ֵ��� �ϴ°�
--���н� �������� ũ���̶�� �ϴ°ſ� ����ϴ°� ����

--����Ŭ �� ���
--����Ŭ �� ����ϴ¹� ���ͳݿ� ġ���
BEGIN --BEGIN�� ������ �ʼ��� ������ϴ°�!!!
    DBMS_SCHEDULER.CREATE_JOB
    (
        JOB_NAME => 'EX_JOB',   --���
        JOB_TYPE => 'STORED_PROCEDURE',
        JOB_ACTION => 'EX_PROC',    --���ν��� �̸�(���ν��� ���鶧 ������� �� �̸�)
        REPEAT_INTERVAL => 'FREQ=MINUTELY;INTERVAL=1',          --1�п� 1��
        COMMENTS => 'EMP�߰� ��ü'
    );

END;
/
--REPEAT_INTERVAL => 'FREQ=MINUTELY;INTERVAL=1'���� 1�п� 1���� ����ǵ��� ��  ,,���ͳݿ� �д���, �ô��� �ϴ��� ������ ã���� ����

--�� ��ü ���� �α� Ȯ��
SELECT * FROM USER_SCHEDULER_JOB_LOG;
SELECT * FROM USER_SCHEDULER_JOB_RUN_DETAILS;

--�� ����/���� (�� �����ٷ� ����)
BEGIN
    --DBMS_SCHEDULER.ENABLE('EX_JOB');  --�� ���� �̶�� ���ٴ� �����ٷ� �����̶���ϴ� �� �´µ�
    DBMS_SCHEDULER.DISABLE('EX_JOB'); --�� ����  ()���� ��� �־����
END;
/

--JOB�� ����Ŭ���������°�
--�����ٷ��� DB OS�� ���� ���డ��?


