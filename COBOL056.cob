      *****************************************************************
      * DATA     :  12/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA DISPLAY E SUAS CARACTERISTICAS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL056.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 12/06/23 @ 15:15:00.
       DATE-COMPILED. 2023-06-12.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************
      *
       CONFIGURATION SECTION.
      *
       SPECIAL-NAMES.
                     CONSOLE  IS CONSOLE

                     SYSERR   IS SYSERR
                     SYSPUNCH IS SYSPUNCH
                     SYSPCH   IS SYSPCH.
      *
      ***************
       DATA DIVISION.
      ***************
       FILE SECTION.
      *
       WORKING-STORAGE SECTION.
      *
       01 WSS-VAR.
         05 WSS-VAR1     PIC X(05) VALUE 'HELLO'.
         05 WSS-VAR2     PIC X(05) VALUE 'WORLD'.
      *
       01 GROUP-DATA.
         05 A            PIC 999   VALUE 123.
         05 B            PIC 999   VALUE 456.
         05 C            PIC 999   VALUE 789.
      *
       77 TRACKED-RESOURCE  PIC X(10) VALUE 'TESTE'.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL056'.
           DISPLAY 'EXEMPLO DE DISPLAY E SUA SINTAXE'.
           DISPLAY ' '.

      *****X***********************************************************

           DISPLAY "AN ERROR OCCURRED WITH " TRACKED-RESOURCE
                 UPON SYSERR

           DISPLAY A, B, C    UPON CONSOLE

           DISPLAY GROUP-DATA UPON USER-DEVICE
               ON EXCEPTION
                   DISPLAY 'OPS DEU ERRO GRAVE'
               NOT ON EXCEPTION
                   DISPLAY 'AGORA SIM'.
      *    END-DISPLAY.

           DISPLAY ' '.
           DISPLAY ' LITERAIS E VARIAVEIS MULTIPLOS ITENS'.
           DISPLAY "MESSAGE: " WSS-VAR1 " " WSS-VAR2.

           DISPLAY ' '.
           DISPLAY ' LITERAIS E VARIAVEIS USO ADVANCING'.
           DISPLAY WSS-VAR1 WITH NO ADVANCING.
           DISPLAY " " WSS-VAR2.

           STOP RUN.

       END PROGRAM COBOL056.
      ********************** FIM DO PROGRAMA **************************
