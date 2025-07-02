      *****************************************************************
      * DATA     :  12/06/2025
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO PERFORM THUR SECTION PARAGRAPH
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL130.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 12/06/25 @ 18:40:00.
       DATE-COMPILED. 2025-06-12.
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
       77 WSS-DATA              PIC 9(08).
       77 WSS-HORA              PIC 9(08).
      *
      ********************
       PROCEDURE DIVISION.
      ********************
       MAIN-SECTION                       SECTION.

           DISPLAY 'COBOL130'.
           DISPLAY 'OPERANDOS ARITMETICOS            '.

           PERFORM PRIMEIRA-SECTION.

           DISPLAY ' '.

           PERFORM ROT-OI
              THRU ROT-OLA.

           PERFORM SEGUNDA-SECTION.

           PERFORM ROT-OLHA-RELOGIO.

           STOP RUN.

       PRIMEIRA-SECTION                   SECTION.

       ROT-OI.
           DISPLAY 'OI'.
       ROT-OLA.
           DISPLAY 'OLA'.
       ROT-CIAO.
           DISPLAY 'CIAO'.

       SEGUNDA-SECTION                    SECTION.

       ROT-QUE-HORAS.
           DISPLAY 'QUE HORAS SAO?'.

       TERCEIRA-SECTION                   SECTION.

       ROT-OLHA-CALENDARIO.
           ACCEPT WSS-DATA   FROM DATE
           DISPLAY 'HOJE EH ' WSS-DATA.

       ROT-OLHA-RELOGIO.
           ACCEPT  WSS-HORA  FROM TIME
           DISPLAY 'SAO: ' WSS-HORA  ' HORAS'.

       END PROGRAM COBOL130.
      ********************** FIM PROGRAMA   ****************************
