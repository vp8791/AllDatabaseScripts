
CREATE TABLE USER_DETAILS 
   (	"ID" NUMBER(20,0) NOT NULL ENABLE, 
	"BIRTH_DATE" DATE, 
	"NAME" VARCHAR2(255), 
	PRIMARY KEY ("ID")
  );

CREATE TABLE USER_POSTS 
   (	
    "ID" NUMBER(20,0) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(255), 
	"USER_ID" NUMBER(20,0) NOT NULL, 
	 PRIMARY KEY ("ID"),
	 CONSTRAINT "POST_FK1"
	  FOREIGN KEY ("USER_ID")
	  REFERENCES "USER_DETAILS" ("ID")
   );
   
    CREATE TABLE LOGIN_USERS 
   (	"USERNAME" VARCHAR2(50) NOT NULL ENABLE, 
	"PASSWORD" VARCHAR2(200) NOT NULL ENABLE, 
	"ENABLED" NUMBER(1,0) NOT NULL ENABLE, 
	 PRIMARY KEY ("USERNAME")
   );
   
     CREATE TABLE AUTHORITIES 
   (	"USERNAME" VARCHAR2(50), 
		"AUTHORITY" VARCHAR2(20), 
	 	CONSTRAINT "AUTHORITIES_FK1" 
	 	FOREIGN KEY ("USERNAME")
	  	REFERENCES "LOGIN_USERS" ("USERNAME")
   );


Insert into LOGIN_USERS (USERNAME,PASSWORD,ENABLED) values ('admin','$2a$10$hbxecwitQQ.dDT4JOFzQAulNySFwEpaFLw38jda6Td.Y/cOiRzDFu',1);
Insert into AUTHORITIES (USERNAME,AUTHORITY) values ('admin','ROLE_ADMIN');


INSERT INTO USER_DETAILS (ID, BIRTH_DATE, NAME) VALUES ('1', TO_DATE('1950-11-17 08:39:15', 'YYYY-MM-DD HH24:MI:SS'), 'Testing Name1');
INSERT INTO USER_DETAILS (ID, BIRTH_DATE, NAME) VALUES ('2', TO_DATE('1970-11-13 08:39:49', 'YYYY-MM-DD HH24:MI:SS'), 'Testing Name 2');

INSERT INTO USER_POSTS (ID, DESCRIPTION, USER_ID) VALUES ('10', 'Shopped in Romania', '1');
INSERT INTO USER_POSTS (ID, DESCRIPTION, USER_ID) VALUES ('11', '5 Atm with drawals in 3 hours', '1');
INSERT INTO USER_POSTS (ID, DESCRIPTION, USER_ID) VALUES ('12', 'Shopped within credit Limit thrice in Last 3 months ', '1');
INSERT INTO USER_POSTS (ID, DESCRIPTION, USER_ID) VALUES ('13', 'Shopped at Suspicious Mcc Terminal', '1');
INSERT INTO USER_POSTS (ID, DESCRIPTION, USER_ID) VALUES ('14', 'Failed login Pin attempts', '2');
INSERT INTO USER_POSTS (ID, DESCRIPTION, USER_ID) VALUES ('15', 'Reported disputed transactions', '2');
INSERT INTO USER_POSTS (ID, DESCRIPTION, USER_ID) VALUES ('16', 'Used Overdraft many times', '2');
INSERT INTO USER_POSTS (ID, DESCRIPTION, USER_ID) VALUES ('17', 'Has Police warnings about inpersonation of accont', '2');


commit;

CREATE SEQUENCE POST_SEQUENCE  START WITH 10000 INCREMENT BY 1;
CREATE SEQUENCE USER_SEQUENCE START WITH 100 INCREMENT BY 1;


CREATE TABLE AUTHORITY (ID NUMBER(19) NOT NULL, NAME VARCHAR2(50) NULL, PRIMARY KEY (ID));
CREATE TABLE USERS (ID NUMBER(19) NOT NULL, EMAIL VARCHAR2(50) NULL, ENABLED NUMBER(1) default 0 NULL, FIRSTNAME VARCHAR2(50) NULL, LASTPASSWORDRESETDATE TIMESTAMP NULL, LASTNAME VARCHAR2(50) NULL, PASSWORD VARCHAR2(100) NULL, USERNAME VARCHAR2(50) NULL UNIQUE, PRIMARY KEY (ID));

