/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     29/01/2020 10:27:05                          */
/*==============================================================*/


drop table if exists ARBITRO;

drop table if exists CALENDARIO;

drop table if exists CAMPEONATO;

drop table if exists CANCHA;

drop table if exists DIVISION;

drop table if exists ENCUENTRO;

drop table if exists EQUIPO;

drop table if exists JORNADA;

drop table if exists JORNADA_PARTIDO;

drop table if exists JUGADOR;

drop table if exists PARTIDO;

drop table if exists TABLA_POSICIONES;

drop table if exists TIPO_CAMPEONATO;

/*==============================================================*/
/* Table: ARBITRO                                               */
/*==============================================================*/
create table ARBITRO
(
   ARBITRO_ID           int not null auto_increment,
   ARBITRO_NOMBRE       char(20) not null,
   ARBITRO_APELLIDO     char(20) not null,
   ARBITRO_TELEFONO     char(10) not null,
   primary key (ARBITRO_ID)
);

/*==============================================================*/
/* Table: CALENDARIO                                            */
/*==============================================================*/
create table CALENDARIO
(
   CALENDARIO_ID        int not null auto_increment,
   EQUI_ID              int,
   CAMP_ID              int,
   CALENDARIO_FECHA     date,
   primary key (CALENDARIO_ID)
);

/*==============================================================*/
/* Table: CAMPEONATO                                            */
/*==============================================================*/
create table CAMPEONATO
(
   CAMP_ID              int not null auto_increment,
   DIVISION_ID          int not null,
   TIPOCAMP_ID          int not null,
   CAMP_NOMBRE          char(40) not null,
   CAMP_FECHAINICIO     date not null,
   CAMP_FECHAFIN        date not null,
   primary key (CAMP_ID)
);

/*==============================================================*/
/* Table: CANCHA                                                */
/*==============================================================*/
create table CANCHA
(
   CANCHA_ID            int not null auto_increment,
   CANCHA_NOMBRE        char(40) not null,
   CANCHA_DIRECICON     char(40) not null,
   CANCHA_MAXPERSONA    numeric(5,0) not null,
   primary key (CANCHA_ID)
);

/*==============================================================*/
/* Table: DIVISION                                              */
/*==============================================================*/
create table DIVISION
(
   DIVISION_ID          int not null auto_increment,
   DIVISION_DETALLE     text,
   primary key (DIVISION_ID)
);

/*==============================================================*/
/* Table: ENCUENTRO                                             */
/*==============================================================*/
create table ENCUENTRO
(
   ENCUENTRO_ID         int not null auto_increment,
   EQUI_ID              int,
   PARTIDO_ID           int,
   TABLA_ID             int,
   GOLES                int,
   RESULTADO            int,
   primary key (ENCUENTRO_ID)
);

/*==============================================================*/
/* Table: EQUIPO                                                */
/*==============================================================*/
create table EQUIPO
(
   EQUI_ID              int not null auto_increment,
   CAMP_ID              int not null,
   EQUI_NOMBRE          char(40) not null,
   EQUI_CORREO          char(20) not null comment 'Aqui se guarda la informacion de si el equipo esta activo o no ',
   EQUI_LEMA            text not null,
   primary key (EQUI_ID)
);

/*==============================================================*/
/* Table: JORNADA                                               */
/*==============================================================*/
create table JORNADA
(
   JORNADA_ID           int not null auto_increment,
   CALENDARIO_ID        int,
   NUM_JORNADA          int,
   JORNADA_FECHA        date,
   primary key (JORNADA_ID)
);

/*==============================================================*/
/* Table: JORNADA_PARTIDO                                       */
/*==============================================================*/
create table JORNADA_PARTIDO
(
   JORENCUENTRO_ID      int not null auto_increment,
   CAMP_ID              int,
   PARTIDO_ID           int,
   JORNADA_ID           int,
   primary key (JORENCUENTRO_ID)
);

/*==============================================================*/
/* Table: JUGADOR                                               */
/*==============================================================*/
create table JUGADOR
(
   JUG_ID               int not null auto_increment,
   EQUI_ID              int,
   JUG_NOMBRE           char(20) not null,
   JUG_APELLIDO         char(20) not null,
   JUG_FECHANACIMIENTO  date not null,
   primary key (JUG_ID)
);

/*==============================================================*/
/* Table: PARTIDO                                               */
/*==============================================================*/
create table PARTIDO
(
   PARTIDO_ID           int not null auto_increment,
   CAMP_ID              int not null,
   ARBITRO_ID           int not null,
   CANCHA_ID            int,
   PARTIDO_HORA         time not null,
   primary key (PARTIDO_ID)
);

