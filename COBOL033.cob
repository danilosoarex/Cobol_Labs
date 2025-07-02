      *****************************************************************
      * DATA     : 05/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO EVALUATE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL033.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 05/06/23 @ 22:45:00.
       DATE-COMPILED. 2023-06-05.
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
       77 WSS-RANDOM-NUMBER1 PIC 999 VALUE ZEROES.
       77 WSS-RANDOM-NUMBER2 PIC 999 VALUE ZEROES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL033'.
           DISPLAY 'TESTE EVALUATE '.
           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           DISPLAY '001 - EVALUATE '.
           DISPLAY ' '.

           EVALUATE TRUE
               WHEN WSS-RANDOM-NUMBER2 > 10
                   DISPLAY 'WSS-RANDOM-NUMBER2 MAIOR QUE 10'

               WHEN WSS-RANDOM-NUMBER2 > 20
                    DISPLAY 'WS-A LESS THAN  MAIOR QUE 20'

               WHEN OTHER
                   DISPLAY 'VALOR INVALIDO  ' WSS-RANDOM-NUMBER2
            END-EVALUATE.
           DISPLAY '002 - EVALUATE '.
           DISPLAY ' '.

           EVALUATE WSS-RANDOM-NUMBER1
              WHEN 0 THRU 10
                 DISPLAY '10'
              WHEN 11 THRU 21
                 DISPLAY '20'
              WHEN 21 THRU 30
                 DISPLAY '30'
              WHEN 40 THRU 50
                 DISPLAY '50'
              WHEN OTHER
                 DISPLAY 'DEU RUIM : ' WSS-RANDOM-NUMBER1
           END-EVALUATE.
           STOP RUN.

       ROT-ALEATORIA.
           COMPUTE WSS-RANDOM-NUMBER1 = FUNCTION RANDOM * 60.
           COMPUTE WSS-RANDOM-NUMBER2 = FUNCTION RANDOM * 25.
           DISPLAY ' '.
           DISPLAY ' 1 --> ' WSS-RANDOM-NUMBER1
                   ' 2 --> ' WSS-RANDOM-NUMBER2
           DISPLAY ' '.
       ROT-ALEATORIA-EXIT.
           EXIT.

       END PROGRAM COBOL033.
      ********************** FIM PROGRAMA   ****************************
