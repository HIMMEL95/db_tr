use SPOPIA_test;

-- 공통코드
select 
	ccg.seq
    ,ccg.ccgName
    ,cc.ccOrder
    ,cc.ccName
from CCG ccg
inner join CC cc on cc.CCG_seq = ccg.seq
;

-- 로그인 
select 
	u.id
    ,u.name
from user u
where id="himmel" AND pwd = "12312"
;

-- 메인.경기목록
select 
	g.seq
    ,g.gameDate
    ,g.gameDuration
	,t1.teamName
    ,t2.teamName
    ,c1.CCName
    ,c2.CCName
from game g
inner join team t1 on t1.seq = g.team_home
inner join team t2 on t2.seq = g.team_away 
inner join CC c1 on c1.seq = g.event
inner join CC c2 on c2.seq = g.league
;

-- 메인.기사목록
select
	a.seq
	,a.title
    ,a.content
    ,a.newspaper
    ,c.CCName
from article a 
inner join CC c on c.seq = a.league
;

select * from game;
-- 게임상세
select
	g.seq
	,g.player_home
    ,g.player_away
    ,g.score_home
    ,g.score_away
    ,g.stadium
    ,g.gameDate
    ,g.gameDuration
    ,c1.CCName
    ,c2.CCName
    ,t1.teamName
    ,t2.teamName
from game g
inner join CC c1 on c1.seq = g.event
inner join CC c2 on c2.seq = g.league
inner join team t1 on t1.seq = g.team_home
inner join team t2 on t2.seq = g.team_away
where g.seq = 4
;

-- 게임상세.댓글
select count(seq) from game_comment;

select
	gc.seq
	,gc.comment
    ,u.id
    ,
CASE
	WHEN TIMESTAMPDIFF(MINUTE, STR_TO_DATE(gc.createdAt, '%Y-%m-%d %H:%i:%s') , NOW()) <= 0 THEN '방금 전'
    WHEN TIMESTAMPDIFF(MINUTE, STR_TO_DATE(gc.createdAt, '%Y-%m-%d %H:%i:%s'), NOW()) < 60 THEN CONCAT(TIMESTAMPDIFF(MINUTE, STR_TO_DATE(gc.createdAt, '%Y-%m-%d %H:%i:%s'), NOW()), '분 전')
    WHEN TIMESTAMPDIFF(HOUR, STR_TO_DATE(gc.createdAt, '%Y-%m-%d %H:%i:%s') , NOW()) < 24 THEN CONCAT(TIMESTAMPDIFF(HOUR, STR_TO_DATE(gc.createdAt, '%Y-%m-%d %H:%i:%s'), NOW()), '시간 전')
    WHEN TIMESTAMPDIFF(DAY, STR_TO_DATE(gc.createdAt, '%Y-%m-%d %H:%i:%s') , NOW()) < 30 THEN CONCAT(TIMESTAMPDIFF(DAY, STR_TO_DATE(gc.createdAt, '%Y-%m-%d %H:%i:%s'), NOW()), '일 전')
    ELSE CONCAT(TIMESTAMPDIFF(MONTH, gc.createdAt, NOW()), '달 전')
END AS AGOTIME
from game_comment gc
inner join user u on u.seq = gc.createdBy
;

select * from article; 

-- 기사상세
select 
	a.seq
	,a.title
	,a.content
    ,a.newspaper
    ,a.reporter
    ,a.createdAt
    ,a.modifiedAt
    ,u.email
from article a
inner join user u on u.seq = a.createdBy
where a.seq = 4
;

-- 기사상세.댓글
select count(seq) from article_comment;

select
	ac.comment
    ,u.id
    ,
CASE
	WHEN TIMESTAMPDIFF(MINUTE, STR_TO_DATE(ac.createdAt, '%Y-%m-%d %H:%i:%s') , NOW()) <= 0 THEN '방금 전'
    WHEN TIMESTAMPDIFF(MINUTE, STR_TO_DATE(ac.createdAt, '%Y-%m-%d %H:%i:%s'), NOW()) < 60 THEN CONCAT(TIMESTAMPDIFF(MINUTE, STR_TO_DATE(ac.createdAt, '%Y-%m-%d %H:%i:%s'), NOW()), '분 전')
    WHEN TIMESTAMPDIFF(HOUR, STR_TO_DATE(ac.createdAt, '%Y-%m-%d %H:%i:%s') , NOW()) < 24 THEN CONCAT(TIMESTAMPDIFF(HOUR, STR_TO_DATE(ac.createdAt, '%Y-%m-%d %H:%i:%s'), NOW()), '시간 전')
    WHEN TIMESTAMPDIFF(DAY, STR_TO_DATE(ac.createdAt, '%Y-%m-%d %H:%i:%s') , NOW()) < 30 THEN CONCAT(TIMESTAMPDIFF(DAY, STR_TO_DATE(ac.createdAt, '%Y-%m-%d %H:%i:%s'), NOW()), '일 전')
    ELSE CONCAT(TIMESTAMPDIFF(MONTH, ac.createdAt, NOW()), '달 전')
END AS AGOTIME
from article_comment ac
inner join user u on u.seq = ac.createdBy
inner join article a on a.seq = ac.article_seq
where a.seq = 4
;

-- 관리자 영역

select * from teamUser;
select * from CC;
-- 회원목록
select
	u.seq
    ,u.name
	,u.id
    ,u.email
    ,u.dob
    ,u.createdAt
    ,u.modifiedAt
    ,c1.CCName
    ,c2.CCName
    ,t.teamName
from user u
inner join CC c1 on c1.seq = u.gender
inner join CC c2 on c2.seq = u.user_div
inner join teamUser tu on tu.user_seq = u.seq
inner join team t on t.seq = tu.team_seq
;