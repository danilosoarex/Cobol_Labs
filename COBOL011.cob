      *****************************************************************
      * DATA     :  30/05/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VARIAVEL NUMERICA PIC 9
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL011.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 30/05/23 @ 10:20:00.
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
       77  WSS-ZEROES                PIC 9(01) VALUE ZERO.
      * F0
       77  WSS-NUMERO                PIC 9(18) VALUE ZEROES.
      * F0 F0 F0 F0 F0 F0 F0 F0 F0 F0 F0 F0 F0 F0 F0 F0 F0 F0
       77  WSS-GROSELHA              PIC X(10) VALUE SPACES.
       77  WSS-CEREJA                PIC A(10) VALUE SPACES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************
           DISPLAY 'COBOL011'.
           DISPLAY 'VARIAVEL NIVEL 77 TIPO NUMERICA  '.

           DISPLAY '001 '.
           DISPLAY 'WSS-NUMERO   : ' WSS-NUMERO.
           DISPLAY 'WSS-ZEROES   : ' WSS-ZEROES.

           MOVE 1                    TO WSS-NUMERO

           DISPLAY '002 '.
           DISPLAY 'WSS-NUMERO   : ' WSS-NUMERO.
           DISPLAY 'WSS-ZEROES   : ' WSS-ZEROES.

           MOVE 12345                TO WSS-NUMERO

           DISPLAY '003 '.
           DISPLAY 'WSS-NUMERO   : ' WSS-NUMERO.

           MOVE 123456789012345678   TO WSS-NUMERO

           DISPLAY '004 '.
           DISPLAY 'WSS-NUMERO   : ' WSS-NUMERO.

           MOVE 'GROSELHA'           TO WSS-GROSELHA.
           MOVE WSS-GROSELHA         TO WSS-NUMERO.

           DISPLAY '005 '.
           DISPLAY 'WSS-NUMERO   : ' WSS-NUMERO.

      *    DISPLAY '006 '.
      *
      *    MOVE 'CEREJA  '           TO WSS-CEREJA.
      *    MOVE WSS-CEREJA           TO WSS-NUMERO.
      *
      *    DISPLAY '006 '.
      *    DISPLAY 'WSS-NUMERO   : ' WSS-NUMERO.

           STOP RUN.

       END PROGRAM COBOL011.
      ********************** FIM PROGRAMA   ****************************
