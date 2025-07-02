      *****************************************************************
      * DATA     :  08/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO ARRAY BIDIMENSIONAL
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL043.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 08/06/23 @ 21:51:00.
       DATE-COMPILED. 2023-06-08.
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
        01 WSS-STORE-PROD-TABLE.
           05 WSS-STORE-ID OCCURS 3 TIMES.
             10 WSS-PRODUCT OCCURS 5 TIMES PIC 9(08).

        01 WSS-TIME                        PIC 9(08).
        01 WSS-X                           PIC 9(01).
        01 WSS-Y                           PIC 9(01).
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL043'.
           DISPLAY 'EXEMPLO DE ARRAY BIDIMENSIONAL '.
           DISPLAY ' '.


           ACCEPT WSS-TIME FROM TIME.

           DISPLAY ' WSS-TIME  = ' WSS-TIME.

           DISPLAY "ESTE EXEMPLO E UMA MATRIZ BIDIMENSIONAL".

           PERFORM PRODUCT-PARA VARYING WSS-X FROM 1
                                     BY 1 UNTIL WSS-X > 3
                                  AFTER WSS-Y FROM 1 BY 1
                                  UNTIL WSS-Y > 5.

           DISPLAY ' WSS-TIME  = ' WSS-TIME.

           STOP RUN.

       PRODUCT-PARA.

           MOVE WSS-TIME       TO WSS-PRODUCT( WSS-X , WSS-Y ).

           ADD 100000          TO WSS-PRODUCT( WSS-X , WSS-Y ).

           DISPLAY "PRODUTO " WSS-X "," WSS-Y  ' : '
                     WSS-PRODUCT(WSS-X, WSS-Y).

           ADD 1               TO WSS-TIME.

       END PROGRAM COBOL043.
      ********************** FIM PROGRAMA   ****************************
