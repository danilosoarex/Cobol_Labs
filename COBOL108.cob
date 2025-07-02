      *****************************************************************
      * DATA     :  19/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO DE SECTION E PARAGRAFO NA PROCEDURE
      *            DIVISION
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL108.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 19/08/24 @ 19:52:00.
       DATE-COMPILED. 2024-08-14.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.
      *
       ENVIRONMENT DIVISION.
      *
      *
       DATA DIVISION.
      *
      *-------------------
       PROCEDURE DIVISION.
      *-------------------
      *
       SECAO_DISPLAY       SECTION.

           DISPLAY ' SECAO_DISPLAY '.

           GO TO SECAO_PROCESSA_LOOP.

           GO TO SECAO_PROCESSA_JUMP.

           GO TO ROT070.

           PERFORM SECAO_INICIAL.

           PERFORM ROT040
              THRU ROT043.

           PERFORM ROT010.
           DISPLAY ' '.
           PERFORM ROT030.
           DISPLAY ' '.
           PERFORM ROT050.
           DISPLAY ' '.
           PERFORM ROT070.
           DISPLAY ' '.
           PERFORM ROT020.
           DISPLAY ' '.
           PERFORM ROT040.
           DISPLAY ' '.
           PERFORM ROT060.
           DISPLAY ' '.

           PERFORM SECAO_PROCESSA_JUMP.

           STOP RUN.
      *
       SECAO_INICIAL       SECTION.

           DISPLAY ' ENTREI NO PROGRAMA'.

           DISPLAY ' ESTE PROGRAMA E IMPERATIVO'.

           DISPLAY ' IR EXECUTAR LINHA A LINHA '.

           DISPLAY ' ATE ENCONTRAR O FINAL DO  '.

           DISPLAY ' PROGRAMA, OU COMANDOS DE  '.

           DISPLAY ' SAIDA, TAIS COMO STOP RUN '.

           DISPLAY ' GOBACK                    '.

      *
       SECAO_PROCESSA_JUMP SECTION.

           DISPLAY ' SECAO_PROCESSA_JUMP'.

       ROT010.
           DISPLAY 'ROT010'.

       ROT020.
           DISPLAY 'ROT020'.

       ROT030.
           DISPLAY 'ROT030'.

      *
       SECAO_PROCESSA_LOOP SECTION.

       ROT040.
           DISPLAY 'ROT040'.
       ROT041.
           DISPLAY 'ROT041'.
       ROT042.
           DISPLAY 'ROT042'.
       ROT043.
           DISPLAY 'ROT043'.
           EXIT.

       ROT050.

           DISPLAY 'ROT050'.

       ROT060.

           DISPLAY 'ROT060'.

      *
       SECAO_PROCESSA_FIM  SECTION.

           DISPLAY 'SECAO_PROCESSA_FIM'.

       ROT070.

           DISPLAY 'ROT070'.

       ROT080.

           DISPLAY 'ROT080'.
           DISPLAY 'FIM DO PROGRAM'.

           STOP RUN.

       END PROGRAM COBOL108.
      ********************** FIM DO PROGRAMA ***************************
