      *****************************************************************
      * DATA     :  06/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO COMPUTE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL037.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 06/06/23 @ 22:40:00.
       DATE-COMPILED. 2023-06-06.
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
       77  WSS-LIT-001               PIC S9(03) VALUE ZEROES
                                       SIGN LEADING SEPARATE.

       77  WSS-LIT-002               PIC 9(06) VALUE ZEROES.
       77  WSS-LIT-003               PIC 9(03) VALUE ZEROES.
       77  WSS-LIT-004               PIC 9(03) VALUE ZEROES.
       77  WSS-LIT-005               PIC 9(03) VALUE ZEROES.
       77  WSS-LIT-006               PIC 9(03) VALUE ZEROES.
       77  WSS-LIT-007               PIC 9(03) VALUE ZEROES.
       77  WSS-LIT-008               PIC 9(03) VALUE ZEROES.
       77  WSS-PASSO                 PIC S9(02) VALUE ZEROES
                                   SIGN LEADING SEPARATE.
      *
       77 WSS-RANDOM-NUMBER1 PIC 999 VALUE ZEROES.
       77 WSS-RANDOM-NUMBER2 PIC 999 VALUE ZEROES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************


           DISPLAY 'COBOL037'.
           DISPLAY 'USO AVANCADO COMPUTE             '.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           DISPLAY ' WSS-LIT-001  = ' WSS-LIT-001.
           DISPLAY ' WSS-LIT-002  = ' WSS-LIT-002.
           DISPLAY ' WSS-LIT-003  = ' WSS-LIT-003.
           DISPLAY ' WSS-LIT-004  = ' WSS-LIT-004.
           DISPLAY ' WSS-LIT-005  = ' WSS-LIT-005.
           DISPLAY ' WSS-LIT-006  = ' WSS-LIT-006.
           DISPLAY ' WSS-LIT-007  = ' WSS-LIT-007.
           DISPLAY ' WSS-LIT-008  = ' WSS-LIT-008.

      ************* COMPUTE  *******************************************
           DISPLAY ' '.
           DISPLAY ' COMPUTE  001 '.

           COMPUTE  WSS-LIT-001 ROUNDED = 1000 / (-30) + 25
                         ON SIZE ERROR DISPLAY 'ERRO'.

           DISPLAY ' WSS-LIT-001 = ' WSS-LIT-001.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.


           IF WSS-LIT-001 IS NEGATIVE
             DISPLAY ' ERA NEGATIVO '
             MOVE 10                TO WSS-LIT-001
           ELSE
             DISPLAY ' ERRO NO FATOR, NUMERO POSITIVO'
           END-IF.

      ************
           DISPLAY ' COMPUTE  002 '.

      **** TERMO GERAL
           PERFORM UNTIL WSS-LIT-001 = 0

              DISPLAY ' WSS-LIT-001  = ' WSS-LIT-001

      ****    MOVE FUNCTION PI     TO WSS-LIT-008
              MOVE 3.1410          TO WSS-LIT-008
              SUBTRACT 1 FROM WSS-LIT-001

              COMPUTE WSS-LIT-002 = WSS-LIT-001 + ( ( 10 - 1 )
                                             * (WSS-LIT-008)  )

              IF WSS-LIT-002  > 500
                DISPLAY 'QUINHENTOS E TAL '
              END-IF

           END-PERFORM.

           DISPLAY ' '.
           DISPLAY ' COMPUTE  003 '.
           DISPLAY ' WSS-LIT-002  = ' WSS-LIT-002.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.
      **** SOMA PSEUDO PA FINITA

           MOVE 10                TO WSS-LIT-001.

           PERFORM UNTIL WSS-LIT-001 = 0

              DISPLAY ' WSS-LIT-001  = ' WSS-LIT-001
              SUBTRACT 1 FROM WSS-LIT-001

              COMPUTE WSS-LIT-002 = ( WSS-LIT-002 +
                                    WSS-LIT-001) * 10

           END-PERFORM.

           DISPLAY ' WSS-LIT-002  = ' WSS-LIT-002.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.
      **** NUMERO PAR

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           MOVE WSS-RANDOM-NUMBER1 TO   WSS-LIT-005.
           MOVE WSS-RANDOM-NUMBER2 TO   WSS-LIT-006.

           DISPLAY '  WSS-LIT-005  = '  WSS-LIT-005.

           DIVIDE  WSS-LIT-005      INTO  2
                   GIVING  WSS-LIT-008
                   REMAINDER  WSS-LIT-003

           DISPLAY ' RESTO     WSS-LIT-008  = '  WSS-LIT-008.
           DISPLAY ' PASSOS    WSS-LIT-003  = '  WSS-LIT-003.

      ************************************************
      * PERFORM PASSO A PASSO
      ************************************************
           PERFORM  VARYING WSS-PASSO FROM 10 BY -1
              UNTIL WSS-PASSO < 0
             DISPLAY 'WSS-PASSO = ' WSS-PASSO
           END-PERFORM.

           DISPLAY 'WSS-PASSO = ' WSS-PASSO.

           STOP RUN.

       ROT-ALEATORIA.
           COMPUTE WSS-RANDOM-NUMBER1 = FUNCTION RANDOM * 10.
           COMPUTE WSS-RANDOM-NUMBER2 = FUNCTION RANDOM * 10.
           DISPLAY ' '.
           DISPLAY ' 1 --> ' WSS-RANDOM-NUMBER1
                   ' 2 --> ' WSS-RANDOM-NUMBER2
           DISPLAY ' '.
       ROT-ALEATORIA-EXIT.
           EXIT.

       END PROGRAM COBOL037.
      ********************** FIM PROGRAMA   ****************************
