      *****************************************************************
      * DATA     : 12/06/2025
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO IF DOIDO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL129.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 12/06/25 @ 22:45:00.
       DATE-COMPILED. 2025-06-12.
       INSTALLATION. INEFE.
       SECURITY. EXEMPLO IF DOIDO

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
       77 WSS-CONTADOR       PIC 9   VALUE ZEROES.
       77 WSS-INDICE         PIC 99  VALUE ZEROES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL129'.
           DISPLAY 'TESTE PERFORM  '.

           DISPLAY ' PERFORM TIMES FIXO'
      *
           IF WSS-CONTADOR > 1
              DISPLAY 'ENTREI AQUI'
           END-IF.
      *
           IF WSS-CONTADOR > 2
              DISPLAY 'ENTREI AQUI 2'
           ELSE
              DISPLAY 'ELSE   AQUI 2'
           END-IF.
      *
           IF WSS-CONTADOR = ZEROES
              DISPLAY 'ENTREI AQUI 3'
           ELSE
              DISPLAY 'ELSE   AQUI 3'
           END-IF.

           STOP RUN.

       END PROGRAM COBOL129.
      ********************** FIM PROGRAMA   ****************************
