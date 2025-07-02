      *****************************************************************
      * DATA     :  06/06/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL086.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 06/06/24 @ 22:20:00.
       DATE-COMPILED. 2024-02-16.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 WSS-DATA-COMPIL  PIC X(16).
      *
       01 WSS-PROGRAMA     PIC X(08) VALUE 'COBOL085'.
      *
       PROCEDURE DIVISION.
      *
           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' PROGRAMA PRINCIPAL TESTE DE CALL      '.
           DISPLAY ' PROGRAMA ANINHADO          '.
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.

           DISPLAY ' '.
           DISPLAY 'CHAMADA GENERICA'.

           CALL 'FILHO086'.

           DISPLAY ' '.

           CALL 'NETO086'.

           DISPLAY ' '.
      *
           STOP RUN.
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILHO086.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WSS-DATA-COMPIL  PIC X(16).
      *
       01 WSS-PROGRAMA     PIC X(08) VALUE 'COBOL085'.
      *
       PROCEDURE DIVISION.
      *

           DISPLAY ' PROGRAMA FILHO086      '.

           DISPLAY ' '.
           DISPLAY 'CHAMADA GENERICA'.

           CALL 'FILHO085JR'.

           DISPLAY ' '.

           CALL 'FILHO085SR'

           DISPLAY ' '.
      *
           STOP RUN.
      *
       END PROGRAM COBOL086.
      ********************** FIM COBO084    ****************************
