      *****************************************************************
      * DATA     : 05/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO IF COMPOSTO AND OR
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL031.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 05/06/23 @ 08:35:00.
       DATE-COMPILED. 2023-06-05.
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
       77 WSS-RANDOM-NUMBER1 PIC 999 VALUE ZEROES.
       77 WSS-RANDOM-NUMBER2 PIC 999 VALUE ZEROES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL031'.
           DISPLAY 'TESTE CONDICIONAL IF COMPOSTO AND E OR'.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

      ** EXEMPLO NOT > , AND , NOT <

           DISPLAY '001 - NOT, AND, <, >'.
           DISPLAY ' '.


           IF ( WSS-RANDOM-NUMBER1 NOT > 55 AND NOT < 10)
             DISPLAY 'O NUMERO ' WSS-RANDOM-NUMBER1
                     ' ESTA COMPREENDIDO ENTRE 10 E 55.'
           ELSE
             DISPLAY 'O NUMERO ' WSS-RANDOM-NUMBER1
                     ' NAO ESTA COMPREENDIDO ENTRE 10 E 55.'

           END-IF.

      **************

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

      ** EXEMPLO < , OR , >

           DISPLAY '002 - AND, <, >'.
           DISPLAY ' '.

           IF ( WSS-RANDOM-NUMBER1 < 10 OR  > 55)
             DISPLAY 'O NUMERO ' WSS-RANDOM-NUMBER1
                     ' EH MENOR QUE 10 OU MAIOR QUE 55.'
           ELSE
             DISPLAY 'O NUMERO ' WSS-RANDOM-NUMBER1
                     ' NAO EH MENOR QUE 10 OU MAIOR QUE 55.'

           END-IF.

      **************

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

      ** EXEMPLO = , OR

           DISPLAY '003 - =, OR'.
           DISPLAY ' '.

           IF ( WSS-RANDOM-NUMBER2 = 10 OR 15 OR 20 OR 25)
             DISPLAY 'O NUMERO ' WSS-RANDOM-NUMBER2
                     ' EH IGUAL A 1O OU 15 OU 20 OU 25.'
           ELSE
             DISPLAY 'O NUMERO ' WSS-RANDOM-NUMBER2
                     ' NAO EH IGUAL A 1O OU 15 OU 20 OU 25.'

           END-IF.

      *************************

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

      ** EXEMPLO NOT = , AND

           DISPLAY '004 - NOT, =, OR'.
           DISPLAY ' '.

           IF (WSS-RANDOM-NUMBER2 NOT = 10 AND 15 AND 20 AND 25)
             DISPLAY 'O NUMERO ' WSS-RANDOM-NUMBER2
                     ' NAO EH IGUAL A 1O E 15 E 20 E 25.'
           ELSE
             DISPLAY 'O NUMERO ' WSS-RANDOM-NUMBER2
                     ' EH IGUAL A 1O E 15 E 20 E 25.'

           END-IF.

           STOP RUN.

       ROT-ALEATORIA.
           COMPUTE WSS-RANDOM-NUMBER1 = FUNCTION RANDOM * 55.
           COMPUTE WSS-RANDOM-NUMBER2 = FUNCTION RANDOM * 25.
           DISPLAY ' '.
           DISPLAY ' 1 --> ' WSS-RANDOM-NUMBER1
                   ' 2 --> ' WSS-RANDOM-NUMBER2
           DISPLAY ' '.
       ROT-ALEATORIA-EXIT.
           EXIT.

       END PROGRAM COBOL031.
      ********************** FIM PROGRAMA   ****************************
