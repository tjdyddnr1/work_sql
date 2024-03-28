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

-- 8. **EMP테이블에서 사번, 입사일, 사원명, 급여 조회  
-- (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)**

SELECT EMPNO, HIREDATE, ENAME, SAL 
FROM EMP
ORDER BY EMPNO, HIREDATE;

-- 9. **오늘 날짜에 대한 정보 조회**
SELECT SYSDATE 
FROM DUAL;

-- 10. **EMP테이블에서 사번, 사원명, 급여 조회
--(단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)**
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


-- 다중행 함수 : 여러 행에 대해 함수가 적용 되어 하나의 결과를 나타내는 함수, 집계 함수라고 함
SELECT SUM(SAL), EMPNO 
FROM EMP;


-- GROUP BY : 그룹으로 묶어줌
SELECT DEPTNO, SUM(SAL)  -- 3. 부서의 급여의 합계를 출력
FROM EMP  -- 1. 먼저 사원 테이블을 가져 옴
GROUP BY DEPTNO;  -- 2. 사원 테이블을 부서 단위로 묶음


-- 모든 사원의 급여와 수당의 합계 구하기

SELECT SUM(SAL), SUM(COMM)
FROM EMP;


-- 테이블의 데이터 개수 출력
SELECT COUNT(*)
FROM EMP;


--30번 부서의 사원 수 출력
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO  = 30;


SELECT COUNT(COMM)
FROM EMP
WHERE COMM IS NOT NULL;


-- 10번 부서의 사원 중 최대 급여 출력하기
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10;


-- 30번 부서의 평균 급여 출력하기
SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO = 30;


SELECT e.ENAME, e.SAL
FROM EMP e
WHERE e.DEPTNO = 10
AND e.SAL = (SELECT MAX(SAL) FROM EMP WHERE DEPTNO  = 10);


-- 부서별 평균 급여
SELECT AVG(SAL), DEPTNO 
FROM EMP
GROUP BY DEPTNO;


-- 집합을 사용해서 출력하기
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 10
UNION ALL 
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30;


-- 부서 번호 및 직책별 평균 급여 정렬하기
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB  
ORDER BY DEPTNO, JOB;


-- 부서 코드, 급여 합계, 평균급여, 부서 코드 순 정렬로 출력하기
SELECT DEPTNO AS "부서코드", SUM(SAL) AS "급여 합계",
ROUND(AVG(SAL)) AS "급여 평균", COUNT(*) AS "인원"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;


-- HAVING 절 : GROUP BY 절이 존재 할 때만 사용,
-- GROUP BY로 절을 통해 그룹화 된 결과 값의 범위를 제한하는데 사용
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE DEPTNO = 10
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;


-- 연습문제 1 : HAVING절을 사용하여 부서별 직책의 평균 급여가 500 이상인 사원들의 부서번호,
-- 직책, 부서별 직책의 평균 급여 출력
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 500;


-- 연습문제 2 : 부서번호, 평균급여, 최고급여, 최저급여, 사원수 출력, 
-- 단, 평균 급여는 소수점 제외하고 부서 번호별 출력
SELECT DEPTNO, FLOOR(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*)
FROM EMP
GROUP BY DEPTNO;


-- 연습문제 3 : 같은 직책의 종사하는 사원이 3명 이상인 직책과 인원을 출력
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;


-- 연습문제 4 : 사원들의 입사 연도 기준으로 부서별로 몇 명이 입사했는지 출력
SELECT EXTRACT(YEAR FROM HIREDATE), DEPTNO, COUNT(*)
FROM EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE), DEPTNO
ORDER BY DEPTNO;


-- 연습문제 5 : 추가 수당을 받는 사원과 받지 않은 사원수 출력, 추가 수당 여부는 O, X로 표기
SELECT NVL2(COMM, 'O', 'X') "추가수당 여부", COUNT(*)
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X')
ORDER BY "추가수당 여부";


-- 연습문제 6 : 각 부서의 입사년도별 사원 수, 최고 급여, 급여 합, 평균 급여를 출력
SELECT DEPTNO "부서 번호", TO_CHAR(HIREDATE, 'YYYY') "입사 년도",
COUNT(*) "사원 수", MAX(SAL) "최고 급여", SUM(SAL) "급여 합계", ROUND(AVG(SAL)) "평균 급여"
FROM EMP
GROUP BY DEPTNO, TO_CHAR(HIREDATE, 'YYYY')
ORDER BY "부서 번호", "입사 년도";

