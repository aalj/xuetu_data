/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/1/28 10:52:57                           */
/*==============================================================*/


drop table if exists answer;

drop table if exists collectionquestion;

drop table if exists countdown;

drop table if exists coupon;

drop index Relationship_13_FK on favoritescoupons;

drop table if exists favoritescoupons;

drop table if exists mycoupon;

drop table if exists question;

drop index Relationship_6_FK on schedule;

drop table if exists schedule;

drop index Relationship_15_FK on school;

drop table if exists school;

drop table if exists shopping;

drop table if exists storename;

drop table if exists student;

drop index Relationship_17_FK on studytime;

drop table if exists studytime;

drop index Relationship_3_FK on userstate;

drop table if exists userstate;

/*==============================================================*/
/* Table: answer                                                */
/*==============================================================*/
create table answer
(
   ans_id               int not null,
   stu_id               int,
   ques_id              int,
   ans_text             varchar(1000),
   ans_ima              varchar(50),
   ans_time             date,
   ans_points           int
);

/*==============================================================*/
/* Table: collectionquestion                                    */
/*==============================================================*/
create table collectionquestion
(
   coqu_id              char(10) not null,
   stu_id               int,
   ques_id              int
);

/*==============================================================*/
/* Table: countdown                                             */
/*==============================================================*/
create table countdown
(
   codo_id              int not null,
   code_time            date,
   codo_text            varchar(100)
);

/*==============================================================*/
/* Table: coupon                                                */
/*==============================================================*/
create table coupon
(
   cou_id               int not null,
   sto_id               int,
   cou_info             varchar(500),
   cou_num              int,
   cou_Validity         date
);

/*==============================================================*/
/* Table: favoritescoupons                                      */
/*==============================================================*/
create table favoritescoupons
(
   faco_id              int not null,
   stu_id               int,
   cou_id               int
);

/*==============================================================*/
/* Index: Relationship_13_FK                                    */
/*==============================================================*/
create index Relationship_13_FK on favoritescoupons
(

);

/*==============================================================*/
/* Table: mycoupon                                              */
/*==============================================================*/
create table mycoupon
(
   mycou_id             int not null,
   usta_id              int,
   cou_id               int,
   stu_id               int
);

/*==============================================================*/
/* Table: question                                              */
/*==============================================================*/
create table question
(
   ques_id              int not null,
   stu_id               int,
   ans_text             varchar(1000),
   ques_img             varchar(50),
   ques_time            date
);

/*==============================================================*/
/* Table: schedule                                              */
/*==============================================================*/
create table schedule
(
   schedu_id            int not null,
   schedu_num           int,
   stu_id               int,
   schedu_mon           varchar(10),
   schedu_tues          varchar(10),
   schedu_wed           varchar(10),
   schedu_thur          varchar(10),
   schedu_fri           varchar(10),
   schedu_sat           varchar(10),
   schedu_sun           varchar(10)
);

/*==============================================================*/
/* Index: Relationship_6_FK                                     */
/*==============================================================*/
create index Relationship_6_FK on schedule
(

);

/*==============================================================*/
/* Table: school                                                */
/*==============================================================*/
create table school
(
   sch_id               int not null,
   sch_name             varchar(20),
   sch_address          varchar(3)
);

/*==============================================================*/
/* Index: Relationship_15_FK                                    */
/*==============================================================*/
create index Relationship_15_FK on school
(

);

/*==============================================================*/
/* Table: shopping                                              */
/*==============================================================*/
create table shopping
(
   shopID               int not null,
   cou_id               int
);

/*==============================================================*/
/* Table: storename                                             */
/*==============================================================*/
create table storename
(
   sto_id               int not null,
   sto_user_name        varchar(20),
   sto_tel              int,
   sto_address          varchar(50),
   sto_name             varchar(20),
   sto_introduction     varchar(500),
   sto_img              varchar(50),
   sto_pwd              varchar(20)
);

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student
(
   stu_id               int not null,
   stu_name             varchar(20),
   stu_email            varchar(30),
   stu_img              varchar(50),
   stu_sex              varchar(2),
   stu_age              int,
   stu_ugrade           varchar(5),
   stu_signer           varchar(500),
   stu_points           int,
   st_id                int,
   sch_id               int
);

/*==============================================================*/
/* Table: studytime                                             */
/*==============================================================*/
create table studytime
(
   st_id                int not null,
   mon_sti              date,
   tues_sti             date,
   wed_sti              date,
   thur_sti             date,
   fri_sti              date,
   sat_sti              date,
   sun_sti              date,
   temp_sti             date
);

/*==============================================================*/
/* Index: Relationship_17_FK                                    */
/*==============================================================*/
create index Relationship_17_FK on studytime
(

);

/*==============================================================*/
/* Table: userstate                                             */
/*==============================================================*/
create table userstate
(
   usta_id              int not null,
   usta_name            varchar(10)
);

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/
create index Relationship_3_FK on userstate
(

);
/*答案表添加问题表的外键*/
alter table answer add constraint FK_Relationship_11 foreign key (ques_id)
      references question(ques_id) on delete restrict on update restrict;
/* 答案表添加学生的外键*/
alter table answer add constraint FK_Relationship_18 foreign key (stu_id)
      references student(stu_id) on delete restrict on update restrict;
/*问题收藏表添加学生外键*/
alter table collectionquestion add constraint FK_Relationship_7 foreign key (stu_id)
      references student(stu_id) on delete restrict on update restrict;
/*优惠券表添加店铺键*/
alter table coupon add constraint FK_Relationship_12 foreign key (sto_id)
      references storename(sto_id) on delete restrict on update restrict;

alter table mycoupon add constraint FK_Relationship_5 foreign key (cou_id)
      references coupon(cou_id) on delete restrict on update restrict;
/*优惠券表添加学生外键*/
alter table favoritescoupons add constraint FK_Reference_13 foreign key (stu_id)
      references student(stu_id) on delete restrict on update restrict;
/*我的优惠券收藏添加使用状态外键*/
alter table mycoupon add constraint FK_Reference_14 foreign key (usta_id)
      references userstate(usta_id) on delete restrict on update restrict;
/*我的优惠券收藏添加学生外键*/
alter table mycoupon add constraint FK_Relationship_2 foreign key (stu_id)
      references student(stu_id) on delete restrict on update restrict;
/*问题表添加学生外键*/
alter table question add constraint FK_Relationship_19 foreign key (stu_id)
      references student(stu_id) on delete restrict on update restrict;
/*课程表添加学生外键*/
alter table schedule add constraint FK_Reference_12 foreign key (stu_id)
      references student(stu_id) on delete restrict on update restrict;
/*学生表添加学校外键*/
alter table student add constraint FK_Relationship_14 foreign key (sch_id)
      references school(sch_id) on delete restrict on update restrict;
/*学生表添加学习时间外键*/
alter table student add constraint FK_Relationship_16 foreign key (st_id)
      references studytime(st_id) on delete restrict on update restrict;
