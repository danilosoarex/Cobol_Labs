      *****************************************************************
      * DATA     :  10/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA TABELA COM PESQUISA SEARCH ALL
      *            TABELA UNIDIMENSIONAL COM 10 OCORRENCIAS E INDEX
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL051.
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
         05 WSS-RECORD OCCURS 10 TIMES ASCENDING
                       KEY IS WSS-EMP-ID INDEXED BY I.
           10 WSS-EMP-ID PIC 9(2).
           10 WSS-NAME PIC A(3).
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL051'.
           DISPLAY 'EXEMPLO DE BUSCA EM TABELA UNIDIMENSIONAL'.
           DISPLAY ' '.

      *****************************************************************
           DISPLAY ' '.
           DISPLAY 'PROGRAMA TABELA COM PESQUISA SEARCH ALL'
           DISPLAY 'TABELA UNIDIMENSIONAL COM 10 OCORRENCIAS E INDEX'
           DISPLAY ' '.

           MOVE '00ABC11DEF22GHI33JKL44MNO55PQR' TO WSS-TABLE.

           SEARCH ALL WSS-RECORD
             AT END DISPLAY
             'REGISTRO DE EMPREGADO INVALIDO'
             WHEN WSS-EMP-ID(I) = 33
             DISPLAY 'EMPREGADO ENCONTRADO'
             DISPLAY WSS-EMP-ID(I)
             DISPLAY WSS-NAME(I)
           END-SEARCH.

           STOP RUN.

       END PROGRAM COBOL051.
      ********************** FIM DO PROGRAMA **************************
