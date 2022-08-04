use football;

select
	a.seq,
	a.title,
    a.content,
    b.comment
from article a
left join article_comment b on b.article_seq = a.seq
-- inner join article_comment b on b.article_seq = a.seq
-- join article_comment b on b.article_seq = a.seq
;

-- where 1=1

-- order by

-- group by

-- union
