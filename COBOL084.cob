      *****************************************************************
      * DATA     :  06/06/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO
      * CPD      : INEFE
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID. COBOL084.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 06/06/24 @ 22:20:00.
       DATE-COMPILED. 2024-06-06.
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
           DISPLAY ' UTILIZANDO PONTO DE ENTRADA'.
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.

           DISPLAY ' '.
           DISPLAY 'CHAMADA GENERICA'.

           CALL 'COBOL085'.

           DISPLAY ' '.
           DISPLAY 'ENTRANDO CALL ENTRY POINT 1..'

           MOVE 'POINT1'     TO  WSS-PROGRAMA.

           CALL WSS-PROGRAMA.

           DISPLAY ' '.
           DISPLAY 'CONTROL IS IN MAIN PRORGAM....'
           DISPLAY 'ENTRANDO CALL ENTRY POINT 2..'
      *
           MOVE 'POINT2'     TO  WSS-PROGRAMA.

           CALL WSS-PROGRAMA.

      *
           STOP RUN.
      *
       END PROGRAM COBOL084.
      ********************** FIM COBO084    ****************************
