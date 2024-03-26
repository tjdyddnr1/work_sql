SELECT * FROM EMP;

-- SELECT문은 데이터베이스에 보관 되어 있는 데이터를 조회할 때 사용
-- SELECT : 조회할 열 이름 또는 출력할 데이터를 지정, '*' 은 모든 컬럼을 의미
-- FROM : 조회할 테이블을 지정

SELECT EMPNO, ENAME, DEPTNO
FROM EMP;

-- SQL문을 작성 유의사항
-- SQL문은 대/소문자를 구분하지 않음
-- 한 줄 또는 여러 줄에 입력 될 수 있음.
-- 일반적으로는 키워드는 대문자로 입력
-- SQL 문의 마지막 절은 ;을 기술하여 명령의 끝을 표시

-- 열과 연산식을 함께 사용할 수 있음.
-- 컬럼 이름은 보기 좋게 별칭을 사용할 수 있음
-- 별칭 부여 -> AS 키워드 사용, AS 없이 사용 가능,
-- ""는 사용해도 되고, 사용하지 않아도 되지만, 문장 내에 공백이 있는 경우 반드시 사용해야함

SELECT ENAME, SAL, SAL*12+COMM 연봉, COMM
FROM EMP;

SELECT ENAME "성명", SAL "급여", SAL*12+COMM "연봉"
FROM EMP;

-- 중복을 제거하는 DISTINCT : 데이터를 조회할 때 중복 되는 행이 여러 개 조회 될 때
-- 값이 중복된 행을 한 개씩만 표시할 때 사용
SELECT DEPTNO FROM EMP; -- 사원의 부서 번호를 표시함
SELECT DISTINCT DEPTNO FROM EMP; -- 중복 제거
SELECT JOB, DEPTNO FROM EMP;
SELECT DISTINCT JOB, DEPTNO FROM EMP; -- 직책과 부서 두가지 조건에 대해 중복 제거

-- WHERE 구문 : 사용자가 원하는 조건에 맞는 데이터만 조회하고 싶을 때 사용 (행을 제한)
-- 10번 부서에 소속된 사원의 모든 정보를 표시
-- DATABASE의 같다라는 의미는 프로그래밍 언어(==)와 달리 =(1개)임
SELECT * FROM EMP
WHERE DEPTNO = 10;

SELECT * FROM EMP
WHERE EMPNO = 7369;

-- 연습문제 : 급여가 2500초과인 사원번호, 이름, 직책, 급여

SELECT EMPNO, ENAME, JOB, SAL 
FROM EMP
WHERE SAL > 2500; -- 비교 연산자 사용

SELECT *
FROM EMP
WHERE SAL * 12 = 36000;

SELECT *
FROM EMP
WHERE COMM > 300;

SELECT *
FROM EMP
WHERE SAL * 12 = 36000; -- 산술연산자, *, -, +, /

SELECT *
FROM EMP
WHERE COMM > 300; -- 비교 연산자, >, >=, <, <=

SELECT * FROM EMP
WHERE HIREDATE < '81/01/01'; -- 날짜 정보는 내부적으로 특수한 유형으로 관리 됨, 크다/작다 비교 가능

SELECT * FROM EMP
WHERE ENAME = 'WARD';

-- [같지 않음을 표현하는 여러가지 방법]
SELECT * FROM EMP
WHERE DEPTNO != 30;
-- WHERE DEPTNO <> 30;
-- WHERE DEPTNO ^= 30;
-- WHERE NOT DEPTNO = 30;

--[논리연산자 : AND OR NOT]
SELECT * FROM EMP
WHERE SAL >= 3000 AND DEPTNO = 20; -- 급여가 3000이상이고 부서가 30번인 대상자 출력

SELECT * FROM EMP
WHERE SAL >= 3000 OR DEPTNO = 20; -- 급여가 3000 이상이거나 부서가 20번인 대상자 출력

SELECT * FROM EMP
WHERE SAL >= 3000 AND (DEPTNO = 20 OR HIREDATE < '82/01/01');

-- 연습문제
-- 1. 급여가 2500 이상이고, 직업이 MANAGER인 사원 정보만 나오도록 코드 작성

SELECT *
FROM EMP
WHERE SAL >= 2500 AND JOB = 'MANAGER'; -- 문자열 비교는 ''

