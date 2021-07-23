
-- 2-1. 변환함수 
-- To_char, extract, to_date, to_number, to_timestamp 구문
-- 주수 구하기 
SELECT EMP_NAME, to_char((current_timestamp - ENT_DATE),'W') WEEKS
FROM TB_EMP
WHERE ORG_CD = '10';

-- to_Char 구문
select emp_name, ent_date,
	to_char(ent_date,'yyyy') 입사년,
	to_char(ent_date,'MM') 입사월,
	to_char(ent_date,'DD') 입사일
from tb_emp;

-- Extract 구문
select emp_name, ent_date, 
	extract('year' from ent_date) 입사년,
	extract('month' from ent_date) 입사월,
	extract('day' from ent_date) 입사일
from cslee.tb_emp
limit 10;

-- 변환함수(명시적 데이터 유형 변환) to_date, to_number, to_timestamp, cast
select to_date('05 Dec 2000', 'DD Mon YYYY');

select to_number('12,454.8-', '99G999D9S');
 
select to_timestamp('05 Dec 2000', 'DD Mon YYYY');

-- 변환함수 
SELECT CAST(123.4 AS VARCHAR(10))
, CAST('123.5' AS NUMERIC)
, CAST(1234.5678 AS DEC(6,2))
, CAST(CURRENT_TIMESTAMP AS DATE)
, TO_CHAR(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS')
, TO_CHAR(1234.56, 'L9,999.99')
, TO_NUMBER('$12,345', '$99,999')
, TO_DATE('2014/03/01 21:30:18','YYYY/MM/DD HH24:MI:SS')
, TO_TIMESTAMP('2014/03/01 21:30:18','YYYY/MM/DD HH24:MI:SS');

-- 2.2 Case
SELECT emp_name,
case when salary > 50000000
then salary
else 50000000
end as revised_salary
FROM cslee.tb_emp
limit 10;

select org_name,
	case org_name
	when '영업1팀' then '지사'
	when '영업2팀' then '지사'
	when '영업3팀' then '지사'
	when '경영관리팀' then '본사'
	else '지점'
	end as AREA
from tb_org;

-- case 문
SELECT EMP_NAME, 
CASE WHEN SALARY >= 90000000 THEN 'HIGH'
WHEN SALARY >= 60000000 THEN 'MID'
ELSE 'LOW'
END AS SALARY_GRADE
FROM TB_EMP
limit 10 ;

-- 중첩 Case문
SELECT EMP_NAME, SALARY, 
	CASE WHEN SALARY >= 50000000 THEN 20000000
	ELSE (CASE WHEN SALARY >= 20000000 THEN 10000000
	ELSE SALARY * 0.5 END)
	END as BONUS
FROM TB_EMP
limit 10;

-- 2-3. NULL관련 함수 
-- coalesce 함수
SELECT EMP_NAME, position, 
	   -- NVL(POSITION,'없음'), -- oracle null 체크함수
       coalesce(POSITION,'없음') -- null 체크함수
from TB_EMP
limit 10;

-- case함수
SELECT EMP_NAME, POSITION, 
	CASE WHEN POSITION IS null THEN '없음' 
	ELSE POSITION
	END AS 직책
FROM TB_EMP
limit 10;

--NULL과 공집합 
select coalesce(salary, 0) SAL 
from tb_emp
where emp_name='김태진';

SELECT MAX(salary) SAL 
FROM tb_emp
WHERE emp_name='김태진';

SELECT coalesce(MAX(salary), 9999) SAL 
FROM tb_emp
WHERE emp_name='김태진';



