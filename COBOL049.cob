      *****************************************************************
      * DATA     :  10/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA TABELA COM PESQUISA SIMPLES E DIRETA
      *            TABELA DIMENSIONAL E SEU DUPLO INDICE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL049.
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
       01  WSS-DATAN8                 PIC 9(08).
      *
       01  FILLER    REDEFINES  WSS-DATAN8.
         05  WSS-PARAM-ANO            PIC 9(04).
         05  WSS-PARAM-MES            PIC 9(02).
      *
       01 WSS-TABLE-ALPHABET.
         05 WSS-POSIC      OCCURS 3 TIMES INDEXED BY IDX-A.
           10 WSS-POSIC-ORDEM         PIC A(2).
           10 WSS-LETRAS   OCCURS 2 TIMES INDEXED BY IDX-B.
             15 WSS-LETRAS-ORDEM      PIC X(3).
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL049'.
           DISPLAY 'EXEMPLO DE BUSCA EM TABELA BIDIMENSIONAL'.
           DISPLAY ' '.

      *****************************************************************
           DISPLAY ' '.
           DISPLAY 'TABELA BI-DIMENSIONAL COM VALOR FIXO.'.
           DISPLAY 'BUSCA POR LACO DE REPETICAO E INDICE  '.
           DISPLAY ' '.

           MOVE '12ABCDEF34GHIJKL56MNOPQR' TO WSS-TABLE-ALPHABET.

           PERFORM ROT-MOVIM-A VARYING IDX-A FROM 1
                               BY 1 UNTIL IDX-A > 3

      *****************************************************************
      ***  FIM
           STOP RUN.
      *
       ROT-MOVIM-A.

           PERFORM ROT-MOVIM-C VARYING IDX-B
                       FROM 1 BY 1 UNTIL IDX-B > 2.

       ROT-MOVIM-A-EXIT.
           EXIT.
      *
       ROT-MOVIM-C.
           DISPLAY WSS-LETRAS(IDX-A, IDX-B).

       ROT-MOVIM-C-EXIT.
           EXIT.

       END PROGRAM COBOL049.
      ********************** FIM DO PROGRAMA **************************
