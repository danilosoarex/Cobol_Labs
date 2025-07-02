      *****************************************************************
      * DATA     : 20/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO PONTEIRO COM ACESSO AO USER-ID
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL082.

       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 20/06/23 @ 10:50:00.
       DATE-COMPILED. 2023-06-20.
       INSTALLATION. INEFE CPD MARIST EDUCATIONAL.
       SECURITY. PROGRAMA EDUCACIONAL.

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
      *
       01 WSS-VARIAVEIS         PIC X(20) VALUE SPACES.
       01 WSS-COUNT             PIC 9(03) VALUE ZEROES.
       01 WSS-DATA-COMPIL       PIC X(16) VALUE SPACES.
       01 WSS-TAMANHO           PIC 9(04) VALUE ZEROES.
      *
       01  WSS-VAR-P USAGE POINTER.
       01  WSS-VAR-W                       PIC X(2).
      *
       LINKAGE SECTION.
      *
       01  WSS-VAR-L                       PIC X(2).
      *
      *************************************
       PROCEDURE DIVISION.
      *************************************

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY 'COBOL082'.
           DISPLAY 'EXEMPLO DE PONTEIRO '.
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

           PERFORM MAIN1.

           STOP RUN.

       MAIN1.

           DISPLAY 'WSS-VAR-P = ' WSS-VAR-P

      *     ESSE FUNCIONA
           SET WSS-VAR-P TO ADDRESS OF WSS-VAR-W.

           DISPLAY 'WSS-VAR-W = ' WSS-VAR-W
           DISPLAY 'WSS-VAR-P = ' WSS-VAR-P

      *     ESSE FALHA
           SET WSS-VAR-P TO ADDRESS OF WSS-VAR-L.

           DISPLAY 'WSS-VAR-L = ' WSS-VAR-L
           DISPLAY 'WSS-VAR-P = ' WSS-VAR-P.

      *     HEXADECIMAL
      *    SET WSS-VAR-P TO
      *    DISPLAY FUNCTION HEX-OF(200000)

           DISPLAY 'WSS-VAR-P = ' WSS-VAR-P.

       END PROGRAM COBOL082.
      ********************** FIM PROGRAMA   ****************************
