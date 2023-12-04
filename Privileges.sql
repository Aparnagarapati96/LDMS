/*****************---------------------Create user-----------------------------------******/

ALTER SESSION SET "_oracle_script" = true;

CREATE USER ldmsdb IDENTIFIED BY ldmsdb;

/*****************---------------------Granting Privileges---------------------------******/

GRANT
    CREATE SESSION,
    ALTER SESSION,
    CREATE DATABASE LINK,
    CREATE MATERIALIZED VIEW,
    CREATE PROCEDURE,
    CREATE PUBLIC SYNONYM,
    CREATE ROLE,
    CREATE SEQUENCE,
    CREATE SYNONYM,
    CREATE TABLE,
    CREATE TRIGGER,
    CREATE TYPE,
    CREATE VIEW,
    UNLIMITED TABLESPACE
TO ldmsdb;
