      *****************************************************************
      * DATA     :  31/05/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VARIAVEL NUMERICA COMP
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL019.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 31/05/23 @ 10:15:00.
       DATE-COMPILED. 2023-05-31.
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
       01  WSS-VARIAVEL-COMP.
          05  A-COMP-1  USAGE COMP-1.
          05  B-COMP-2  USAGE COMP-2.
          05  C-COMP-3  PIC 9(16)V9(2)  USAGE COMP-3.
          05  D-COMP-4  PIC 9(14)V9(4)  USAGE COMP-4.
          05  E-COMP-5  PIC 9(12)V9(6)  USAGE COMP-5.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL019'.
           DISPLAY 'VARIAVEL NUMERICA COMPACTADA'.

           INITIALIZE WSS-VARIAVEL-COMP.

           MOVE '012345678901234567' TO A-COMP-1.

           DISPLAY '001 '.
           DISPLAY ' A-COMP-1  : ' A-COMP-1
                   ' LENGTH    : ' LENGTH OF A-COMP-1.

           MOVE '012345678901234567' TO B-COMP-2.

           DISPLAY '002 '.
           DISPLAY ' B-COMP-2  : ' B-COMP-2
                   ' LENGTH    : ' LENGTH OF B-COMP-2.


           MOVE 123456789012345678 TO C-COMP-3.

           DISPLAY '003 '.
           DISPLAY ' C-COMP-3  : ' C-COMP-3
                   ' LENGTH    : ' LENGTH OF C-COMP-3.

           MOVE 123456789012345678 TO D-COMP-4.

           DISPLAY '004 '.
           DISPLAY ' D-COMP-4  : ' D-COMP-4
                   ' LENGTH    : ' LENGTH OF D-COMP-4.


           MOVE 99999888801234567890123456789 TO E-COMP-5.

           DISPLAY '005 '.
           DISPLAY ' E-COMP-5  : ' E-COMP-5
                   ' LENGTH    : ' LENGTH OF E-COMP-5.

           STOP RUN.

       END PROGRAM COBOL019.
      ********************** FIM PROGRAMA   ****************************
