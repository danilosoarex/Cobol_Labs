      *****************************************************************
      * DATA     :  08/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO ARRAY UNIDIMENSIONAL
      * CPD      : INEFEAMA EXEMPLO ARRAY UNIDIMENSIONAL
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL045.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 08/06/23 @ 21:41:00.
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
        01 WSS-STR-TABLE.
           05 WSS-PROD-LACTEO   OCCURS 4 TIMES PIC A(10).
      *
        01 WSS-IND              PIC 9 VALUE ZERO.

      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL045'.
           DISPLAY 'EXEMPLO DE ARRAY UNIDIMENSIONAL '.
           DISPLAY ' '.

           DISPLAY 'ESTE EH UM EXEMPLO BASICO DE ARRAY LIMPO'.
           DISPLAY "PRODUTO 1 : " WSS-PROD-LACTEO(1).
           DISPLAY "PRODUTO 2 : " WSS-PROD-LACTEO(2).
           DISPLAY "PRODUTO 3 : " WSS-PROD-LACTEO(3).
           DISPLAY "PRODUTO 4 : " WSS-PROD-LACTEO(4).


           MOVE "LEITE"          TO WSS-PROD-LACTEO(1).
           MOVE "QUEIJO "        TO WSS-PROD-LACTEO(2).
           MOVE "MANTEIGA"       TO WSS-PROD-LACTEO(3).
           MOVE "COALHO  "       TO WSS-PROD-LACTEO(4).

           DISPLAY 'ESTE EH UM EXEMPLO BASICO DE ARRAY UNI'.
           DISPLAY "PRODUTO 1 : " WSS-PROD-LACTEO(1).
           DISPLAY "PRODUTO 2 : " WSS-PROD-LACTEO(2).
           DISPLAY "PRODUTO 3 : " WSS-PROD-LACTEO(3).
           DISPLAY "PRODUTO 4 : " WSS-PROD-LACTEO(4).

           MOVE "YORGURT"        TO WSS-PROD-LACTEO(1).
           MOVE "REQUEIJAO"      TO WSS-PROD-LACTEO(2).
           MOVE 'MUZZARELA'      TO WSS-PROD-LACTEO(3).
           MOVE 'RICOTA'         TO WSS-PROD-LACTEO(4).

           DISPLAY 'ESTE EH UM EXEMPLO BASICO DE ARRAY UNI PARTE 2'.
           DISPLAY "PRODUTO 1 : " WSS-PROD-LACTEO(1).
           DISPLAY "PRODUTO 2 : " WSS-PROD-LACTEO(2).
           DISPLAY "PRODUTO 3 : " WSS-PROD-LACTEO(3).
           DISPLAY "PRODUTO 4 : " WSS-PROD-LACTEO(4).

      * VIA LITERAL NAO ACEITA EXPANDIR TABELA DE 4 OCORRENCIAS
      *    MOVE 'GORGONZOLA'   TO WSS-PROD-LACTEO(5).
      *    DISPLAY "PRODUTO 5 : " WSS-PROD-LACTEO(5).

           MOVE 5  TO WSS-IND.

           IF WSS-IND > 4
             DISPLAY 'ERRO DE INVASAO DE AREA'
             DISPLAY 'VERIFIQUE COM O ANALISTA RESPONSAVEL'
           ELSE
             MOVE 'GORGONZOLA'   TO WSS-PROD-LACTEO(WSS-IND)
             DISPLAY "PRODUTO 5 : " WSS-PROD-LACTEO(WSS-IND)
           END-IF.

           STOP RUN.

       END PROGRAM COBOL045.
      ********************** FIM PROGRAMA   ****************************