-- ROLLUP 함수 : 
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);


-- 집합연산자 : 두 개 이상의 쿼리 결과를 하나로 결합하는 연산자(수직적 처리)
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB = 'SALESMAN'
UNION 
SELECT EMPNO, ENAME, JOB 
FROM EMP
WHERE JOB = 'MANAGER';


-- 조인(JOIN) : 두 개 이상의 테이블에서 데이터를 가져와서 연결하는데 사용되는 SQL 기능
-- 테이블에 대한 식별 값인 Primary Key, 테이블 간의 공통 값인, Foreign Key값을 사용하여 조인

-- 내부 조인(동등 조인, inner join)이며 오라클 방식, 양쪽에 동일한 컬럼이 있는 경우 테이블 이름을 표시해야 함
SELECT EMPNO, ENAME, MGR, SAL, e.DEPTNO
FROM EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO
AND SAL >= 3000;


-- ANSI 방식
SELECT EMPNO, ENAME, MGR, E.DEPTNO
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
WHERE SAL >= 3000;


-- 연습 문제 : EMP 테이블 별칭을 E로, DEPT 테이블 별칭은 D로 하여 다음과 같은 등가 조인을 했을 때,
-- 급여가 2500 이하이고, 사원 번호가 9999 이하인 사원의 정보가 출력되도록 작성
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO 
WHERE SAL <= 2500 AND EMPNO <= 9999
ORDER BY EMPNO;


-- 비등가 조인 : 동일한 컬럼이 없을 때 사용하는 조인(일반적으로 많이 사용되지는 않음.)
SELECT *
FROM EMP;

SELECT *
FROM SALGRADE;

SELECT E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN SALGRADE s 
ON E.SAL BETWEEN S. LOSAL AND S.HISAL;


-- 자체 조인 : 현재 테이블 조인해서 어떠한 결과를 찾아낼 때  사용
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS "상관 사원 번호", E2.ENAME AS "상관 이름"
FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;

-- 외부 조인 : (LEFT OUTTER JOIN) : 부족한 부분이 있는 행이 있는 테이블에 (+)
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO(+)
ORDER BY E.DEPTNO ;


SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO;

SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E FULL OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO;


-- NATURAL JOIN : 동등조인을 사용하는 다른 방법, 조건절 없이 사용, 두 테이블의 같은 열을  자동으로  연결
SELECT E.EMPNO, E.ENAME, D.DNAME, DEPTNO
FROM EMP E NATURAL JOIN DEPT D;


-- JOIN ~ USING : 동등조인(등가조인)을 대신하는 방식 중의 하나
SELECT E.EMPNO, E.ENAME, D.DNAME, DEPTNO
FROM EMP E JOIN DEPT D USING(DEPTNO)
WHERE SAL >= 3000
ORDER BY DEPTNO, E.EMPNO;


-- 연습문제 1 : 급여가 2000 초과인 사원들의 부서 정보, 사원 정보 출력 (SQL-99 방식)
SELECT DEPTNO, DNAME, EMPNO, ENAME, SAL
FROM EMP NATURAL JOIN DEPT
WHERE SAL > 2000;


-- 연습문제 2 : 부서별 평균, 최대 급여, 최소 급여, 사원 수 출력 (ANSI JOIN)
SELECT D.DEPTNO,	
DNAME,
ROUND(AVG(SAL)) AS "평균 급여",
MAX(SAL) AS "최대 급여",
MIN(SAL) AS "최소 급여",
COUNT(*) AS "사원 수"
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME;


-- 연습문제 3 : 모든 부서 정보와 사원 정보를 부서 번호, 사원 이름 순으로 정렬해서 출력
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO 
ORDER BY D.DEPTNO, E.ENAME;


-- 1. 사원번호가 7499인 사원의 이름, 입사일 부서번호 출력
SELECT ENAME, TO_CHAR(HIREDATE, 'YY/MM/DD'), DEPTNO
FROM EMP 
WHERE EMPNO = '7499';


-- 2. 이름이 ALLEN인 사원의 모든 정보 출력
SELECT *
FROM EMP
WHERE ENAME = 'ALLEN';

-- 3. 이름이 K보다 큰 글자로 시작하는 사원의 모든 정보 출력
SELECT *
FROM EMP
WHERE ENAME > 'K%';


