-- 4-1. Equi Join
-- [����]��� ���̺�� ���� ���̺� ���� SQL
select tb_emp.emp_name , tb_emp.org_cd,
	   tb_org.org_cd, tb_org.org_name 
from tb_emp, tb_org
where tb_emp.org_cd = tb_org.org_cd;

-- [����]����̸�, �ҼӺμ��ڵ�, �μ���, ��å
select tb_emp.emp_no, tb_emp.emp_name, tb_emp.org_cd,
       tb_org.org_name, tb_emp."position"
from tb_emp, tb_org
where tb_emp.org_cd = tb_org.org_cd;

-- �÷��� ���̺� alias�� �����Ͽ� sql�� �����Ѵ�.
select E.emp_no, E.emp_name, E.org_cd,
       O.org_name, E.position
from tb_emp E, tb_org O
where E.org_cd = O.org_cd;

-- �� sql ������ where����  position�� ������ ������ ���ؼ� org_name  ������� ����Ͻÿ�. 
select E.emp_no, E.emp_name, E.org_cd,
       O.org_name, E.position
from tb_emp E, tb_org O
where E.org_cd = O.org_cd and E.position= '����'
order by O.org_name;


-- 4.2 3�� �̻� ���̺� ���� 
-- [����]���¹�ȣ, ����, ��ǰ�ݾ�, ���ݾ�, �����ڸ��� ����Ѵ�.
-- �� ���� ���̺� ���� join�̹Ƿ� where ���� 3���� join ������ ����ִ�.
select A.accno, C.cust_name, P.prod_name, A.cont_amt, E.emp_name 
from tb_accnt A, tb_cust C, tb_prod P, tb_emp E
where A.cust_no = C.cust_no and A.prod_cd = P.prod_cd and A.manager = E.emp_no ;

-- [����]����� �޿��� ��� ��޿� ���ϴ��� �˰� �ʹٴ� �䱸���׿� ���� Non EQUI Join ��� (Fk�� ��������)
select E.emp_name �����, E.salary �޿�, S.grade �޿����
from tb_emp E, tb_grade S
where E.salary between S.low_sal and S.high_sal;


-- 4.3 ǥ������
-- inner join 
--[����] �����ȣ�� ����̸�, �ҼӺμ� �ڵ�� �ҼӺμ� �̸��� ã�ƺ���.
--- 1) where�� join ����
select te.emp_no, te.emp_name, to2.org_cd, to2.org_name 
from tb_emp te, tb_org to2 
where te.org_cd = te.org_cd;

--- 2) from �� join ����
select te.emp_no, te.emp_name, to2.org_cd, to2.org_name 
from tb_emp te inner join tb_org to2 on te.org_cd = to2.org_cd;

--- 3) inner Ű���� ����
select te.emp_no, te.emp_name, to2.org_cd, to2.org_name 
from tb_emp te join tb_org to2 on te.org_cd = to2.org_cd;

-- From �� join ����
--[����] ���� ���̺��� ���¹�ȣ�� ����ȣ, ���� ���� �����̺�� �����Ͽ� ã�ƺ���.
select ta.accno, ta.cust_no , tc.cust_name
from tb_accnt ta join tb_cust tc on ta.cust_no = tc.cust_no ;

-- [����]�����ڵ� 10�� �μ��� �Ҽ� ��� �̸� �� �Ҽ� �μ� �ڵ�, �μ��ڵ�, �μ� �̸��� ã�ƺ���.
select te.emp_name , te.org_cd ,to2.org_cd , to2.org_name 
from tb_emp te join tb_org to2 on te.org_cd=to2.org_cd 
where to2.org_cd = '10';

-- On������
-- [����]���¹�ȣ, ����, ��ǰ��, ���ݾ�, �����ڸ��� ����Ѵ�.
--- 1) where�� join ����
select ta.accno ���¹�ȣ, tc.cust_name ����, tp.prod_name ��ǰ��, ta.cont_amt ���ݾ�, te.emp_name ����ڸ� 
from tb_accnt ta, tb_prod tp, tb_cust tc, tb_emp te 
where ta.manager = te.emp_no and ta.cust_no =tc.cust_no and ta.prod_cd= tp.prod_cd;

--- 2) on �� join ����
select ta.accno ���¹�ȣ, tc.cust_name ����, tp.prod_name ��ǰ��, ta.cont_amt ���ݾ�, te.emp_name ����ڸ� 
from tb_accnt ta 
join tb_emp te on ta.manager = te.emp_no 
join tb_prod tp on ta.prod_cd = tp.prod_cd 
join tb_cust tc on ta.cust_no = tc.cust_no;

-- CROSS JOIN 
select count(emp_name) from tb_emp;
select count(org_name) from tb_org;

--[����] ���� ���� ���� ����� �μ� ���̺��� �����غ���.
select te.emp_name , to2.org_name 
from tb_emp te cross join tb_org to2 
order by emp_name;

select count(te.emp_name)
from cslee.tb_emp te cross join cslee.tb_org to2;

-- OUTER JOIN
--[����] �����߿� ���� �μ������� �ȵ� ����� �ִ�. tb_emp�� tb_org�� join�ϵ�, �μ������� �ȵ� ����� ������ ���� ����ϵ��� �Ѵ�.
select  te.emp_no , te.emp_name, te."position" , to2.org_name 
from tb_emp te left outer join tb_org to2 on te.org_cd = to2.org_cd 
where te."position" = '���';

select  te.emp_no , te.emp_name, te."position" , to2.org_name 
from tb_org to2 right outer join tb_emp te on te.org_cd = to2.org_cd 
where te."position" = '���';

-- FULL OUTER JOIN
SELECT A.ORG_CD, A.ORG_NAME, B.ORG_CD, B.ORG_NAME 
FROM cslee.TB_ORG A FULL OUTER JOIN cslee.TB_ORG B
ON A.ORG_CD=B.ORG_CD;

SELECT A.ORG_CD, A.ORG_NAME, B.ORG_CD, B.ORG_NAME
FROM cslee.TB_ORG A LEFT OUTER JOIN cslee.TB_ORG B
ON A.ORG_CD = B.ORG_CD
union
SELECT A.ORG_CD, A.ORG_NAME, B.ORG_CD, B.ORG_NAME
from cslee.TB_ORG A RIGHT OUTER JOIN cslee.TB_ORG B
ON A.ORG_CD = B.ORG_CD;
