      *****************************************************************
      * DATA     :  10/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA TABELA USO DO SORT ARRAY
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
       01 WSS-FILLER.
           05 WSS-TBL OCCURS 10  TIMES.
               10 WSS-USE-CNT    PIC 9(4)   COMP.
       01 WSS-I                  PIC 9(4)   COMP.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL050'.
           DISPLAY 'EXEMPLO DE CLASSIFICACAO EM TABELA UNIDIMENSIONAL'.
           DISPLAY ' '.

      *****************************************************************
           DISPLAY ' '.
           DISPLAY 'PROGRAMA TABELA COM PESQUISA SIMPLES'
           DISPLAY 'TABELA UNIDIMENSIONAL COM 10 OCORRENCIAS'
           DISPLAY ' '.
           MOVE 112  TO WSS-USE-CNT (1)
           MOVE 13   TO WSS-USE-CNT (2)
           MOVE 55   TO WSS-USE-CNT (3)
           MOVE 15   TO WSS-USE-CNT (4)
           MOVE 16   TO WSS-USE-CNT (5)
           MOVE 3    TO WSS-USE-CNT (6)
           MOVE 43   TO WSS-USE-CNT (7)
           MOVE 78   TO WSS-USE-CNT (8)
           MOVE 34   TO WSS-USE-CNT (9)
           MOVE 46   TO WSS-USE-CNT (10)

           DISPLAY ' '.
           DISPLAY ' ANTES DA CLASSIFICACAO '.

           PERFORM VARYING WSS-I FROM 1 BY 1 UNTIL WSS-I > 10
               DISPLAY WSS-USE-CNT (WSS-I)
           END-PERFORM.

           SORT WSS-TBL ASCENDING WSS-USE-CNT.

           DISPLAY ' '.
           DISPLAY ' APOS A CLASSIFICACAO '.

           PERFORM VARYING WSS-I FROM 1 BY 1 UNTIL WSS-I > 10
               DISPLAY WSS-USE-CNT (WSS-I)
           END-PERFORM


           STOP RUN.

       END PROGRAM COBOL050.
      ********************** FIM DO PROGRAMA **************************
