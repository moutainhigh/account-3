/*************************************
������:�˻����ױ�
�ֶ�ǰ׺:ACD
����޸���:genghs
*************************************/
DROP TABLE IF EXISTS ACCOUNTRECORD;

CREATE TABLE ACCOUNTRECORD
(
	ACD_SERIALNO		VARCHAR(30)	NOT NULL,	/*��ˮ��*/
	ACD_ACCOUNTNO		VARCHAR(20)	NOT NULL,	/*�˺�*/
	ACD_TRANTIME		CHAR(14)	NOT NULL,	/*����ʱ��*/
	ACD_TRANTYPE		CHAR(2)		NOT NULL,	/*��������*/
	ACD_OTHERACCOUNTNO	VARCHAR(20)	,	/*�Է��˺�*/
	ACD_OTHERACCOUNTNAME	VARCHAR(60)	,	/*�Է�����*/
	ACD_AMOUNT		DECIMAL(18,2)	NOT NULL,	/*���׽���������*/
	ACD_BALANCE		DECIMAL(18,2)	NOT NULL,	/*���*/
	ACD_CHANNELSYSTEMNO	VARCHAR(30)	,	/*����ϵͳ��*/
	ACD_CHANNELSERIALNO	VARCHAR(30)	,	/*������ˮ��*/
	ACD_STATUS		VARCHAR(2)	DEFAULT 0	NOT NULL,	/*״̬*/
	PRIMARY KEY (ACD_SERIALNO)
)DEFAULT CHARSET=utf8;