CREATE TABLE USER_AUTHORITY (AUTHORITY_ID NUMBER(19) NOT NULL, USER_ID NUMBER(19) NOT NULL, PRIMARY KEY (AUTHORITY_ID, USER_ID));
ALTER TABLE USER_AUTHORITY ADD CONSTRAINT FK_USER_AUTHORITY_USER_ID FOREIGN KEY (USER_ID) REFERENCES USERS (ID);
ALTER TABLE USER_AUTHORITY ADD CONSTRAINT FK_USER_AUTHORITY_AUTHORITY_ID FOREIGN KEY (AUTHORITY_ID) REFERENCES AUTHORITY (ID);

CREATE TABLE SECURITY_SETTINGS (ID NUMBER(19) NOT NULL, KEY VARCHAR2(50) NULL,  VALUE VARCHAR2(50) NULL, PRIMARY KEY (ID));


INSERT INTO SECURITY_SETTINGS (ID, KEY, VALUE) VALUES ('1', 'jwt.expiration.in.minutes', '525600');
INSERT INTO SECURITY_SETTINGS (ID, KEY, VALUE) VALUES ('2', 'jwt.secret', 'mySecret');



INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (1, 'admin', '$2a$08$lDnHPz7eUkSi6ao14Twuau08mzhWrL4kyZGGU5xfiGALO/Vxd5DOi', 'admin', 'admin', 'admin@admin.com', 1, sysdate);
INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (2, 'user', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'user', 'user', 'enabled@user.com', 1, sysdate);
INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (3, 'alerts', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'alerts', 'alerts', 'alerts@user.com', 1, sysdate);
INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (4, 'rules', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'rules', 'rules', 'rules@user.com', 1, sysdate);
INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (5, 'hierarical', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'hierarical', 'hierarical', 'hierarical@user.com', 1, sysdate);
INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (6, 'cpp', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'cpp', 'cpp', 'rules@user.com', 1, sysdate);
INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (7, 'configuration', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'configuration', 'configuration', 'rules@user.com', 1, sysdate);
INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (8, 'grid', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'grid', 'grid', 'grid@user.com', 1, sysdate);
INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (9, 'search', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'search', 'search', 'search@user.com', 1, sysdate);
INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (10, 'dashboard', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'rules', 'rules', 'rules@user.com', 1, sysdate);
INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (11, 'disabled', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'user', 'user', 'disabled@user.com', 0, sysdate);




INSERT INTO AUTHORITY (ID, NAME) VALUES (1, 'ROLE_USER');
INSERT INTO AUTHORITY (ID, NAME) VALUES (2, 'ROLE_ADMIN');
INSERT INTO AUTHORITY (ID, NAME) VALUES (3, 'ROLE_ALERTS');
INSERT INTO AUTHORITY (ID, NAME) VALUES (4, 'ROLE_RULES');
INSERT INTO AUTHORITY (ID, NAME) VALUES (5, 'ROLE_HIERARICALMANAGEMENT');
INSERT INTO AUTHORITY (ID, NAME) VALUES (6, 'ROLE_CPP');
INSERT INTO AUTHORITY (ID, NAME) VALUES (7, 'ROLE_CONFIGURATION');
INSERT INTO AUTHORITY (ID, NAME) VALUES (8, 'ROLE_GRID');
INSERT INTO AUTHORITY (ID, NAME) VALUES (9, 'ROLE_SEARCH');
INSERT INTO AUTHORITY (ID, NAME) VALUES (10, 'ROLE_DASHBOARD');



INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (1, 1);
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (1, 2);
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (1, 3);
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (1, 4 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (1, 5 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (1, 6 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (1, 7 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (1, 8 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (1, 9 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (1, 10 );



INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (3, 3 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (4, 4 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (5, 5 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (6, 6 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (7, 7 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (8, 8 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (9, 9 );
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_ID) VALUES (10, 10 );

commit;



CREATE SEQUENCE user_seq START WITH 1;
CREATE SEQUENCE authority_seq START WITH 1;



--------------------------------------------------------
--  File created - Release 4.3    
--------------------------------------------------------

  CREATE TABLE BATCH_JOB_EXECUTION
   (	"JOB_EXECUTION_ID" NUMBER(19,0), 
	"VERSION" NUMBER(19,0), 
	"JOB_INSTANCE_ID" NUMBER(19,0), 
	"CREATE_TIME" TIMESTAMP (6), 
	"START_TIME" TIMESTAMP (6) DEFAULT NULL, 
	"END_TIME" TIMESTAMP (6) DEFAULT NULL, 
	"STATUS" VARCHAR2(10 CHAR), 
	"EXIT_CODE" VARCHAR2(2500 CHAR), 
	"EXIT_MESSAGE" VARCHAR2(2500 CHAR), 
	"LAST_UPDATED" TIMESTAMP (6), 
	"JOB_CONFIGURATION_LOCATION" VARCHAR2(2500 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BATCH_JOB_INSTANCE
--------------------------------------------------------

  CREATE TABLE BATCH_JOB_INSTANCE
   (	"JOB_INSTANCE_ID" NUMBER(19,0), 
	"VERSION" NUMBER(19,0), 
	"JOB_NAME" VARCHAR2(100 CHAR), 
	"JOB_KEY" VARCHAR2(32 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BATCH_JOB_EXECUTION_PARAMS
--------------------------------------------------------

  CREATE TABLE BATCH_JOB_EXECUTION_PARAMS
   (	"JOB_EXECUTION_ID" NUMBER(19,0), 
	"TYPE_CD" VARCHAR2(6 CHAR), 
	"KEY_NAME" VARCHAR2(100 CHAR), 
	"STRING_VAL" VARCHAR2(250 CHAR), 
	"DATE_VAL" TIMESTAMP (6) DEFAULT NULL, 
	"LONG_VAL" NUMBER(19,0), 
	"DOUBLE_VAL" NUMBER, 
	"IDENTIFYING" CHAR(1 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BATCH_JOB_EXECUTION_CONTEXT
--------------------------------------------------------

  CREATE TABLE BATCH_JOB_EXECUTION_CONTEXT
   (	"JOB_EXECUTION_ID" NUMBER(19,0), 
	"SHORT_CONTEXT" VARCHAR2(2500 CHAR), 
	"SERIALIZED_CONTEXT" CLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("SERIALIZED_CONTEXT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table BATCH_STEP_EXECUTION
--------------------------------------------------------

  CREATE TABLE BATCH_STEP_EXECUTION 
   (	"STEP_EXECUTION_ID" NUMBER(19,0), 
	"VERSION" NUMBER(19,0), 
	"STEP_NAME" VARCHAR2(100 CHAR), 
	"JOB_EXECUTION_ID" NUMBER(19,0), 
	"START_TIME" TIMESTAMP (6), 
	"END_TIME" TIMESTAMP (6) DEFAULT NULL, 
	"STATUS" VARCHAR2(10 CHAR), 
	"COMMIT_COUNT" NUMBER(19,0), 
	"READ_COUNT" NUMBER(19,0), 
	"FILTER_COUNT" NUMBER(19,0), 
	"WRITE_COUNT" NUMBER(19,0), 
	"READ_SKIP_COUNT" NUMBER(19,0), 
	"WRITE_SKIP_COUNT" NUMBER(19,0), 
	"PROCESS_SKIP_COUNT" NUMBER(19,0), 
	"ROLLBACK_COUNT" NUMBER(19,0), 
	"EXIT_CODE" VARCHAR2(2500 CHAR), 
	"EXIT_MESSAGE" VARCHAR2(2500 CHAR), 
	"LAST_UPDATED" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BATCH_STEP_EXECUTION_CONTEXT
--------------------------------------------------------

  CREATE TABLE BATCH_STEP_EXECUTION_CONTEXT 
   (	"STEP_EXECUTION_ID" NUMBER(19,0), 
	"SHORT_CONTEXT" VARCHAR2(2500 CHAR), 
	"SERIALIZED_CONTEXT" CLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("SERIALIZED_CONTEXT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Index SYS_C0012237
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0012237" ON "BATCH_JOB_EXECUTION" ("JOB_EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0012232
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0012232" ON "BATCH_JOB_INSTANCE" ("JOB_INSTANCE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JOB_INST_UN
--------------------------------------------------------

  CREATE UNIQUE INDEX "JOB_INST_UN" ON "BATCH_JOB_INSTANCE" ("JOB_NAME", "JOB_KEY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0012257
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0012257" ON "BATCH_JOB_EXECUTION_CONTEXT" ("JOB_EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0012249
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0012249" ON "BATCH_STEP_EXECUTION" ("STEP_EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0012253
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0012253" ON "BATCH_STEP_EXECUTION_CONTEXT" ("STEP_EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BATCH_JOB_EXECUTION
--------------------------------------------------------

  ALTER TABLE "BATCH_JOB_EXECUTION" ADD PRIMARY KEY ("JOB_EXECUTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BATCH_JOB_EXECUTION" MODIFY ("CREATE_TIME" NOT NULL ENABLE);
  ALTER TABLE "BATCH_JOB_EXECUTION" MODIFY ("JOB_INSTANCE_ID" NOT NULL ENABLE);
  ALTER TABLE "BATCH_JOB_EXECUTION" MODIFY ("JOB_EXECUTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BATCH_JOB_INSTANCE
--------------------------------------------------------

  ALTER TABLE "BATCH_JOB_INSTANCE" ADD CONSTRAINT "JOB_INST_UN" UNIQUE ("JOB_NAME", "JOB_KEY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BATCH_JOB_INSTANCE" ADD PRIMARY KEY ("JOB_INSTANCE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BATCH_JOB_INSTANCE" MODIFY ("JOB_KEY" NOT NULL ENABLE);
  ALTER TABLE "BATCH_JOB_INSTANCE" MODIFY ("JOB_NAME" NOT NULL ENABLE);
  ALTER TABLE "BATCH_JOB_INSTANCE" MODIFY ("JOB_INSTANCE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BATCH_JOB_EXECUTION_PARAMS
--------------------------------------------------------

  ALTER TABLE "BATCH_JOB_EXECUTION_PARAMS" MODIFY ("IDENTIFYING" NOT NULL ENABLE);
  ALTER TABLE "BATCH_JOB_EXECUTION_PARAMS" MODIFY ("KEY_NAME" NOT NULL ENABLE);
  ALTER TABLE "BATCH_JOB_EXECUTION_PARAMS" MODIFY ("TYPE_CD" NOT NULL ENABLE);
  ALTER TABLE "BATCH_JOB_EXECUTION_PARAMS" MODIFY ("JOB_EXECUTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BATCH_JOB_EXECUTION_CONTEXT
--------------------------------------------------------

  ALTER TABLE "BATCH_JOB_EXECUTION_CONTEXT" ADD PRIMARY KEY ("JOB_EXECUTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BATCH_JOB_EXECUTION_CONTEXT" MODIFY ("SHORT_CONTEXT" NOT NULL ENABLE);
  ALTER TABLE "BATCH_JOB_EXECUTION_CONTEXT" MODIFY ("JOB_EXECUTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BATCH_STEP_EXECUTION
--------------------------------------------------------

  ALTER TABLE "BATCH_STEP_EXECUTION" ADD PRIMARY KEY ("STEP_EXECUTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BATCH_STEP_EXECUTION" MODIFY ("START_TIME" NOT NULL ENABLE);
  ALTER TABLE "BATCH_STEP_EXECUTION" MODIFY ("JOB_EXECUTION_ID" NOT NULL ENABLE);
  ALTER TABLE "BATCH_STEP_EXECUTION" MODIFY ("STEP_NAME" NOT NULL ENABLE);
  ALTER TABLE "BATCH_STEP_EXECUTION" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "BATCH_STEP_EXECUTION" MODIFY ("STEP_EXECUTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BATCH_STEP_EXECUTION_CONTEXT
--------------------------------------------------------

  ALTER TABLE "BATCH_STEP_EXECUTION_CONTEXT" ADD PRIMARY KEY ("STEP_EXECUTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BATCH_STEP_EXECUTION_CONTEXT" MODIFY ("SHORT_CONTEXT" NOT NULL ENABLE);
  ALTER TABLE "BATCH_STEP_EXECUTION_CONTEXT" MODIFY ("STEP_EXECUTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BATCH_JOB_EXECUTION
--------------------------------------------------------

  ALTER TABLE "BATCH_JOB_EXECUTION" ADD CONSTRAINT "JOB_INST_EXEC_FK" FOREIGN KEY ("JOB_INSTANCE_ID")
	  REFERENCES "BATCH_JOB_INSTANCE" ("JOB_INSTANCE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BATCH_JOB_EXECUTION_PARAMS
--------------------------------------------------------

  ALTER TABLE "BATCH_JOB_EXECUTION_PARAMS" ADD CONSTRAINT "JOB_EXEC_PARAMS_FK" FOREIGN KEY ("JOB_EXECUTION_ID")
	  REFERENCES "BATCH_JOB_EXECUTION" ("JOB_EXECUTION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BATCH_JOB_EXECUTION_CONTEXT
--------------------------------------------------------

  ALTER TABLE "BATCH_JOB_EXECUTION_CONTEXT" ADD CONSTRAINT "JOB_EXEC_CTX_FK" FOREIGN KEY ("JOB_EXECUTION_ID")
	  REFERENCES "BATCH_JOB_EXECUTION" ("JOB_EXECUTION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BATCH_STEP_EXECUTION
--------------------------------------------------------

  ALTER TABLE "BATCH_STEP_EXECUTION" ADD CONSTRAINT "JOB_EXEC_STEP_FK" FOREIGN KEY ("JOB_EXECUTION_ID")
	  REFERENCES "BATCH_JOB_EXECUTION" ("JOB_EXECUTION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BATCH_STEP_EXECUTION_CONTEXT
--------------------------------------------------------

  ALTER TABLE "BATCH_STEP_EXECUTION_CONTEXT" ADD CONSTRAINT "STEP_EXEC_CTX_FK" FOREIGN KEY ("STEP_EXECUTION_ID")
	  REFERENCES "BATCH_STEP_EXECUTION" ("STEP_EXECUTION_ID") ENABLE;

--------------------------------------------------------
--  File created - Release  4.3    
--------------------------------------------------------

CREATE TABLE ACQUIRER_SETTLEMENTS 
(
  CREDIT_CARD_NUMBER VARCHAR2(16 BYTE) NOT NULL
 , ORDER_DATE VARCHAR2(45 BYTE) NOT NULL
 , AMOUNT VARCHAR2(16 BYTE) NOT NULL
 , MCC_CODE VARCHAR2(16 BYTE) NOT NULL
 , TERMINAL_ID VARCHAR2(16 BYTE) NOT NULL  
 , TRANSACTION_REF VARCHAR2(16 BYTE) NOT NULL
 , MODE_OF_PAYMENT VARCHAR2(16 BYTE) NOT NULL 
 , META_JOB_ID NUMBER(20, 0) NOT NULL 
 , META_JOB_START_TIME VARCHAR2(100 BYTE) NOT NULL 
 , META_PROCESSING_FILE VARCHAR2(100 BYTE) NOT NULL 
 , META_ACQUIRER VARCHAR2(20 BYTE) NOT NULL 
 , META_CHUNK_COMMIT_SIZE NUMBER(20, 0) NOT NULL 
);

CREATE TABLE CONFIGURATION_PARAMETERS 
(
  KEY VARCHAR2(100 BYTE) 
, VALUE VARCHAR2(100 BYTE) 
);

--------------------------------------------------------
--  File created - Release  4.3    
--------------------------------------------------------


CREATE SEQUENCE JOB_ID_SEQUENCE INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 CACHE 20;

--------------------------------------------------------
--  File created - Release  4.3   
--------------------------------------------------------

Insert into CONFIGURATION_PARAMETERS (KEY,VALUE) values ('COMMIT_SIZE','5');
Insert into CONFIGURATION_PARAMETERS (KEY,VALUE) values ('SKIP_LIMIT','100');
Insert into CONFIGURATION_PARAMETERS (KEY,VALUE) values ('LANDING_DIRECTORY','/home/batchconfig/batch/landing');
Insert into CONFIGURATION_PARAMETERS (KEY,VALUE) values ('SUCCESS_DIRECTORY','/home/batchconfig/batch/success');
Insert into CONFIGURATION_PARAMETERS (KEY,VALUE) values ('ERROR_DIRECTORY','/home/batchconfig/batch/errors');
Insert into CONFIGURATION_PARAMETERS (KEY,VALUE) values ('PROCESSING_DIRECTORY','/home/batchconfig/batch/processing');
Insert into CONFIGURATION_PARAMETERS (KEY,VALUE) values ('SKIPPED_ITEMS_DIRECTORY','/home/batchconfig/batch/skipped');
Insert into CONFIGURATION_PARAMETERS (KEY,VALUE) values ('DB_Release','4.3');
commit;

--------------------------------------------------------
--  File created - Release  4.2
--------------------------------------------------------

   CREATE SEQUENCE  BATCH_JOB_EXECUTION_SEQ  MINVALUE 0 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
   CREATE SEQUENCE  BATCH_JOB_SEQ  MINVALUE 0 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
   CREATE SEQUENCE  BATCH_STEP_EXECUTION_SEQ  MINVALUE 0 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;












