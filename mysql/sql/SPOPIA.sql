use football;


-- 공통코드
select 
	a.seq,
    a.groupName,
    b.ccOrder,
    b.ccName
from CCG a
inner join CC b on b.CCG_seq = a.seq
;

-- 로그인
select 
	u.id,
    u.name
from user u
WHERE id="himmel" and password="12312"
;

-- 메인.기록목록
select 
	gs.seq,
    gs.event,
    gs.league,
    t1.teamName,
    t2.teamName,
    gs.gameDate,
    gs.gameDuration
from gameScore gs
inner join team t1 on t1.seq = gs.home_team
inner join team t2 on t2.seq = gs.away_team 
;

-- 메인.기사목록
select
	a.seq,
    a.title,
    a.content,
    a.newspaper,
    t.leagueName
from article a
inner join team t on t.event = a.event
;

-- 기록상세
select
	t1.teamName,
    t2.teamName,
    gs.gameDate,
    gs.gameDuration,
	gs.stadium
from gameScore gs
inner join team t1 on t1.seq = gs.away_team
inner join team t2 on t2.seq = gs.home_team
where gs.seq = 4
;

-- 기록상세댓글
select count(seq) from gameScore_comment;

select 
	u.id,
	gsc.comment,
    sysdate(),
    gsc.createdAt,
    minute(now() - gsc.createdAt)
from gameScore_comment gsc
inner join user u on u.seq = gsc.user_seq
;

-- 기사상세
select
	a.title,
    a.newspaper,
    a.content,
    a.reporter,
    a.createdAt,
    a.modifiedAt
from article a 
where a.seq = 1
;

-- 기사상세댓글
select 
	count(ac.seq)
from article_comment ac
inner join article a on a.seq = ac.article_seq
where a.seq = 1
;

select
	u.id,
	ac.comment,
    ac.createdAt
from article_comment ac
inner join user u on u.seq = ac.user_seq
inner join article a on a.seq = ac.article_seq
where a.seq = 1
;

-- 회원 목록
select
	a.seq,
    c1.ccName as 등급,
    a.name as 이름,
    c2.ccName as 성별,
    a.id as 아이디,
    a.email as 이메일,
    a.dob as 생년월일,
    t.teamName as 좋아하는팀,
    a.createdAt as 등록일,
    a.modifiedAt as 수정일
from user a
inner join teamUser u on u.user_seq = a.seq
inner join CC c1 on c1.seq = a.user_div
inner join CC c2 on c2.seq = a.gender
inner join team t on t.seq = u.team_seq
;

-- 기사 목록
select
	a.seq as 번호,
    c.ccName as 종목,
    a.title as 제목,
    a.newspaper as 신문사,
    b.name as 기자,
    a.createdAt as 등록일,
    a.modifiedAt as 수정일
from article a
inner join user b on b.seq = a.user_seq
inner join CC c on c.seq = a.event
;

-- 기사 comment 목록
select 
	a.seq as 번호,
    b.name as 이름,
    c.ccName as 성별,
	b.id as 아이디,
	a.comment as 내용,
    a.createdAt,
    a.modifiedAt
from article_comment a 
inner join user b on b.seq = a.user_seq
inner join CC c on c.seq = b.gender
;

-- 기록 목록
select
	a.seq,
    a.event,
    a.league,
    b1.teamName as homeTeam,
	b2.teamName as awyaTeam,
    a.homeScore,
    a.awayScore,
    a.stadium,
    a.gameDate,
    a.gameDuration,
    a.createdAt,
    a.modifiedAt
from gameScore a 
inner join team b1 on b1.seq = a.home_team
inner join team b2 on b2.seq = a.away_team
;

-- 기록 Comment 목록
select
	a.seq as 번호,
    b.name as 이름,
    c.ccName as 성별,
    b.id as 아이디,
	a.comment as 내용,
    a.createdAt as 등록일,
    a.modifiedAt as 수정일
from gameScore_comment a
inner join user b on b.seq = a.user_seq
inner join CC c on c.seq = b.gender
;

-- 관리자 영역

-- 성별 가입자 수 
select	
	seq,
	gender
from user
;

select 
	count(c.ccName) 
from user u
inner join CC c on c.seq = u.gender
where c.ccName like "남성"
;

select 
	count(c.ccName) 
from user u
inner join CC c on c.seq = u.gender
where c.ccName like "여성"
;

select 
	count(u.createdAt)
from user u
where u.createdAt = sysdate()
;

