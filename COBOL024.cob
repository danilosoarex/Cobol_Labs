      *****************************************************************
      * DATA     :  13/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO COMPUTACIONAL OU COMPUTACIONAL-4
      *            DESCOBRINDO TAMANHO EM BYTES
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL024.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 13/08/24 @ 17:55:00.
       DATE-COMPILED. 2024-08-13.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       01 WSS-VAR.
          05 WSS-NUM-1 PIC S9(4)  USAGE IS COMP.
          05 WSS-NUM-2 PIC S9(9)  USAGE IS COMP.
          05 WSS-NUM-3 PIC S9(18) USAGE IS COMP.
      *
       77 WSS-NUMBER1    PIC 9(4) VALUE 123.
       77 WSS-EDITAVEL   PIC +ZZZ9.
       77 WSS-EDITAVEL-2 PIC +ZZZ,ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.
       77 WSS-EDITAVEL-4 PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZZ,ZZ9+.
       77 WSS-EDITAVEL-3 PIC +9(18).
      *
      *********************
       PROCEDURE DIVISION.
      *********************

           ADD  0                  TO WSS-NUM-1.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-1.
           DISPLAY 'LENGTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-1.

           DISPLAY ' O> ' WSS-NUM-1.

           ADD  9999 WSS-NUMBER1   TO WSS-NUM-1
             ON SIZE  ERROR DISPLAY 'ERROUUUU'
           END-ADD.

           DISPLAY ' O0> ' WSS-NUM-1.
           ADD  -154 WSS-NUMBER1   TO WSS-NUM-1
             ON SIZE  ERROR DISPLAY 'ERROUUUU DE NOVO'
             NOT ON SIZE  ERROR DISPLAY ' AGORA SIM '
           END-ADD.

           DISPLAY ' OP> ' WSS-NUM-1.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-1.
           DISPLAY 'LENGTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-1.

           MOVE -335                TO WSS-NUM-1.
           MOVE WSS-NUM-1           TO WSS-EDITAVEL.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-1.
           DISPLAY 'LENGTH OF WSS-NUM-1   : ' LENGTH OF WSS-NUM-1.
           DISPLAY 'WSS-EDITAVEL          : ' WSS-EDITAVEL.

           MOVE 9999               TO WSS-NUM-1.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-1.
           DISPLAY 'LENGTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-1.

           MOVE 0                  TO WSS-NUM-2.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-2.
           DISPLAY 'LENGTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-2.

           MOVE 12345678           TO WSS-NUM-2.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-2.
           DISPLAY 'LENGTH OF WSS-NUM-2  : ' LENGTH OF WSS-NUM-2.

           MOVE 99999999           TO WSS-NUM-2.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-2.
           DISPLAY 'LENGTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-2.

           MOVE 0                  TO WSS-NUM-3.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-3.
           DISPLAY 'LENGTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-3.

           MOVE 123456789012345678 TO WSS-NUM-3.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-3.
           DISPLAY 'LENGTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-3.

           MOVE +123456             TO WSS-NUM-3.
           MOVE WSS-NUM-3           TO WSS-EDITAVEL-2.
           MOVE WSS-NUM-3           TO WSS-EDITAVEL-3.
           MOVE WSS-NUM-3           TO WSS-EDITAVEL-4.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-3.
           DISPLAY 'LENGTH OF WSS-NUM-1   : ' LENGTH OF WSS-NUM-3.
           DISPLAY 'WSS-EDITAVEL-2        : ' WSS-EDITAVEL-2.
           DISPLAY 'WSS-EDITAVEL-3        : ' WSS-EDITAVEL-3.
           DISPLAY 'WSS-EDITAVEL-4        : ' WSS-EDITAVEL-4.

           MOVE 999999999999999999 TO WSS-NUM-3.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-3.
           DISPLAY 'LENGTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-3.

           STOP RUN.

       END PROGRAM COBOL024.

      ********************** FIM DO PROGRAMA ***************************
