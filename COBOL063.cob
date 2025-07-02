      *****************************************************************
      * DATA     :  16/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO INSPECT
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL063.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 16/06/23 @ 11:31:00.
       DATE-COMPILED. 2023-06-16.
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
       01  WSS-AUXILIARES.
           05  WSS-FIM           PIC 9(09)  VALUE 0.
           05  WSS-IND           PIC 9(09)  VALUE 1.
           05  WSS-TAMANHO       PIC 9(09)  VALUE 0.
           05  WSS-TAMANHO-1     PIC 9(09)  VALUE 0.
           05  WSS-RESULT        PIC 9(09)  VALUE 0.
           05  WSS-CAMPO         PIC X(30)  VALUE 'TESTE  ESPACO  99A'.
      *
       77  WSS-LIMPO             PIC X(30)  VALUE SPACES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL063'.
           DISPLAY 'EXEMPLO INSPECT REMOVENDO ESPACO'.
           DISPLAY ' '.

           COMPUTE WSS-RESULT = FUNCTION LENGTH (WSS-CAMPO).

           DISPLAY 'TAMANHO ANTES : ' WSS-RESULT.
           DISPLAY ' WSS-CAMPO    : '  WSS-CAMPO.

           INSPECT FUNCTION REVERSE (WSS-CAMPO)
                  TALLYING WSS-TAMANHO-1 FOR LEADING SPACES.

           DISPLAY 'QUANTIDADE DE BRANCOS DEPOIS O ULTIMO'
                   ' CARACTER SIGNIFICATIVO'
           DISPLAY 'WSS-TAMANHO-1 - ' WSS-TAMANHO-1.

           COMPUTE WSS-RESULT = FUNCTION LENGTH (WSS-CAMPO)

           DISPLAY ' LENGTH    : ' LENGTH OF WSS-CAMPO.

           MOVE 0                 TO WSS-FIM WSS-TAMANHO

           PERFORM VARYING WSS-IND FROM 1 BY 1
                   UNTIL WSS-IND GREATER THAN WSS-RESULT

             IF WSS-CAMPO(WSS-IND:1) NOT EQUAL SPACES
               ADD 1              TO WSS-TAMANHO
             END-IF

           END-PERFORM

           DISPLAY 'QUANTIDADE DE CARACTERES SIGNIFICATIVO NO CAMPO'

           DISPLAY ' WSS-TAMANHO  : ' WSS-TAMANHO.
           DISPLAY ' WSS-CAMPO    : '  WSS-CAMPO.

           STOP RUN.

       END PROGRAM COBOL063.
      ********************** FIM PROGRAMA   ****************************
