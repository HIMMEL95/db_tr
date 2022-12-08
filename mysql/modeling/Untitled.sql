SELECT * FROM tasteZip.chatUser;
use tasteZip;
SELECT
	cu.cuChatSeq as chatSeq
FROM chatUser cu
JOIN chat ct ON ct.chatSeq = cu.cuChatSeq
AND ct.chatDelNy = 0
WHERE 1=1
	AND cu.cuMember = 17
	AND cu.cuChatSeq = 79
;

(select max(cuChatSeq) from chatUser)