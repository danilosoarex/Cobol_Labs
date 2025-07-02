      *****************************************************************
      * DATA     :  22/01/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      *  OBJETIVO : PROGRAMA EXEMPLO CALCULO DE DIVISAO
      *             DIVIDE E SUA SINTAXE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL041.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 22/01/24 @ 19:21:00.
       DATE-COMPILED. 2024-01-22.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.

       SOURCE-COMPUTER. IBM3270.
       OBJECT-COMPUTER. IBM3270.

       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      ***************
       DATA DIVISION.
      ***************
       FILE SECTION.
      *
       WORKING-STORAGE SECTION.
      *
       01  WSS-VALORES-AUXILIARES.
           05 WSS-VALOR-1    PIC 9(009)V99          VALUE ZEROES.
           05 WSS-VALOR-2    PIC 9(009)V99          VALUE ZEROES.
           05 WSS-VALOR-3    PIC 9(009)V99          VALUE ZEROES.
           05 WSS-VALOR-4    PIC 9(009)             VALUE ZEROES.
           05 WSS-VALOR-5    PIC 9(009)             VALUE ZEROES.
           05 WSS-VALOR-6    PIC 9(009)             VALUE ZEROES.
           05 WSS-VALOR-7    PIC 9(009)             VALUE ZEROES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

       001-DIVIDE   SECTION.

           DISPLAY 'COBOL041'.
           DISPLAY 'EXEMPLO DIVIDE                 '.
           DISPLAY ' '.

      ********** EXEMPLO 001
           DISPLAY 'EXEMPLO 001'

           MOVE 6334,00         TO WSS-VALOR-1
           DISPLAY "INICIAL WSS-VALOR-1 " WSS-VALOR-1

           DIVIDE 5 INTO WSS-VALOR-1

           DISPLAY 'DEPOIS'.
           DISPLAY "WSS-VALOR-1 " WSS-VALOR-1
           DISPLAY ' '.

      ********** EXEMPLO 002
           DISPLAY 'EXEMPLO 002'

           MOVE 48,00        TO  WSS-VALOR-1
           MOVE 11,00        TO  WSS-VALOR-2
           MOVE  5,31        TO  WSS-VALOR-3

           DISPLAY 'ANTES'.
           DISPLAY "WSS-VALOR-1 " WSS-VALOR-1
           DISPLAY "WSS-VALOR-2 " WSS-VALOR-2
           DISPLAY "WSS-VALOR-3 " WSS-VALOR-3

           DIVIDE WSS-VALOR-1 BY WSS-VALOR-2
              GIVING WSS-VALOR-3
           END-DIVIDE.

           DISPLAY 'DEPOIS'.
           DISPLAY "WSS-VALOR-1 " WSS-VALOR-1
           DISPLAY "WSS-VALOR-2 " WSS-VALOR-2
           DISPLAY "WSS-VALOR-3 " WSS-VALOR-3

           DISPLAY ' '.

      ********** EXEMPLO 003
           DISPLAY 'EXEMPLO 003'

           MOVE 1335,00      TO  WSS-VALOR-1
           MOVE 0            TO  WSS-VALOR-2

           DISPLAY 'ANTES'.
           DISPLAY "WSS-VALOR-1 " WSS-VALOR-1
           DISPLAY "WSS-VALOR-2 " WSS-VALOR-2

           DIVIDE WSS-VALOR-1 BY WSS-VALOR-2
             GIVING WSS-VALOR-2
             ON SIZE ERROR MOVE ZEROES TO WSS-VALOR-1
           END-DIVIDE.

           DISPLAY 'DEPOIS'.
           DISPLAY "WSS-VALOR-1 " WSS-VALOR-1
           DISPLAY "WSS-VALOR-2 " WSS-VALOR-2

           DISPLAY ' '.

      ********** EXEMPLO 004
           DISPLAY 'EXEMPLO 004'

           MOVE 32,00        TO  WSS-VALOR-1
           MOVE 11,00        TO  WSS-VALOR-2
           MOVE 3            TO  WSS-VALOR-3

           DISPLAY 'ANTES'.
           DISPLAY "WSS-VALOR-1 " WSS-VALOR-1
           DISPLAY "WSS-VALOR-2 " WSS-VALOR-2
           DISPLAY "WSS-VALOR-3 " WSS-VALOR-3

           DIVIDE WSS-VALOR-1 BY WSS-VALOR-2
             GIVING WSS-VALOR-3 ROUNDED
           END-DIVIDE.

           DISPLAY 'DEPOIS'.
           DISPLAY "WSS-VALOR-1 " WSS-VALOR-1
           DISPLAY "WSS-VALOR-2 " WSS-VALOR-2
           DISPLAY "WSS-VALOR-3 " WSS-VALOR-3

           DISPLAY ' '.

      ********** EXEMPLO 005
           DISPLAY 'EXEMPLO 005'

           MOVE 32,00        TO  WSS-VALOR-4
           MOVE 11,00        TO  WSS-VALOR-5
           MOVE 3            TO  WSS-VALOR-6

           DISPLAY 'ANTES'.
           DISPLAY "WSS-VALOR-4 " WSS-VALOR-4
           DISPLAY "WSS-VALOR-5 " WSS-VALOR-5
           DISPLAY "WSS-VALOR-6 " WSS-VALOR-6

           DIVIDE WSS-VALOR-4 BY WSS-VALOR-5
             GIVING WSS-VALOR-6 ROUNDED
           END-DIVIDE.

           DISPLAY 'DEPOIS'.
           DISPLAY "WSS-VALOR-4 " WSS-VALOR-4
           DISPLAY "WSS-VALOR-5 " WSS-VALOR-5
           DISPLAY "WSS-VALOR-6 " WSS-VALOR-6

           DISPLAY ' '.

      ********** EXEMPLO 006
           DISPLAY 'EXEMPLO 006'

           MOVE 32,00        TO  WSS-VALOR-4
           MOVE 11,00        TO  WSS-VALOR-5
           MOVE 3            TO  WSS-VALOR-6

           DISPLAY 'ANTES'.
           DISPLAY "WSS-VALOR-4 " WSS-VALOR-4
           DISPLAY "WSS-VALOR-5 " WSS-VALOR-5
           DISPLAY "WSS-VALOR-6 " WSS-VALOR-6

           DIVIDE WSS-VALOR-4 BY WSS-VALOR-5
             GIVING WSS-VALOR-6
             REMAINDER WSS-VALOR-7
           END-DIVIDE.

           DISPLAY 'DEPOIS'.
           DISPLAY "WSS-VALOR-4 " WSS-VALOR-4
           DISPLAY "WSS-VALOR-5 " WSS-VALOR-5
           DISPLAY "WSS-VALOR-6 " WSS-VALOR-6
           DISPLAY "WSS-VALOR-7 " WSS-VALOR-7

           DISPLAY ' '.

           STOP RUN.

       END PROGRAM COBOL041.
      ********************** FIM PROGRAMA   ****************************