-- IN 연산자
SELECT * FROM EMP
WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';

SELECT * FROM EMP
WHERE JOB IN('MANAGER', 'SALESMAN', 'CLERK');

SELECT * FROM EMP
WHERE JOB NOT IN('MANAGER', 'SALESMAN', 'CLERK');

-- 연습문제
-- IN 연산자를 사용하여 부서 번호가 10, 20번인 대상자만 출력
SELECT *
FROM EMP
WHERE DEPTNO IN (10, 20);

SELECT *
FROM EMP
WHERE SAL >= 2000 AND SAL <= 3000;

-- BETWEEN 연산자는 일정한 범위를 조회할 때 사용하는 연산자
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

-- 연습문제
-- 1980년이 아닌 해에 입사한 직원을 조회

SELECT *
FROM EMP
WHERE NOT HIREDATE BETWEEN '1980/01/01' AND '1980/12/31'; 

-- LIKE, NOT LIKE 연산자 : 내용의 일부를 검색할 때 사용
-- % : 길이에 상관 없이 모든 문자 데이터를 의미 (길이가 0 ~ 무한대를 의미)
-- _ : 문자 1개를 의미
SELECT EMPNO, ENAME FROM EMP
WHERE ENAME LIKE '%K%';  -- 이름에 K가 포함 되어 있는 모든 대상자

-- 사원 이름의 두 번째 글자가 L인 사원만 출력

SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';  -- \% 와일드카드 사용 X

-- IS NULL : NULL 여부를 확인
-- NULL은 값이 존재하지 않음을 의미(미확정 상태), 연산, 할당, 비교 불가,
-- NULL과 연산을 수행하면 결과가 NULL
SELECT ENAME, SAL, SAL*12+COMM AS "연봉", COMM
FROM EMP;

-- 아래의 코드에서 NULL은 비교 불가이므로 값이 나오지 않음.
SELECT *
FROM EMP
WHERE COMM = NULL; 

-- IS NULL : NULL 여부 확인.
SELECT *
FROM EMP
WHERE comm IS NULL;

SELECT *
FROM EMP
WHERE comm IS NOT NULL;

-- 정렬을 위한 ORDER BY 절 : 특정 컬럼의 데이털르 중심으로 오름차순이나 내림차순 정렬

SELECT *
FROM EMP
ORDER BY SAL DESC; -- 정렬 조건을 넣지 않으면 해당 컬럼 기준으로 오름차순 정렬함

-- 연결 연산자 : SELECT문 조회시 컬럼 사이에 특정한 문자를 넣을 때 사용
SELECT ENAME || 'S JOB IS' || JOB AS EMPLOYEE
FROM EMP;


-- 실습문제 1 : EMP 테이블을 사용하여 사원이름이 S로 끝나는 사원 데이터 모두 출력

SELECT *
FROM EMP
WHERE ENAME LIKE '%S';


-- 실습문제 2 : EMP 테이블을 사용하여 30번 부서에서 근무하고 있는 사원 중에 직책이
-- SALESMAN인 사원 번호, 이름, 직책, 급여, 부서 번호 출력

SELECT EMPNO "사원 번호", ENAME "이름", JOB "직책" , SAL "급여", EMPNO "부서 번호"
FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';


-- 실습문제 3 : 20번 30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원의
-- 사원 번호, 이름, 급여, 부서 번호 출력

SELECT EMPNO "사원 번호", ENAME "이름", SAL "급여", EMPNO "부서 번호"
FROM EMP
WHERE SAL > 2000 OR (EMPNO = 30 AND EMPNO = 20);


-- 실습문제 4 : NOT BETWEEN A AND B 연산자를 쓰지 않고 급여가 2000이상, 3000 이하 범위 이외의
-- 값을 가진 데이터만 출력

SELECT *
FROM EMP
WHERE SAL >= 2000 AND SAL <= 3000;


-- 실습문제 5 : 사원 이름에 E가 포함 되어 있는 30번 부서의 사원 중 급여가 1000 ~ 2000 사이가 아닌,
-- 사원 이름, 사원 번호, 급여, 부서 번호 출력

SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%' AND DEPTNO = 30 AND (NOT SAL  BETWEEN  1000 AND 2000);


-- 실습문제 6 : 추가 수당이 존재하지 않고, 상급자가 있고, 직책이 MANAGER, CLERK인 사원 중
-- 사원 이름이 두 번째 글자가 L이 아닌 사원의 정보 출력

