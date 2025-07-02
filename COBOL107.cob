      *****************************************************************
      * DATA     :  22/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO DE USO COLUNA 7 E DIVERSOS COMANDOS
      *           QUEBRA DE PAGINA E LINHAS NA IMPRESSAO DO CODIGO FONT
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL107.
      *
       AUTHOR. VAGNER BELLACOSA.
       INSTALLATION. INEFE CPD MARIST.
       DATE-WRITTEN. 22/08/24 @ 19:52:00.
       DATE-COMPILED. 2024-08-22.
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
         77 WSS-TEXTO             PIC X(250).
      *
      *-------------------
       PROCEDURE DIVISION.
      *-------------------
      *
       MAIN_SECTION        SECTION.
           DISPLAY ' COBOL107  '.

       EJECT.

      * *** ASTERICOS NA COLUNA 7 EXIBE COMENTARIO EM QUALQUER
      * *** PARTE DO PROGRAMA

           MOVE "    ESTE TEXTO EH MUITO LONGO PARA CABER EM APENAS UMA
      -    " LINHA POR ISSO USO - NA COLUNA 7"
                                         TO WSS-TEXTO.

           SKIP1.
           DISPLAY ' WSS-TEXTO = ' WSS-TEXTO.
           SKIP1.
           DISPLAY ' PULEI UMA LINHA NO CODIGO FONTE'.
           SKIP2.
           DISPLAY ' PULEI DUAS LINHAS NO CODIGO FONTE'.
           SKIP3.
           DISPLAY ' PULEI TRES LINHAS NO CODIGO FONTE'.

       EJECT.

      *
      /    DISPLAY 'USAR A / BARRA NA COLUNA 7 EH IGUAL O EJECT'

       EJECT.

      *
      *    DEBUG MODO
      *
      D    DISPLAY ' COMPILEI O PROGRAMA EM DEBUG MODO'
      D    DISPLAY ' SERA EXECUTADO OS COMANDOS COM D NA SETIMA COLUNA'
      D    DISPLAY ' '.

           STOP RUN.

       END PROGRAM COBOL107.
      ********************** FIM DO PROGRAMA ***************************
