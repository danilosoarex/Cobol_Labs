      *****************************************************************
      * DATA     : 05/02/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : USO IMPLICITO DE MEMORIA
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL087.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 05/02/24 @ 10:50:00.
       DATE-COMPILED. 2024-02-05.
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
       01 WSS-DATA-COMPIL PIC X(16).
       01 WSS-PRIMEIRO    PIC 999 VALUE 10.
       01 WSS-SEGUNDO     PIC 999.
       01 WSS-TERCEIRO    PIC 999.
      *
       01 TABELA.
         05 WSS-LEVEL1   OCCURS 10.
           10 WSS-TABELA-UM   PIC 999.
      *
         05 WSS-LEVEL2   OCCURS 10.
           10 WSS-TABELA-DOIS PIC 999.
      *
       PROCEDURE DIVISION.
      *
           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' EXEMPLO DE MOVE IMPLICITO '.
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.

           DISPLAY '******************'.
           DISPLAY 'COMECO DO PROGRAMA'.
           DISPLAY '******************'.
           DISPLAY ' '.

           DISPLAY ' WSS-PRIMEIRO  = ' WSS-PRIMEIRO.
           DISPLAY ' WSS-SEGUNDO   = ' WSS-SEGUNDO.
           DISPLAY ' WSS-TERCEIRO  = ' WSS-TERCEIRO.

           MOVE WSS-PRIMEIRO   TO WSS-SEGUNDO, WSS-TERCEIRO.
      *
           DISPLAY ' APOS MOVE'.
           DISPLAY ' WSS-PRIMEIRO  = ' WSS-PRIMEIRO.
           DISPLAY ' WSS-SEGUNDO   = ' WSS-SEGUNDO.
           DISPLAY ' WSS-TERCEIRO  = ' WSS-TERCEIRO.
      *
           DISPLAY ' '.
           DISPLAY 'WSS-TABELA-UM(5) = ' WSS-TABELA-UM(5).
           DISPLAY 'WSS-TABELA-DOIS(5) = ' WSS-TABELA-DOIS(5).
      *
           MOVE 5  TO  WSS-SEGUNDO.
           MOVE WSS-SEGUNDO  TO WSS-TABELA-UM(5).
           MOVE WSS-TABELA-UM(WSS-SEGUNDO)
                       TO WSS-TERCEIRO, WSS-TABELA-DOIS(WSS-TERCEIRO).
      *
           DISPLAY ' APOS MOVE'.
           DISPLAY 'WSS-TABELA-UM(5) = ' WSS-TABELA-UM(5).
           DISPLAY 'WSS-TABELA-DOIS(5) = ' WSS-TABELA-DOIS(5).
      *
           STOP RUN.
      *
       END PROGRAM COBOL087.
      ********************** FIM DO PROGRAMA ***************************
