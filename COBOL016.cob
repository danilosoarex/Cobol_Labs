      *****************************************************************
      * DATA     :  30/05/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VARIAVEL ALFANUMERICA PIC X
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL016.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 30/05/23 @ 10:30:00.
       DATE-COMPILED. 2023-05-30.
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
       77  WSS-ALFA-ESPACO           PIC X(01) VALUE SPACE.
       77  WSS-ALFANUMERICA          PIC X(12) VALUE SPACES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL016'.
           DISPLAY 'VARIAVEL NIVEL 77 TIPO ALFANUMERICA'.

           DISPLAY '001 '.
           DISPLAY 'WSS-ALFA-ESPACO  : ' WSS-ALFA-ESPACO.
           DISPLAY 'WSS-ALFANUMERICA : ' WSS-ALFANUMERICA.

           MOVE 'XXXXX'                  TO WSS-ALFANUMERICA.

           DISPLAY '002 '.
           DISPLAY 'WSS-ALFA-ESPACO  : ' WSS-ALFA-ESPACO.
           DISPLAY 'WSS-ALFANUMERICA : ' WSS-ALFANUMERICA.

           MOVE '12345'                  TO WSS-ALFANUMERICA.

           DISPLAY '003 '.
           DISPLAY 'WSS-ALFANUMERICA : ' WSS-ALFANUMERICA.
           MOVE 'ABCD-12345'             TO WSS-ALFANUMERICA.

           DISPLAY '004 '.
           DISPLAY 'WSS-ALFANUMERICA : ' WSS-ALFANUMERICA.

           MOVE    '@#$%^[]=-+!?'
                                         TO WSS-ALFANUMERICA.

           DISPLAY '005 '.
           DISPLAY 'WSS-ALFANUMERICA : ' WSS-ALFANUMERICA.

           MOVE    12345678901234       TO  WSS-ALFANUMERICA.
           DISPLAY '006 '.
           DISPLAY 'WSS-ALFANUMERICA : ' WSS-ALFANUMERICA.

           STOP RUN.

       END PROGRAM COBOL016.
      ********************** FIM PROGRAMA   ****************************
