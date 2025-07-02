      *****************************************************************
      * DATA     : 05/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO EVALUATE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL032.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 05/06/23 @ 08:55:00.
       DATE-COMPILED. 2023-06-05.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.
      **********************
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
       77 WSS-RANDOM-NUMBER1 PIC 999 VALUE ZEROES.
       77 WSS-RANDOM-NUMBER2 PIC 999 VALUE ZEROES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL032'.
           DISPLAY 'TESTE EVALUATE '.
           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           DISPLAY '001 - EVALUATE '.
           DISPLAY ' '.

           EVALUATE TRUE
              WHEN WSS-RANDOM-NUMBER1 = 10
                   DISPLAY '10'

              WHEN WSS-RANDOM-NUMBER1 = 20
                    DISPLAY '20'

              WHEN WSS-RANDOM-NUMBER1 = 30
                    DISPLAY '30'
              WHEN WSS-RANDOM-NUMBER1 = 40
                    DISPLAY '40'

              WHEN OTHER
                    DISPLAY ' FALHOU :' WSS-RANDOM-NUMBER1

           END-EVALUATE.

           STOP RUN.

       ROT-ALEATORIA.
           COMPUTE WSS-RANDOM-NUMBER1 = FUNCTION RANDOM * 40.
           COMPUTE WSS-RANDOM-NUMBER2 = FUNCTION RANDOM * 25.
           DISPLAY ' '.
           DISPLAY ' 1 --> ' WSS-RANDOM-NUMBER1
                   ' 2 --> ' WSS-RANDOM-NUMBER2
           DISPLAY ' '.
       ROT-ALEATORIA-EXIT.
           EXIT.

       END PROGRAM COBOL032.
      ********************** FIM PROGRAMA   ****************************
