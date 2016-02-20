/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/1/27 20:07:53                           */
/*==============================================================*/
drop database family;
create database family;
  use family;

drop table if exists bill;

drop table if exists bill_type;

drop table if exists familymember;



drop table if exists income_and_expenses;



drop table if exists sub_bill_type;

/*==============================================================*/
/* Table: bill                                                  */
/*==============================================================*/
create table bill
(
   bi_id                int not null auto_increment,
   fm_id                int,
   sub_bt_id            Integer(2),
   in_ex_time           date not null,
   in_ex_mon            Float (8,2) not null,
   in_ex_remarks        varchar(1000),
   primary key (bi_id)
);

/*==============================================================*/
/* Table: bill_type                                             */
/*==============================================================*/
create table bill_type
(
   by_id                int not null auto_increment,
   in_ex_id             int,
   by_name              integer(10) not null,
   primary key (by_id)
);



/*==============================================================*/
/* Table: familymember                                          */
/*==============================================================*/
create table familymember
(
   fm_id                int not null auto_increment,
   fm_name              varchar(20) not null,
   fm_permiss           int not null,
   pwd                  varchar(20) not null,
   fm_user_name         VARCHAR(10) not null unique
   primary key (fm_id)
);

/*==============================================================*/
/* Table: income_and_expenses                                   */
/*==============================================================*/
create table income_and_expenses
(
   in_ex_id             int not null auto_increment,
   in_ex_name           varchar(4) not null,
   primary key (in_ex_id)
);



/*==============================================================*/
/* Table: sub_bill_type                                         */
/*==============================================================*/
create table sub_bill_type
(
   sub_bt_id            Integer(2) not null auto_increment,
   by_id                int,
   sub_bt_name          varchar(20) not null,
   primary key (sub_bt_id)
);


alter table bill add constraint FK_Reference_4 foreign key (sub_bt_id)
      references sub_bill_type (sub_bt_id) on delete restrict on update restrict;

alter table bill add constraint FK_fm_bi foreign key (fm_id)
      references familymember (fm_id) on delete restrict on update restrict;

alter table bill_type add constraint FK_bi_ty_inex foreign key (in_ex_id)
      references income_and_expenses (in_ex_id) on delete restrict on update restrict;

alter table sub_bill_type add constraint FK_sub_bity foreign key (by_id)
      references bill_type (by_id) on delete restrict on update restrict;
