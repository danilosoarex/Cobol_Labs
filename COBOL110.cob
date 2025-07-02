      *****************************************************************
      * DATA     :  24/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : USO DE PONTEIRO DE MEMORIA
      *            LENDO O MODULO EXECUTAVEL DO PROGRAMA E OBTEM
      *            NOME DO PROGRAMA, DATA E HORA DE COMPILACAO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL110.

       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 24/08/24 @ 14:15:54.
       DATE-COMPILED. 2024-08-24.
       DATE-COMPILED. 2024-02-16.
       INSTALLATION. INEFE.
       SECURITY. PROGRAMA EDUCACIONAL.
      *
      **********************
       ENVIRONMENT DIVISION.
      **********************
      *
       CONFIGURATION SECTION.
      *
       SOURCE-COMPUTER. IBM390 WITH DEBUGGING MODE.
       OBJECT-COMPUTER. IBM390.
      *
       SPECIAL-NAMES.
      *
           DECIMAL-POINT IS COMMA.
      *
      ***************
       DATA DIVISION.
      ***************

      ****************************************************************
       WORKING-STORAGE SECTION.
      ****************************************************************
       01 WHEN-COMPILED-WORK.
         05 COMPILE-DATE        PIC X(08) VALUE 'MM/DD/YY'.
         05 COMPILE-TIME        PIC X(08) VALUE 'HH.MM.SS'.
      *
       01 WSS-COMPILED          PIC X(20).
      *
       01 WSS-TCB-ADDR-01.
           10 WSS-TCB-ADDR POINTER.
      *
       01 WSS-DISPLAY-FIELDS.
           10 WSS-PN-DISPLAY   PIC X(008).
      *
      ****************************************************************
       LINKAGE SECTION.
      ****************************************************************
       01 LK-TCB-ADDR POINTER.
      *--------------------------------------------------------------
      *===> T A S K C O N T R O L B L O C K
      *--------------------------------------------------------------
       01 LK-TCB.
         10 FILLER             PIC X(012).
         10 LK-TIOT-ADDR POINTER.
         10 FILLER             PIC X(028).
         10 LK-LAST-CDE-ADDR POINTER.
      *--------------------------------------------------------------
      *===> C O N T E N T S D I R E C T O R Y E N T R Y
      *--------------------------------------------------------------
       01 LK-CDE.
         10 LK-PREV-CDE-ADDR POINTER.
         10 FILLER             PIC X(004).
         10 LK-PGM-NAME        PIC X(008).
         10 LK-EP-ADDR         PIC X(004).
         10 LK-EXTENT-LST-ADDR POINTER.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

       000-MAINLINE      SECTION.

           DISPLAY ' '.
           DISPLAY ' PROGRAMA COBOL110'.
           DISPLAY ' USO DE COMANDO SET PARA LER PONTEIRO DE MEMORIA'
           DISPLAY ' OBTENDO NOME, DATA E HORA DE COMPILACAO DO PGM '
           DISPLAY ' '.

           MOVE WHEN-COMPILED TO WSS-COMPILED
      *
           DISPLAY ' WSS-COMPILED = ' WSS-COMPILED.
      *

      *--------------------------------------------------------------
      *===> ESTABLISH ADDRESSABILITY FOR TIOT
      *--------------------------------------------------------------
           MOVE X"0000021C" TO WSS-TCB-ADDR-01

           SET ADDRESS OF LK-TCB-ADDR TO WSS-TCB-ADDR
           SET ADDRESS OF LK-TCB      TO LK-TCB-ADDR
           SET ADDRESS OF LK-CDE      TO LK-LAST-CDE-ADDR

           PERFORM WITH TEST BEFORE UNTIL LK-PREV-CDE-ADDR = NULLS
             SET ADDRESS OF LK-CDE TO LK-PREV-CDE-ADDR
           END-PERFORM

           MOVE LK-PGM-NAME TO WSS-PN-DISPLAY
      *
           MOVE WHEN-COMPILED TO WHEN-COMPILED-WORK
      *
           DISPLAY " "
           DISPLAY WSS-PN-DISPLAY
                   ' COMPILE DATE/TIME ' COMPILE-DATE
                   ' - ' COMPILE-TIME ' **'
           DISPLAY ALL SPACES.
      *
           GOBACK.
      *
       END PROGRAM COBOL110.
      ********************* FIM DO PROGRAMA ****************************