-- 4. 입사일이 81년 4월2일 보다 늦고, 82년 12월9일 보다 빠른 사원의 이름, 급여, 부서번호 출력
SELECT ENAME, SAL, DEPTNO,TO_CHAR(HIREDATE, 'YY/MM/DD')
FROM EMP
WHERE HIREDATE BETWEEN '1981-04-03' AND '1982-12-08';


-- 5. 급여가 1,600 보다 크고, 3000보다 작은 사원의 이름, 직무, 급여를 출력
SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL BETWEEN '1601' AND '2999'


-- 6. 입사일이 81년 이외에 입사한 사원의 모든 정보 출력
SELECT *
FROM EMP
WHERE  TO_CHAR(HIREDATE,'YY') NOT IN '81';


-- 7. 직업이 MANAGER와 SALESMAN인 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN');


-- 8. 부서가 20번, 30번을 제외한 모든 사원의 이름, 사원번호, 부서번호를 출력
SELECT ENAME, EMPNO, DEPTNO
FROM EMP
WHERE DEPTNO NOT IN ('20','30');


-- 9. 이름이 S로 시작하는 사원의 사원번호, 이름, 부서번호 출력
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE ENAME LIKE 'S%';


-- 10. 처음 글자는 관계없고, 두 번째 글자가 A인 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '_A%';


-- 11. 커미션이 NULL이 아닌 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;



-- 12. 이름이 J자로 시작하고 마지막 글자가 S인 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE ENAME LIKE 'J%S';


-- 13. 급여가 1500이상이고, 부서번호가 30번인 사원 중 직무가 MANAGER인 사원의 모든 정보 출력s
SELECT *
FROM EMP
WHERE SAL >= 1500 AND DEPTNO = 30 AND JOB = 'MANAGER';


-- 14. 모든 사원의 이름, 급여, 커미션, 총액(급여+커미션)을 구하여 총액이 많은 순서로 출력 (단, 커미션이 null인 사원도 0으로 포함)
SELECT ENAME, SAL, NVL(COMM,'0') "COMM", SAL + NVL(COMM, '0') "총액"
FROM EMP
ORDER BY "총액";


-- 15. 10번 부서의 모든 사원에게 급여의 13%를 보너스로 지불하기로 하였다.
-- 10번 부서 사원들의 이름, 급여, 보너스, 부서번호 출력
SELECT ENAME, SAL, SAL*1.13,DEPTNO
FROM EMP
WHERE DEPTNO = '10';

-- 16. 모든 사원에 대해 입사한 날로 부터 60일이 지난 후의 ‘월요일’에 대한 년,월,일를 구하여 이름, 입사일, 60일 후의 ‘월요일’ 날짜를 출력
SELECT ENAME, TO_CHAR(HIREDATE, 'YY/MM/DD') "HIREDATE", TO_CHAR(NEXT_DAY(HIREDATE+60,'월요일'), 'YYYY/MM/DD')
FROM EMP;

-- 17. 이름의 글자수가 6자 이상인 사원의 이름을 앞에서 3자만 구하여 소문자로 이름만 출력
SELECT LOWER(SUBSTR(ENAME, 1, 3))
FROM EMP
WHERE LENGTH(ENAME) >= 6;


-- 18. 사원들의 사원 번호와 급여, 커미션, 연봉((comm+sal)*12)을 연봉이 많은 순서로 출력
SELECT EMPNO, SAL, NVL2(COMM,COMM,0) AS "커미션", NVL2(COMM,(COMM+SAL)*12,SAL*12) AS "연봉"
FROM EMP
ORDER BY "연봉";


-- 19. 모든 사원들의 입사한 년/월/일 (예, 1981년5월30일)
SELECT TO_CHAR(HIREDATE, 'YYYY"년"MM"월"DD"일"')
FROM EMP;



-- 20. 10번 부서에 대해 급여의 평균 값, 최대 값, 최소 값, 인원 수를 출력
SELECT AVG(SAL), MAX(SAL), MIN(SAL), COUNT(*)
FROM EMP
WHERE DEPTNO  = '10';


-- 21. 사원번호가 짝수인 사원들의 모든 정보를 출력
SELECT *
FROM EMP
WHERE MOD(EMPNO,2) = 0;


-- 22. 각 부서별 같은 직무를 갖는 사원의 인원수를 구하여 부서 번호, 직무, 인원수 출력
SELECT DEPTNO, JOB, COUNT(*)
FROM EMP
GROUP BY DEPTNO, JOB;


