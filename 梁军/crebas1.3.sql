/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/1/28 11:22:21                           */
/*==============================================================*/
drop database if exists xuete;
create database xuetu;
  use xuetu;

drop table if exists answer;
drop table if exists collectionquestion;
drop table if exists countdown;
drop table if exists favoritescoupons;
drop table if exists mycoupon;
drop table if exists question;
drop table if exists schedule;
drop table if exists shopping;
drop table if exists student;
drop table if exists studytime;
drop table if exists userstate;

drop table if exists storename;
drop table if exists school;
drop table if exists coupon;

/*==============================================================*/
/* Table: answer                                                */
/*==============================================================*/
create table answer
(
   ans_id               int not null,
   stu_id               int,
   ques_id              int,
   ans_text             varchar(1000) not null,
   ans_ima              varchar(50),
   ans_time             date not null,
   ans_points           int not null,
   primary key (ans_id)
);

/*==============================================================*/
/* Table: collectionquestion                                    */
/*==============================================================*/
create table collectionquestion
(
   coqu_id              integer not null,
   stu_id               int,
   ques_id              int not null,
   primary key (coqu_id)
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
   cou_info             varchar(500) not null,
   cou_num              int not null,
   cou_Validity         date not null,
   primary key (cou_id)
);



/*==============================================================*/
/* Table: favoritescoupons                                      */
/*==============================================================*/
create table favoritescoupons
(
   faco_id              int not null,
   stu_id               int,
   cou_id               int not null,
   primary key (faco_id)
);



/*==============================================================*/
/* Table: mycoupon                                              */
/*==============================================================*/
create table mycoupon
(
   mycou_id             int not null,
   usta_id              int,
   cou_id               int,
   stu_id               int,
   primary key (mycou_id)
);

/*==============================================================*/
/* Table: question                                              */
/*==============================================================*/
create table question
(
   ques_id              int not null,
   stu_id               int,
   ans_text             varchar(1000) not null,
   ques_img             varchar(50),
   ques_time            date not null,
   primary key (ques_id)
);

/*==============================================================*/
/* Table: schedule                                              */
/*==============================================================*/
create table schedule
(
   schedu_id            int not null,
   schedu_num           int not null,
   stu_id               int,
   schedu_mon           varchar(10),
   schedu_tues          varchar(10),
   schedu_wed           varchar(10),
   schedu_thur          varchar(10),
   schedu_fri           varchar(10),
   schedu_sat           varchar(10),
   schedu_sun           varchar(10),
   primary key (schedu_id)
);



/*==============================================================*/
/* Table: school                                                */
/*==============================================================*/
create table school
(
   sch_id               int not null,
   sch_name             varchar(20) not null,
   sch_address          varchar(3) not null,
   primary key (sch_id)
);



/*==============================================================*/
/* Table: shopping                                              */
/*==============================================================*/
create table shopping
(
   shopID               int not null,
   cou_id               int,
   primary key (shopID)
);

/*==============================================================*/
/* Table: storename                                             */
/*==============================================================*/
create table storename
(
   sto_id               int not null,
   sto_user_name        varchar(20) not null,
   sto_tel              int not null,
   sto_address          varchar(50) not null,
   sto_name             varchar(20) not null,
   sto_introduction     varchar(500),
   sto_img              varchar(50),
   sto_pwd              varchar(20) not null,
   primary key (sto_id)
);

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student
(
   stu_id               int not null,
   stu_name             varchar(20) not null,
   stu_email            varchar(30) not null,
   stu_img              varchar(50),
   stu_sex              varchar(2),
   stu_age              int,
   stu_ugrade           varchar(5) not null,
   stu_signer           varchar(500),
   stu_points           int not null,
   st_id                int,
   sch_id               int,
   sch_pwd              varchar(20) not null,
   primary key (stu_id)
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
   temp_sti             date,
   primary key (st_id)
);


/*==============================================================*/
/* Table: userstate                                             */
/*==============================================================*/
create table userstate
(
   usta_id              int not null,
   usta_name            varchar(10) not null,
   primary key (usta_id)
);



alter table answer add constraint FK_Relationship_11 foreign key (ques_id)
      references question (ques_id) on delete restrict on update restrict;

alter table answer add constraint FK_Relationship_18 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table collectionquestion add constraint FK_Relationship_7 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table coupon add constraint FK_Reference_16 foreign key (sto_id)
      references storename (sto_id) on delete restrict on update restrict;

alter table favoritescoupons add constraint FK_Reference_13 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table mycoupon add constraint FK_Reference_14 foreign key (usta_id)
      references userstate (usta_id) on delete restrict on update restrict;

alter table mycoupon add constraint FK_Reference_15 foreign key (cou_id)
      references coupon (cou_id) on delete restrict on update restrict;

alter table mycoupon add constraint FK_Relationship_2 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table question add constraint FK_Relationship_19 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table schedule add constraint FK_Reference_12 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table student add constraint FK_Relationship_14 foreign key (sch_id)
      references school (sch_id) on delete restrict on update restrict;

alter table student add constraint FK_Relationship_16 foreign key (st_id)
      references studytime (st_id) on delete restrict on update restrict;
