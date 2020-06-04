-- ����Ʈ ���� ���̺�

CREATE TABLE "POST" (	
    "P_NO" NUMBER(*,0) NOT NULL, 
    "P_ID" VARCHAR2(20 BYTE) NOT NULL, 
    "P_PHOTO" VARCHAR2(100 BYTE), 
    "P_CONTENT" VARCHAR2(2000 BYTE) DEFAULT NULL NOT NULL, 
    "P_REGDATE" TIMESTAMP (6) DEFAULT sysdate NOT NULL, 
    "P_REPLYCNT" NUMBER(*,0) DEFAULT 0 NOT NULL, 
    PRIMARY KEY ("P_NO")
  );
  
select * from post;
// ������ ����

delete from post;
drop sequence post_p_no_seq;
create sequence post_p_no_seq;
  
  
  
  -- ����ū p_no ��������
  SELECT max(p_no) FROM post;
  
  select * from post where p_no<13;
  select * from(
			select rownum rnum, TT.* from (
				select * from post where p_no<8 order by p_no desc
			) TT where rownum <= 5
		) where rnum >= 1;

-- ��� ���̺� 
  CREATE TABLE"REPLY" (	
  "R_NO" NUMBER(*,0) NOT NULL , 
	"R_PNO" NUMBER(*,0), 
	"R_ID" VARCHAR2(20 BYTE), 
	"R_CONTENT" VARCHAR2(1000 BYTE), 
	"R_REGDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"R_REF" NUMBER(*,0), 
	"R_LEV" NUMBER(*,0), 
	"R_SEQ" NUMBER(*,0), 
  PRIMARY KEY ("R_NO")
  );
  
-- ������̺� ������ ����
delete from reply;
drop sequence reply_r_no_seq;
create sequence reply_r_no_seq;
-- ��� ���̺� ������� ����
select * from reply order by R_NO;  
-- ��� ���̺� ���̵�����
insert into reply(r_no, r_pno, r_id, r_content, r_ref, r_lev, r_seq) values(reply_r_no_seq.nextval, 12, 'aaa', '1���Դϴ�.', reply_r_no_seq.currval, 0, 0);
insert into reply(r_no, r_pno, r_id, r_content, r_ref, r_lev, r_seq) values(reply_r_no_seq.nextval, 11, 'bbb', '2���Դϴ�.', reply_r_no_seq.currval, 0, 0);
insert into reply(r_no, r_pno, r_id, r_content, r_ref, r_lev, r_seq) values(reply_r_no_seq.nextval, 10, 'ccc', '3���Դϴ�.', reply_r_no_seq.currval, 0, 0);
insert into reply(r_no, r_pno, r_id, r_content, r_ref, r_lev, r_seq) values(reply_r_no_seq.nextval, 12, 'ddd', '4���Դϴ�.', reply_r_no_seq.currval, 0, 0);
insert into reply(r_no, r_pno, r_id, r_content, r_ref, r_lev, r_seq) values(reply_r_no_seq.nextval, 11, 'eee', '5���Դϴ�.', reply_r_no_seq.currval, 0, 0);

  
  --ȸ�����̺�
  CREATE TABLE "MEMBER" (	
  "M_NO" NUMBER(*,0) NOT NULL, 
	"M_ID" VARCHAR2(20 BYTE) NOT NULL, 
	"M_PW" VARCHAR2(20 BYTE) NOT NULL, 
	"M_EMAIL" VARCHAR2(40 BYTE), 
	"M_BIRTH" NUMBER(*,0), 
	"M_GENDER" CHAR(1 BYTE), 
	"M_PHONE" VARCHAR2(20 BYTE), 
	"M_PROFILE" VARCHAR2(20 BYTE),
  PRIMARY KEY ("M_NO")
  );
  
  --ȸ�����̺� ������ ����
  delete from member;
  drop sequence member_m_no_seq;
  create sequence member_m_no_seq;

  -- ȸ�����̺� ���̵�����
  insert into member(m_no, m_id, m_pw, m_profile) values(member_m_no_seq.nextval, 'a1a1a1', 'a1a1a1', 'a1a1a1_001');
  insert into member(m_no, m_id, m_pw, m_profile) values(member_m_no_seq.nextval, 'b2b2b2', 'b2b2b2', 'b2b2b2_001');
  insert into member(m_no, m_id, m_pw, m_profile) values(member_m_no_seq.nextval, 'c3c3c3', 'c3c3c3', 'c3c3c3_001');
  insert into member(m_no, m_id, m_pw, m_profile) values(member_m_no_seq.nextval, 'd4d4d4', 'd4d4d4', 'd4d4d4_001');

  