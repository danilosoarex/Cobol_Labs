      *****************************************************************
      * DATA     :  29/01/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA CALCULOS ARITIMETICOS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL059.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 29/01/24 @ 12:15:00.
       DATE-COMPILED. 2024-01-29.
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
       01 WS-NUM01  PIC S9(4)V99.
       01 WS-NUM02  PIC S9(4)V99.
       01 WS-VAR01  PIC 9(4)V99.
       01 WS-VAR02  PIC 9(4)V99.
       01 WS-RESULT PIC S9(5)V99 COMP.
       01 WS-RES01  PIC -ZZZ9.99.
       01 WS-RES02  PIC -ZZZ9.99.
       01 WS-RES03  PIC -ZZZ9.99.
       01 WS-RES04  PIC -ZZZ9.99.
       01 WS-VAR05  PIC -ZZZ9.99.
       01 WS-VAR06  PIC -ZZZ9.99.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL059'.
           DISPLAY 'PROGRAMA CALCULOS ARITIMETICOS '.
           DISPLAY ' '.

      *****X***********************************************************
           SET WS-NUM01 TO 30.

       ADDITION-PARA.
           ADD WS-VAR01 WS-VAR02 GIVING WS-RESULT.
           MOVE WS-RESULT TO WS-RES01.
           PERFORM SUBTRACTION-PARA.

       SUBTRACTION-PARA.
           SUBTRACT WS-VAR02 FROM WS-VAR01 GIVING WS-RESULT.
           MOVE WS-RESULT TO WS-RES02
           PERFORM MULTIPLICATION-PARA.

       MULTIPLICATION-PARA.
           MULTIPLY WS-VAR01 BY WS-VAR02 GIVING WS-RESULT.
           MOVE WS-RESULT TO WS-RES03.
           PERFORM DIVISION-PARA.

       DIVISION-PARA.

           DIVIDE WS-VAR01 BY WS-VAR02 GIVING WS-RESULT.
           MOVE WS-RESULT TO WS-RES04.
           PERFORM RESULT-PARA.

       RESULT-PARA.

           DISPLAY 'ADDITION RESULT OF : '.
           DISPLAY WS-VAR05 ' +' WS-VAR06 ' = 'WS-RES01.
           DISPLAY 'SUBTRACTION RESULT OF : '.
           DISPLAY WS-VAR05 ' -' WS-VAR06 ' = 'WS-RES02.
           DISPLAY 'MULTIPLICATION  RESULT OF: '.
           DISPLAY WS-VAR05 ' *' WS-VAR06 ' = 'WS-RES03.
           DISPLAY 'DIVISION RESULT OF : '.
           DISPLAY WS-VAR05 ' /' WS-VAR06 ' = 'WS-RES04.

           STOP RUN.

       END PROGRAM COBOL059.
      ********************** FIM DO PROGRAMA **************************