SELECT *
FROM EMP
WHERE ENAME NOT LIKE '_L%' 
AND COMM IS NULL 
AND MGR IS NOT NULL 
AND JOB IN ('MANAGER', 'CLERK');


-- 숫자 함수 : 수학적 계산식을 처리하기 위한 함수를 의미
-- DUAL 테이블 : SYS 계정에서 제공하는 테이블
-- ABS : 절대값을 구함

SELECT -10, ABS(-10) FROM dual;


-- ROUND : 반올림한 결과를 반환, 반올림할 위치를 지정할 수 있으며 지정하지 않으면,
-- 0으로 지정한 위치에서 반올림

SELECT ROUND(1234.5678) AS round, -- 위치를 지정하지 않으면 0의 위치(소수점 첫 번째 자리를 반올림)
	ROUND(1234.5678, 0) AS round_0,
	ROUND(1234.5678, 1) AS round_1,
	ROUND(1234.5678, 2) AS round_2,
	ROUND(1234.5678, -1) AS round_minus1,
	ROUND(1234.5678, -2) AS round_minus2
FROM dual;


-- TRUNC : 버림을 한 결과를 반환하는 함수

SELECT TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS TRUNC_0,
	TRUNC(1234.5678, 1) AS TRUNC_1,
	TRUNC(1234.5678, 2) AS TRUNC_2,
	TRUNC(1234.5678, -1) AS TRUNC_minus1,
	TRUNC(1234.5678, -2) AS TRUNC_minus2
FROM dual;


-- MOD : 나누기한 후 나머지를 출력하는 함수
SELECT MOD(21,5)
FROM DUAL;

-- CEIL : 소수점 이하가 있으면 무조건 올림
SELECT CEIL(12.345)
FROM DUAL;

-- FLOOR : 소수점 이하를 무조건 버림
SELECT FLOOR(12.345)
FROM DUAL;

-- POWER : 정수 A를 정수 B만큼 제곱하는 함수
SELECT POWER(3,4)
FROM DUAL;


-- 문자 함수 : 문자 데이터를 가공하거나 문자 데이터로 부터 특정 결과를 얻고자 할 때 사용

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) 
FROM EMP;

-- 문자열 길이를 구하는 LENGTH 함수

SELECT ENAME, LENGTH(ENAME)
FROM EMP;

--LENGTH(문자열 길이)와 LENGTHB(문자열의 바이트 수) 함수 비교

SELECT LENGTH ('한글'), LENGTH ('ENG'), LENGTHB('한글'), LENGTHB('ENG')
FROM dual;

-- SUBSTR(대상, 시작위치, 길이) / SUBSTRB
-- 대상 문자열의 시작위치 부터 선택한 개수만큼 문자를 반환
-- 데이터베이스는 프로그래밍 언어와 달리 0부터 시작하는 인덱스 아님

SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB,5)
FROM EMP;

-- 음수값은 뒤에서 부터 계산 함(파이썬 문자열 인덱싱과 유사)

SELECT JOB, SUBSTR(JOB, -LENGTH(JOB)),
	SUBSTR(JOB, -LENGTH(JOB), 2), SUBSTR(JOB,-3)
FROM EMP;


-- INSTR : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함 되어 있는지를 알아낼 때 사용

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR1,  -- 처음부터 검색
	INSTR('HELLO, ORACLE!', 'L',5) AS INSTR2, -- 5번째부터 검색 시작
	INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR3  -- 2번째부터 검색하는데 해당 문자 2번째에 나타난 문자 검색
FROM DUAL;

-- 특정 문자가 포함된 행 찾기
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S') > 0;

SELECT *
FROM EMP 
WHERE ENAME LIKE '%S%';

-- REPLACE : 특정 문자열에 데이터에 포함된 문자를 다른 문자로 대체 할 떄 사용

SELECT '010-1234-5678' AS repalce_before,
	REPLACE ('010-1234-5678', '-', ' ') AS replace1,
	REPLACE ('010-1234-5678', '-') AS replace2
FROM DUAL;

-- LPAD / RPAD : 기준 공간 칸수를 지정하고 빈칸만큼 특정 문자로 채우는 함수
SELECT LPAD('ORACLE', 10, '+')
FROM DUAL;

