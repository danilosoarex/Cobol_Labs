      *****************************************************************
      * DATA     :  15/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO CALL RECURSIVO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL066  RECURSIVE.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 15/06/23 @ 21:05:00.
       DATE-COMPILED. 2023-06-15.
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
       01 WSS-NUMB        PIC 9(4) VALUE 11.
       01 WSS-FACT        PIC 9(8) VALUE 0.
       01 WSS-DATA-COMPIL PIC X(16) VALUE SPACES.
      *
       LOCAL-STORAGE SECTION.
      *
       01 WSS-NUM         PIC 9(4).
      *
      ********************
       PROCEDURE DIVISION.
      ********************
           DISPLAY 'COBOL066'.
           DISPLAY 'EXEMPLO DE PROGRAMA RECURSIVO'.
           DISPLAY ' '.

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

           MOVE WSS-NUMB TO WSS-NUM.

           IF WSS-NUMB = 0

              MOVE 1 TO WSS-FACT
           ELSE
              SUBTRACT 1 FROM WSS-NUMB

              CALL 'COBOL066'

              MULTIPLY WSS-NUM BY WSS-FACT

           END-IF.

           DISPLAY WSS-NUM '! = ' WSS-FACT.

           GOBACK.

       END PROGRAM COBOL066.
      ********************** FIM PROGRAMA   ****************************
