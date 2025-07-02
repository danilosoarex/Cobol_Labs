      *****************************************************************
      * DATA     :  18/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO JUSTIFIED UPPER-CASE LOWER-CASE
      *            STRING MOVE ESPECIAL RIGHT E LEFT
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL077.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 18/06/23 @ 17:05:00.
       DATE-COMPILED. 2023-06-18.
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
       01 WSS-AUXILIARES.
            05 WSS-ENTRADA   PIC X(009) VALUE 'BELLACOSA'.
            05 WSS-RESULTADO PIC X(009) VALUE SPACES.
            05 WSS-VAR1      PIC X(26)
                     VALUE 'ABCDEFGHIJKLMNOPQRSTUVXXYZ'.
            05 WSS-VAR2      PIC X(26).
            05 WSS-LINGUAGEM PIC X(08).
            05 WSS-AA        PIC X(10) VALUE 'ABCDEFGHIJ'.
            05 WSS-BB        PIC X(10).
            05 WSS-ID-1      PIC X(11) VALUE 'O PROFESSOR'.
            05 WSS-ID-2      PIC X(11) VALUE ' BELLACOSA ' .
            05 WSS-ID-3      PIC X(02) VALUE 'EH'.
            05 WSS-ID-4      PIC X(09) VALUE ' UM CARA '.
            05 WSS-ID-5      PIC X(06) VALUE 'BACANA'.
            05 WSS-ID-6      PIC X(10) VALUE ' COBOLEIRO'.
            05 WSS-ID-7      PIC X(60) VALUE ' '.
            05 WSS-ID-8      PIC S9(4) USAGE IS BINARY.
            05 WSS-DATA         PIC X(10) VALUE '14/03/2023'.
            05 WSS-DET-MES-ANO  PIC X(10).
      *
       01   WSS-JUSTIFY.
          05 WSS-ORIGEM      PIC X(10) VALUE 'MAINFRAME'.
          05 WSS-JUST-RIGHT1 PIC X(05) JUSTIFIED RIGHT.
          05 WSS-JUST-RIGHT2 PIC X(12) JUSTIFIED RIGHT.
          05 WSS-JUST-RIGHT3 PIC X(05) JUSTIFIED.
          05 WSS-JUST-RIGHT4 PIC X(12) JUST.
          05 WSS-JUST-LEFT1  PIC X(05).
          05 WSS-JUST-LEFT2  PIC X(12).
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL077'.
           DISPLAY 'EXEMPLO DE FUNCTIONS LOWER-CASE UPPER-CASE'.
           DISPLAY '           JUSTIFIED STRING E MOVE ESPECIAL'.
           DISPLAY ' '.

           DISPLAY ' LOWER-CASE'.

           MOVE FUNCTION LOWER-CASE (WSS-ENTRADA)
                                        TO WSS-RESULTADO

           DISPLAY 'WSS-ENTRADA          - ' WSS-ENTRADA
           DISPLAY 'FUNCTION LOWER-CASE  - ' WSS-RESULTADO.

           MOVE FUNCTION LOWER-CASE('COBOL') TO WSS-LINGUAGEM

           DISPLAY 'WSS-LINGUAGEM = ' WSS-LINGUAGEM

           MOVE FUNCTION LOWER-CASE (WSS-VAR1) TO WSS-VAR2

           DISPLAY 'WSS-VAR1    = ' WSS-VAR1.
           DISPLAY 'WSS-VAR2    =>' WSS-VAR2.

           DISPLAY ' '.
           DISPLAY ' UPPER-CASE'.

           MOVE FUNCTION UPPER-CASE (WSS-RESULTADO)
                                  TO WSS-RESULTADO

           DISPLAY 'FUNCTION UPPER-CASE  = ' WSS-RESULTADO.

           MOVE FUNCTION UPPER-CASE (WSS-VAR2) TO WSS-VAR1

           DISPLAY 'WSS-VAR1    = ' WSS-VAR1.
           DISPLAY 'WSS-VAR2    = ' WSS-VAR2.

      **********************************
           DISPLAY ' '.
           DISPLAY 'EXEMPLO STRING'.

           STRING WSS-ID-1 WSS-ID-2 WSS-ID-3
                  WSS-ID-4 WSS-ID-5 DELIMITED BY SIZE
             INTO WSS-ID-7
      *      INTO WSS-ID-7 WITH POINTER WSS-ID-8
           END-STRING

           DISPLAY ' '.
           DISPLAY ' WSS-ID-3 = ' WSS-ID-3.
           DISPLAY ' WSS-ID-7 = ' WSS-ID-7.
           DISPLAY ' WSS-ID-8 = ' WSS-ID-8.

           STRING WSS-ID-1
                  ';'
                  WSS-ID-2
                  ';'
                  WSS-ID-4
                  ';'
                  WSS-ID-5
                  ';' DELIMITED BY SIZE
             INTO WSS-ID-7
           END-STRING

           DISPLAY ' '.
           DISPLAY ' WSS-ID-7 = ' WSS-ID-7.

           STRING '<TAG = "'
                  WSS-ID-1
                  '" />'
                  '<VALOR>'
                  WSS-ID-2
                  '</VALOR> <W1 ="'
                  WSS-ID-4
                  '" /><X1>'
                  WSS-ID-5
                  '</X1>'
                  '</TAG>'
                        DELIMITED BY SIZE
             INTO WSS-ID-7
             ON OVERFLOW PERFORM OVERFLOW-VARIAVEL
           END-STRING

           DISPLAY ' '.
           DISPLAY ' WSS-ID-7 = ' WSS-ID-7.

      **********************************
           DISPLAY ' '.
           DISPLAY 'EXEMPLO MOVE POSICIONAL'.

           MOVE WSS-DATA(4:7) TO WSS-DET-MES-ANO

           DISPLAY ' '.
           DISPLAY 'WSS-DATA    = ' WSS-DATA.
           DISPLAY 'WSS-DET-MES-ANO = ' WSS-DET-MES-ANO.

           MOVE WSS-AA TO WSS-BB(1:4).

           DISPLAY ' '.
           DISPLAY 'WSS-AA       = ' WSS-AA.
           DISPLAY 'WSS-BB       = ' WSS-BB.

           MOVE WSS-AA(2:3) TO WSS-BB.

           DISPLAY ' '.
           DISPLAY 'WSS-BB       = ' WSS-BB.

      **********************************
           DISPLAY ' '.
           DISPLAY 'EXEMPLO JUSTIFIED '.

           MOVE  WSS-ORIGEM     TO  WSS-JUST-RIGHT1.
           MOVE  WSS-ORIGEM     TO  WSS-JUST-RIGHT2.
           MOVE  WSS-ORIGEM     TO  WSS-JUST-RIGHT3.
           MOVE  WSS-ORIGEM     TO  WSS-JUST-RIGHT4.
           MOVE  WSS-ORIGEM     TO  WSS-JUST-LEFT1.
           MOVE  WSS-ORIGEM     TO  WSS-JUST-LEFT2.

           DISPLAY 'WSS-ORIGEM      = '  WSS-ORIGEM.
           DISPLAY 'WSS-JUST-RIGHT1 = '  WSS-JUST-RIGHT1.
           DISPLAY 'WSS-JUST-RIGHT2 = '  WSS-JUST-RIGHT2.
           DISPLAY 'WSS-JUST-RIGHT3 = '  WSS-JUST-RIGHT3.
           DISPLAY 'WSS-JUST-RIGHT4 = '  WSS-JUST-RIGHT4.
           DISPLAY 'WSS-JUST-LEFT1  = '  WSS-JUST-LEFT1.
           DISPLAY 'WSS-JUST-LEFT2  = '  WSS-JUST-LEFT2.

           STOP RUN.

       OVERFLOW-VARIAVEL.
           DISPLAY ' '.
           DISPLAY 'ESTOROU O TAMANHO DA VARIAVEL'
           DISPLAY 'REVEJA O STRING OU AUMENTE A VARIAVEL'
           DISPLAY ' LENGTH    : ' LENGTH OF WSS-ID-7.
           DISPLAY ' '.

       END PROGRAM COBOL077.
      ********************** FIM PROGRAMA   ****************************