/*==============================================================*/
/* Table: TABLA_POSICIONES                                      */
/*==============================================================*/
create table TABLA_POSICIONES
(
   TABLA_ID             int not null auto_increment,
   EQUI_ID              int not null,
   CAMP_ID              int,
   TABLA_PARTIDOSJUGADOS numeric(5,0) not null,
   TABLA_PARTIDOSGANADOS numeric(5,0) not null,
   TABLA_PARTIDOSPERDIDOS numeric(5,0) not null,
   TABLA_GOLESFAVOR     numeric(5,0) not null,
   TABLA_GOLESCONTRA    numeric(5,0) not null,
   TABLA_PUNTOS         numeric(5,0) not null,
   primary key (TABLA_ID)
);

/*==============================================================*/
/* Table: TIPO_CAMPEONATO                                       */
/*==============================================================*/
create table TIPO_CAMPEONATO
(
   TIPOCAMP_ID          int not null auto_increment,
   TIPOCAMP_TIPO        char(40) not null,
   primary key (TIPOCAMP_ID)
);

alter table CALENDARIO add constraint FK_REFERENCE_15 foreign key (EQUI_ID)
      references EQUIPO (EQUI_ID) on delete restrict on update restrict;

alter table CALENDARIO add constraint FK_REFERENCE_16 foreign key (CAMP_ID)
      references CAMPEONATO (CAMP_ID) on delete restrict on update restrict;

alter table CAMPEONATO add constraint FK_ES foreign key (TIPOCAMP_ID)
      references TIPO_CAMPEONATO (TIPOCAMP_ID) on delete restrict on update restrict;

alter table CAMPEONATO add constraint FK_ESTA foreign key (DIVISION_ID)
      references DIVISION (DIVISION_ID) on delete restrict on update restrict;

alter table ENCUENTRO add constraint FK_REFERENCE_17 foreign key (EQUI_ID)
      references EQUIPO (EQUI_ID) on delete restrict on update restrict;

alter table ENCUENTRO add constraint FK_REFERENCE_18 foreign key (PARTIDO_ID)
      references PARTIDO (PARTIDO_ID) on delete restrict on update restrict;

alter table ENCUENTRO add constraint FK_REFERENCE_20 foreign key (TABLA_ID)
      references TABLA_POSICIONES (TABLA_ID) on delete restrict on update restrict;

alter table EQUIPO add constraint FK_NECESITA foreign key (CAMP_ID)
      references CAMPEONATO (CAMP_ID) on delete restrict on update restrict;

alter table JORNADA add constraint FK_REFERENCE_25 foreign key (CALENDARIO_ID)
      references CALENDARIO (CALENDARIO_ID) on delete restrict on update restrict;

alter table JORNADA_PARTIDO add constraint FK_REFERENCE_22 foreign key (CAMP_ID)
      references CAMPEONATO (CAMP_ID) on delete restrict on update restrict;

alter table JORNADA_PARTIDO add constraint FK_REFERENCE_23 foreign key (PARTIDO_ID)
      references PARTIDO (PARTIDO_ID) on delete restrict on update restrict;

alter table JORNADA_PARTIDO add constraint FK_REFERENCE_24 foreign key (JORNADA_ID)
      references JORNADA (JORNADA_ID) on delete restrict on update restrict;

alter table JUGADOR add constraint FK_REFERENCE_21 foreign key (EQUI_ID)
      references EQUIPO (EQUI_ID) on delete restrict on update restrict;

alter table PARTIDO add constraint FK_ARBITRAR foreign key (ARBITRO_ID)
      references ARBITRO (ARBITRO_ID) on delete restrict on update restrict;

alter table PARTIDO add constraint FK_PERTENECE foreign key (CAMP_ID)
      references CAMPEONATO (CAMP_ID) on delete restrict on update restrict;

alter table PARTIDO add constraint FK_SE_JUEGA foreign key (CANCHA_ID)
      references CANCHA (CANCHA_ID) on delete restrict on update restrict;

alter table TABLA_POSICIONES add constraint FK_REFERENCE_19 foreign key (CAMP_ID)
      references CAMPEONATO (CAMP_ID) on delete restrict on update restrict;

alter table TABLA_POSICIONES add constraint FK_TIENE foreign key (EQUI_ID)
      references EQUIPO (EQUI_ID) on delete restrict on update restrict;
