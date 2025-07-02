      *****************************************************************
      * DATA     :  26/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO USO COMPUTACIONAL
      *            USO DOS LIMITES
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL112.
      *
       AUTHOR. VAGNER BELLACOSA.
       INSTALLATION. INEFE CPD MARIST.
       DATE-WRITTEN. 26/08/24 @ 19:52:00.
       DATE-COMPILED. 2024-08-26.
       INSTALLATION. INEFE.
       SECURITY. PROGRAMA EDUCACIONAL.
      *
       ENVIRONMENT DIVISION.
      *
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370 WITH DEBUGGING MODE.
       OBJECT-COMPUTER. IBM-370.
       SPECIAL-NAMES.
      *
           DECIMAL-POINT IS COMMA.
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
      *
       77 WSS-NUM04-COMP-4       PIC 9(4)   COMP-4.
       77 WSS-NUM09-COMP-4       PIC 9(9)   COMP-4.
       77 WSS-NUM18-COMP-4       PIC 9(18)  COMP-4.
       77 WSS-NUMS04-COMP-4      PIC S9(4)  COMP-4.
       77 WSS-NUMS09-COMP-4      PIC S9(9)  COMP-4.
       77 WSS-NUMS18-COMP-4      PIC S9(18) COMP-4.
      *
      *-------------------
       PROCEDURE DIVISION.
      *-------------------
      *
       MAIN_SECTION        SECTION.

           DISPLAY ' COBOL112  '.
           DISPLAY ' COMPUTACIONAL-4'
           DISPLAY ' USE DOS LIMITES'

           DISPLAY ' '.

           MOVE 65535                TO WSS-NUM04-COMP-4

           DISPLAY 'WSS-NUM04-COMP-4 = ' WSS-NUM04-COMP-4.

           MOVE 4294967295           TO WSS-NUM09-COMP-4

           DISPLAY 'WSS-NUM09-COMP-4 = ' WSS-NUM09-COMP-4.

           MOVE 18446744073709551615 TO WSS-NUM18-COMP-4

           DISPLAY 'WSS-NUM18-COMP-4 = ' WSS-NUM18-COMP-4.

           MOVE -32768               TO WSS-NUMS04-COMP-4

           DISPLAY 'WSS-NUMS04-COMP-4 = ' WSS-NUMS04-COMP-4.

           MOVE +32767               TO WSS-NUMS04-COMP-4

           DISPLAY 'WSS-NUMS04-COMP-4 = ' WSS-NUMS04-COMP-4.

           MOVE +32768               TO WSS-NUMS04-COMP-4

           DISPLAY 'WSS-NUMS04-COMP-4 = ' WSS-NUMS04-COMP-4.

           MOVE -2147483648          TO WSS-NUMS09-COMP-4

           DISPLAY 'WSS-NUMS09-COMP-4 = ' WSS-NUMS09-COMP-4.

           MOVE +2147483647          TO WSS-NUMS09-COMP-4

           DISPLAY 'WSS-NUMS09-COMP-4 = ' WSS-NUMS09-COMP-4.

           MOVE -9223372036854775808 TO WSS-NUMS18-COMP-4

           DISPLAY 'WSS-NUMS18-COMP-4 = ' WSS-NUMS18-COMP-4.

           MOVE +9223372036854775808 TO WSS-NUMS18-COMP-4

           DISPLAY 'WSS-NUMS18-COMP-4 = ' WSS-NUMS18-COMP-4.

           STOP RUN.

       END PROGRAM COBOL112.
      ********************** FIM DO PROGRAMA ***************************
