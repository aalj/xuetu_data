/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/1/29 10:32:53                           */
/*==============================================================*/
drop database xuetu;
create database xuetu;
  use xuetu;

drop table if exists Selfstudyplan;

drop index Relationship_21_FK on agreement;

drop table if exists agreement;

drop index Relationship_11_FK on answer;

drop table if exists answer;

drop table if exists class;

drop table if exists collectionquestion;

drop table if exists countdown;

drop index Relationship_5_FK on coupon;

drop table if exists coupon;

drop table if exists courselist;

drop table if exists favoritescoupons;

drop table if exists mycoupon;

drop table if exists pattern;

drop table if exists question;

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
/* Table: Selfstudyplan                                         */
/*==============================================================*/
create table Selfstudyplan
(
   plan_id              int not null auto_increment,
   start_time           date not null,
   end_time             date not null,
   plan_text            varchar(300) not null,
   plan_remind          int not null,
   pattern_id           int,
   stu_id               int,
   plan_date            date not null,
   primary key (plan_id)
);

/*==============================================================*/
/* Table: agreement                                             */
/*==============================================================*/
create table agreement
(
   agr_id               int(11) not null auto_increment,
   ans_id               int(11) DEFAULT null,
   stu_id               int not null,
   primary key (agr_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Index: Relationship_21_FK                                    */
/*==============================================================*/
create index Relationship_21_FK on agreement
(

);

/*==============================================================*/
/* Table: answer                                                */
/*==============================================================*/
create table answer
(
   ans_id               int not null auto_increment,
   ques_id              int,
   stu_id               int,
   ans_text             varchar(1000) not null,
   ans_ima              varchar(50),
   ans_time             date not null,
   primary key (ans_id)
);

/*==============================================================*/
/* Index: Relationship_11_FK                                    */
/*==============================================================*/
create index Relationship_11_FK on answer
(

);

/*==============================================================*/
/* Table: class                                                 */
/*==============================================================*/
create table class
(
   cls_id               int not null auto_increment,
   cls_name             varchar(60) not null,
   cls_week             int not null,
   cls_few              int not null,
   cls_room             varchar(30) not null,
   primary key (cls_id)
);

/*==============================================================*/
/* Table: collectionquestion                                    */
/*==============================================================*/
create table collectionquestion
(
   coqu_id              int not null auto_increment,
   stu_id               int,
   ques_id              int not null,
   primary key (coqu_id)
);

/*==============================================================*/
/* Table: countdown                                             */
/*==============================================================*/
create table countdown
(
   codo_id              int not null auto_increment,
   code_time            date,
   codo_text            varchar(100),
   primary key (codo_id)
);

/*==============================================================*/
/* Table: coupon                                                */
/*==============================================================*/
create table coupon
(
   cou_id               int not null auto_increment,
   sto_id               int,
   cou_info             varchar(500) not null,
   cou_num              int not null,
   cou_Validity         date not null,
   cou_redeem_points    int not null,
   primary key (cou_id)
);

/*==============================================================*/
/* Index: Relationship_5_FK                                     */
/*==============================================================*/
create index Relationship_5_FK on coupon
(

);

/*==============================================================*/
/* Table: courselist                                            */
/*==============================================================*/
create table courselist
(
   coul_id              int not null auto_increment,
   stu_id               int,
   cls_id               int,
   primary key (coul_id)
);

/*==============================================================*/
/* Table: favoritescoupons                                      */
/*==============================================================*/
create table favoritescoupons
(
   faco_id              int not null auto_increment,
   stu_id               int,
   cou_id               int not null,
   primary key (faco_id)
);

/*==============================================================*/
/* Table: mycoupon                                              */
/*==============================================================*/
create table mycoupon
(
   mycou_id             int not null auto_increment,
   usta_id              int,
   cou_id               int,
   stu_id               int,
   mycou_exchange_time  date not null,
   primary key (mycou_id)
);

/*==============================================================*/
/* Table: pattern                                               */
/*==============================================================*/
create table pattern
(
   pattern_id           int not null auto_increment,
   pattern_text         varchar(300) not null,
   primary key (pattern_id)
);

/*==============================================================*/
/* Table: question                                              */
/*==============================================================*/
create table question
(
   ques_id              int not null auto_increment,
   stu_id               int,
   ans_text             varchar(1000) not null,
   ques_img             varchar(50),
   ques_time            date not null,
   primary key (ques_id)
);

/*==============================================================*/
/* Table: school                                                */
/*==============================================================*/
create table school
(
   sch_id               int not null auto_increment,
   sch_name             varchar(20) not null,
   sch_longitude        varchar(60) not null,
   sch_latitude         varchar(60) not null,
   primary key (sch_id)
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
   shopID               int not null auto_increment,
   cou_id               int,
   primary key (shopID)
);

/*==============================================================*/
/* Table: storename                                             */
/*==============================================================*/
create table storename
(
   sto_id               int not null auto_increment,
   sto_user_name        varchar(20) not null,
   sto_tel              int not null,
   sto_address          varchar(50) not null,
   sto_name             varchar(20) not null,
   sto_introduction     varchar(500) not null,
   sto_img              varchar(50),
   sto_pwd              varchar(20) not null,
   primary key (sto_id)
);

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student
(
   stu_id               int not null auto_increment,
   stu_name             varchar(20) not null,
   stu_email            varchar(60) not null,
   stu_phone            varchar(14) not null,
   stu_img              varchar(50),
   stu_sex              varchar(2),
   stu_age              int,
   stu_ugrade           varchar(5) not null,
   stu_major            varchar(10) not null,
   stu_signer           varchar(500),
   stu_points           int not null,
   sch_id               int,
   stu_pwd              varchar(20),
   primary key (stu_id)
);

/*==============================================================*/
/* Table: studytime                                             */
/*==============================================================*/
create table studytime
(
   st_id                int not null auto_increment,
   st_date              date not null,
   st_time              time not null,
   stu_id               int,
   primary key (st_id)
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
   usta_id              int not null auto_increment,
   usta_name            varchar(10),
   primary key (usta_id)
);

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/
create index Relationship_3_FK on userstate
(

);

alter table Selfstudyplan add constraint FK_Relationship_1 foreign key (pattern_id)
      references pattern (pattern_id) on delete restrict on update restrict;

alter table Selfstudyplan add constraint FK_Relationship_20 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table agreement add constraint FK_Reference_20 foreign key (ans_id)
      references answer (ans_id) on delete restrict on update restrict;

alter table answer add constraint FK_Reference_21 foreign key (ques_id)
      references question (ques_id) on delete restrict on update restrict;

alter table answer add constraint FK_Reference_22 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table collectionquestion add constraint FK_Relationship_7 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table coupon add constraint FK_Reference_18 foreign key (sto_id)
      references storename (sto_id) on delete restrict on update restrict;

alter table courselist add constraint FK_Relationship_22 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table courselist add constraint FK_Relationship_23 foreign key (cls_id)
      references class (cls_id) on delete restrict on update restrict;

alter table favoritescoupons add constraint FK_Relationship_13 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table mycoupon add constraint FK_Reference_17 foreign key (cou_id)
      references coupon (cou_id) on delete restrict on update restrict;

alter table mycoupon add constraint FK_Relationship_2 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table mycoupon add constraint FK_Relationship_4 foreign key (usta_id)
      references userstate (usta_id) on delete restrict on update restrict;

alter table question add constraint FK_Relationship_19 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table student add constraint FK_Relationship_14 foreign key (sch_id)
      references school (sch_id) on delete restrict on update restrict;

alter table studytime add constraint FK_Reference_16 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;
