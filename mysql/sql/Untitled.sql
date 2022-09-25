SELECT * FROM SPOPIA_test.article_comment;

select aa.* from (

select 
		g.seq
		,g.abroadNy
		,g.event
		,g.league
		,g.score_home
		,g.score_away
		,g.player_home
		,g.player_away
		,g.stadium
		,g.gameDate
		,g.gameDuration
		,g.createdAt
		,g.modifiedAt
		,g.gcDelNy
		,t1.teamName as team_home
		,t2.teamName as team_away
        from game g
			inner join team t1 on t1.teamSeq = g.team_home
			inner join team t2 on t2.teamSeq = g.team_away
		where 1=1
		ORDER BY 
			g.gameDate DESC
			,g.gameDuration DESC
		limit 99999999999
	) aa
	limit 10 offset 0