-- 23. EMP와 DEPT테이블을 조인하여 모든 사원에 대해 부서 번호, 부서이름, 사원이름 급여를 출력
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO;


-- 24. 이름이 ‘ALLEN’인 사원의 부서 번호, 부서 이름, 사원 이름, 급여 출력



-- 25. ‘ALLEN’과 직무가 같은 사원의 이름, 부서 이름, 급여, 부서위치를 출력



-- 26. 모든 사원들의 평균 급여 보다 많이 받는 사원들의 사원번호와 이름 출력



-- 27. 부서별 평균 급여가 2000보다 적은 부서 사원들의 부서 번호 출력


-- 28. 30번 부서의 최고급여보다 급여가 많은 사원의 사원 번호, 이름, 급여를 출력
    
    
    
-- 29. ‘FORD’와 부서가 같은 사원들의 이름, 부서 이름, 직무, 급여를 출력
    
    
-- 30. 부서 이름이 ‘SALES’인 사원들의 평균 급여 보다 많고,
-- 부서 이름이 ‘RESEARCH’인 사원들의 평균 급여 보다 적은 사원들의 이름, 부서번호, 급여, 직무 출력


-- 서브쿼리 : 쿼리문 내에 포함 되는 쿼리문을 의미, 일반적으로 SELECT 문의 WHERE 절에서 사용
-- 단일행 서브쿼리와 다중행 서브쿼리가 있음
SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
							FROM EMP 
							WHERE ENAME = 'KING');
						
SELECT * FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

-- 연습문제 : 서브쿼리를 사용하여 EMP 테이블의 사원 정보 중에서
-- 사원 이름이 ALLEN인 사원의 추가 수당보다 많은 추가 수당을 받는 사원 정보를 구하도록 코드 작성
SELECT *
FROM EMP
WHERE COMM > (SELECT COMM  FROM EMP WHERE ENAME = 'ALLEN');

SELECT * FROM EMP 
WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'JAMES');

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E. DEPTNO = 20
AND E.SAL > (SELECT AVG(SAL) FROM EMP);


-- 실행 결과가 여러 개인 다중행 서브쿼리
-- IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있으면 TRUE
-- ANY, SOME : 메인 쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE
-- ALL : 메인 쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 TRUE
-- EXISTS : 서브 쿼리의 결과가 존재하면 TRUE
SELECT *
FROM EMP
WHERE SAL IN(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ANY(SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL = ANY(SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');

-- ALL : 다중행으로 반환 되는 서브쿼리의 결과를 모두 만족해야 TURE임
SELECT *
FROM EMP
WHERE SAL < ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL FROM EMP WHERE JOB = 'MANAGER');

SELECT *
FROM EMP 
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 10);


-- 다중열 서브쿼리 : 서브쿼리의 결과가 두 개 이상의 컬럼으로 반환되어  메인 쿼리에 전달
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, SAL FROM EMP
									WHERE DEPTNO = 30);
								
SELECT * 
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
									FROM EMP  GROUP BY DEPTNO);
								

-- FROM 절에서 사용하는 서브 쿼리 : 인라인뷰라고 부름
-- 테이블 내에 데이터 규모가 너무 크거나 특정 열만 제공해야 하는 경우 사용
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC, E10.SAL
FROM (SELECT EMPNO, ENAME, DEPTNO, SAL FROM EMP WHERE DEPTNO = 10) E10 JOIN DEPT D
ON E10.DEPTNO = D.DEPTNO;


-- SELECT절에 사용하는 서브쿼리 : 스칼라 서브쿼리라고 부름
-- SELECT절에서 사용되는 서브쿼리는 반드시 하나의 결과만 반환 되어야 함
SELECT EMPNO, ENAME, JOB, SAL, (SELECT GRADE FROM SALGRADE 
												WHERE E.SAL BETWEEN LOSAL AND HISAL)  
													AS "SALGRADE", DEPTNO,
													(SELECT DNAME FROM DEPT D
													WHERE E.DEPTNO = D.DEPTNO) AS "DNAME"
FROM EMP e ;

SELECT ENAME, DEPTNO, SAL, (SELECT TRUNC(AVG(SAL)) FROM EMP
											WHERE DEPTNO = E.DEPTNO ) AS "부서별 급여 평균"
FROM EMP E;

