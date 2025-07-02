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
          05 TABELA OCCURS 10 TIMES  INDEXED BY I.
            10 WSS-A PIC 9(1).
      *
       01 WSS-SRCH  PIC 9(1) VALUE 0.
       01 WSS-COUNT PIC 9(1) VALUE 0.
      *
       01 GROUP-ITEM.
          05 TABL OCCURS 5  TIMES.
            10 ELEM-ITEM1 PIC X.
            10 ELEM-ITEM2 PIC X.
            10 ELEM-ITEM3 PIC X.

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

           SEARCH TABELA
              AT END DISPLAY 'NAO ENCONTREI ZERO NA TABELA'
              WHEN WSS-A(I) = WSS-SRCH
              DISPLAY 'NUMERO ZERO FOI ENCONTRADO NA TABELA'
           END-SEARCH.

           DISPLAY ' '
           DISPLAY 'TABELA ANTES DO SORT:'
           DISPLAY TABELA

           SORT TABELA DESCENDING WSS-A.

           DISPLAY ' '
           DISPLAY 'TABELA APOS SORT:'
           DISPLAY TABELA
      * BUSCA NUMERO 1

           DISPLAY ' '
           DISPLAY ' BUSCAR 1 NA TABELA INTERNA'

           SET I TO 1.

           MOVE 1  TO WSS-SRCH

           SEARCH TABELA
              AT END DISPLAY 'NAO ENCONTREI O UM NA TABELA'
              WHEN WSS-A(I) = WSS-SRCH
              DISPLAY 'NUMERO UM   FOI ENCONTRADO NA TABELA'
           END-SEARCH.

      * BUSCA NUMERO 6

           MOVE 'AZBYCWDXEVFUGRHSIT' TO GROUP-ITEM

           DISPLAY ' '
           DISPLAY ' ANTES DO SORT '

           PERFORM 5 TIMES
              ADD 1 TO WSS-COUNT
              DISPLAY ' ELEM-ITEM1[' WSS-COUNT '] ='
                ELEM-ITEM1(WSS-COUNT)
              DISPLAY ' ELEM-ITEM2[' WSS-COUNT '] ='
                ELEM-ITEM2(WSS-COUNT)
              DISPLAY ' ELEM-ITEM3[' WSS-COUNT '] ='
                ELEM-ITEM3(WSS-COUNT)
           END-PERFORM.

      *** CLASSIFICA A TABELA EM ORDEM ASCENDENTE
      ***  SORT TABL ON DESCENDING KEY ELEM-ITEM2 ELEM-ITEM3.

           DISPLAY ' '
           DISPLAY ' APOS O SORT '

           INITIALIZE WSS-COUNT.

           PERFORM 5 TIMES
              ADD 1 TO WSS-COUNT
              DISPLAY ' ELEM-ITEM1[' WSS-COUNT '] ='
                ELEM-ITEM1(WSS-COUNT)
              DISPLAY ' ELEM-ITEM2[' WSS-COUNT '] ='
                ELEM-ITEM2(WSS-COUNT)
              DISPLAY ' ELEM-ITEM3[' WSS-COUNT '] ='
                ELEM-ITEM3(WSS-COUNT)
           END-PERFORM.


           STOP RUN.

       END PROGRAM COBOL050.
      ********************** FIM DO PROGRAMA **************************
