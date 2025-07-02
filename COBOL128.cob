      *****************************************************************
      * DATA     : 12/06/2025
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO PERFORM TIMES
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL128.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 12/06/25 @ 22:45:00.
       DATE-COMPILED. 2025-06-12.
       INSTALLATION. INEFE.
       SECURITY. EXEMPLO PERFORM TIMES

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

           DISPLAY 'COBOL128'.
           DISPLAY 'TESTE PERFORM  '.

           DISPLAY ' PERFORM TIMES FIXO'

           PERFORM 11 TIMES

              DISPLAY ' INDICE DE VOLTAS => '
                      WSS-CONTADOR

              ADD  01           TO WSS-CONTADOR
                ON SIZE ERROR DISPLAY 'ESTOURO DE CAPACIDADE'
              END-ADD

           END-PERFORM

           DISPLAY ' '.
           DISPLAY ' PERFORM TIMES FIXO'

           MOVE WSS-CONTADOR TO WSS-INDICE.
           MOVE ZEROES       TO WSS-CONTADOR.

           PERFORM WSS-INDICE TIMES

              DISPLAY ' INDICE DE VOLTAS => '
                      WSS-CONTADOR

              ADD  01           TO WSS-CONTADOR
                ON SIZE ERROR DISPLAY 'ESTOURO DE CAPACIDADE'
              END-ADD

           END-PERFORM.

           DISPLAY ' '.
           DISPLAY ' PERFORM TIMES OUTLINE'

           PERFORM ROT-DISPLAY 2 TIMES.

           DISPLAY ' LINHA EM BRANCO'.

           STOP RUN.

       ROT-LIXO.

           DISPLAY 'ROT-LIXO'.

       ROT-DISPLAY.

           DISPLAY 'ROT-DISPLAY'.

       ROT-FIM.
           DISPLAY 'ROT-FIM'.
           STOP RUN.

       END PROGRAM COBOL128.
      ********************** FIM PROGRAMA   ****************************
