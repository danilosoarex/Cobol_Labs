      *****************************************************************
      * DATA     :  13/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO COMPUTACIONAL
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL025.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 13/08/24 @ 13:55:00.
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
          05 WSS-NUM-1 PIC S9(4)  USAGE IS COMP-5.
          05 WSS-NUM-2 PIC S9(9)  USAGE IS COMP-5.
          05 WSS-NUM-3 PIC S9(18) USAGE IS COMP-5.
          05 WSS-NUM-4 PIC 9(4)   USAGE IS COMP-5.
          05 WSS-NUM-5 PIC 9(9)   USAGE IS COMP-5.
          05 WSS-NUM-6 PIC 9(18)  USAGE IS COMP-5.

      *********************
       PROCEDURE DIVISION.
      *********************

           MOVE 0                  TO WSS-NUM-1.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-1.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-1.

           MOVE 1234               TO WSS-NUM-1.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-1.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-1.

           MOVE 9999               TO WSS-NUM-1.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-1.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-1.

           MOVE 0                  TO WSS-NUM-2.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-2.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-2.

           MOVE 12345678           TO WSS-NUM-2.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-2.
           DISPLAY 'LENGHTH OF WSS-NUM-2  : ' LENGTH OF WSS-NUM-2.

           MOVE 99999999           TO WSS-NUM-2.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-2.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-2.

           MOVE 0                  TO WSS-NUM-3.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-3.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-3.

           MOVE 123456789012345678 TO WSS-NUM-3.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-3.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-3.

           MOVE 999999999999999999 TO WSS-NUM-3.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-3.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-3.

           MOVE 0                  TO WSS-NUM-4.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-4.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-4.

           MOVE 1234               TO WSS-NUM-4.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-4.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-4.

           MOVE 9999               TO WSS-NUM-4.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-4.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-4.

           MOVE 0                  TO WSS-NUM-5.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-5.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-5.

           MOVE 12345678           TO WSS-NUM-5.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-5.
           DISPLAY 'LENGHTH OF WSS-NUM-2  : ' LENGTH OF WSS-NUM-5.

           MOVE 99999999           TO WSS-NUM-5.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-5.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-5.

           MOVE 0                  TO WSS-NUM-6.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-6.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-6.

           MOVE 123456789012345678 TO WSS-NUM-6.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-6.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-6.

           MOVE 999999999999999999 TO WSS-NUM-6.

           DISPLAY ' '.
           DISPLAY "THE NUMBER            : " WSS-NUM-6.
           DISPLAY 'LENGHTH OF WSS-NUM-1  : ' LENGTH OF WSS-NUM-6.

           STOP RUN.

       END PROGRAM COBOL025.

      ********************** FIM DO PROGRAMA ***************************
