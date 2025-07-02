      *****************************************************************
      * DATA     :  04/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA USO FUNCAO RANDOM E TESTE CONDICIONAL
      *            EXEMPLOS SIMPLES E IF ELSE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL029.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 04/06/24 @ 20:10:00.
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
       77 WSS-RANDOM-NUMBER2 PIC 999 VALUE ZEROES.
007400 77 WSS-DATA-COMPIL    PIC X(16).
      *
       PROCEDURE DIVISION.

           DISPLAY ' PROGRAMA COBOL029'.
           DISPLAY ' EXEMPLO FUNCAO RANDOM'.
           DISPLAY ' '.
008500     MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.
           DISPLAY ' DATA DE COMPILACAO : ' WSS-DATA-COMPIL.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           DISPLAY '001 - EXEMPLO IF >   '

           IF  WSS-RANDOM-NUMBER1 >   WSS-RANDOM-NUMBER2
               DISPLAY WSS-RANDOM-NUMBER1
                       ' EH MAIOR QUE '
                       WSS-RANDOM-NUMBER2
           ELSE
                DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH MAIOR QUE '
                        WSS-RANDOM-NUMBER2
           END-IF.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           DISPLAY '002 - EXEMPLO IF >=  '

           IF  WSS-RANDOM-NUMBER1 >=  WSS-RANDOM-NUMBER2
               DISPLAY WSS-RANDOM-NUMBER1
                       ' EH MAIOR OU IGUAL A '
                       WSS-RANDOM-NUMBER2
           ELSE
                DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH MAIOR OU IGUAL A '
                        WSS-RANDOM-NUMBER2
           END-IF.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           DISPLAY '003 - EXEMPLO IF <   '

           IF  WSS-RANDOM-NUMBER1 <   WSS-RANDOM-NUMBER2
               DISPLAY WSS-RANDOM-NUMBER1
                       ' EH MENOR QUE '
                       WSS-RANDOM-NUMBER2
           ELSE
                DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH MENOR QUE '
                        WSS-RANDOM-NUMBER2
           END-IF.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           DISPLAY '004 - EXEMPLO IF <=  '

           IF  WSS-RANDOM-NUMBER1 <=  WSS-RANDOM-NUMBER2
               DISPLAY WSS-RANDOM-NUMBER1
                       ' EH MENOR QUE '
                       WSS-RANDOM-NUMBER2
           ELSE
                DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH MENOR QUE '
                        WSS-RANDOM-NUMBER2
           END-IF.
           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           DISPLAY '005 - EXEMPLO IF =   '

           IF  WSS-RANDOM-NUMBER1 =   WSS-RANDOM-NUMBER2
               DISPLAY WSS-RANDOM-NUMBER1
                       ' EH IGUAL A '
                       WSS-RANDOM-NUMBER2
           ELSE
                DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH IGUAL A '
                        WSS-RANDOM-NUMBER2
           END-IF.
           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           DISPLAY '006 - EXEMPLO IF NOT='

           IF NOT WSS-RANDOM-NUMBER1 =  WSS-RANDOM-NUMBER2
               DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH IGUAL A  '
                       WSS-RANDOM-NUMBER2
           ELSE
                DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH DIFERENTE A '
                        WSS-RANDOM-NUMBER2
           END-IF.
           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           DISPLAY '007 - EXEMPLO IF NOT>'

           IF  NOT WSS-RANDOM-NUMBER1 >   WSS-RANDOM-NUMBER2
               DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH MAIOR QUE '
                       WSS-RANDOM-NUMBER2
           ELSE
                DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH MENOR QUE '
                        WSS-RANDOM-NUMBER2
           END-IF.
           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           DISPLAY '008 - EXEMPLO IF NOT<'

           IF  NOT WSS-RANDOM-NUMBER1 <   WSS-RANDOM-NUMBER2
               DISPLAY WSS-RANDOM-NUMBER1
                       ' NAO EH MENOR QUE '
                       WSS-RANDOM-NUMBER2
           ELSE
                DISPLAY WSS-RANDOM-NUMBER1
                       'NAO EH MAIOR QUE '
                        WSS-RANDOM-NUMBER2
           END-IF.

           STOP RUN.

       ROT-ALEATORIA.
           COMPUTE WSS-RANDOM-NUMBER1 = FUNCTION RANDOM * 20.
           COMPUTE WSS-RANDOM-NUMBER2 = FUNCTION RANDOM * 20.
           DISPLAY ' '.
           DISPLAY ' 1 --> ' WSS-RANDOM-NUMBER1
                   ' 2 --> ' WSS-RANDOM-NUMBER2
           DISPLAY ' '.

       ROT-ALEATORIA-EXIT.
           DISPLAY ' '.
           EXIT.

       END PROGRAM COBOL029.
      ********************** FIM PROGRAMA   ****************************
