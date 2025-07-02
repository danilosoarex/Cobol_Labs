      *****************************************************************
      * DATA     :  06/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO ADD SUBTRACT MULTIPLY DIVIDE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL035.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 06/06/23 @ 18:40:00.
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
       77  WSS-LIT-001A              PIC S9(03) VALUE ZEROES.
       77  WSS-DISPLAY               PIC -ZZ9.
       77  WSS-DISPLAYA              PIC ZZ9.
       77  WSS-LIT-002               PIC 9(03) VALUE ZEROES.
       77  WSS-LIT-003               PIC S9(03) VALUE ZEROES
                                         SIGN LEADING SEPARATE.
       77  WSS-LIT-004               PIC S9(03) VALUE ZEROES
                                         SIGN LEADING SEPARATE.
       77  WSS-LIT-004A              PIC S9(09) VALUE ZEROES
                                         SIGN LEADING SEPARATE.
       77  WSS-LIT-005               PIC 9(03) VALUE ZEROES.
       77  WSS-LIT-006               PIC 9(03) VALUE ZEROES.
       77  WSS-LIT-007               PIC 9(03)V9(5) VALUE ZEROES.
       77  WSS-LIT-008               PIC 9(03) VALUE 1.
      *
       77 WSS-RANDOM-NUMBER1 PIC 999 VALUE ZEROES.
       77 WSS-RANDOM-NUMBER2 PIC 999 VALUE ZEROES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************


           DISPLAY 'COBOL035'.
           DISPLAY 'OPERANDOS ARITMETICOS            '.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           MOVE WSS-RANDOM-NUMBER1 TO   WSS-LIT-001.
           MOVE WSS-RANDOM-NUMBER2 TO   WSS-LIT-002.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           MOVE WSS-RANDOM-NUMBER1 TO   WSS-LIT-003.
           MOVE WSS-RANDOM-NUMBER2 TO   WSS-LIT-004.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           MOVE WSS-RANDOM-NUMBER1 TO   WSS-LIT-005.
           MOVE WSS-RANDOM-NUMBER2 TO   WSS-LIT-006.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           MOVE WSS-RANDOM-NUMBER1 TO   WSS-LIT-007.
           MOVE WSS-RANDOM-NUMBER2 TO   WSS-LIT-008.

           DISPLAY ' WSS-LIT-001  = ' WSS-LIT-001.
           DISPLAY ' WSS-LIT-002  = ' WSS-LIT-002.
           DISPLAY ' WSS-LIT-003  = ' WSS-LIT-003.
           DISPLAY ' WSS-LIT-004  = ' WSS-LIT-004.
           DISPLAY ' WSS-LIT-005  = ' WSS-LIT-005.
           DISPLAY ' WSS-LIT-006  = ' WSS-LIT-006.
           DISPLAY ' WSS-LIT-007  = ' WSS-LIT-007.
           DISPLAY ' WSS-LIT-008  = ' WSS-LIT-008.

      ************* ADD ************************************************
           DISPLAY ' '.
           DISPLAY ' ADD '


           DISPLAY ' ANTES '
           DISPLAY ' WSS-LIT-001  = ' WSS-LIT-001.
           DISPLAY ' WSS-LIT-002  = ' WSS-LIT-002.
           DISPLAY ' WSS-LIT-008  = ' WSS-LIT-008.

           ADD WSS-LIT-001 WSS-LIT-002
                                   TO WSS-LIT-008
           END-ADD.


           DISPLAY ' A + B + FINAL = ' WSS-LIT-008
           DISPLAY ' '
           DISPLAY ' DEPOIS '
           DISPLAY ' WSS-LIT-001  = ' WSS-LIT-001.
           DISPLAY ' WSS-LIT-002  = ' WSS-LIT-002.
           DISPLAY ' WSS-LIT-008  = ' WSS-LIT-008.


           ADD WSS-LIT-001
                                   TO WSS-LIT-008
           END-ADD.

           DISPLAY ' A + FINAL = ' WSS-LIT-008

           DISPLAY ' ANTES '
           DISPLAY ' WSS-LIT-003  = ' WSS-LIT-003.
           DISPLAY ' WSS-LIT-004  = ' WSS-LIT-004.
           DISPLAY ' WSS-LIT-008  = ' WSS-LIT-008.

           ADD WSS-LIT-003 WSS-LIT-004
                                   GIVING WSS-LIT-008
           END-ADD.

           DISPLAY ' C + D     = ' WSS-LIT-008

           DISPLAY ' '
           DISPLAY ' DEPOIS'
           DISPLAY ' WSS-LIT-003  = ' WSS-LIT-003.
           DISPLAY ' WSS-LIT-004  = ' WSS-LIT-004.
           DISPLAY ' WSS-LIT-008  = ' WSS-LIT-008.


      *
           INITIALIZE WSS-LIT-008.
      *
           DISPLAY ' WSS-LIT-008  = ' WSS-LIT-008.

      ************* SUBTRAC2  ******************************************
           DISPLAY ' '.
           DISPLAY ' SUBTRACT '.

           SUBTRACT WSS-LIT-005   WSS-LIT-006
                              FROM WSS-LIT-001
           END-SUBTRACT.

           SUBTRACT WSS-LIT-005   WSS-LIT-006
                              FROM WSS-LIT-001A
           END-SUBTRACT.

           MOVE  WSS-LIT-001     TO WSS-DISPLAY.
           MOVE  WSS-LIT-001     TO WSS-DISPLAYA.

           DISPLAY ' A - ( E + F )  = ' WSS-LIT-001.
           DISPLAY ' A - ( E + F )  = ' WSS-DISPLAY.
           DISPLAY ' '
           DISPLAY ' WSS-LIT-001    = ' WSS-LIT-001
           DISPLAY ' WSS-LIT-001A   = ' WSS-LIT-001A
           DISPLAY ' WSS-DISPLAY    = ' WSS-DISPLAY
           DISPLAY ' WSS-DISPLAYA   = ' WSS-DISPLAYA
           DISPLAY ' '.

           SUBTRACT WSS-LIT-003   WSS-LIT-004 6
                              FROM WSS-LIT-001
           END-SUBTRACT.

           DISPLAY ' A - ( C + D + 6 )  = ' WSS-LIT-001.
           SUBTRACT  WSS-LIT-003   WSS-LIT-002 6
                              FROM 500
                              GIVING WSS-LIT-001
           END-SUBTRACT.

           DISPLAY ' A = 500 - (C + B + 6) = '  WSS-LIT-001

      *
           INITIALIZE WSS-LIT-008.
      *
      ************* MULTIPLY  ******************************************
           DISPLAY ' '.
           DISPLAY ' MULTIPLY '.
           DISPLAY ' '.

           DISPLAY ' ANTES '
           DISPLAY ' WSS-LIT-003 = ' WSS-LIT-003
           DISPLAY ' WSS-LIT-004 = ' WSS-LIT-004

           MULTIPLY WSS-LIT-003 BY WSS-LIT-004
           END-MULTIPLY.

           DISPLAY ' DEPOIS'
           DISPLAY ' WSS-LIT-003 = ' WSS-LIT-003
           DISPLAY ' WSS-LIT-004 = ' WSS-LIT-004

           DISPLAY ' D =  C * D  = ' WSS-LIT-004.

           DISPLAY ' ANTES '
           DISPLAY ' WSS-LIT-008 = '  WSS-LIT-008

           MULTIPLY WSS-LIT-002 BY 5
                                GIVING WSS-LIT-008
           END-MULTIPLY.

           DISPLAY ' H =  B * 5 = ' WSS-LIT-008.

           MOVE -10 TO WSS-LIT-003
           MOVE -22 TO WSS-LIT-004

           MULTIPLY WSS-LIT-003 BY WSS-LIT-004
           END-MULTIPLY.

           DISPLAY ' D =  C * D  = ' WSS-LIT-004.

           MOVE  11 TO WSS-LIT-003
           MOVE -99 TO WSS-LIT-004 WSS-LIT-004A

           MULTIPLY WSS-LIT-003 BY WSS-LIT-004
             ON SIZE ERROR DISPLAY ' ERRO DE CALCULO '
                           DISPLAY ' VARIAVEL WSS-LIT-004 COM ESTOURO'
     *****                 MOVE 45 TO RETURN-CODE
     *****                 PERFORM ROT-ABEND

           END-MULTIPLY.

           DISPLAY ' D =  C * D  = ' WSS-LIT-004.

           MULTIPLY WSS-LIT-003 BY WSS-LIT-004A
           END-MULTIPLY.

           DISPLAY ' D =  C * D  = ' WSS-LIT-004A.

           INITIALIZE WSS-LIT-008 REPLACING NUMERIC BY 1.

           DISPLAY ' INITIALIZE REPLACING'
           DISPLAY ' WSS-LIT-008 = ' WSS-LIT-008.
      *
      ************* DIVIDE    ******************************************
           DISPLAY ' '.
           DISPLAY ' DIVIDE   '.

           DIVIDE WSS-LIT-003        INTO WSS-LIT-004
           END-DIVIDE.

           DISPLAY ' B =  B / A = ' WSS-LIT-004.


           DISPLAY ' ANTES '
           DISPLAY ' WSS-LIT-005 = '   WSS-LIT-005
           DISPLAY ' WSS-LIT-006 = '   WSS-LIT-006
           DISPLAY ' WSS-LIT-007 = '   WSS-LIT-007
           DISPLAY ' WSS-LIT-008 = '   WSS-LIT-008

           DIVIDE WSS-LIT-005        INTO WSS-LIT-006
                                   GIVING WSS-LIT-007
                               REMAINDER WSS-LIT-008
           END-DIVIDE.

           DISPLAY ' C =  B / A  = ' WSS-LIT-007.

           DISPLAY ' '
           DISPLAY ' DEPOIS'
           DISPLAY ' WSS-LIT-005 = '   WSS-LIT-005
           DISPLAY ' WSS-LIT-006 = '   WSS-LIT-006
           DISPLAY ' WSS-LIT-007 = '   WSS-LIT-007
           DISPLAY ' WSS-LIT-008 = '   WSS-LIT-008

           DIVIDE WSS-LIT-003
                                    BY  WSS-LIT-004
                                   GIVING WSS-LIT-005
                               REMAINDER WSS-LIT-008
           END-DIVIDE.

           DISPLAY ' C =  A / B = '  WSS-LIT-005.

           INITIALIZE WSS-LIT-008.
      *
      ************* COMPUTE   ******************************************
           DISPLAY ' '.
           DISPLAY ' COMPUTE  '.

           COMPUTE WSS-LIT-008 =   WSS-LIT-001 + WSS-LIT-002 /
                     ( ( WSS-LIT-003 - WSS-LIT-004 ) * WSS-LIT-005 ).

           DISPLAY ' H = A + B / ( ( C   D ) * E ) = '
                                     WSS-LIT-008.
           COMPUTE WSS-LIT-008 = (  WSS-LIT-001 + WSS-LIT-002 ) /
                     ( ( WSS-LIT-003 - WSS-LIT-004 ) * WSS-LIT-005 ).

           DISPLAY ' H = (A + B) / ( ( C   D ) * E ) = '
                                     WSS-LIT-008.

           STOP RUN.

       ROT-ALEATORIA.
           COMPUTE WSS-RANDOM-NUMBER1 = FUNCTION RANDOM * 10.
           COMPUTE WSS-RANDOM-NUMBER2 = FUNCTION RANDOM * 10.
           DISPLAY ' '.
           DISPLAY ' 1 --> ' WSS-RANDOM-NUMBER1
                   ' 2 --> ' WSS-RANDOM-NUMBER2
           DISPLAY ' '.
       ROT-ALEA-DISP.
           DISPLAY ' '.
       ROT-ZZZZZZZZZ.
           DISPLAY 'ROT-ZZZZZZZZZ'.
       ROT-ALEATORIA-EXIT.
           EXIT.

       ROT-ABEND.

           DISPLAY ' ABEND PROGRAMADO'
           DISPLAY ' FAVOR AVISAR O ANALISTA RESPONSAVEL'
           DISPLAY ' RETURN-CODE = ' RETURN-CODE
           DISPLAY ' '.

           STOP RUN.

       END PROGRAM COBOL035.
      ********************** FIM PROGRAMA   ****************************
