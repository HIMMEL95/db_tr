
-- 총 사원수
SELECT COUNT(*) FROM EMP;

-- s로 시작하는 사원의 사원 번호와 이름
SELECT 
    e.EMPNO
    ,e.ENAME
FROM EMP e
WHERE 1=1
    AND ENAME LIKE CONCAT('S%');
    
-- 급여가 1200에서 3500 사이인 사원의 사원 번호, 이름, 급여
SELECT 
    e.EMPNO
    ,e.ENAME
    ,e.SAL
FROM EMP e
WHERE 1=1 
    AND SAL BETWEEN 1200 AND 3500
;

-- 부서별 평균 급여, 최대급여, 최소급여
SELECT
    e.DEPTNO
    ,d.DNAME
    ,avg(e.SAL) AS AVG
    ,max(e.SAL) AS MAX
    ,MIN(e.SAL) AS MIN
FROM EMP e
    INNER JOIN DEPT d ON d.DEPTNO = e.DEPTNO
WHERE 1=1
GROUP BY DEPTNO;



