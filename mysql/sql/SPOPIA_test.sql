use SPOPIA_test;

-- 공통코드
select 
	ccg.seq
    ,ccg.ccgName
    ,cc.ccOrder
    ,cc.ccName
from 
	CCG ccg
inner join CC cc on cc.CCG_seq = ccg.seq
;

-- 로그인 
select 
	u.id
    ,u.name
from 
	user u
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
from 
	game g
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
from 
	article a 
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
from 
	game g
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
    ,gc.createdAt
    ,u.id
from 
	game_comment gc
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
from 
	article a
inner join user u on u.seq = a.createdBy
where a.seq = 2
;

-- 기사상세.댓글
select 
	(select count(ac.seq) from article_comment as ac)
    +
    (select count(acs.seq) from article_comments as acs) as count
;

select
	ac.comment
    ,ac.createdAt
    ,u.id
from 
	article_comment ac
inner join user u on u.seq = ac.createdBy
inner join article a on a.seq = ac.article_seq
where a.seq = 2
;

-- 기사상세.댓글.댓글
select 
	count(acs.seq)
from article_comments acs
where acs.article_comment_seq = 8
;

select
	acs.comment
    ,acs.createdAt
    ,u.id
from article_comments acs
inner join user u on u.seq = acs.createdBy
where acs.article_comment_seq = 8
;

select * from CC;

-- 관리자 영역

-- Dashboard.성별가입자수

-- 남성수
select
	u.gender as 성별
	,count(u.gender)
from user u 
-- inner join CC c1 on c1.seq = u.gender
where 1=1
	and u.gender = 5
    or u.gender = 6
group by
	u.gender
;

-- 남여인원수
select
	c1.CCName
	,count(u.gender) as 인원
from 
	user u 
	inner join CC c1 on c1.seq = u.gender
group by u.gender
;

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
from 
	user u
inner join CC c1 on c1.seq = u.gender
inner join CC c2 on c2.seq = u.user_div
inner join teamUser tu on tu.user_seq = u.seq
inner join team t on t.seq = tu.team_seq
;

-- 회원상세
select
	u.name
    ,u.id
    ,u.dob
    ,u.email
    ,u.phone
    ,u.zip
    ,u.address
    ,u.address_detail
    ,c1.CCName
    ,u.job
    ,t.teamName
from 
	user u
inner join CC c1 on c1.seq = u.gender
inner join teamUser tu on tu.user_seq = u.seq
inner join team t on t.seq = tu.team_seq
where 1=1
	AND u.seq = 1
;

-- 기사목록
select
	a.seq
    ,a.title
    ,a.reporter
    ,a.newspaper
    ,a.createdAt
    ,a.modifiedAt
    ,c1.CCName
from 
	article a
inner join CC c1 on c1.seq = a.event
;

-- 댓글 리스트

-- 기사 댓글
select 
	ac.seq
    ,ac.comment
    ,ac.createdAt
    ,ac.modifiedAt
    ,u.name
    ,u.id
    ,c1.CCName
from 
	article_comment ac
inner join user u on u.seq = ac.createdBy
inner join CC c1 on c1.seq = u.gender
;

-- 게임 댓글
select
	gc.seq
    ,gc.comment
    ,gc.createdAt
    ,gc.modifiedAt
    ,u.name
    ,u.id
    ,c1.CCName
from game_comment gc
inner join user u on u.seq = gc.createdBy
inner join CC c1 on c1.seq = u.gender
;

-- 게임관리
select 
	g.seq
    ,g.score_home
    ,g.score_away
    ,g.player_home
    ,g.player_away
    ,g.stadium
    ,g.gameDate
    ,g.gameDate
    ,g.createdAt
    ,g.modifiedAt
    ,c1.CCName
    ,t1.teamName
    ,t2.teamName
from game g
inner join CC c1 on c1.seq = g.event
inner join team t1 on t1.seq = g.team_home
inner join team t2 on t2.seq = g.team_away
;
