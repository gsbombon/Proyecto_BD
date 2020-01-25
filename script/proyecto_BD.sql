/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     25/1/2020 13:04:41                           */
/*==============================================================*/


drop table if exists ARBITRO;

drop table if exists CALENDARIO;

drop table if exists CAMPEONATO;

drop table if exists CANCHA;

drop table if exists DETALLE_DIVISION;

drop table if exists DETALLE_GRUPO;

drop table if exists DIVISION;

drop table if exists EQUIPO;

drop table if exists EQUIPO_SERIE;

drop table if exists GRUPO;

drop table if exists JUGADOR;

drop table if exists OBSERVACION;

drop table if exists PARTIDO;

drop table if exists PARTIDO_JUGADOR;

drop table if exists PARTIDO_SERIE;

drop table if exists PARTIDO_SERIE_JUGADOR;

drop table if exists PITAR;

drop table if exists SERIE;

drop table if exists TABLA_POSICIONES;

drop table if exists TARJETA;

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
   CAL_ID               numeric(5,0) not null,
   PARTIDO_ID           numeric(5,0),
   CAMP_ID              numeric(4,0) not null,
   CAL_FECHAINICIO      date not null,
   CAL_FECHAFIN         date not null,
   primary key (CAL_ID)
);

/*==============================================================*/
/* Table: CAMPEONATO                                            */
/*==============================================================*/
create table CAMPEONATO
(
   CAMP_ID              numeric(4,0) not null,
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
/* Table: DETALLE_DIVISION                                      */
/*==============================================================*/
create table DETALLE_DIVISION
(
   ID_DETALLE_DIVISION  numeric(11,0) not null,
   CAMP_ID              numeric(4,0),
   primary key (ID_DETALLE_DIVISION)
);

/*==============================================================*/
/* Table: DETALLE_GRUPO                                         */
/*==============================================================*/
create table DETALLE_GRUPO
(
   DETALLE_GRUPO_ID     numeric(11,0) not null,
   GRUPO_ID             numeric(11,0),
   primary key (DETALLE_GRUPO_ID)
);

/*==============================================================*/
/* Table: DIVISION                                              */
/*==============================================================*/
create table DIVISION
(
   DIVISION_ID          numeric(11,0) not null,
   ID_DETALLE_DIVISION  numeric(11,0),
   DIVISION_DETALLE     text,
   primary key (DIVISION_ID)
);

/*==============================================================*/
/* Table: EQUIPO                                                */
/*==============================================================*/
create table EQUIPO
(
   EQUI_ID              numeric(5,0) not null,
   DIVISION_ID          numeric(11,0),
   GRUPO_ID             numeric(11,0) not null,
   CANCHA_ID            numeric(5,0) not null,
   TABLA_ID             numeric(5,0) not null,
   CAL_ID               numeric(5,0),
   EQUI_NOMBRE          char(40) not null,
   EQUI_ESTADO          char(10) not null comment 'Aqui se guarda la informacion de si el equipo esta activo o no ',
   EQUI_LEMA            text not null,
   primary key (EQUI_ID)
);

/*==============================================================*/
/* Table: EQUIPO_SERIE                                          */
/*==============================================================*/
create table EQUIPO_SERIE
(
   ID_EQUIPO_SERIE      numeric(11,0) not null,
   ID_SERIE             numeric(11,0),
   EQUI_ID              numeric(5,0),
   primary key (ID_EQUIPO_SERIE)
);

/*==============================================================*/
/* Table: GRUPO                                                 */
/*==============================================================*/
create table GRUPO
(
   GRUPO_ID             numeric(11,0) not null,
   TABLA_ID             numeric(5,0),
   DIVISION_ID          numeric(11,0),
   GRUPO_DETALLE        text,
   primary key (GRUPO_ID)
);

/*==============================================================*/
/* Table: JUGADOR                                               */
/*==============================================================*/
create table JUGADOR
(
   JUG_ID               numeric(4,0) not null,
   ID_PART_SERIE_JUG    numeric(11,0),
   ID_PARTIDO_JUGADOR   numeric(11,0),
   JUG_NOMBRE           char(20) not null,
   JUG_APELLIDO         char(20) not null,
   JUG_FECHANACIMIENTO  date not null,
   primary key (JUG_ID)
);

/*==============================================================*/
/* Table: OBSERVACION                                           */
/*==============================================================*/
create table OBSERVACION
(
   OBS_ID               numeric(3,0) not null,
   PARTIDO_ID           numeric(5,0) not null,
   OBS_DETALLE          text not null,
   primary key (OBS_ID)
);

/*==============================================================*/
/* Table: PARTIDO                                               */
/*==============================================================*/
create table PARTIDO
(
   PARTIDO_ID           numeric(5,0) not null,
   CANCHA_ID            numeric(5,0) not null,
   PARTIDO_FECHAPARTIDO date not null,
   primary key (PARTIDO_ID)
);

/*==============================================================*/
/* Table: PARTIDO_JUGADOR                                       */
/*==============================================================*/
create table PARTIDO_JUGADOR
(
   ID_PARTIDO_JUGADOR   numeric(11,0) not null,
   PARTIDO_ID           numeric(5,0),
   primary key (ID_PARTIDO_JUGADOR)
);

/*==============================================================*/
/* Table: PARTIDO_SERIE                                         */
/*==============================================================*/
create table PARTIDO_SERIE
(
   ID_PARTIDO_SERIE     numeric(11,0) not null,
   PARTIDO_ID           numeric(5,0),
   ID_SERIE             numeric(11,0),
   ID_PART_SERIE_JUG    numeric(11,0),
   primary key (ID_PARTIDO_SERIE)
);

/*==============================================================*/
/* Table: PARTIDO_SERIE_JUGADOR                                 */
/*==============================================================*/
create table PARTIDO_SERIE_JUGADOR
(
   ID_PART_SERIE_JUG    numeric(11,0) not null,
   TARJ_ID              numeric(5,0),
   GOLES                numeric(11,0),
   primary key (ID_PART_SERIE_JUG)
);

/*==============================================================*/
/* Table: PITAR                                                 */
/*==============================================================*/
create table PITAR
(
   PARTIDO_ID           numeric(5,0) not null,
   ARBITRO_ID           numeric(5,0) not null,
   primary key (PARTIDO_ID, ARBITRO_ID)
);

/*==============================================================*/
/* Table: SERIE                                                 */
/*==============================================================*/
create table SERIE
(
   ID_SERIE             numeric(11,0) not null,
   TABLA_ID             numeric(5,0),
   SERIE_NOMBRE         char(50),
   primary key (ID_SERIE)
);

/*==============================================================*/
/* Table: TABLA_POSICIONES                                      */
/*==============================================================*/
create table TABLA_POSICIONES
(
   TABLA_ID             numeric(5,0) not null,
   GRUPO_ID             numeric(11,0),
   CAMP_ID              numeric(4,0) not null,
   TABLA_PARTIDOSJUGADOS numeric(5,0) not null,
   TABLA_PARTIDOSGANADOS numeric(5,0) not null,
   TABLA_PARTIDOSPERDIDOS numeric(5,0) not null,
   TABLA_GOLESFAVOR     numeric(5,0) not null,
   TABLA_GOLESCONTRA    numeric(5,0) not null,
   TABLA_PUNTOS         numeric(5,0) not null,
   primary key (TABLA_ID)
);

/*==============================================================*/
/* Table: TARJETA                                               */
/*==============================================================*/
create table TARJETA
(
   TARJETA_ID           numeric(2,0) not null,
   TARJ_ID              numeric(5,0) not null,
   TARJETA_TIPO         char(10) not null,
   primary key (TARJETA_ID)
);

alter table TARJETA comment 'Entidad donde tendra el tipo de la tarjeta que obtiene el ju';

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
   DETALLE_GRUPO_ID     numeric(11,0) not null,
   TIPOCAMP_TIPO        char(40) not null,
   primary key (TIPOCAMP_ID)
);

