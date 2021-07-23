-- 4-1. Equi Join
-- [예제]사원 테이블과 조직 테이블 조인 SQL
select tb_emp.emp_name , tb_emp.org_cd,
	   tb_org.org_cd, tb_org.org_name 
from tb_emp, tb_org
where tb_emp.org_cd = tb_org.org_cd;

-- [예제]사원이름, 소속부서코드, 부서명, 직책
select tb_emp.emp_no, tb_emp.emp_name, tb_emp.org_cd,
       tb_org.org_name, tb_emp."position"
from tb_emp, tb_org
where tb_emp.org_cd = tb_org.org_cd;

-- 컬럼과 테이블 alias를 적용하여 sql을 수정한다.
select E.emp_no, E.emp_name, E.org_cd,
       O.org_name, E.position
from tb_emp E, tb_org O
where E.org_cd = O.org_cd;

-- 위 sql 문장의 where절에  position이 팀장인 직원에 한해서 org_name  순서대로 출력하시오. 
select E.emp_no, E.emp_name, E.org_cd,
       O.org_name, E.position
from tb_emp E, tb_org O
where E.org_cd = O.org_cd and E.position= '팀장'
order by O.org_name;


-- 4.2 3개 이상 테이블 조인 
-- [예제]계좌번호, 고객명, 상품금액, 계약금액, 관리자명을 출력한다.
-- 네 개의 테이블에 대한 join이므로 where 절에 3개의 join 조건이 들어있다.
select A.accno, C.cust_name, P.prod_name, A.cont_amt, E.emp_name 
from tb_accnt A, tb_cust C, tb_prod P, tb_emp E
where A.cust_no = C.cust_no and A.prod_cd = P.prod_cd and A.manager = E.emp_no ;

-- [예제]사원별 급여와 어느 등급에 속하는지 알고 싶다는 요구사항에 대한 Non EQUI Join 사례 (Fk를 쓰지않음)
select E.emp_name 사원명, E.salary 급여, S.grade 급여등급
from tb_emp E, tb_grade S
where E.salary between S.low_sal and S.high_sal;


-- 4.3 표준조인
-- inner join 
--[예제] 사원번호와 사원이름, 소속부서 코드와 소속부서 이름을 찾아본다.
--- 1) where절 join 조건
select te.emp_no, te.emp_name, to2.org_cd, to2.org_name 
from tb_emp te, tb_org to2 
where te.org_cd = te.org_cd;

--- 2) from 절 join 조건
select te.emp_no, te.emp_name, to2.org_cd, to2.org_name 
from tb_emp te inner join tb_org to2 on te.org_cd = to2.org_cd;

--- 3) inner 키워드 생략
select te.emp_no, te.emp_name, to2.org_cd, to2.org_name 
from tb_emp te join tb_org to2 on te.org_cd = to2.org_cd;

-- From 절 join 조건
--[예제] 계좌 테이블에서 계좌번호와 고객번호, 고객의 명을 고객테이블과 조인하여 찾아본다.
select ta.accno, ta.cust_no , tc.cust_name
from tb_accnt ta join tb_cust tc on ta.cust_no = tc.cust_no ;

-- [예제]조직코드 10인 부서의 소속 사원 이름 및 소속 부서 코드, 부서코드, 부서 이름을 찾아본다.
select te.emp_name , te.org_cd ,to2.org_cd , to2.org_name 
from tb_emp te join tb_org to2 on te.org_cd=to2.org_cd 
where to2.org_cd = '10';

-- On조건절
-- [예제]계좌번호, 고객명, 상품명, 계약금액, 관리자명을 출력한다.
--- 1) where절 join 조건
select ta.accno 계좌번호, tc.cust_name 고객명, tp.prod_name 상품명, ta.cont_amt 계약금액, te.emp_name 담당자명 
from tb_accnt ta, tb_prod tp, tb_cust tc, tb_emp te 
where ta.manager = te.emp_no and ta.cust_no =tc.cust_no and ta.prod_cd= tp.prod_cd;

--- 2) on 절 join 조건
select ta.accno 계좌번호, tc.cust_name 고객명, tp.prod_name 상품명, ta.cont_amt 계약금액, te.emp_name 담당자명 
from tb_accnt ta 
join tb_emp te on ta.manager = te.emp_no 
join tb_prod tp on ta.prod_cd = tp.prod_cd 
join tb_cust tc on ta.cust_no = tc.cust_no;

-- CROSS JOIN 
select count(emp_name) from tb_emp;
select count(org_name) from tb_org;

--[예제] 조인 조건 없이 사원과 부서 테이블을 조인해본다.
select te.emp_name , to2.org_name 
from tb_emp te cross join tb_org to2 
order by emp_name;

select count(te.emp_name)
from cslee.tb_emp te cross join cslee.tb_org to2;

-- OUTER JOIN
--[예제] 직원중에 아직 부서배정이 안된 사원이 있다. tb_emp와 tb_org를 join하되, 부서배정이 안된 사원의 정보도 같이 출력하도록 한다.
select  te.emp_no , te.emp_name, te."position" , to2.org_name 
from tb_emp te left outer join tb_org to2 on te.org_cd = to2.org_cd 
where te."position" = '사원';

select  te.emp_no , te.emp_name, te."position" , to2.org_name 
from tb_org to2 right outer join tb_emp te on te.org_cd = to2.org_cd 
where te."position" = '사원';

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
