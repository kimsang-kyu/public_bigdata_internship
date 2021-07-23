-- 3.1 집계함수
select  count(*) 전체건수, count(position) "직책건수",
		count(distinct "position") "직책종류", 
		max(salary) 최대,
		min(salary) 최소, avg(salary) 평균
from cslee.tb_emp;

-- Group by
select position 직책, count(*) 인원수, min(salary) 최소
	  , max(salary) 최대, avg(salary) 평균
from cslee.tb_emp
group by "position";
-- group by 절에서 그룹 단위를 표시해주어야 select 절에서 그룹 단위의 컬럼과 집계를 사용할 수 있음

-- 3.2 having 
-- 인원이 4명 이상인 부서의 인원수와 평균 연봉을 출력한다.
select * from cslee.tb_emp;

select org_cd 부서, count(*) 인원수, avg(salary) 평균연봉 
from cslee.tb_emp
group by org_cd
having count(*) >= 4;f

-- 부서별 최대 연봉만 출력하는데, 연봉이 4000만원 이하인 직원을 가지고 있는 경우만 출력하라.
select org_cd 부서, max(salary) 연봉
from cslee.tb_emp
group by org_cd
having min(salary) <= 40000000;

-- 부서별로 과장, 대리, 사원의 평균 급여를 출력한다.
select org_cd 부서, "position" 직책, avg(salary)
from cslee.tb_emp
where "position" in ('과장','대리','사원')
group by org_cd, position;
	   
-- case 표현을 활용한 부서별 데이터 집계
select org_cd,
       avg(case position when '과장' then salary end) 과장,
       avg(case position when '대리' then salary end) 대리,
       avg(case position when '사원' then salary end) 사원
from cslee.tb_emp
where "position" in ('과장','대리','사원')
group by org_cd ;


-- 집계 함수와 null처리
select org_cd,
	   sum(coalesce((case position when '팀장' then 1 else 0 end),0)) 팀장,
	   sum(coalesce((case position when '과장' then 1 else 0 end),0)) 과장,
	   sum(coalesce((case position when '대리' then 1 else 0 end),0)) 대리,
	   sum(coalesce((case position when '사원' then 1 else 0 end),0)) 사원
from cslee.tb_emp
group by org_cd;

SELECT ORG_CD, 
COALESCE (SUM(case position WHEN '팀장' THEN 1 END),0) 팀장,
COALESCE (SUM(case position WHEN '과장' THEN 1 END),0) 과장,
COALESCE (SUM(case position WHEN '대리' THEN 1 END),0) 대리,
COALESCE (SUM(case position WHEN '사원' THEN 1 END),0) 사원
from TB_EMP
GROUP BY ORG_CD;