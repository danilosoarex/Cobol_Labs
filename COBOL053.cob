      *****************************************************************
      * DATA     :  10/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA TABELA COM PESQUISA SIMPLES
      *            TABELA UNIDIMENSIONAL COM 10 OCORRENCIAS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL050.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 11/06/23 @ 14:10:00.
       DATE-COMPILED. 2023-06-11.
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
       01 WSS-TABLE.
          05 WSS-A PIC 9(1) OCCURS 10 TIMES INDEXED BY I.
      *
       01 WSS-SRCH PIC 9(1) VALUE '0'.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL050'.
           DISPLAY 'EXEMPLO DE BUSCA EM TABELA UNIDIMENSIONAL'.
           DISPLAY ' '.

      *****************************************************************
           DISPLAY ' '.
           DISPLAY 'PROGRAMA TABELA COM PESQUISA SIMPLES'
           DISPLAY 'TABELA UNIDIMENSIONAL COM 10 OCORRENCIAS'
           DISPLAY ' '.

           MOVE '1234567890' TO WSS-TABLE.

           SET I TO 1.

           SEARCH WSS-A
              AT END DISPLAY 'NAO ENCONTREI ZERO NA TABELA'
              WHEN WSS-A(I) = WSS-SRCH
              DISPLAY 'NUMERO ZERO FOI ENCONTRADO NA TABELA'
           END-SEARCH.

           STOP RUN.

       END PROGRAM COBOL050.
      ********************** FIM DO PROGRAMA **************************
