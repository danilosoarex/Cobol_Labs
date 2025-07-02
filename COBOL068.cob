      *****************************************************************
      * DATA     :  15/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO CALL RECURSIVO
      *            START VIA JCL PRIMEIRA, PARAMETROS POR VIRGULA
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL068  RECURSIVE.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 15/06/23 @ 21:15:00.
       DATE-COMPILED. 2023-06-15.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

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
       01  COMMAPOS PIC S9(9) BINARY.
       01  PARMNO PIC S9(4) BINARY VALUE 0.
       01  PGMPARM.
         02  PGMPARM-LENGTH PIC S9(4) BINARY.
         02  PGMPARM-CONTENS PIC X(100).
      *
       LOCAL-STORAGE SECTION.
      *
       01  LOCALNO PIC S9(4) BINARY VALUE 0.
      *
       LINKAGE SECTION.
      *
       01  JCLPARM.
         02  JCLPARM-LENGTH PIC S9(4) BINARY.
         02  JCLPARM-CONTENS PIC X(100).
      *
      ***********************************
       PROCEDURE DIVISION USING JCLPARM.
      ***********************************

           DISPLAY 'COBOL068'.
           DISPLAY 'EXEMPLO DE PROGRAMA RECURSIVO'.
           DISPLAY ' '.

           MOVE JCLPARM TO PGMPARM.

           PERFORM PGMSTART.

           GOBACK.

      *****************************************************************
       PGMSTART.

           DISPLAY 'PGMSTART'.

           MOVE 1 TO COMMAPOS

           ADD 1  TO PARMNO
           ADD 1  TO LOCALNO

           IF PGMPARM-LENGTH > 0

              INSPECT PGMPARM-CONTENS(1:PGMPARM-LENGTH)
                 TALLYING COMMAPOS FOR CHARACTERS BEFORE ','

               DISPLAY 'PARMNO=' PARMNO
                       ', LOCALNO=' LOCALNO ', VALUE=<'
                       PGMPARM-CONTENS(1:COMMAPOS - 1) '>'

              DISPLAY 'COMMAPOS = ' COMMAPOS

              IF COMMAPOS <= JCLPARM-LENGTH
                SUBTRACT COMMAPOS FROM PGMPARM-LENGTH
                MOVE PGMPARM-CONTENS(COMMAPOS + 1:)
                                      TO PGMPARM-CONTENS
                MOVE PARMNO TO LOCALNO
                CALL 'COBOL068' USING PGMPARM
                DISPLAY 'PARMNO=' PARMNO
                         ', LOCALNO=' LOCALNO ' AFTER RECURSION'
              END-IF
            END-IF.

       END PROGRAM COBOL068.

      ********************** FIM PROGRAMA   ****************************
