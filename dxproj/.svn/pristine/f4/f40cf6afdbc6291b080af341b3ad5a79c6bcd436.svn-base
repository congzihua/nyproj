create database db_gwlz;

CREATE TABLE  db_gwlz
.dis_department(
  ID int(4) auto_increment NOT NULL,
  name varchar(20) NOT NULL,
  parentid int(4) NOT NULL,
  PRIMARY KEY  (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE  db_gwlz
.dis_group(
  ID int(4) auto_increment NOT NULL,
  name varchar(20) NOT NULL,
  mem  varchar(40),
  dpmid int(4) NOT NULL,
  PRIMARY KEY  (ID)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE  db_gwlz
.dis_gpReleation(
  ID int(4) auto_increment NOT NULL,
  groupid  int(4) NOT NULL,
  powerid  int(4) NOT NULL,
  PRIMARY KEY  (ID)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.dis_users(

	userid int(4) auto_increment NOT NULL,
	account varchar(20) NOT NULL,
	name varchar(128) NOT NULL,
	password varchar(255) NOT NULL,
	dmpid int(4) NOT NULL,
	email varchar(40),
	phone varchar(100),
	other varchar(1024),
	type  int(4) NOT NULL,
	PRIMARY KEY (userid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE db_gwlz.dis_ugrelation
(
    id int(4) auto_increment NOT NULL,
    userid int(4) NOT NULL,
    groupid int(4) NOT NULL,
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE db_gwlz.dis_doctypes
(
    doctypeid int(4) auto_increment NOT NULL,
    typename varchar(40) NOT NULL,
    templetid int(4) NOT NULL,
    PRIMARY KEY (doctypeid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.dis_docs
(
    docid int(4) auto_increment NOT NULL,
    Title varchar(256) NOT NULL,
    createtime Datetime NOT NULL,
    maketime Datetime,
    content varchar(256),
    typename varchar(40) NOT NULL,
    Urgency  varchar(40) NOT NULL,
    publishtime Datetime ,
    createOrg varchar(40),
    docnum varchar(60) ,
    secret varchar(40),
    ToOrg varchar(128),
    printnum int(4),
    secretime varchar(10),
    createmode varchar(40),
    publishlevel varchar(40),
    copyto varchar(128),
    keywords varchar(128),
    result varchar(256),
    event varchar(256),  
    publishOrg varchar(40),
    creator varchar(128) NOT NULL,
    PRIMARY KEY (docid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.dis_attachments
(
    attacheid int(4) auto_increment NOT NULL,
    title varchar(128) NOT NULL,
    filetype varchar(40) NOT NULL,
    Filename varchar(128) NOT NULL,
    Docid   int(4) NOT NULL,
    PRIMARY KEY (attacheid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.dis_flows
(
    Id int(4) auto_increment NOT NULL,
    powergroup int(4) NOT NULL,
    docid int(4),
    status  varchar(20) NOT NULL,
    sendtime Datetime NOT NULL,
    Fatherid int(4) NOT NULL,
    flag int(4) NOT NULL,
    processorid int(4) NOT NULL,
    version int(4) NOT NULL,
    opertime Datetime ,
    operationtor varchar(128) ,
    readflag  int(4) null,
	  advice varchar(1024),
	  flowName varchar(40),
	  flowtor varchar(128) not null,
    PRIMARY KEY (Id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.dis_Advices
(
    adsid int(4) auto_increment NOT NULL,
    Userid int(4) NOT NULL,
    advice varchar(1024) NOT NULL,
    PRIMARY KEY (adsid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.Dis_accountie
(
    tieid int(4) auto_increment NOT NULL,
    Userid int(4) NOT NULL,
    leaderid int(4) NOT NULL,
    PRIMARY KEY (tieid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.Dis_doctemplets
(
    templetid int(4) auto_increment NOT NULL,
    templetname varchar(128) NOT NULL,
    Filename varchar(128),
    PRIMARY KEY (templetid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.Dis_docnum
(
    docnumid int(4) auto_increment NOT NULL,
    doctypeid int(4) NOT NULL,
    year int(4) NOT NULL,
    nextnum int(4) NOT NULL,
    PRIMARY KEY (docnumid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.dis_logs
(
    Logid int(4) auto_increment NOT NULL,
    account varchar(20) NOT NULL,
    Actiontype varchar(64) NOT NULL,
    Action varchar(64) NOT NULL,
    IP   varchar(32) NOT NULL,
    Logtime datetime NOT NULL,
    PRIMARY KEY (Logid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.dis_watches
(
    id int(4) auto_increment NOT NULL,
    Userid int(4) NOT NULL,
    ipaddress varchar(40) NOT NULL,
    logintime datetime NOT NULL,
    refreshtime datetime NOT NULL,
    docid   int(4) NOT NULL,
    doctypeid int(4) NOT NULL,
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.dis_parameter
(
    templateip varchar(128) NOT NULL,
    attacheip varchar(128) NOT NULL,
    contentip varchar(128) NOT NULL,
    docsbackip varchar(128) NOT NULL,
    httpupload varchar(128) NOT NULL,
    httpdnload varchar(128) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE db_gwlz.dis_userpage
(
    fileTempPath varchar(128) NOT NULL,
    fileNumber   int(4) NOT NULL,
    selectLogin  int(4) NOT NULL,
    userid  int(4) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

Create TABLE  mysql.gwlz_admin
(
   id int(4) auto_increment NOT NULL,
   account varchar(20) NOT NULL,
   password varchar(128) NOT NULL,
   name varchar(128) NOT NULL,
   PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into  mysql.gwlz_admin(account,password,name) values('admin','63a9f0ea7bb98050796b649e85481845','administrator');
insert into db_gwlz.dis_parameter values('\\\\127.0.0.1\\gwlz\\template\\','\\\\127.0.0.1\\gwlz\\attache\\','\\\\127.0.0.1\\gwlz\\content\\','\\\\127.0.0.1\\gwlz\\back\\','http://127.0.0.1/upload/receiveFile.asp','http://127.0.0.1/upload/gwlz/');