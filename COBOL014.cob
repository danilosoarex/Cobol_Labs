      *****************************************************************
      * DATA     : 01/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VARIAVEL NUMERICA COMP
      *            COMPUTE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL014.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 01/06/23 @ 22:15:00.
       DATE-COMPILED. 2023-06-01.


      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
      *
       SOURCE-COMPUTER. IBM-390.
      *SOURCE-COMPUTER. IBM-390 WITH DEBUGGING MODE.
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
      *   05  WSS-Z-COMP    PIC 9(14)V9(4)  USAGE COMP.
          05  WSS-Z-COMP    PIC 9(14)V9(4)  COMP.
      *   05  WSS-E-COMP-5  PIC 9(12)V9(6)  USAGE COMP-5.
          05  WSS-E-COMP-5  PIC 9(12)V9(6)  COMP-5.
      *
       77 WSS-DIA-SEMANA    PIC 9.
       77 WSS-NUMERO        PIC Z(15)9V99.
       77 WSS-MSG           PIC X(30).
      *
      D 01 WSS-VAR1      PIC X(10) VALUE "MAINFRAMES".
      D 01 WSS-VAR2      PIC 999   COMP-3.
      *
       LINKAGE SECTION.
      *
       01 LKS-PARM-IBM.
        05 LKS-PARAM-TAM    PIC S9(04) COMP.
        05 LKS-PARAM-GROUP.
          10 LKS-DEBUG-MODO  PIC X(001).
            88 DEBUG-YES     VALUE 'S'.
            88 DEBUG-NO      VALUE 'N'.
          10 LKS-SALDO       PIC 9(031).
      *   NUMERICO       9 - 18 DIGITOS NORMAL
      *   NUMERICO       9 - 31 DIGITOS MOD EXPANDIDO.
      ********************
      *PROCEDURE DIVISION.
      ********************
      *-------------------------------------*
       PROCEDURE DIVISION USING LKS-PARM-IBM.
      *-------------------------------------*

           DISPLAY 'COBOL014'.
           DISPLAY 'IF E COMPUTE'.
      *
           IF LKS-PARAM-TAM > 1 OR
              LKS-DEBUG-MODO NOT EQUAL 'S'
              SET DEBUG-NO TO TRUE
           ELSE
             DISPLAY ' ***********'
             DISPLAY ' DEBUG MODE '
             DISPLAY ' DEBUG MODE '
             DISPLAY ' DEBUG MODE '
             DISPLAY ' ***********'
           END-IF.

           INITIALIZE WSS-MSG.
      D    INITIALIZE WSS-VAR2.

      D    DISPLAY "DEBUGGING MODE ON".
      D    DISPLAY "DEBUGGING MODE EXAMPLE".
      D    DISPLAY "WSS-VAR1: " WSS-VAR1.
      D    DISPLAY "WSS-VAR2: " WSS-VAR2.
      D    DISPLAY "DEBUGGING MODE END".
      *
           ACCEPT WSS-DIA-SEMANA   FROM DAY-OF-WEEK.

           MOVE 1234             TO WSS-A-COMP-1
           MOVE 1234567890       TO WSS-B-COMP-2
           MOVE 23456            TO WSS-C-COMP-3
           MOVE 99987            TO WSS-D-COMP-4
           MOVE 66685            TO WSS-Z-COMP
           MOVE 10               TO WSS-E-COMP-5.

           DISPLAY 'ANTES DO CALCULO '.
           DISPLAY ' WSS-A-COMP-1    = ' WSS-A-COMP-1 .
           DISPLAY ' WSS-B-COMP-2    = ' WSS-B-COMP-2 .
           DISPLAY ' WSS-C-COMP-3    = ' WSS-C-COMP-3 .
           DISPLAY ' WSS-D-COMP-4    = ' WSS-D-COMP-4 .
           DISPLAY ' WSS-Z-COMP      = ' WSS-Z-COMP   .
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
                COMPUTE  WSS-C-COMP-3 = WSS-A-COMP-1 / 0.005
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
              ELSE
                COMPUTE  WSS-A-COMP-1 =
                            ( WSS-B-COMP-2 * WSS-C-COMP-3 ) ** 8
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
                COMPUTE  WSS-C-COMP-3 = WSS-A-COMP-1 / 0.055
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
              END-IF
           ELSE
              IF WSS-DIA-SEMANA = 3
                DISPLAY ' ERRO '
                MOVE ' ERRO1'        TO WSS-MSG
                COMPUTE WSS-C-COMP-3 =
                            ( WSS-B-COMP-2 * WSS-A-COMP-1 ) ** 5
                            + 999999999999999999
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
                MOVE ' ERRO2'        TO WSS-MSG
                COMPUTE WSS-D-COMP-4 = WSS-A-COMP-1 / 0.007
                            + 999999999999999999
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
              ELSE
                DISPLAY ' OVERFLOW '
                MOVE ' ERRO3'        TO WSS-MSG
      D         ADD  001           TO WSS-VAR2
                COMPUTE WSS-C-COMP-3 =
                      ( WSS-B-COMP-2 * WSS-A-COMP-1 ) ** 1
                  ON SIZE ERROR PERFORM BUG-TRAP
                END-COMPUTE
      D         ADD  001           TO WSS-VAR2
                MOVE ' ERRO4'        TO WSS-MSG
                COMPUTE WSS-D-COMP-4 = WSS-A-COMP-1 / 0.007
                            + 999999999999999999
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
           DISPLAY ' WSS-Z-COMP      = ' WSS-Z-COMP   .

           MOVE     WSS-Z-COMP        TO  WSS-NUMERO

           DISPLAY ' WSS-NUMERO = ' WSS-NUMERO.
           DISPLAY ' WSS-E-COMP-5    = ' WSS-E-COMP-5 .

           MOVE  WSS-E-COMP-5         TO  WSS-NUMERO

           DISPLAY ' WSS-NUMERO = ' WSS-NUMERO.

           GOBACK.

       BUG-TRAP.
           DISPLAY 'ESTOURO DE VARIAVEL'.
      D    DISPLAY 'WSS-VAR2= ' WSS-VAR2.

           IF DEBUG-YES
             DISPLAY ' LKS-DEBUG-MODO  = ' LKS-DEBUG-MODO
             DISPLAY ' WSS-DIA-SEMANA  = ' WSS-DIA-SEMANA
             DISPLAY ' WSS-MSG         = ' WSS-MSG
           END-IF.

           MOVE 500                   TO RETURN-CODE.

           STOP RUN.

       END PROGRAM COBOL014.
      ********************** FIM DO PROGRAMA **************************
