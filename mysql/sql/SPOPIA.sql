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
	b.seq,
    a.title,
    a.newspaper,
    b.name,
    c.ccName,
    a.createdAt,
    a.modifiedAt
from article a
inner join user b on b.seq = a.user_seq
inner join CC c on c.seq = a.event
;

-- 기사 comment 목록
select 
	a.comment,
    b.id,
    a.createdAt,
    a.modifiedAt
from article_comment a 
inner join user b on b.seq = a.user_seq
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
	a.comment,
    b.id,
    a.createdAt,
    a.modifiedAt
from gameScore_comment a
inner join user b on b.seq = a.user_seq
;

-- 회원 목록
select
	a.seq,
    c1.ccName,
    a.name,
    c2.ccName,
    a.id,
    a.tel,
    a.email,
    a.dob,
    a.address,
    a.addressDetail,
    t.teamName
from user a
inner join teamUser u on u.user_seq = a.seq
inner join CC c1 on c1.seq = a.user_div
inner join CC c2 on c2.seq = a.gender
inner join team t on t.seq = u.team_seq
;

-- 팀 목록
select
	a.seq,
    b.leagueName,
    b.teamName
from teamUser a
inner join team b on b.seq = a.team_seq
;