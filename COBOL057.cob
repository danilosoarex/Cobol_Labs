      *****************************************************************
      * DATA     :  12/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA CALCULOS EXEMPLO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL057.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 12/06/23 @ 19.10.10
       DATE-COMPILED. 2023-06-12.
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
       01 WSS-NUM01 PIC S9(4)V99.
       01 WSS-NUM02 PIC S9(4)V99.
       01 WSS-VAR01 PIC 9(4)V99.
       01 WSS-VAR02 PIC 9(4)V99.
       01 WSS-RESULT PIC S9(5)V99 COMP.
       01 WSS-RES01 PIC -ZZZ9.99.
       01 WSS-RES02 PIC -ZZZ9.99.
       01 WSS-RES03 PIC -ZZZ9.99.
       01 WSS-RES04 PIC -ZZZ9.99.
       01 WSS-VAR05 PIC -ZZZ9.99.
       01 WSS-VAR06 PIC -ZZZ9.99.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL057'.
           DISPLAY 'EXEMPLO DE CALCULOS'.
           DISPLAY ' '.

           SET WSS-NUM01 TO 30.
           SET WSS-NUM02 TO 25.

      *****************************************************************
           DISPLAY ' '.

       MAIN-PARA.

           DISPLAY 'VALUE 1 : ' WSS-NUM01.
           DISPLAY 'VALUE 2 : ' WSS-NUM02.

           MOVE WSS-NUM01 TO WSS-VAR01.
           MOVE WSS-NUM02 TO WSS-VAR02.
           MOVE WSS-NUM01 TO WSS-VAR05.
           MOVE WSS-NUM02 TO WSS-VAR06.

           PERFORM ADDITION-PARA.

           STOP RUN.

       ADDITION-PARA.

           ADD WSS-VAR01 WSS-VAR02 GIVING WSS-RESULT.

           MOVE WSS-RESULT TO WSS-RES01.

           PERFORM SUBTRACTION-PARA.

       SUBTRACTION-PARA.

           SUBTRACT WSS-VAR02 FROM WSS-VAR01 GIVING WSS-RESULT.

           MOVE WSS-RESULT TO WSS-RES02

           PERFORM MULTIPLICATION-PARA.

       MULTIPLICATION-PARA.

           MULTIPLY WSS-VAR01 BY WSS-VAR02 GIVING WSS-RESULT.

           MOVE WSS-RESULT TO WSS-RES03.

           PERFORM DIVISION-PARA.

       DIVISION-PARA.

           DIVIDE WSS-VAR01 BY WSS-VAR02 GIVING WSS-RESULT.

           MOVE WSS-RESULT TO WSS-RES04.

           PERFORM RESULT-PARA.

       RESULT-PARA.

           DISPLAY 'RESULTADO DA ADICAO : '.
           DISPLAY WSS-VAR05 ' +' WSS-VAR06 ' = 'WSS-RES01.
           DISPLAY 'RESULTADO DA SUBTRACAO : '.
           DISPLAY WSS-VAR05 ' -' WSS-VAR06 ' = 'WSS-RES02.
           DISPLAY 'RESULTADO DA MULTIPLICACAO : '.
           DISPLAY WSS-VAR05 ' *' WSS-VAR06 ' = 'WSS-RES03.
           DISPLAY 'RESULTADO DA DIVISAO : '.
           DISPLAY WSS-VAR05 ' /' WSS-VAR06 ' = 'WSS-RES04.

       END PROGRAM COBOL057.
      ********************** FIM DO PROGRAMA **************************
