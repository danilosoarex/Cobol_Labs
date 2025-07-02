      *****************************************************************
      * DATA     : 17/01/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VARIAVEL NUMERICA COMP
      *            COMPUTE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL040.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 17/01/24 @ 20:22:00.
       DATE-COMPILED. 2024-01-17.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
      *
       SPECIAL-NAMES.
      *
           DECIMAL-POINT IS COMMA.
      *
      *SOURCE-COMPUTER. IBM-390.
       SOURCE-COMPUTER. IBM-390 WITH DEBUGGING MODE.
       OBJECT-COMPUTER. IBM-390.

      ***************
       DATA DIVISION.
      ***************
       FILE SECTION.
      *
       WORKING-STORAGE SECTION.
      *
       01  WSS-VARIAVEL-COMP.
      *   05  WSS-A-COMP-1  USAGE COMP-1.
          05  WSS-A-COMP-1  COMP-1.
      *   05  WSS-B-COMP-2  USAGE COMP-2.
          05  WSS-B-COMP-2  COMP-2.
      *   05  WSS-C-COMP-3  PIC 9(16)V9(2)  USAGE COMP-3.
          05  WSS-C-COMP-3  PIC 9(16)V9(2)  COMP-3.
      *   05  WSS-D-COMP-4  PIC 9(14)V9(4)  USAGE COMP-4.
          05  WSS-D-COMP-4  PIC 9(14)V9(4)  COMP-4.
      *   05  WSS-Z-COMP-4  PIC 9(14)V9(4)  USAGE COMP.
          05  WSS-Z-COMP-4  PIC 9(14)V9(4)  COMP.
      *   05  WSS-E-COMP-5  PIC 9(12)V9(6)  USAGE COMP-5.
          05  WSS-E-COMP-5  PIC 9(12)V9(6)  COMP-5.
      *
          05  WSS-NUM-1     PIC 9999V99  VALUE 123.
          05  WSS-NUM-2     PIC 99V99    VALUE 34,55.
          05  WSS-NUM-3     PIC 9(4)V99  VALUE 1234,56 .
          05  WSS-NUM-4     PIC 9(3)V99  VALUE 127,8.
          05  WSS-NUM-5     PIC 999V99   VALUE 12.
          05  WSS-NUM-6     PIC 9(3)V99  VALUE 342,34 .
          05  WSS-NUM-7     PIC 9(6)V99  VALUE 123456,78 .
          05  WSS-NUM-8     PIC 9(6)V99  VALUE 765432 .
          05  WSS-NUM-9     PIC 9(3)     VALUE 765 .
          05  WSS-NUM-10    PIC 9(3)V99  VALUE 236,45 .
          05  WSS-NUM-11    PIC 9(5)V99  VALUE 2131 .
          05  WSS-NUM-12    PIC 9(5)V99  VALUE 87654,32 .
          05  WSS-NUM-13    PIC 9(5)V99  VALUE 76543,21 .
          05  WSS-NUM-14    PIC 9(5)V99  VALUE 123 .
          05  WSS-NUM-15    PIC 9(5)V99  VALUE 1234 .
          05  WSS-NUM-16    PIC 9(5)V99  VALUE 45 .
          05  WSS-NUM-17    PIC 9(7)V99  VALUE 1242124,56 .
          05  WSS-NUM-18    PIC 9(6)V99  VALUE 123456,78 .
          05  WSS-NUM-19    PIC 9(4)V99  VALUE 234 .
          05  WSS-NUM-20    PIC 9(4)V99  VALUE 6532,8 .
          05  WSS-NUM-21    PIC 9(6)V99  VALUE 876543,21 .
          05  WSS-NUM-22    PIC 9(5)V99  VALUE 64 .
          05  WSS-NUM-23    PIC 9(5)V99  VALUE 64 .
          05  WSS-NUM-24    PIC 9(7)V99  VALUE 0 .
      *
       77 WSS-DIA-SEMANA    PIC 9.
       77 WSS-CONTADOR      PIC S999      COMP-3.
       77 WSS-CONTADOR-01   PIC S999V999  COMP-3.
       77 WSS-NUMBER-01     PIC 999       COMP-3 VALUE 10.
       77 WSS-NUMBER-02     PIC S999      COMP-3 VALUE -10.
       77 WSS-NUMBER-03     PIC S999V99   COMP-3 VALUE 70.
       77 WSS-NUMERO        PIC Z(15)9V99.
       77 WSS-DISPLAY       PIC $Z.ZZZ.ZZ9,999+.
      *
      D 01 WS-VAR1          PIC X(10)  VALUE "MAINFRAMES".
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL040'.
           DISPLAY 'IF E COMPUTE'.

      *
           DISPLAY ' '.

           PERFORM DIVIDE-EXEMPLO
              THRU DIVIDE-EXEMPLO-EXIT.

           DISPLAY ' '.

           PERFORM MULTIPLY-EXEMPLO
              THRU MULTIPLY-EXEMPLO-EXIT.

           DISPLAY ' '.

           PERFORM SUBTRACT-EXEMPLO
              THRU SUBTRACT-EXEMPLO-EXIT.

           DISPLAY ' '.

           PERFORM ADD-EXEMPLO
              THRU ADD-EXEMPLO-EXIT.

           DISPLAY ' '.

      D    DISPLAY "DEBUGGING MODE ON".
      D    DISPLAY "DEBUGGING MODE EXAMPLE".
      D    DISPLAY "WS-VAR1: " WS-VAR1.
      D    DISPLAY "DEBUGGING MODE END".
      *
           ACCEPT WSS-DIA-SEMANA   FROM DAY-OF-WEEK.

           MOVE 1234             TO WSS-A-COMP-1
           MOVE 1234567890       TO WSS-B-COMP-2
           MOVE 23456            TO WSS-C-COMP-3
           MOVE 99987            TO WSS-D-COMP-4
           MOVE 66685            TO WSS-Z-COMP-4
           MOVE 10               TO WSS-E-COMP-5.

           DISPLAY 'ANTES DO CALCULO '.
           DISPLAY ' WSS-A-COMP-1    = ' WSS-A-COMP-1 .
           DISPLAY ' WSS-B-COMP-2    = ' WSS-B-COMP-2 .
           DISPLAY ' WSS-C-COMP-3    = ' WSS-C-COMP-3 .
           DISPLAY ' WSS-D-COMP-4    = ' WSS-D-COMP-4 .
           DISPLAY ' WSS-Z-COMP-4    = ' WSS-Z-COMP-4 .
           DISPLAY ' WSS-E-COMP-5    = ' WSS-E-COMP-5 .
           DISPLAY ' '.

           DISPLAY ' WSS-DIA-SEMANA ' WSS-DIA-SEMANA

      **  TEM ERRO DE EXECUÁ„O - ESTOURO DE VARIAVEL
      **  SERA CORRIGIDO NA PROXIMA SESSAO.

           IF WSS-DIA-SEMANA = 1
              IF NOT WSS-DIA-SEMANA = 1
                COMPUTE WSS-A-COMP-1 =
                            ( WSS-B-COMP-2 *  WSS-C-COMP-3 ) ** 4
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
                COMPUTE  WSS-C-COMP-3 = WSS-A-COMP-1 / 0,005
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
              ELSE
                COMPUTE  WSS-A-COMP-1 =
                            ( WSS-B-COMP-2 * WSS-C-COMP-3 ) ** 8
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
                COMPUTE  WSS-C-COMP-3 = WSS-A-COMP-1 / 0,055
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
              END-IF
           ELSE
              IF WSS-DIA-SEMANA = 3
                COMPUTE WSS-C-COMP-3 =
                            ( WSS-B-COMP-2 * WSS-A-COMP-1 ) ** 5
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
                COMPUTE WSS-D-COMP-4 = WSS-A-COMP-1 / 0,007
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
              ELSE
                DISPLAY ' OVERFLOW '
                COMPUTE WSS-C-COMP-3 =
                      ( WSS-B-COMP-2 * WSS-A-COMP-1 ) ** 1
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
                COMPUTE WSS-D-COMP-4 = WSS-A-COMP-1 / 0,007
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
              END-IF
           END-IF

           DISPLAY 'APOS CALCULO '.
           DISPLAY ' WSS-A-COMP-1    = ' WSS-A-COMP-1 .
           MOVE     WSS-A-COMP-1      TO  WSS-NUMERO
           DISPLAY ' WSS-NUMERO = ' WSS-NUMERO.

           DISPLAY ' WSS-B-COMP-2    = ' WSS-B-COMP-2 .
           MOVE     WSS-B-COMP-2      TO  WSS-NUMERO
           DISPLAY ' WSS-NUMERO = ' WSS-NUMERO.

           DISPLAY ' WSS-C-COMP-3    = ' WSS-C-COMP-3 .
           MOVE     WSS-C-COMP-3      TO  WSS-NUMERO
           DISPLAY ' WSS-NUMERO = ' WSS-NUMERO.

           DISPLAY ' WSS-D-COMP-4    = ' WSS-D-COMP-4 .
           MOVE     WSS-D-COMP-4      TO  WSS-NUMERO
           DISPLAY ' WSS-NUMERO = ' WSS-NUMERO.

           DISPLAY ' WSS-Z-COMP-4    = ' WSS-Z-COMP-4 .
           MOVE     WSS-Z-COMP-4      TO  WSS-NUMERO
           DISPLAY ' WSS-NUMERO = ' WSS-NUMERO.

           DISPLAY ' WSS-E-COMP-5    = ' WSS-E-COMP-5 .
           MOVE  WSS-E-COMP-5         TO  WSS-NUMERO
           DISPLAY ' WSS-NUMERO = ' WSS-NUMERO.

           PERFORM  ROT-DISPLAY-MASK
               THRU ROT-DISPLAY-MASK-EXIT.

           STOP RUN.

       TESTE-ADD   SECTION.

       ADD-EXEMPLO.

           DISPLAY ' '.
           DISPLAY 'TESTE ADD 001 '.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           ADD 1             TO WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.
           DISPLAY ' '.

           DISPLAY 'TESTE ADD 002 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           ADD 1 2 3 4 5 6 7 TO WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.
           DISPLAY ' '.

           DISPLAY 'TESTE ADD 003 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           ADD 10  WSS-NUMBER-01  TO WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.
           DISPLAY ' '.

           DISPLAY 'TESTE ADD 004 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           ADD WSS-NUMBER-01
               WSS-NUMBER-02  TO WSS-CONTADOR
           END-ADD.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.
           DISPLAY ' '.

           DISPLAY 'TESTE ADD 005 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           ADD 1234 1000 2000000 TO WSS-CONTADOR
             ON SIZE ERROR DISPLAY 'EXPLODIU'
           END-ADD.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.
           DISPLAY ' '.

       ADD-EXEMPLO-EXIT.
           EXIT.

       TESTE-SUBTRACT SECTION.

       SUBTRACT-EXEMPLO.

           DISPLAY ' '.
           DISPLAY 'TESTE SUBTRACT 001 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           SUBTRACT 1      FROM WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE SUBTRACT 002 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           SUBTRACT 1 100 35     FROM WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE SUBTRACT 003 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           SUBTRACT 1 WSS-NUMBER-02 FROM WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE SUBTRACT 004 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           SUBTRACT  WSS-NUMBER-02
                    WSS-NUMBER-01 FROM WSS-CONTADOR
           END-SUBTRACT.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE SUBTRACT 005 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           SUBTRACT 12345  WSS-NUMBER-02
                    WSS-NUMBER-01 FROM WSS-CONTADOR
             ON SIZE ERROR DISPLAY 'EXPLODIU'
           END-SUBTRACT.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

       SUBTRACT-EXEMPLO-EXIT.
           EXIT.

       TESTE-MULTIPLY SECTION.

       MULTIPLY-EXEMPLO.

           DISPLAY ' '.
           DISPLAY 'TESTE MULTIPLY 001 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MULTIPLY 2  BY 2 GIVING WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE MULTIPLY 002 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MULTIPLY 2  BY WSS-NUMBER-02 GIVING WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE MULTIPLY 003 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MULTIPLY WSS-NUMBER-01  BY WSS-NUMBER-02
                    GIVING WSS-CONTADOR.
           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE MULTIPLY 004 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           COMPUTE WSS-NUMBER-03 = WSS-NUMBER-03 / 3.

           MULTIPLY WSS-NUMBER-01  BY WSS-NUMBER-03
                   GIVING WSS-CONTADOR-01
           END-MULTIPLY.

           DISPLAY 'WSS-CONTADOR-01 = ' WSS-CONTADOR-01.

           MOVE WSS-CONTADOR-01 TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE MULTIPLY 005 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           DISPLAY ' '
           DISPLAY ' COM ROUNDED '
           DISPLAY ' '

           MULTIPLY WSS-NUMBER-01  BY 0,666
                    GIVING WSS-CONTADOR     ROUNDED
             ON SIZE ERROR DISPLAY 'EXPLODIU'
           END-MULTIPLY.

           DISPLAY 'WSS-CONTADOR    = ' WSS-CONTADOR.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR    = ' WSS-CONTADOR.

           DISPLAY ' '
           DISPLAY ' SEM ROUNDED '
           DISPLAY ' '

           MULTIPLY WSS-NUMBER-01  BY 0,666
                    GIVING WSS-CONTADOR
             ON SIZE ERROR DISPLAY 'EXPLODIU'
           END-MULTIPLY.

           DISPLAY 'WSS-CONTADOR    = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR    TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE MULTIPLY 005A'.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MULTIPLY WSS-NUMBER-01  BY WSS-NUMBER-03
                    GIVING WSS-CONTADOR     ROUNDED
             ON SIZE ERROR DISPLAY 'EXPLODIU'
           END-MULTIPLY.

           DISPLAY 'WSS-CONTADOR    = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR    TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE MULTIPLY 006 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MULTIPLY 1000000        BY WSS-NUMBER-03
                    GIVING WSS-CONTADOR-01 ROUNDED
             ON SIZE ERROR DISPLAY 'EXPLODIU'
           END-MULTIPLY.

           DISPLAY 'WSS-CONTADOR-01 = ' WSS-CONTADOR-01.

           MOVE WSS-CONTADOR-01 TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

       MULTIPLY-EXEMPLO-EXIT.
           EXIT.

       TESTE-DIVIDE SECTION.

       DIVIDE-EXEMPLO.

           DISPLAY ' '.
           DISPLAY 'TESTE DIVIDE 001 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           DIVIDE  2  INTO  WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE DIVIDE 001A'.

           INITIALIZE WSS-CONTADOR
                      WSS-CONTADOR-01.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           DIVIDE  WSS-CONTADOR INTO 2 GIVING  WSS-CONTADOR-01
             ON SIZE ERROR DISPLAY 'DIVISAO POR ZERO'
           END-DIVIDE.

           DISPLAY 'WSS-CONTADOR-01 = ' WSS-CONTADOR-01.

           MOVE WSS-CONTADOR-01 TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE DIVIDE   002 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           DIVIDE  WSS-NUMBER-02 INTO 2 GIVING WSS-CONTADOR.
           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE DIVIDE   002A'.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           DIVIDE  WSS-NUMBER-02 BY   2,5 GIVING WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.

           MOVE WSS-NUMBER-02 TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE DIVIDE   002B'.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           DIVIDE  WSS-NUMBER-02 BY   3,33 GIVING WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.

           MOVE WSS-NUMBER-02 TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE DIVIDE 003 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           DIVIDE   WSS-NUMBER-01  INTO ZERO
                    GIVING WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE DIVIDE  004 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.
           DIVIDE   1000000      INTO ZERO
                    GIVING WSS-CONTADOR-01 ROUNDED
             ON SIZE ERROR DISPLAY 'DIVISAO POR ZERO'
           END-DIVIDE.

           DISPLAY 'WSS-CONTADOR-01 = ' WSS-CONTADOR-01.

           MOVE WSS-CONTADOR-01 TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

           DISPLAY 'TESTE DIVIDE   005 '.

           INITIALIZE WSS-CONTADOR.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           DIVIDE  WSS-NUMBER-02 BY   3,33 GIVING WSS-CONTADOR
                   REMAINDER WSS-CONTADOR-01
           END-DIVIDE.

           DISPLAY 'WSS-CONTADOR = ' WSS-CONTADOR.

           MOVE WSS-CONTADOR TO WSS-DISPLAY.

           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.

           MOVE WSS-CONTADOR-01 TO WSS-DISPLAY.

           DISPLAY 'WSS-CONTADOR-01 = ' WSS-CONTADOR-01.
           DISPLAY ' WSS-DISPLAY = ' WSS-DISPLAY.
           DISPLAY ' '.

       DIVIDE-EXEMPLO-EXIT.
           EXIT.

       ROT-DISPLAY-MASK.

           DISPLAY ' '.
           DISPLAY 'ROT-DISPLAY-MASK'.
           DISPLAY ' '.

           DISPLAY ' WSS-NUM-1  = ' WSS-NUM-1
           DISPLAY ' WSS-NUM-2  = ' WSS-NUM-2
           DISPLAY ' WSS-NUM-3  = ' WSS-NUM-3
           DISPLAY ' WSS-NUM-4  = ' WSS-NUM-4
           DISPLAY ' WSS-NUM-5  = ' WSS-NUM-5
           DISPLAY ' WSS-NUM-6  = ' WSS-NUM-6
           DISPLAY ' WSS-NUM-7  = ' WSS-NUM-7
           DISPLAY ' WSS-NUM-8  = ' WSS-NUM-8
           DISPLAY ' WSS-NUM-9  = ' WSS-NUM-9
           DISPLAY ' WSS-NUM-10 = ' WSS-NUM-10
           DISPLAY ' WSS-NUM-11 = ' WSS-NUM-11
           DISPLAY ' WSS-NUM-12 = ' WSS-NUM-12
           DISPLAY ' WSS-NUM-13 = ' WSS-NUM-13
           DISPLAY ' WSS-NUM-14 = ' WSS-NUM-14
           DISPLAY ' WSS-NUM-15 = ' WSS-NUM-15
           DISPLAY ' WSS-NUM-16 = ' WSS-NUM-16
           DISPLAY ' WSS-NUM-17 = ' WSS-NUM-17
           DISPLAY ' WSS-NUM-18 = ' WSS-NUM-18
           DISPLAY ' WSS-NUM-19 = ' WSS-NUM-19
           DISPLAY ' WSS-NUM-20 = ' WSS-NUM-20
           DISPLAY ' WSS-NUM-21 = ' WSS-NUM-21
           DISPLAY ' WSS-NUM-22 = ' WSS-NUM-22
           DISPLAY ' WSS-NUM-23 = ' WSS-NUM-23

           MOVE WSS-NUM-1          TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-1  = ' WSS-DISPLAY.

           MOVE WSS-NUM-2          TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-2  = ' WSS-DISPLAY.

           MOVE WSS-NUM-3          TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-3  = ' WSS-DISPLAY.

           MOVE WSS-NUM-4          TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-4  = ' WSS-DISPLAY.

           MOVE WSS-NUM-5          TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-5  = ' WSS-DISPLAY.

           MOVE WSS-NUM-6          TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-6  = ' WSS-DISPLAY.

           MOVE WSS-NUM-7          TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-7  = ' WSS-DISPLAY.

           MOVE WSS-NUM-8          TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-8  = ' WSS-DISPLAY.

           MOVE WSS-NUM-9          TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-9  = ' WSS-DISPLAY.

           MOVE WSS-NUM-10         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-10 = ' WSS-DISPLAY.

           MOVE WSS-NUM-11         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-11 = ' WSS-DISPLAY.

           MOVE WSS-NUM-12         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-12 = ' WSS-DISPLAY.

           MOVE WSS-NUM-13         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-13 = ' WSS-DISPLAY.

           MOVE WSS-NUM-14         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-14 = ' WSS-DISPLAY.

           MOVE WSS-NUM-15         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-15 = ' WSS-DISPLAY.

           MOVE WSS-NUM-16         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-16 = ' WSS-DISPLAY.

           MOVE WSS-NUM-17         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-17 = ' WSS-DISPLAY.

           MOVE WSS-NUM-18         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-18 = ' WSS-DISPLAY.

           MOVE WSS-NUM-19         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-19 = ' WSS-DISPLAY.

           MOVE WSS-NUM-20         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-20 = ' WSS-DISPLAY.

           MOVE WSS-NUM-21         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-21 = ' WSS-DISPLAY.

           MOVE WSS-NUM-22         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-22 = ' WSS-DISPLAY.

           MOVE WSS-NUM-23         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-23 = ' WSS-DISPLAY.

           MOVE WSS-NUM-24         TO WSS-DISPLAY.

           DISPLAY ' WSS-NUM-24 = ' WSS-DISPLAY.

       ROT-DISPLAY-MASK-EXIT.
           EXIT.

       BUG-TRAP.

           DISPLAY 'ESTOURO DE VARIAVEL'.

           MOVE 670 TO RETURN-CODE.

           STOP RUN.

       END PROGRAM COBOL040.
      ********************** FIM DO PROGRAMA **************************
