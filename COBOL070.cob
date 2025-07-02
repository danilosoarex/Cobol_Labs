      *****************************************************************
      * DATA     :  16/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO INSPECT
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL070.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 16/06/23 @ 12:10:00.
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
           05  WSS-FIM       PIC 9(09)  VALUE 0.
           05  WSS-IND       PIC 9(09)  VALUE 1.
           05  WSS-TAMANHO   PIC 9(09)  VALUE 0.
           05  WSS-TAMANHO-1 PIC 9(09) VALUE 0.
           05  WSS-RESULT    PIC 9(09)  VALUE 0.
           05  WSS-CAMPO     PIC X(50)  VALUE 'VAGNER RENATO BELLACOSA'.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL070'.
           DISPLAY 'EXEMPLO DE INSPECT '.
           DISPLAY ' '.

           DISPLAY ' PRIMEIRO TESTE '

           PERFORM ROT-INSPECT
              THRU ROT-INSPECT-EXIT.

           DISPLAY ' SEGUNDO TESTE '

           MOVE 'V A G N  E R RENATO BELLACOSA' TO WSS-CAMPO.

           PERFORM ROT-INSPECT
              THRU ROT-INSPECT-EXIT.

           STOP RUN.

       ROT-INSPECT.

           INSPECT FUNCTION REVERSE (WSS-CAMPO)
                   TALLYING WSS-TAMANHO-1 FOR LEADING SPACES

           DISPLAY 'QUANTIDADE DE BRANCOS DEPOIS O ULTIMO CARACTER '
           DISPLAY 'SIGNIFICATIVO.'
           DISPLAY 'WSS-TAMANHO-1 - ' WSS-TAMANHO-1.

           COMPUTE WSS-RESULT = FUNCTION LENGTH (WSS-CAMPO)

           MOVE 0 TO WSS-FIM WSS-TAMANHO

      *    MOVE 51 TO WSS-IND.
           MOVE  1 TO WSS-IND.

      **** SIMULA O COMANDO FOR
           DISPLAY ' INICIO FOR WSS-IND = ' WSS-IND

           PERFORM VARYING WSS-IND FROM WSS-IND BY 1
                UNTIL WSS-IND GREATER THAN WSS-RESULT

                DISPLAY ' WSS-IND ' WSS-IND
                        ' > WSS-RESULT ' WSS-RESULT

                IF WSS-CAMPO(WSS-IND:1) NOT EQUAL SPACES
                   ADD 1 TO WSS-TAMANHO
                END-IF

           END-PERFORM

           DISPLAY 'QUANTIDADE DE CARACTERES SIGNIFICATIVO NO CAMPO'
           DISPLAY 'WSS-TAMANHO   - ' WSS-TAMANHO.

           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.

       ROT-INSPECT-EXIT.
           EXIT.

       END PROGRAM COBOL070.
      ********************** FIM PROGRAMA   ****************************
