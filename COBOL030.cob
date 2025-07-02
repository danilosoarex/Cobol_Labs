      *****************************************************************
      * DATA     :  04/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA USO FUNCAO RANDOM E TESTE CONDICIONAL
      *            EXEMPLOS SIMPLES E IF ELSE VERBOSE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL030.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 04/06/24 @ 21:10:00.
       DATE-COMPILED. 2023-06-04
       INSTALLATION. INEFE.
       SECURITY. NORMAL.
      *
       ENVIRONMENT DIVISION.
      *
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
      *
       77 WSS-FOR            PIC 9(2)    COMP-3.
       77 WSS-RANDOM         PIC 9(2)V99 COMP-3.
       77 WSS-RANDOM-NUMBER1 PIC 999 VALUE ZEROES.
       77 WSS-RANDOM-NUMBER2 PIC S999 VALUE ZEROES.
       77 WSS-EDITAVEL       PIC -ZZ9 VALUE ZEROES.
       77 WSS-TEXTO-GRANDE   PIC X(150) VALUE 'ABCDEFGHIJKLMNOPQRSTUVWX
      -     'YZ O PROFESSOR ESTA DE BRINCADEIRA'.

       PROCEDURE DIVISION.

           DISPLAY ' PROGRAMA COBOL030'.
           DISPLAY ' EXEMPLO FUNCAO RANDOM'.
           DISPLAY ' '.

           DISPLAY '001 - EXEMPLO IS GREATER THAN'
           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           IF  WSS-RANDOM-NUMBER1 IS GREATER THAN
               WSS-RANDOM-NUMBER2
               DISPLAY WSS-RANDOM-NUMBER1
                       ' EH MAIOR QUE '
                       WSS-RANDOM-NUMBER2
           ELSE
                DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH MAIOR QUE '
                        WSS-RANDOM-NUMBER2
           END-IF.

           DISPLAY '002 - EXEMPLO IS LESS THAN'
           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           IF  WSS-RANDOM-NUMBER1 IS LESS THAN
               WSS-RANDOM-NUMBER2
               DISPLAY WSS-RANDOM-NUMBER1
                       ' EH MAIOR OU IGUAL A '
                       WSS-RANDOM-NUMBER2
           ELSE
                DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH MAIOR OU IGUAL A '
                        WSS-RANDOM-NUMBER2
           END-IF.
           DISPLAY '003 - EXEMPLO IS EQUAL '

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           IF  WSS-RANDOM-NUMBER1 IS EQUAL
               WSS-RANDOM-NUMBER2
               DISPLAY WSS-RANDOM-NUMBER1
                       ' EH MENOR QUE '
                       WSS-RANDOM-NUMBER2
           ELSE
                DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH MENOR QUE '
                        WSS-RANDOM-NUMBER2
           END-IF.
           DISPLAY '004 - EXEMPLO IS POSITIVE'

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           COMPUTE WSS-RANDOM-NUMBER2 = WSS-RANDOM-NUMBER2 * -1

           IF  WSS-RANDOM-NUMBER2 IS POSITIVE
               DISPLAY ' WSS-RANDOM-NUMBER2 : '
                       WSS-RANDOM-NUMBER2
                       ' EH POSITIVO  '
           ELSE
               DISPLAY ' WSS-RANDOM-NUMBER2 : '
                        WSS-RANDOM-NUMBER2
                       ' EH NEGATIVO  '
           END-IF.
           DISPLAY '005 - EXEMPLO IS NEGATIVE '

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           COMPUTE WSS-RANDOM-NUMBER2 = WSS-RANDOM-NUMBER2 * -1

           IF  WSS-RANDOM-NUMBER2 IS NEGATIVE
               DISPLAY WSS-RANDOM-NUMBER2
                       ' EH NEGATIVO '
           ELSE
                DISPLAY WSS-RANDOM-NUMBER2
                       ' NAO EH POSITIVO '
           END-IF.

           DISPLAY ' '.
           DISPLAY ' WSS-TEXTO-GRANDE = ' WSS-TEXTO-GRANDE.

           STOP RUN.

       ROT-ALEATORIA.
           COMPUTE WSS-RANDOM-NUMBER1 = FUNCTION RANDOM * 20.
           COMPUTE WSS-RANDOM-NUMBER2 = FUNCTION RANDOM * 20.
           MOVE   WSS-RANDOM-NUMBER2    TO WSS-EDITAVEL.
           DISPLAY ' '.
           DISPLAY ' 1 --> ' WSS-RANDOM-NUMBER1
                   ' 2 --> ' WSS-RANDOM-NUMBER2
                       ' = ' WSS-EDITAVEL
           DISPLAY ' '.

       ROT-ALEATORIA-EXIT.
           DISPLAY ' '.
           EXIT.

       END PROGRAM COBOL030.
      ********************** FIM PROGRAMA   ****************************
