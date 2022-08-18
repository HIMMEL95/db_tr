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
where 1=1
	AND id="himmel" 
    AND pwd = "12312"
;

-- 메인.경기목록
select 
	g.seq
    ,g.gameDate
    ,g.gameDuration
    ,g.event
    ,g.league
	,t1.teamName
    ,t2.teamName
from 
	game g
	inner join team t1 on t1.seq = g.team_home
	inner join team t2 on t2.seq = g.team_away 
order by
	g.gameDate
;

-- 메인.기사목록
select
	a.seq
	,a.title
    ,a.content
    ,a.newspaper
    ,a.league
from 
	article a 
order by
	a.createdAt
;

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
    ,g.event
    ,g.league
    ,t1.teamName
    ,t2.teamName
from 
	game g
	inner join team t1 on t1.seq = g.team_home
	inner join team t2 on t2.seq = g.team_away
where 1=1
	and g.seq = 4
;

-- 게임상세.댓글
select count(seq) from game_comment;

select
	gc.seq
	,gc.comment
    ,gc.createdAt
    ,(select u.id from user u where 1=1 and u.seq = gc.createdBy) as userID
from 
	game_comment gc
order by 
	gc.createdAt
;

-- 기사상세
select 
	a.seq
	,a.title
	,a.content
    ,a.newspaper
    ,a.reporter
    ,a.createdAt
    ,a.modifiedAt
    ,(select u.email from user u where 1=1 and u.seq = a.createdBy) as email
from 
	article a
	inner join user u on u.seq = a.createdBy
where 1=1
	and a.seq = 2
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
    ,(select u.id from user u where 1=1 and u.seq = ac.createdBy) as userID
from 
	article_comment ac
	inner join article a on a.seq = ac.article_seq
where 1=1
	and a.seq = 2
;

-- 기사상세.댓글.댓글
select 
	count(acs.seq)
from 
	article_comments acs
where 1=1
	and acs.article_comment_seq = 8
;

select
	acs.comment
    ,acs.createdAt
    ,(select u.id from user u where 1=1 and u.seq = acs.createdBy) as userID
from 
	article_comments acs
where 1=1
	and acs.article_comment_seq = 8
;

-- 관리자 영역

-- Dashboard.성별가입자수
select
	u.gender as 성별
	,count(u.gender)
from user u 
where 1=1
	and u.gender = 5
    or u.gender = 6
group by
	u.gender
;

-- 남여인원수
select
	u.gender
	,count(u.gender) as 인원
from 
	user u 
group by 
	u.gender
;

-- 회원목록
select
	u.seq
    ,u.name
	,u.id
    ,u.email
    ,u.dob
    ,u.gender
    ,u.user_div
    ,u.createdAt
    ,u.modifiedAt
    ,(select t.teamName from team t where 1=1 and t.seq = tu.team_seq) as team
from 
	user u
	inner join teamUser tu on tu.user_seq = u.seq
where 1=1
	and tu.defaultNY = 0
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
    ,u.gender
    ,u.job
    ,(select t.teamName from team t where 1=1 and t.seq = tu.team_seq) as Team
from 
	user u
	inner join teamUser tu on tu.user_seq = u.seq
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
    ,a.event
from 
	article a
order by
	a.createdAt
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
    ,u.gender
from 
	article_comment ac
	inner join user u on u.seq = ac.createdBy
order by
	ac.article_seq
	,ac.createdAt
;

-- 게임 댓글
select
	gc.seq
    ,gc.comment
    ,gc.createdAt
    ,gc.modifiedAt
    ,u.name
    ,u.id
    ,u.gender
from game_comment gc
	inner join user u on u.seq = gc.createdBy
order by 
	gc.game_seq
    ,gc.createdAt
;

-- 댓글
(select 
	ac.seq
    ,ac.comment
    ,ac.createdAt
    ,ac.modifiedAt
    ,u.name
    ,u.id
    ,u.gender
from 
	article_comment ac
	inner join user u on u.seq = ac.createdBy
order by
	ac.article_seq
	,ac.createdAt)
union all
(select
	gc.seq
    ,gc.comment
    ,gc.createdAt
    ,gc.modifiedAt
    ,u.name
    ,u.id
    ,u.gender
from game_comment gc
	inner join user u on u.seq = gc.createdBy
order by 
	gc.game_seq
    ,gc.createdAt)
order by
	createdAt
;

-- 게임관리
select 
	g.seq
    ,g.event
    ,g.score_home
    ,g.score_away
    ,g.player_home
    ,g.player_away
    ,g.stadium
    ,g.gameDate
    ,g.gameDuration
    ,g.createdAt
    ,g.modifiedAt
    ,t1.teamName
    ,t2.teamName
from game g
	inner join team t1 on t1.seq = g.team_home
	inner join team t2 on t2.seq = g.team_away
order by 
	g.gameDate
    ,g.gameDuration
;
