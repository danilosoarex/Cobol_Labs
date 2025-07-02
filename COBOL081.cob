      *****************************************************************
      * DATA     : 20/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO PONTEIRO COM ACESSO AO USER-ID
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL081.

       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 20/06/23 @ 10:50:00.
       DATE-COMPILED. 2023-06-20.
       INSTALLATION. INEFE CPD MARIST EDUCATIONAL.
       SECURITY. PROGRAMA EDUCACIONAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
       FILE SECTION.
      *
       WORKING-STORAGE SECTION.
      *
       01  WSS-PSA-POINTER POINTER.
       01  WSS-USERID           PIC X(8).
      *
       01 WSS-VARIAVEIS         PIC X(20) VALUE SPACES.
       01 WSS-COUNT             PIC 9(03) VALUE ZEROES.
       01 WSS-DATA-COMPIL       PIC X(16) VALUE SPACES.
       01 WSS-TAMANHO           PIC 9(04) VALUE ZEROES.
      *
         77 X PIC 9(2) PACKED-DECIMAL.
         77 NUM-ELEMENTS PIC 9(4) BINARY.
         77 SIZE-NEEDED PIC 9(4) BINARY.
         77 VPTR POINTER.
      *
       LINKAGE SECTION.
      *
       01 VARGRP.
         05 OBJ        PIC 9(4) COMP.
         05 TABGRP.
           10 VARTAB OCCURS 1 TO UNBOUNDED DEPENDING ON OBJ.
             15 T1   PIC 9(4).
             15 T2   PIC X(8).
             15 T3   PIC 9(4) COMP.
      *
       01 BUFFER       PIC X(1000).
      *
      *************************************
       PROCEDURE DIVISION.
      *************************************

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY 'COBOL081'.
           DISPLAY 'EXEMPLO DE PONTEIRO BUSCA WSS-USERID'.
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

           SET VPTR                TO NULL

      *************************************************************
      * ALLOCATE UMA TABELA COM 20 ELEMENTOS
      *************************************************************
           COMPUTE NUM-ELEMENTS = 20

           PERFORM ALLOC-VARGRP

      *************************************************************
      * SET SOME  TEST  VALUES TO VALIDATE RE-ALLOCATED TABLE
      *************************************************************
           COMPUTE T1(12) = 9999

           MOVE  'HI MOM'  TO T2 (17)

           DISPLAY ' '
           DISPLAY ' VARTAB(12) = '  VARTAB(12)
           DISPLAY ' VARTAB(17) = ' VARTAB(17)
           DISPLAY ' '.

      *************************************************************
      * NEED A BIGGER TABLE! ALLOCATE A LARGER ONE AND COPY DATA
      *************************************************************
           COMPUTE NUM-ELEMENTS = 30

           PERFORM ALLOC-VARGRP

      *************************************************************
      * ENSURE THAT NEW TABLE HAS CORRECT DATA FROM ORIGINAL
      *************************************************************
           DISPLAY  VARTAB(12) =   VARTAB(12)
           DISPLAY  VARTAB(17) =   VARTAB(17)

           GOBACK.

      *************************************************************
      * THE FIRST TIME ALLOCATE THE ORIGINAL TABLE. IF THE TABLE
      * HAS ALREADY BEEN ALLOCATED, ASSUME THAT WE ARE ALLOCATING
      * A LARGER ONE AND WANT TO COPY THE DATA OVER TO IT
      *************************************************************
        ALLOC-VARGRP.

           IF VPTR = NULL
             COMPUTE SIZE-NEEDED = LENGTH OF OBJ +
                                 LENGTH OF VARTAB * NUM-ELEMENTS
             ALLOCATE SIZE-NEEDED CHARACTERS INITIALIZED RETURNING VPTR
             SET ADDRESS OF VARGRP TO VPTR
             MOVE NUM-ELEMENTS TO OBJ

           ELSE
      ******************************************************************
      * RE-SIZE IT!
      * FIRST, MAP BUFFER ON CURRENT TABLE
      ******************************************************************
             SET ADDRESS OF BUFFER TO VPTR

      ******************************************************************
      * CALCULATE NEW SIZE FROM NUM-ELEMENTS
      ******************************************************************

             COMPUTE SIZE-NEEDED = LENGTH OF OBJ +
                                  LENGTH OF VARTAB * NUM-ELEMENTS

             ALLOCATE SIZE-NEEDED CHARACTERS
                  INITIALIZED RETURNING VPTR

      *************************************************************
      * MOVE DATA FROM OLD TABLE TO NEW LARGER TABLE
      *************************************************************
             SET ADDRESS OF VARGRP TO VPTR
             MOVE NUM-ELEMENTS TO OBJ
             MOVE BUFFER(1:SIZE-NEEDED) TO VARGRP

      *************************************************************
      * FREE THE ORIGINAL TABLE
      ************************************************************

             SET VPTR TO ADDRESS OF BUFFER

             FREE VPTR
           END-IF.

       END PROGRAM COBOL081.
      ********************** FIM PROGRAMA   ****************************
