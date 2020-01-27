/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     27/1/2020 11:24:26                           */
/*==============================================================*/


drop table if exists ARBITRO;

drop table if exists CALENDARIO;

drop table if exists CAMPEONATO;

drop table if exists CANCHA;

drop table if exists DIVISION;

drop table if exists EQUIPO;

drop table if exists JORNADA;

drop table if exists JUGADOR;

drop table if exists JUGAR;

drop table if exists PARTIDO;

drop table if exists TABLA_POSICIONES;

drop table if exists TARJETA_JUGADOR;

drop table if exists TIPO_CAMPEONATO;

/*==============================================================*/
/* Table: ARBITRO                                               */
/*==============================================================*/
create table ARBITRO
(
   ARBITRO_ID           numeric(5,0) not null,
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
   CALENDARIO_ID        int not null,
   JORNADA_ID           int,
   CAMP_ID              numeric(4,0),
   primary key (CALENDARIO_ID)
);

/*==============================================================*/
/* Table: CAMPEONATO                                            */
/*==============================================================*/
create table CAMPEONATO
(
   CAMP_ID              numeric(4,0) not null,
   DIVISION_ID          numeric(11,0) not null,
   TIPOCAMP_ID          numeric(5,0) not null,
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
   CANCHA_ID            numeric(5,0) not null,
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
   DIVISION_ID          numeric(11,0) not null,
   DIVISION_DETALLE     text,
   primary key (DIVISION_ID)
);

/*==============================================================*/
/* Table: EQUIPO                                                */
/*==============================================================*/
create table EQUIPO
(
   EQUI_ID              numeric(5,0) not null,
   JUG_ID               numeric(4,0) not null,
   CAMP_ID              numeric(4,0) not null,
   EQUI_NOMBRE          char(40) not null,
   EQUI_ESTADO          char(10) not null comment 'Aqui se guarda la informacion de si el equipo esta activo o no ',
   EQUI_LEMA            text not null,
   primary key (EQUI_ID)
);

/*==============================================================*/
/* Table: JORNADA                                               */
/*==============================================================*/
create table JORNADA
(
   JORNADA_ID           int not null,
   JORNADA_FECHA        date,
   primary key (JORNADA_ID)
);

/*==============================================================*/
/* Table: JUGADOR                                               */
/*==============================================================*/
create table JUGADOR
(
   JUG_ID               numeric(4,0) not null,
   TARJ_ID              numeric(5,0),
   JUG_NOMBRE           char(20) not null,
   JUG_APELLIDO         char(20) not null,
   JUG_FECHANACIMIENTO  date not null,
   primary key (JUG_ID)
);

/*==============================================================*/
/* Table: JUGAR                                                 */
/*==============================================================*/
create table JUGAR
(
   PARTIDO_ID           numeric(5,0) not null,
   EQUI_ID              numeric(5,0) not null,
   GOLES                int,
   RESULTADO            int,
   primary key (PARTIDO_ID, EQUI_ID)
);

/*==============================================================*/
/* Table: PARTIDO                                               */
/*==============================================================*/
create table PARTIDO
(
   PARTIDO_ID           numeric(5,0) not null,
   ARBITRO_ID           numeric(5,0) not null,
   CANCHA_ID            numeric(5,0),
   JORNADA_ID           int,
   PARTIDO_HORA         time not null,
   primary key (PARTIDO_ID)
);

/*==============================================================*/
/* Table: TABLA_POSICIONES                                      */
/*==============================================================*/
create table TABLA_POSICIONES
(
   TABLA_ID             numeric(5,0) not null,
   EQUI_ID              numeric(5,0) not null,
   PARTIDO_ID           numeric(5,0),
   JUG_EQUI_ID          numeric(5,0),
   CAMP_ID              numeric(4,0),
   TABLA_PARTIDOSJUGADOS numeric(5,0) not null,
   TABLA_PARTIDOSGANADOS numeric(5,0) not null,
   TABLA_PARTIDOSPERDIDOS numeric(5,0) not null,
   TABLA_GOLESFAVOR     numeric(5,0) not null,
   TABLA_GOLESCONTRA    numeric(5,0) not null,
   TABLA_PUNTOS         numeric(5,0) not null,
   primary key (TABLA_ID)
);

/*==============================================================*/
/* Table: TARJETA_JUGADOR                                       */
/*==============================================================*/
create table TARJETA_JUGADOR
(
   TARJ_ID              numeric(5,0) not null,
   TARJ_FECHA           date not null,
   TARJ_CANTIDAD        numeric(3,0) not null,
   primary key (TARJ_ID)
);

/*==============================================================*/
/* Table: TIPO_CAMPEONATO                                       */
/*==============================================================*/
create table TIPO_CAMPEONATO
(
   TIPOCAMP_ID          numeric(5,0) not null,
   TIPOCAMP_TIPO        char(40) not null,
   primary key (TIPOCAMP_ID)
);

alter table CALENDARIO add constraint FK_REFERENCE_14 foreign key (JORNADA_ID)
      references JORNADA (JORNADA_ID) on delete restrict on update restrict;

alter table CALENDARIO add constraint FK_REFERENCE_16 foreign key (CAMP_ID)
      references CAMPEONATO (CAMP_ID) on delete restrict on update restrict;

alter table CAMPEONATO add constraint FK_ES foreign key (TIPOCAMP_ID)
      references TIPO_CAMPEONATO (TIPOCAMP_ID) on delete restrict on update restrict;

alter table CAMPEONATO add constraint FK_ESTA foreign key (DIVISION_ID)
      references DIVISION (DIVISION_ID) on delete restrict on update restrict;

alter table EQUIPO add constraint FK_JUEGA foreign key (JUG_ID)
      references JUGADOR (JUG_ID) on delete restrict on update restrict;

alter table EQUIPO add constraint FK_NECESITA foreign key (CAMP_ID)
      references CAMPEONATO (CAMP_ID) on delete restrict on update restrict;

alter table JUGADOR add constraint FK_POSEE foreign key (TARJ_ID)
      references TARJETA_JUGADOR (TARJ_ID) on delete restrict on update restrict;

alter table JUGAR add constraint FK_JUGAR foreign key (PARTIDO_ID)
      references PARTIDO (PARTIDO_ID) on delete restrict on update restrict;

alter table JUGAR add constraint FK_JUGAR2 foreign key (EQUI_ID)
      references EQUIPO (EQUI_ID) on delete restrict on update restrict;

alter table PARTIDO add constraint FK_ARBITRAR foreign key (ARBITRO_ID)
      references ARBITRO (ARBITRO_ID) on delete restrict on update restrict;

alter table PARTIDO add constraint FK_REFERENCE_17 foreign key (JORNADA_ID)
      references JORNADA (JORNADA_ID) on delete restrict on update restrict;

alter table PARTIDO add constraint FK_SE_JUEGA foreign key (CANCHA_ID)
      references CANCHA (CANCHA_ID) on delete restrict on update restrict;

alter table TABLA_POSICIONES add constraint FK_REFERENCE_12 foreign key (PARTIDO_ID, JUG_EQUI_ID)
      references JUGAR (PARTIDO_ID, EQUI_ID) on delete restrict on update restrict;

alter table TABLA_POSICIONES add constraint FK_REFERENCE_15 foreign key (CAMP_ID)
      references CAMPEONATO (CAMP_ID) on delete restrict on update restrict;

alter table TABLA_POSICIONES add constraint FK_TIENE foreign key (EQUI_ID)
      references EQUIPO (EQUI_ID) on delete restrict on update restrict;

