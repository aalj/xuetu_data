/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/1/21 20:56:39                           */
/*==============================================================*/


drop table if exists Countdown;

drop index Relationship_7_FK on answer;

drop table if exists answer;

drop table if exists collectdiscount;

drop table if exists collectquestion;

drop table if exists discount;

drop table if exists fk_student_discount;

drop table if exists question;

drop table if exists school;

drop index Relationship_10_FK on shopping;

drop table if exists shopping;

drop index Relationship_11_FK on student;

drop table if exists student;

drop table if exists studytime;

drop table if exists week;

/*==============================================================*/
/* Table: Countdown                                             */
/*==============================================================*/
create table Countdown
(
   cd_id                int not null,
   cd_info              varchar(50),
   cd_time              date
);

/*==============================================================*/
/* Table: answer                                                */
/*==============================================================*/
create table answer
(
   ans_Id               int not null auto_increment,
   uid                  int,
   q_id                 int,
   ans_text             varchar(5000) not null,
   ans_ima              varchar(50),
   ans_opt              int,
   primary key (ans_Id)
);

/*==============================================================*/
/* Index: Relationship_7_FK                                     */
/*==============================================================*/
create index Relationship_7_FK on answer
(
   
);

/*==============================================================*/
/* Table: collectdiscount                                       */
/*==============================================================*/
create table collectdiscount
(
   uid                  int,
   Attribute_60         char(10)
);

/*==============================================================*/
/* Table: collectquestion                                       */
/*==============================================================*/
create table collectquestion
(
   uid                  int,
   coll_q_id            int
);

/*==============================================================*/
/* Table: discount                                              */
/*==============================================================*/
create table discount
(
   d_Id                 int not null,
   shid                 int,
   d_Info               varchar(500) not null,
   d_user_mode          int not null,
   d_num                int not null,
   d_before             date not null,
   primary key (d_Id)
);

/*==============================================================*/
/* Table: fk_student_discount                                   */
/*==============================================================*/
create table fk_student_discount
(
   uid                  int not null,
   d_Id                 int not null,
   stu_dis_id           integer(4) not null auto_increment,
   primary key (stu_dis_id)
);

/*==============================================================*/
/* Table: question                                              */
/*==============================================================*/
create table question
(
   q_id                 int not null auto_increment,
   uid                  int,
   q_text               varchar(1000) not null,
   q_ima                varchar(50),
   primary key (q_id)
);

/*==============================================================*/
/* Table: school                                                */
/*==============================================================*/
create table school
(
   uid                  int,
   sc_id                int not null auto_increment,
   sc_name              varchar(20),
   sc_long_la           varchar(30),
   primary key (sc_id)
);

/*==============================================================*/
/* Table: shopping                                              */
/*==============================================================*/
create table shopping
(
   sh_id                int not null,
   sh_pwd               integer(2) not null,
   sh_tell              varchar(15),
   sh_address           varchar(200),
   sh_shname            varchar(100),
   sh_remarks           varchar(1000),
   sh_img               longblob,
   primary key (sh_id)
);

/*==============================================================*/
/* Index: Relationship_10_FK                                    */
/*==============================================================*/
create index Relationship_10_FK on shopping
(
   
);

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student
(
   uid                  int not null auto_increment,
   upwd                 integer(20) not null,
   wid                  int,
   stu_id               int,
   sc_id                int,
   uemail               varchar(50) not null,
   uima                 longblob,
   usex                 int not null,
   uage                 int,
   ugrade               varchar(4),
   usigner              varchar(140),
   upoints              int not null,
   primary key (uid)
);

/*==============================================================*/
/* Index: Relationship_11_FK                                    */
/*==============================================================*/
create index Relationship_11_FK on student
(
   
);

/*==============================================================*/
/* Table: studytime                                             */
/*==============================================================*/
create table studytime
(
   uid                  int not null,
   stu_id               int not null auto_increment,
   stu_mon              varchar(6),
   stu_tue              varchar(6),
   stu_wed              varchar(6),
   stu_thu              varchar(6),
   stu_fri              varchar(6),
   stu_sat              varchar(6),
   stu_sun              varchar(6),
   stu_temp             varchar(6),
   primary key (stu_id)
);

/*==============================================================*/
/* Table: week                                                  */
/*==============================================================*/
create table week
(
   wid                  int not null auto_increment,
   uid                  int,
   wmonday              varchar(20),
   wtuesday             varchar(20),
   wwednesday           varchar(20),
   wthursday            varchar(20),
   wfriday              varchar(20),
   wsaturday            varchar(20),
   wsunday              varchar(20),
   wsolumn              varchar(20),
   primary key (wid)
);

alter table answer add constraint FK_fk_question_answer foreign key (q_id)
      references question (q_id) on delete restrict on update restrict;

alter table answer add constraint FK_fk_student_answer foreign key (uid)
      references student (uid) on delete restrict on update restrict;

alter table collectdiscount add constraint FK_fk_student_collectdiscount foreign key (uid)
      references student (uid) on delete restrict on update restrict;

alter table collectquestion add constraint FK_fk_student_collectquestion foreign key (uid)
      references student (uid) on delete restrict on update restrict;

alter table discount add constraint FK_fk_shopping_discount foreign key (shid)
      references shopping (sh_id) on delete restrict on update restrict;

alter table fk_student_discount add constraint FK_fk_student_discount foreign key (d_Id)
      references discount (d_Id) on delete restrict on update restrict;

alter table fk_student_discount add constraint FK_fk_student_discount foreign key (uid)
      references student (uid) on delete restrict on update restrict;

alter table question add constraint FK_fk_stuent_question foreign key (uid)
      references student (uid) on delete restrict on update restrict;

alter table school add constraint FK_fk_student_school foreign key (uid)
      references student (uid) on delete restrict on update restrict;

alter table student add constraint FK_fk_student_school foreign key (sc_id)
      references school (sc_id) on delete restrict on update restrict;

alter table student add constraint FK_fk_student_studytime foreign key (stu_id)
      references studytime (stu_id) on delete restrict on update restrict;

alter table student add constraint FK_fk_student_week foreign key (wid)
      references week (wid) on delete restrict on update restrict;

alter table studytime add constraint FK_fk_student_studytime foreign key (uid)
      references student (uid) on delete restrict on update restrict;

alter table week add constraint FK_fk_student_week foreign key (uid)
      references student (uid) on delete restrict on update restrict;

