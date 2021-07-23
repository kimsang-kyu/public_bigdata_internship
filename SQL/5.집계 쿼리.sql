-- 3.1 �����Լ�
select  count(*) ��ü�Ǽ�, count(position) "��å�Ǽ�",
		count(distinct "position") "��å����", 
		max(salary) �ִ�,
		min(salary) �ּ�, avg(salary) ���
from cslee.tb_emp;

-- Group by
select position ��å, count(*) �ο���, min(salary) �ּ�
	  , max(salary) �ִ�, avg(salary) ���
from cslee.tb_emp
group by "position";
-- group by ������ �׷� ������ ǥ�����־�� select ������ �׷� ������ �÷��� ���踦 ����� �� ����

-- 3.2 having 
-- �ο��� 4�� �̻��� �μ��� �ο����� ��� ������ ����Ѵ�.
select * from cslee.tb_emp;

select org_cd �μ�, count(*) �ο���, avg(salary) ��տ��� 
from cslee.tb_emp
group by org_cd
having count(*) >= 4;f

-- �μ��� �ִ� ������ ����ϴµ�, ������ 4000���� ������ ������ ������ �ִ� ��츸 ����϶�.
select org_cd �μ�, max(salary) ����
from cslee.tb_emp
group by org_cd
having min(salary) <= 40000000;

-- �μ����� ����, �븮, ����� ��� �޿��� ����Ѵ�.
select org_cd �μ�, "position" ��å, avg(salary)
from cslee.tb_emp
where "position" in ('����','�븮','���')
group by org_cd, position;
	   
-- case ǥ���� Ȱ���� �μ��� ������ ����
select org_cd,
       avg(case position when '����' then salary end) ����,
       avg(case position when '�븮' then salary end) �븮,
       avg(case position when '���' then salary end) ���
from cslee.tb_emp
where "position" in ('����','�븮','���')
group by org_cd ;


-- ���� �Լ��� nulló��
select org_cd,
	   sum(coalesce((case position when '����' then 1 else 0 end),0)) ����,
	   sum(coalesce((case position when '����' then 1 else 0 end),0)) ����,
	   sum(coalesce((case position when '�븮' then 1 else 0 end),0)) �븮,
	   sum(coalesce((case position when '���' then 1 else 0 end),0)) ���
from cslee.tb_emp
group by org_cd;

SELECT ORG_CD, 
COALESCE (SUM(case position WHEN '����' THEN 1 END),0) ����,
COALESCE (SUM(case position WHEN '����' THEN 1 END),0) ����,
COALESCE (SUM(case position WHEN '�븮' THEN 1 END),0) �븮,
COALESCE (SUM(case position WHEN '���' THEN 1 END),0) ���
from TB_EMP
GROUP BY ORG_CD;