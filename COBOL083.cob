      *****************************************************************
      * DATA     : 20/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO RECURSIVO CALCULO FIBONACCI
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL083.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 20/06/23 @ 10:50:00.
       DATE-COMPILED. 2023-06-20.
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
       01  WSS-PSA-POINTER POINTER.
       01  WSS-USERID           PIC X(8).
      *
       01 WSS-VARIAVEIS         PIC X(20) VALUE SPACES.
       01 WSS-COUNT             PIC 9(03) VALUE ZEROES.
       01 WSS-DATA-COMPIL       PIC X(16) VALUE SPACES.
       01 WSS-TAMANHO           PIC 9(04) VALUE ZEROES.
      *
      *
       LOCAL-STORAGE SECTION.
      *
       01 WSS-RESULT1 PIC S9(18) USAGE IS COMP-3.
       01 WSS-RESULT2 PIC S9(18) USAGE IS COMP-3.
      *
       LINKAGE SECTION.
      *
       01 WSS-NUM     PIC S9(18) USAGE IS COMP-3.
      *
      ******************************************
       PROCEDURE DIVISION USING WSS-NUM.
      ******************************************

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.
           DISPLAY 'COBOL083'.
           DISPLAY 'EXEMPLO DE FIBONACCI                '.
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

           IF WSS-NUM EQUAL ZERO
              MOVE 0 TO RETURN-CODE
              GOBACK
           END-IF
           IF WSS-NUM = 1
              MOVE 1 TO RETURN-CODE
              GOBACK
           END-IF

           COMPUTE WSS-NUM = WSS-NUM - 1

           CALL COBOL083    USING BY WSS-NUM
                                      RETURNING WSS-RESULT1

           COMPUTE WSS-NUM = WSS-NUM - 1

           CALL COBOL083    USING BY WSS-NUM
                                      RETURNING WSS-RESULT2

           COMPUTE RETURN-CODE = WSS-RESULT1 + WSS-RESULT2

           GOBACK.

       END PROGRAM COBOL083.
      ********************** FIM PROGRAMA   ****************************
