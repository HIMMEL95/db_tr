-- football database를 사용하겠다.   
USE football;

-- 전체 컬럼 조회
SELECT * from member2;

-- 컬럼 추가
ALTER TABLE member2 
	ADD COLUMN name varchar(45),
    ADD COLUMN id varchar(45),
    ADD COLUMN pwd varchar(45),
    ADD COLUMN gender TINYINT,
    ADD COLUMN dob varchar(45),
    ADD COLUMN delNy TINYINT,
    ADD COLUMN regDatetime datetime,
    ADD COLUMN modDatetime datetime,
    ADD COLUMN membercol varchar(45)
    ;

ALTER TABLE member2
	ADD COLUMN nickname varchar(45);
    
ALTER TABLE member2 
	ADD COLUMN nameEng varchar(45) AFTER name;

ALTER TABLE member2
	ADD COLUMN tel varchar(45) AFTER pwd;

-- 컬럼 변경
ALTER TABLE member2 MODIFY COLUMN nickname varchar(100);

-- 컬럼 이름 변경
ALTER TABLE member2 CHANGE COLUMN nickname nick varchar(45);

-- 컬럼 삭제
ALTER TABLE user DROP COLUMN CC_seq;

-- row 삭제
DELETE FROM member2 WHERE seq=2; 

DELETE FROM member2 WHERE seq=11;

-- Commit / Rollback

-- 내용 수정
UPDATE member2 SET
	name = "Haneul",
	id = "Himmel"
WHERE seq=1;

SELECT * FROM member2;

-- UPDATE & DELETE 제한 조건 푸는 법
-- Edit -> Preference -> SQL Editor -> 최하단 체크 해제

SELECT * FROM user
WHERE 1=1
	-- AND name like "이%"
    -- AND name like "%이"
    -- AND name like "%이%"
    AND password like "%s%"
;

SELECT * FROM user
WHERE 1=1
-- 	AND gender = 1
    -- AND gender > 1 
    -- AND gender >= 1
	AND gender between 1 and 2 
;

SELECT * FROM user
WHERE 1=1
	AND job = ''
--     AND job = null
;