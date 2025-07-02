      *****************************************************************
      * DATA     :  01/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA USO FUNCAO RANDOM E RETURN-CODE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL021.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 01/06/24 @ 20:10:00.
       DATE-COMPILED. 2023-06-01
       INSTALLATION. INEFE.
       SECURITY. NORMAL.
      *
       ENVIRONMENT DIVISION.
      *
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
      *
       77 WSS-FOR            PIC 9(2)    COMP-3.
       77 WSS-RANDOM         PIC 9(2)V99 COMP-3.
       77 WSS-RANDOM-NUMBERS PIC 99.999 VALUE ZEROES.
      *77 WSS-RANDOM-NUMBERS PIC 99     VALUE ZEROES.
      *
       PROCEDURE DIVISION.

           DISPLAY ' PROGRAMA COBOL021'.
           DISPLAY ' EXEMPLO FUNCAO RANDOM - RETURN-CODE'.
           DISPLAY ' ESTE PROGRAMA SEMPRE ABENDARA COM VALORES'
           DISPLAY ' ALEATORIOS. CASO DE ESTUDO RETURN-CODE'
           DISPLAY ' '.

      * EXEMPLO PERFORM - LACO FOR INCREMENTADO 1 POR 1
      *    PERFORM WITH TEST BEFORE VARYING WSS-FOR FROM 1 BY 1
      *    PERFORM WITH TEST AFTER  VARYING WSS-FOR FROM 1 BY 1
           PERFORM                  VARYING WSS-FOR FROM 1 BY 1
             UNTIL WSS-FOR = 9

             COMPUTE WSS-RANDOM-NUMBERS = FUNCTION RANDOM
             DISPLAY WSS-FOR ' => ' WSS-RANDOM-NUMBERS

           END-PERFORM.

           COMPUTE WSS-RANDOM-NUMBERS = FUNCTION RANDOM.

           DISPLAY ' --> ' WSS-RANDOM-NUMBERS

           MOVE  WSS-RANDOM-NUMBERS  TO  WSS-RANDOM.

           COMPUTE RETURN-CODE = WSS-RANDOM * 100.

           DISPLAY ' '.
           DISPLAY ' RETURN-CODE : ' RETURN-CODE.

           STOP RUN.

       END PROGRAM COBOL021.
      ********************** FIM PROGRAMA   ****************************