SELECT RPAD('ORACLE', 10, '+')
FROM DUAL;

SELECT RPAD('ORACLE', 10)
FROM DUAL;

-- 개인정보 뒷자리를 *로 표시하기
SELECT RPAD('971215-', 14, '*') AS rpad_jumin,
	RPAD('010-1234-', 13 , '*') AS rpad_phone
FROM DUAL;


-- 두 문자열을 합치는 CONCAT 함수
SELECT CONCAT(EMPNO, ENAME), CONCAT(EMPNO, CONCAT(' : ', ENAME))
FROM EMP
WHERE ENAME = 'JAMES';


-- TRIM / LTRIM / RTRIM : 문자열 데이터 내에서 특정 문자를 지우기 위해 사용

SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
 '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
 '[' || LTRIM('<_Oracle_>', '<_') || ']' AS LTRIM_2,
 '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
 '[' || RTRIM('<_Oracle_>', '_>') || ']' AS RTRIM_2
 FROM DUAL;

-- 날짜 데이터를 다루는 날짜 함수
-- SYSDATE : 운영제체로 부터 시간을 읽어 옴
SELECT SYSDATE
FROM dual;

SELECT SYSDATE AS "현재 시간",
	SYSDATE - 1 AS "어제",
	SYSDATE + 1 AS "내일"
FROM dual;

-- 몇 개월 이후 날짜를 구하는 ADD_MONTH 함수

SELECT SYSDATE, 
	ADD_MONTHS(SYSDATE, 3)
FROM DUAL;


-- 입사 10주년이 되는 사원들 데이터 출력하기

SELECT EMPNO, ENAME, HIREDATE,
	ADD_MONTHS(HIREDATE, 120) AS "입사 10주년" 
FROM EMP;


-- 연습 문제 : SYSDATE와 ADD_MONTH함수를 사용하여 현재 날짜와 6개월 이후 날짜가 출력

SELECT SYSDATE,
	ADD_MONTHS(SYSDATE, 6)
FROM DUAL;


-- 돌아오는 요일(NEXT_DAY), 달의 마지막 날짜를 구하는 LAST_DAY

SELECT SYSDATE,
	NEXT_DAY(SYSDATE,'월요일'),
	LAST_DAY(SYSDATE)
FROM DUAL;


-- 날짜 정보 추출 함수

SELECT EXTRACT(YEAR FROM DATE '2024-03-26')
FROM DUAL;

SELECT * 
FROM EMP
WHERE EXTRACT (MONTH FROM hiredate) = 12;

-- 자료형을 변환하는 형 변환 함수

SELECT empno, ename, empno + '500'
FROM emp
WHERE ENAME = 'FORD';

-- 날짜, 숫자를 문자로 변환하는 TO_CHAR 함수
SELECT SYSDATE FROM DUAL;
-- 원하는 format으로 바꿔서 찍어준다.
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "현재날짜시간"
FROM DUAL;

SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS 세기,
    TO_CHAR(SYSDATE, 'YY') AS 연도,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS ') AS "년/월/일 시:분:초",
    TO_CHAR(SYSDATE, 'Q') AS 쿼터,
    TO_CHAR(SYSDATE, 'DD') AS 일,
    TO_CHAR(SYSDATE, 'DDD') AS 경과일,
    TO_CHAR(SYSDATE, 'HH') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH12') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH24') AS "24시간제",
    TO_CHAR(SYSDATE, 'W') AS 몇주차
FROM DUAL;

SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'MM') AS MM,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MON_KOR,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MON_ENG,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MONTH_KOR,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MONTH_ENG
FROM DUAL;

SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'MM') AS MM,
     TO_CHAR(SYSDATE, 'DD') AS DD,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DY_KOR,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DY_ENG,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DAY_KOR,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DAY_JPN,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DAY_ENG
FROM DUAL;

SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
     TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
     TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
FROM DUAL;

--숫자 데이터 형식을 지정하여 출력하기
SELECT SAL,
     TO_CHAR(SAL, '$999,999') AS SAL_$,
     TO_CHAR(SAL, 'L999,999') AS SAL_L,
     TO_CHAR(SAL, '999,999.00') AS SAL_1,
     TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
     TO_CHAR(SAL, '000999999.99') AS SAL_3,
     TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP;

