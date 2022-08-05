use football;

select 
	a.seq,
    a.groupName,
    b.ccOrder,
    b.ccName
from CCG a
inner join CC b on b.CCG_seq = a.seq
;

-- 로그인
select * from user 
WHERE id="himmel" and password="12312"
;

-- 기사 목록
select 
	a.name,
    a.id,
    a.email,
    b.title,
    b.content,
    b.newspaper,
    b.createdAt,
    b.modifiedAt
from user a
inner join article b on b.user_seq = a.seq
;

-- 기사 comment 목록
select 
	c.title,
    b.id,
	a.comment,
    a.createdAt,
    a.modifiedAt
from article_comment a 
inner join user b on b.seq = a.user_seq
left join article c on c.seq = a.article_seq
;

-- 기록 목록
select
	a.seq,
    a.id,
    b.home,
    b.away,
    b.homeScore,
    b.awayScore,
    b.event,
    b.league,
    b.gameDate,
    b.gameDuration,
    b.stadium,
    b.createdAt,
    b.modifiedAt
from user a 
inner join gameScore b on b.user_seq = a.seq
;

-- 기록 Comment 목록
select
	b.id,
	a.comment,
    a.createdAt,
    a.modifiedAt
from gameScore_comment a
inner join user b on b.seq = a.user_seq
;

-- comment 목록
select 
	a.id,
    b.title,
    c.comment as article_comment,
    e.comment as gameScore_comment
from user a
inner join article b on b.user_seq = a.seq
inner join article_comment c on b.user_seq = a.seq
inner join gameScore_comment e on c.user_seq = a.seq
;

select 
	a.id,
    -- b.title,
    c.comment
from user a
-- inner join article b on b.user_seq = a.seq
inner join comment c on c.user_seq = a.seq
;

-- 회원 목록
select
	a.seq,
    b.ccName,
    a.name,
    c.ccName,
    a.id,
    a.tel,
    a.email,
    a.dob,
    a.address,
    a.addressDetail
from user a
left join CC b on b.seq = a.user_div
left join CC c on c.seq = a.gender
left join teamUser d on a.seq = d.team_seq
;