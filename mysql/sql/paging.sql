use SPOPIA_test;

select
	cg.ccgSeq
    ,cg.ifcgAnother
    ,cg.ifcgName
    ,cg.ifcgNameEng
    ,(select count(c.ccSeq) from code c where c.codeGroup_ccgSeq = cg.ccgSeq) as count
    ,cg.createdAt
    ,cg.modifiedAt
from codeGroup cg
where 1=1
	and cg.ccgSeq > 0
    order by cg.ccgSeq desc, cg.createdAt desc
;