alter table CALENDARIO add constraint FK_FECHA foreign key (PARTIDO_ID)
      references PARTIDO (PARTIDO_ID) on delete restrict on update restrict;

alter table CALENDARIO add constraint FK_POSEE foreign key (CAMP_ID)
      references CAMPEONATO (CAMP_ID) on delete restrict on update restrict;

alter table CAMPEONATO add constraint FK_TIENE2 foreign key (TIPOCAMP_ID)
      references TIPO_CAMPEONATO (TIPOCAMP_ID) on delete restrict on update restrict;

alter table DETALLE_DIVISION add constraint FK_JUEGAN_EN foreign key (CAMP_ID)
      references CAMPEONATO (CAMP_ID) on delete restrict on update restrict;

alter table DETALLE_GRUPO add constraint FK_DESCRIBE foreign key (GRUPO_ID)
      references GRUPO (GRUPO_ID) on delete restrict on update restrict;

alter table DIVISION add constraint FK_APORTA foreign key (ID_DETALLE_DIVISION)
      references DETALLE_DIVISION (ID_DETALLE_DIVISION) on delete restrict on update restrict;

alter table EQUIPO add constraint FK_DEBUTA foreign key (DIVISION_ID)
      references DIVISION (DIVISION_ID) on delete restrict on update restrict;

