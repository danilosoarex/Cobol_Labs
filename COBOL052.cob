      *****************************************************************
      * DATA     :  10/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA TABELA COM PESQUISA SIMPLES
      *            TABELA TRIDIMENSIONAL COM 10 OCORRENCIAS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL052.
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
       01  TABLE-ONE.
         05 TABLE-ENTRY1 OCCURS 10 TIMES
                INDEXED BY TE1-INDEX.
           10 TABLE-ENTRY2 OCCURS 10 TIMES
                    INDEXED BY TE2-INDEX.
             15 TABLE-ENTRY3 OCCURS 5 TIMES
                    ASCENDING KEY IS KEY1
                    INDEXED BY TE3-INDEX.
               20 KEY1                 PIC X(5).
               20 KEY2                 PIC X(10).
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL052'.
           DISPLAY 'EXEMPLO DE BUSCA EM TABELA TRIDIMENSIONAL'.
           DISPLAY ' '.

      *****************************************************************
           DISPLAY ' '.
           DISPLAY 'PROGRAMA TABELA COM PESQUISA SIMPLES'
           DISPLAY 'TABELA TRIDIMENSIONAL COM 10 OCORRENCIAS'
           DISPLAY ' '.

           SET TE1-INDEX       TO 1
           SET TE2-INDEX       TO 4
           SET TE3-INDEX       TO 1

           MOVE "A1234"        TO
             KEY1 (TE1-INDEX, TE2-INDEX, TE3-INDEX + 2)
           MOVE "AAAAAAAA00"   TO
             KEY2 (TE1-INDEX, TE2-INDEX, TE3-INDEX + 2)

           SEARCH TABLE-ENTRY3
             AT END
               MOVE 114        TO RETURN-CODE
             WHEN TABLE-ENTRY3(TE1-INDEX, TE2-INDEX, TE3-INDEX)
                 = "A1234AAAAAAAA00"
                  DISPLAY 'TABLE-ENTRY3 = '
                  TABLE-ENTRY3(TE1-INDEX, TE2-INDEX, TE3-INDEX)
                  MOVE 0            TO RETURN-CODE
           END-SEARCH

           DISPLAY ' RETURN-CODE = ' RETURN-CODE.

           STOP RUN.

       END PROGRAM COBOL052.
      ********************** FIM DO PROGRAMA **************************
