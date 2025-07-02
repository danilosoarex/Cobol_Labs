      *****************************************************************
      * DATA     : 05/02/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : SUBPROGRAMA COM USO DE ENTRY
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL085.
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
       01 WSS-X           PIC X(80)
             VALUE
             'ESTE E UM CAMPO COMUM PARA TODOS OS PONTOS DE ENTRADA'.
      *
       01 WSS-DATA-COMPIL PIC X(16).
      *
       LOCAL-STORAGE SECTION.
        01 WSS-Y           PIC 999 VALUE 10.
      *
       PROCEDURE DIVISION.
      *
           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' EXEMPLO DE SUBPROGRAMA COM ENTRY POINT'.
           DISPLAY ' VULGO PONTO DE ENTRADA'.
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.

           DISPLAY '******************'.
           DISPLAY 'COMECO DO PROGRAMA'.

           ENTRY 'POINT1'.

           DISPLAY 'ENTRANDO ENTRY POINT1..'
           DISPLAY WSS-X.
           DISPLAY 'WSS-Y = ' WSS-Y.

           ADD 1000 TO WSS-Y.

           DISPLAY 'WSS-Y = ' WSS-Y.
           DISPLAY 'SAINDO ENTRY POINT1..'
      *
           GOBACK.
      *
           ENTRY 'POINT2'.

           DISPLAY 'ENTRANDO ENTRY POINT2..'
           DISPLAY WSS-X.
           DISPLAY 'WSS-Y = ' WSS-Y.

           ADD 1    TO WSS-Y.

           DISPLAY 'WSS-Y = ' WSS-Y.
           DISPLAY 'SAINDO ENTRY POINT2..'
      *
           GOBACK.
      *
       END PROGRAM COBOL085.
      ********************** FIM DO PROGRAMA ***************************
