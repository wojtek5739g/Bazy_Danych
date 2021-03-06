-- Generated by Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   at:        2022-05-29 21:08:12 CEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



DROP TABLE dyrektorowie CASCADE CONSTRAINTS;

DROP TABLE klasy CASCADE CONSTRAINTS;

DROP TABLE konkretne_przedmioty CASCADE CONSTRAINTS;

DROP TABLE nauczyciele CASCADE CONSTRAINTS;

DROP TABLE oceny CASCADE CONSTRAINTS;

DROP TABLE oceny_uczniow CASCADE CONSTRAINTS;

DROP TABLE przedmioty CASCADE CONSTRAINTS;

DROP TABLE uczniowie CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE dyrektorowie (
    dyrektor_id      NUMBER NOT NULL,
    data_rozpoczecia DATE NOT NULL,
    data_zakonczenia DATE,
    nauczyciel_id    NUMBER NOT NULL
);

ALTER TABLE dyrektorowie ADD CONSTRAINT dyrektorowie_pk PRIMARY KEY ( dyrektor_id );

CREATE TABLE klasy (
    klasa_id      NUMBER NOT NULL,
    rok           NUMBER NOT NULL,
    litera        CHAR(1 BYTE) NOT NULL,
    wychowawca_id NUMBER NOT NULL
);

ALTER TABLE klasy ADD CONSTRAINT klasy_pk PRIMARY KEY ( klasa_id );

CREATE TABLE konkretne_przedmioty (
    konkretny_przedmiot_id NUMBER NOT NULL,
    przedmiot_id           NUMBER NOT NULL,
    klasa_id               NUMBER NOT NULL,
    nauczyciel_id          NUMBER NOT NULL
);

ALTER TABLE konkretne_przedmioty ADD CONSTRAINT konkretne_przedmioty_pk PRIMARY KEY ( konkretny_przedmiot_id );

CREATE TABLE nauczyciele (
    nauczyciel_id   NUMBER NOT NULL,
    imie            VARCHAR2(50) NOT NULL,
    nazwisko        VARCHAR2(50) NOT NULL,
    data_dolaczenia DATE NOT NULL
);

ALTER TABLE nauczyciele ADD CONSTRAINT nauczyciele_pk PRIMARY KEY ( nauczyciel_id );

CREATE TABLE oceny (
    ocena_id      NUMBER(3, 2) NOT NULL,
    liczba        NUMBER,
    ocena_slownie VARCHAR2(50)
);

ALTER TABLE oceny ADD CONSTRAINT oceny_pk PRIMARY KEY ( ocena_id );

CREATE TABLE oceny_uczniow (
    konkretna_ocena_id     NUMBER NOT NULL,
    uczen_id               NUMBER NOT NULL,
    ocena_id               NUMBER(3, 2) NOT NULL,
    data_wystawienia       DATE NOT NULL,
    konkretny_przedmiot_id NUMBER NOT NULL,
    komentarz              VARCHAR2(300)
);

ALTER TABLE oceny_uczniow ADD CONSTRAINT oceny_uczniow_pk PRIMARY KEY ( konkretna_ocena_id );

CREATE TABLE przedmioty (
    przedmiot_id NUMBER NOT NULL,
    nazwa        VARCHAR2(50)
);

ALTER TABLE przedmioty ADD CONSTRAINT przedmioty_pk PRIMARY KEY ( przedmiot_id );

CREATE TABLE uczniowie (
    uczen_id NUMBER NOT NULL,
    imie     VARCHAR2(50) NOT NULL,
    nazwisko VARCHAR2(50) NOT NULL,
    klasa_id NUMBER NOT NULL
);

ALTER TABLE uczniowie ADD CONSTRAINT uczniowie_pk PRIMARY KEY ( uczen_id );

ALTER TABLE dyrektorowie
    ADD CONSTRAINT dyrektorowie_nauczyciele_fk FOREIGN KEY ( nauczyciel_id )
        REFERENCES nauczyciele ( nauczyciel_id );

ALTER TABLE konkretne_przedmioty
    ADD CONSTRAINT klasa_fk FOREIGN KEY ( klasa_id )
        REFERENCES klasy ( klasa_id );

ALTER TABLE oceny_uczniow
    ADD CONSTRAINT konkretne_przedmioty_fk FOREIGN KEY ( konkretny_przedmiot_id )
        REFERENCES konkretne_przedmioty ( konkretny_przedmiot_id );

ALTER TABLE klasy
    ADD CONSTRAINT nauczyciele_wychowawcy_fk FOREIGN KEY ( wychowawca_id )
        REFERENCES nauczyciele ( nauczyciel_id );

ALTER TABLE oceny_uczniow
    ADD CONSTRAINT oceny_fk FOREIGN KEY ( ocena_id )
        REFERENCES oceny ( ocena_id );

ALTER TABLE konkretne_przedmioty
    ADD CONSTRAINT prowadzacy_fk FOREIGN KEY ( nauczyciel_id )
        REFERENCES nauczyciele ( nauczyciel_id );

ALTER TABLE konkretne_przedmioty
    ADD CONSTRAINT przedmiot_fk FOREIGN KEY ( przedmiot_id )
        REFERENCES przedmioty ( przedmiot_id );

ALTER TABLE oceny_uczniow
    ADD CONSTRAINT uczniowie_fk FOREIGN KEY ( uczen_id )
        REFERENCES uczniowie ( uczen_id );

ALTER TABLE uczniowie
    ADD CONSTRAINT uczniowie_klasy_fk FOREIGN KEY ( klasa_id )
        REFERENCES klasy ( klasa_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
