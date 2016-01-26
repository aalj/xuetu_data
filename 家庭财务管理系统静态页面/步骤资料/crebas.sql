/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/1/26 20:06:16                           */
/*==============================================================*/


drop table if exists bill;

drop index Relationship_6_FK on bill_type;

drop table if exists bill_type;

drop table if exists familymember;

drop index Relationship_2_FK on income_and_expenses;

drop table if exists income_and_expenses;

drop table if exists pwd;

drop table if exists sub_bill_type;

/*==============================================================*/
/* Table: bill                                                  */
/*==============================================================*/
create table bill
(
   bi_id                int not null auto_increment,
   fm_id                int,
   by_id                int not null,
   in_ex_id             int not null,
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
   by_name              char(10) not null,
   sub_bt               Integer(2) not null,
   primary key (by_id)
);

/*==============================================================*/
/* Index: Relationship_6_FK                                     */
/*==============================================================*/


/*==============================================================*/
/* Table: familymember                                          */
/*==============================================================*/
create table familymember
(
   fm_id                int not null auto_increment,
   fm_name              varchar(20) not null,
   fm_permiss           int not null,
   primary key (fm_id)
);

/*==============================================================*/
/* Table: income_and_expenses                                   */
/*==============================================================*/
create table income_and_expenses
(
   in_ex_id             int not null auto_increment,
   bi_id                int not null auto_increment,
   in_ex_name           varchar(4) not null,
   primary key (in_ex_id)
);

/*==============================================================*/
/* Index: Relationship_2_FK                                     */
/*==============================================================*/


/*==============================================================*/
/* Table: pwd                                                   */
/*==============================================================*/
create table pwd
(
   pwd_id               integer(2) not null auto_increment,
   fm_id                int not null,
   pwd                  varchar(20) not null,
   primary key (pwd_id)
);

/*==============================================================*/
/* Table: sub_bill_type                                         */
/*==============================================================*/
create table sub_bill_type
(
   sub_bt               Integer(2) not null auto_increment,
   by_id                int not null,
   sub_bt_name          varchar(20) not null,
   primary key (sub_bt)
);

alter table bill add constraint FK_fm_bi foreign key (fm_id)
      references familymember (fm_id) on delete restrict on update restrict;

alter table bill_type add constraint FK_bi_bit foreign key ()
      references bill (bi_id) on delete restrict on update restrict;

alter table income_and_expenses add constraint FK_bi_inex foreign key (bi_id)
      references bill (bi_id) on delete restrict on update restrict;

alter table pwd add constraint FK_fm_pw foreign key (fm_id)
      references familymember (fm_id) on delete restrict on update restrict;

alter table sub_bill_type add constraint FK_bit_subbit foreign key (by_id)
      references bill_type (by_id) on delete restrict on update restrict;

