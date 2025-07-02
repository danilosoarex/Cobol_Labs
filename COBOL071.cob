      *****************************************************************
      * DATA     :  16/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO INSPECT
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL071.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 16/06/23 @ 23:15:00.
       DATE-COMPILED. 2023-06-16.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************
       WORKING-STORAGE SECTION.
      *
       01  WSS-AUXILIARES.
           05  WSS-FIM        PIC 9(09)  VALUE 0.
           05  WSS-IND        PIC 9(09)  VALUE 1.
           05  WSS-TAMANHO    PIC 9(09)  VALUE 0.
           05  WSS-TAMANHO-1  PIC 9(09)  VALUE 0.
           05  WSS-RESULT     PIC 9(09)  VALUE 0.
           05  WSS-CAMPO      PIC X(50)  VALUE 'VAGNER BELLACOSA   '.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL071'.
           DISPLAY 'EXEMPLO DE INSPECT '.
           DISPLAY ' '.
           DISPLAY 'WSS-TAMANHO-1 - ' WSS-TAMANHO-1.

           INSPECT FUNCTION REVERSE (WSS-CAMPO)
                   TALLYING WSS-TAMANHO-1 FOR LEADING SPACES

           DISPLAY 'QUANTIDADE DE BRANCOS DEPOIS O ULTIMO CARACTER '
           DISPLAY 'SIGNIFICATIVO.'
           DISPLAY 'WSS-TAMANHO-1 - ' WSS-TAMANHO-1.

           COMPUTE WSS-RESULT  = FUNCTION LENGTH (WSS-CAMPO).
           COMPUTE WSS-TAMANHO = WSS-RESULT - WSS-TAMANHO-1.

           DISPLAY 'QUANTIDADE DE CARACTERES SIGNIFICATIVO NO CAMPO'
           DISPLAY 'WSS-RESULT    - ' WSS-RESULT.
           DISPLAY 'WSS-TAMANHO   - ' WSS-TAMANHO.

           STOP RUN.

       END PROGRAM COBOL071.
      ********************** FIM PROGRAMA   ****************************