SELECT '1300' - '1200' FROM DUAL; -- 자동 형변환
SELECT TO_NUMBER('1300') - '1000' FROM DUAL; --수동 형변환

-- TO_DATE :문자열로 명시된 날짜로 변환하는 함수
SELECT TO_DATE('22/08/20', 'YY/MM/DD')
FROM DUAL;


-- NULL 처리 함수 : NULL이란? 특정열의 행의 데이터값이 지정되지 않으면 데이터값이 NULL이 됨
-- NULL은 0이나 공백과는 다른 의미, 연산도 안되고 비교도 안됨

-- NVL(컬럼명,반환값) = 입력값이 NULL인 경우 반환값으로 변환

SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, 
	NVL(COMM, 0),
	SAL + NVL(COMM, 0)
	FROM EMP;
	

-- NVL2(컬럼명,반환값(NULL이 아니면),반환값2(NULL인 경우)) 입력 데이터가 NULL이 아니면 2번째 값으로 반환, NULL이면 3번째 값으로 반환

SELECT EMPNO, ENAME, COMM,
	NVL2(COMM, '0', 'X'),
	NVL2(COMM, SAL*12+COMM, SAL*12) 연봉
FROM EMP;

-- NULLIF(비교값1, 비교값2) : 두 값을 비교하여 동일한지 아닌지에 대한 결과 반환,
-- 두 값이 동일하면 NULL 반환하고 동일하지 않으면 첫 번째 값 반환
SELECT NULLIF(10,10), NULLIF ('A','B')
FROM DUAL;


-- 1. **EMP테이블에서 COMM 의 값이 NULL이 아닌 정보 조회**

SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

-- 2. **EMP테이블에서 커미션을 받지 못하는 직원 조회**

SELECT *
FROM EMP
WHERE COMM IS NULL;

-- 3. **EMP테이블에서 관리자가 없는 직원 정보 조회**

SELECT *
FROM EMP
WHERE MGR IS NULL;

-- 4. **EMP테이블에서 급여를 많이 받는 직원 순으로 조회**
SELECT *
FROM EMP
ORDER BY SAL DESC;

-- 5. **EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회**

SELECT *
FROM EMP
ORDER BY SAL DESC, COMM DESC;

-- 6. **EMP테이블에서 사원번호, 사원명,직급, 입사일 조회 (단, 입사일을 오름차순 정렬 처리)**

SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE;

-- 7. **EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)**

SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO DESC;

-- 8. **EMP테이블에서 사번, 입사일, 사원명, 급여 조회  (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)**

SELECT EMPNO, HIREDATE, ENAME, SAL 
FROM EMP
ORDER BY EMPNO, HIREDATE;

-- 9. **오늘 날짜에 대한 정보 조회**

SELECT SYSDATE 
FROM DUAL;

-- 10. **EMP테이블에서 사번, 사원명, 급여 조회  (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)**

SELECT EMPNO, ENAME, ROUND(SAL, -2)
FROM EMP
ORDER BY SAL DESC;

-- 11. **EMP테이블에서 사원번호가 홀수인 사원들을 조회**

SELECT *
FROM EMP
WHERE MOD(EMPNO ,2) > 0

-- -- 12. **EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)**

SELECT ENAME, EXTRACT (MONTH FROM hiredate),EXTRACT (YEAR FROM HIREDATE)
FROM EMP;

-- 13. **EMP테이블에서 9월에 입사한 직원의 정보 조회**

SELECT HIREDATE
FROM EMP
WHERE EXTRACT (MONTH FROM HIREDATE) = 9;

-- 14. **EMP테이블에서 81년도에 입사한 직원 조회**

SELECT HIREDATE
FROM EMP
WHERE EXTRACT (YEAR FROM HIREDATE) = 1981;

-- 15. **EMP테이블에서 이름이 'E'로 끝나는 직원 조회**

SELECT *
FROM EMP
WHERE ENAME LIKE '%E'

-- 16. **EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회**

SELECT *
FROM EMP
WHERE ENAME LIKE '__R%'

-- - **LIKE 사용**

-- 1. **EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회**

SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE,480)  
FROM EMP;

-- 2. **EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회**

SELECT *
FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE)/12 >= 38; 

-- 3. **오늘 날짜에서 년도만 추출**

SELECT TO_CHAR(SYSDATE, 'YY')
FROM DUAL;
	
	
	
	