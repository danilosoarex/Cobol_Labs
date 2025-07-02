      *****************************************************************
      * DATA     : 29/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VISUALIZAR HEXADECIMAL
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL118.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 29/08/24 @ 21:18:00.
       DATE-COMPILED. 2024-08-29.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************
      *
       CONFIGURATION SECTION.
      *
       INPUT-OUTPUT SECTION.
      *
      ***************
       DATA DIVISION.
      ***************
      *
      *
       WORKING-STORAGE SECTION.
      *
      * HEXVAL (OUTPUT) MUST BE TWICE THE SIZE OF HEXNUM (INPUT).
      * FOR EXAMPLE IF YOU HAVE 20 BYTES OF GARBAGE BUT
      * WANT TO DISPLAY IT IN HEX, CHANGE THE PICTURE
      * OF HEXNUM TO X(20), OF HEXVAL TO X(40), THEN
      * MOVE THE GARBAGE TO HEXNUM. IGNORE DECNUM.
      *
       01  HEXNUM   PIC X(4) VALUE X"0000CA84".
       01  DECNUM   REDEFINES HEXNUM PIC S9(8) COMP.
       01  HEXVAL   PIC X(8).
       01  HEXSTR   PIC X(16) VALUE "0123456789ABCDEF".
       01  DEC      PIC S9(4) COMP.
       01  FILLER   REDEFINES DEC.
           02  FILLER PIC X.
           02  DECBYTE PIC X.
       01  I   PIC S9(8) COMP.
       01  J   PIC S9(8) COMP.
       01  Q   PIC S9(8) COMP.
       01  R   PIC S9(8) COMP.
       01  J1  PIC S9(8) COMP.
       01  Q1  PIC S9(8) COMP.
       01  R1  PIC S9(8) COMP.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

       TEST-IT.

           DISPLAY ' '
           DISPLAY ' COBOL118 - PRINT HEXADECIMAL'
           DISPLAY ' '

           DISPLAY "HEX        " HEXNUM.
           DISPLAY "DEC        " DECNUM.

           PERFORM CONVERT

           DISPLAY "PRINTABLE  " HEXVAL.

           STOP RUN.

       CONVERT.

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF HEXNUM
             COMPUTE J = 2 * I - 1
             MOVE HEXNUM(I:1) TO DECBYTE
             DIVIDE DEC BY 16 GIVING Q REMAINDER R
             COMPUTE J1 = J + 1
             COMPUTE Q1 = Q + 1
             COMPUTE R1 = R + 1
             MOVE HEXSTR(Q1:1) TO HEXVAL(J:1)
             MOVE HEXSTR(R1:1) TO HEXVAL(J1:1)
           END-PERFORM.

       ROT-ABEND.

           DISPLAY '*******************************************'.
           DISPLAY ' ABEND PROGRAMADO '.
           DISPLAY ' ERRO ENCONTRADO : '  RETURN-CODE.
           DISPLAY ' FAVOR AVISAR O ANALISTA RESPONSAVEL'.
           DISPLAY '*******************************************'.
      **** CALL ABEND.
           STOP RUN.
       ROT-ABEND-EXIT.
           EXIT.

       END PROGRAM COBOL118.
      ********************** FIM PROGRAMA   ****************************
