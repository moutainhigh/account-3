-- ------------------------------------
--  ������--���к���Ϣ��
-- ------------------------------------
DROP TABLE IF EXISTS sequence;
CREATE TABLE sequence
(
	seq_type	varchar(20)		NOT NULL,	-- ���к���
	seq_no		bigint(20)		NOT NULL,	-- ���к�ֵ����ʼʱ��һλӦΪ1
	seq_length	tinyint(2)		NOT NULL,	-- ���к�λ��
	PRIMARY KEY (seq_type)
)DEFAULT CHARSET=utf8;

INSERT INTO sequence VALUES ('serialNo',100000000000,12);
INSERT INTO sequence VALUES ('accountNo',10000000,8);
INSERT INTO sequence VALUES ('clearNo',1000000000,10);



DROP FUNCTION IF EXISTS getSequence;
-- �����������кŵĺ���
DELIMITER $
CREATE FUNCTION getSequence ( in_type varchar(20) ) RETURNS varchar(60)
NOT DETERMINISTIC
READS SQL DATA
BEGIN
DECLARE thisFlowNo bigint(20);
UPDATE sequence SET seq_no =
(
select tmp.thisFlowNo from (
SELECT seq_no,seq_length,
(CASE WHEN (POWER(10,seq_length)-seq_no=1) THEN POWER(10,seq_length-1)ELSE  seq_no + 1 END) thisFlowNo FROM sequence WHERE  seq_type = in_type
)
tmp
)
 WHERE  seq_type = in_type;


select seq_no into thisFlowNo from sequence WHERE seq_type = in_type;

RETURN CONCAT(DATE_FORMAT(now(), '%Y%m%d'),thisFlowNo);
END
$
DELIMITER ;