SELECT EMPNO, ENAME,
	CASE WHEN DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'NEW YORK')
		THEN '본사'
		ELSE  '분점'
	END AS "소속"
FROM EMP
ORDER BY 소속 DESC;

-- DECODE : 주어진 데이터 값이 조건 값과 일치하는 값을 출력하고 일치하지 않으면 기본값 출력
SELECT EMPNO, ENAME, JOB, SAL,
	DECODE(JOB,
		'MANAGER', SAL * 1.1,
		'SALESMAN', SAL * 1.05,
		'ANALYST', SAL,
		SAL * 1.03) AS "급여 인상"
FROM EMP;


-- CASE 문 :
SELECT EMPNO, ENAME, JOB, SAL,
CASE JOB
WHEN 'MANAGER' THEN SAL * 1.1
WHEN 'SALESMAN' THEN SAL * 1.05
WHEN 'ANALYST' THEN SAL
ELSE SAL *1.03
END AS "급여 인상"
FROM EMP;

SELECT *
FROM EMP;

SELECT *
FROM DEPT;

SELECT *
FROM SALGRADE;

-- 연습문제 1 : 전체 사원 중 ALLEN과 같은 직책(JOB)인 사원들의 사원 정보,
-- 부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
SELECT E.JOB, E.ENAME, E.SAL, D.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN' );

-- 연습문제 2 : 전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 사원들의 사원 정보
-- 부서 정보, 급여 등급 정보를 출력하는 SQL문을 작성하세요
-- (단 출력할 때 급여가 많은 순으로 정렬하되 급여가 같은 경우에는 사원 번호를 기준으로 오름차순으로 정렬)
SELECT E.EMPNO, E.ENAME, D.DNAME, TO_CHAR(E.HIREDATE, 'YY/MM/DD'), D.LOC, E.SAL,
			(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL ) AS GRADE
FROM EMP E JOIN DEPT d ON E.DEPTNO = D.DEPTNO
WHERE E.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY  SAL DESC, EMPNO;

-- 연습문제 3 : 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는
-- 직책을 가진 사원들의 사원 정보, 부서 정보를 다음과 같이 작성하는 출력하는 SQL문을 작성하세요.
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE D.DEPTNO = 10
AND JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = '30');


-- 연습문제 4 : 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원 정보,
-- 급여 등급 정보를 다음과 같이 출력하는 SQL문을 작성하세요
-- (단 서브쿼리를 활용할 떄 다중행 함수를 사용하는 방법과,
-- 사용하지 않는 방법을 통해 사원 번호를 기준으로 오름차순으로 정렬)

SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND SAL > (SELECT MAX(SAL)
                FROM EMP
               WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;

SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND SAL > ALL (SELECT SAL
                    FROM EMP
                   WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;

-- DML (Data Manipulation Language) : 조회(Select), 입력(Insert), 변경(Update)
CREATE TABLE DEPT_TEMP
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(50, 'DATABASE', 'SEOUL' );

INSERT INTO DEPT_TEMP VALUES(60, 'NETWORK', 'BUSAN');

INSERT INTO DEPT_TEMP(DEPTNO, LOC) VALUES(70, 'SUWON');

INSERT INTO DEPT_TEMP  VALUES(80, 'MOBILE'); -- ERROR

CREATE TABLE EMP_TEMP
AS SELECT * FROM EMP
WHERE 1 != 1;

SELECT *
FROM EMP_TEMP;

INSERT INTO EMP_TEMP  VALUES(9001, '나영석', 'PRESIDENT', NULL, '2010/01/01', 9900, 1000, 10);
INSERT INTO EMP_TEMP  VALUES (9002, '이은지', 'MANAGER', 9999, '2020-04-05', 5500, 800, 20);

DESC EMP_TEMP;

SELECT INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
        SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
        FROM EMP E, SALGRADE S
        WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
            AND S.GRADE = 1;
           
CREATE TABLE DEPT_TEMP2
AS SELECT *
FROM DEPT;

SELECT *
FROM DEPT_TEMP2;

UPDATE DEPT_TEMP2
	SET LOC = 'SUWON';

UPDATE DEPT_TEMP2
	SET LOC = '대전'
WHERE DEPTNO = 40;

DELETE FROM DEPT_TEMP2 WHERE LOC = 'SUWON';
DELETE FROM DEPT_TEMP2;

ROLLBACK;
           