alter table EQUIPO add constraint FK_ES_PARTE foreign key (GRUPO_ID)
      references GRUPO (GRUPO_ID) on delete restrict on update restrict;

alter table EQUIPO add constraint FK_JUEGAN foreign key (CANCHA_ID)
      references CANCHA (CANCHA_ID) on delete restrict on update restrict;

alter table EQUIPO add constraint FK_REGISTRA foreign key (CAL_ID)
      references CALENDARIO (CAL_ID) on delete restrict on update restrict;

alter table EQUIPO add constraint FK_REGISTRAR foreign key (TABLA_ID)
      references TABLA_POSICIONES (TABLA_ID) on delete restrict on update restrict;

alter table EQUIPO_SERIE add constraint FK_RELATIONSHIP_26 foreign key (ID_SERIE)
      references SERIE (ID_SERIE) on delete restrict on update restrict;

alter table EQUIPO_SERIE add constraint FK_RELATIONSHIP_27 foreign key (EQUI_ID)
      references EQUIPO (EQUI_ID) on delete restrict on update restrict;

alter table GRUPO add constraint FK_REGISTRA_GRUPO2 foreign key (TABLA_ID)
      references TABLA_POSICIONES (TABLA_ID) on delete restrict on update restrict;

alter table GRUPO add constraint FK_RELATIONSHIP_28 foreign key (DIVISION_ID)
      references DIVISION (DIVISION_ID) on delete restrict on update restrict;

alter table JUGADOR add constraint FK_RELATIONSHIP_19 foreign key (ID_PARTIDO_JUGADOR)
      references PARTIDO_JUGADOR (ID_PARTIDO_JUGADOR) on delete restrict on update restrict;

alter table JUGADOR add constraint FK_RELATIONSHIP_22 foreign key (ID_PART_SERIE_JUG)
      references PARTIDO_SERIE_JUGADOR (ID_PART_SERIE_JUG) on delete restrict on update restrict;

alter table OBSERVACION add constraint FK_POSEER foreign key (PARTIDO_ID)
      references PARTIDO (PARTIDO_ID) on delete restrict on update restrict;

alter table PARTIDO add constraint FK_SE_JUEGAN foreign key (CANCHA_ID)
      references CANCHA (CANCHA_ID) on delete restrict on update restrict;

alter table PARTIDO_JUGADOR add constraint FK_RELATIONSHIP_18 foreign key (PARTIDO_ID)
      references PARTIDO (PARTIDO_ID) on delete restrict on update restrict;

alter table PARTIDO_SERIE add constraint FK_RELATIONSHIP_20 foreign key (PARTIDO_ID)
      references PARTIDO (PARTIDO_ID) on delete restrict on update restrict;

alter table PARTIDO_SERIE add constraint FK_RELATIONSHIP_21 foreign key (ID_PART_SERIE_JUG)
      references PARTIDO_SERIE_JUGADOR (ID_PART_SERIE_JUG) on delete restrict on update restrict;

alter table PARTIDO_SERIE add constraint FK_RELATIONSHIP_24 foreign key (ID_SERIE)
      references SERIE (ID_SERIE) on delete restrict on update restrict;

alter table PARTIDO_SERIE_JUGADOR add constraint FK_RELATIONSHIP_23 foreign key (TARJ_ID)
      references TARJETA_JUGADOR (TARJ_ID) on delete restrict on update restrict;

alter table PITAR add constraint FK_EJERCE foreign key (PARTIDO_ID)
      references PARTIDO (PARTIDO_ID) on delete restrict on update restrict;

alter table PITAR add constraint FK_TIENE foreign key (ARBITRO_ID)
      references ARBITRO (ARBITRO_ID) on delete restrict on update restrict;

alter table SERIE add constraint FK_RELATIONSHIP_25 foreign key (TABLA_ID)
      references TABLA_POSICIONES (TABLA_ID) on delete restrict on update restrict;

alter table TABLA_POSICIONES add constraint FK_PERTENECE foreign key (CAMP_ID)
      references CAMPEONATO (CAMP_ID) on delete restrict on update restrict;

alter table TABLA_POSICIONES add constraint FK_REGISTRA_GRUPO foreign key (GRUPO_ID)
      references GRUPO (GRUPO_ID) on delete restrict on update restrict;

alter table TARJETA add constraint FK_CONTIENE foreign key (TARJ_ID)
      references TARJETA_JUGADOR (TARJ_ID) on delete restrict on update restrict;

alter table TIPO_CAMPEONATO add constraint FK_TENER foreign key (DETALLE_GRUPO_ID)
      references DETALLE_GRUPO (DETALLE_GRUPO_ID) on delete restrict on update restrict;

