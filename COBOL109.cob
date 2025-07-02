      *****************************************************************
      * DATA     :  22/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO DE USO COLUNA 7 E DIVERSOS COMANDOS
      *           QUEBRA DE PAGINA E LINHAS NA IMPRESSAO DO CODIGO FONT
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL109.
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
      *  77  SHIFT-OUT GLOBAL PICTURE X(1) USAGE DISPLAY VALUE X"0E".
      *  77  SHIFT-IN  GLOBAL PICTURE X(1) USAGE DISPLAY VALUE X"0F".
      *
         77 WSS-TEXTO             PIC X(250).
      *
       01  DBCSGRP.
            05  SO       PIC X.
            05  DBCSITEM PIC G(3) USAGE DISPLAY-1.
            05  SI       PIC X.
      *
      *-------------------
       PROCEDURE DIVISION.
      *-------------------
      *
       MAIN_SECTION        SECTION.

           DISPLAY ' COBOL109  '.
           DISPLAY ' USO DE REGISTRADORES ESPECIAIS'
           DISPLAY ' FUNCAO ONDE UM ARGUMENTO ALFANUMERICO'
           DISPLAY ' EH PERMITIDO'.
           DISPLAY ' '.

           MOVE SHIFT-OUT TO SO
           MOVE G"<D1D2D3>" TO DBCSITEM
           MOVE SHIFT-IN TO SI.

           DISPLAY DBCSGRP.

           STOP RUN.

       END PROGRAM COBOL109.
      ********************** FIM DO PROGRAMA ***************************
