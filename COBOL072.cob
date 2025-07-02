      *****************************************************************
      * DATA     : 20/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO LEITURA DE SYSIN E RECEBER VARIAVEIS DO
      *            SISTEMA PARA FINS DIDATICOS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL072  RECURSIVE.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 20/06/23 @ 10:01:00.
       DATE-COMPILED. 2023-06-20.
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
       01 WSS-VARIAVEIS       PIC X(20) VALUE SPACES.
       01 WSS-VARIAVEIL-OLD   PIC X(20) VALUE SPACES.
       01 WSS-COUNT           PIC 9(03) VALUE ZEROES.
       01 WSS-DATA-COMPIL     PIC X(16) VALUE SPACES.
       01 WSS-TAMANHO         PIC 9(04) VALUE ZEROES.
      *
       LINKAGE SECTION.
      *
       01  PARAM-LINK.
         05  LKS-PARAM-TAM           PIC S9(4) COMP.
         05  LKS-PARAM-SYSUID        PIC X(07).
         05  LKS-PARAM-JOBNAME       PIC X(08).
         05  LKS-PARAM-MIN           PIC 9(08).
         05  LKS-PARAM-MON           PIC X(08).
         05  LKS-PARAM-SEC           PIC X(08).
         05  LKS-PARAM-SEQ           PIC X(08).
         05  LKS-PARAM-TIMEE         PIC X(08).
         05  LKS-PARAM-WDAY          PIC X(08).
         05  LKS-PARAM-YR22          PIC X(08).
         05  LKS-PARAM-YR44          PIC X(08).
         05  LKS-PARAM-DATE          PIC X(08).
      *
      *************************************
       PROCEDURE DIVISION USING PARAM-LINK.
      *************************************

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.
           DISPLAY 'COBOL072'.
           DISPLAY 'EXEMPLO DE LEITURA VARIAVEIS VIA SYSIN'.
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

           MOVE LKS-PARAM-TAM        TO WSS-TAMANHO.
      *
           IF LKS-PARAM-TAM   = 0
              DISPLAY ' ERRO NOS PARAMETROS'
              MOVE 100   TO RETURN-CODE

              STOP RUN
           END-IF.
           IF LKS-PARAM-TAM   < 50
              DISPLAY ' PARM INCORRETO '
              DISPLAY ' WSS-TAMANHO      = ' WSS-TAMANHO
              MOVE 200   TO RETURN-CODE

              STOP RUN
           END-IF.

           IF LKS-PARAM-MIN  NOT NUMERIC
              DISPLAY ' PARAM-MIN INCORRETO '
              DISPLAY ' LKS-PARAM-MIN    = ' LKS-PARAM-MIN
              MOVE 205   TO RETURN-CODE

              STOP RUN
           END-IF.
           DISPLAY ' WSS-TAMANHO      = ' WSS-TAMANHO.
           DISPLAY ' LKS-PARAM-SYSUID = ' LKS-PARAM-SYSUID.
           DISPLAY ' LKS-PARAM-JOBNAME  ' LKS-PARAM-JOBNAME.
           DISPLAY ' LKS-PARAM-MIN      ' LKS-PARAM-MIN.
           DISPLAY ' LKS-PARAM-MON      ' LKS-PARAM-MON.
           DISPLAY ' LKS-PARAM-SEC      ' LKS-PARAM-SEC.
           DISPLAY ' LKS-PARAM-SEQ      ' LKS-PARAM-SEQ.
           DISPLAY ' LKS-PARAM-TIMEE    ' LKS-PARAM-TIMEE.
           DISPLAY ' LKS-PARAM-WDAY     ' LKS-PARAM-WDAY.
           DISPLAY ' LKS-PARAM-YR22     ' LKS-PARAM-YR22.
           DISPLAY ' LKS-PARAM-YR44     ' LKS-PARAM-YR44.
           DISPLAY ' LKS-PARAM-DATE     ' LKS-PARAM-DATE.
           PERFORM 30 TIMES

             ADD 1                 TO  WSS-COUNT

             MOVE WSS-VARIAVEIS       TO  WSS-VARIAVEIL-OLD

             ACCEPT WSS-VARIAVEIS

             IF WSS-VARIAVEIS  =  WSS-VARIAVEIL-OLD
               DISPLAY ' PARAMETRO DUPLICADO'
               MOVE 111   TO RETURN-CODE
               STOP RUN
             ELSE

               DISPLAY  WSS-COUNT ' - WSS-VARIAVEIS = '
                                    WSS-VARIAVEIS
             END-IF
           END-PERFORM.

           ACCEPT WSS-VARIAVEIS

           IF WSS-VARIAVEIS  NOT EQUAL WSS-VARIAVEIL-OLD
              DISPLAY ' PARAMETRO SYSIN NAO ESPERADO'
              MOVE 999   TO RETURN-CODE
              DISPLAY ' WSS-VARIAVEIS = '
                                    WSS-VARIAVEIS
           END-IF.

           COPY TESTE001.

           STOP RUN.

       END PROGRAM COBOL072.
      ********************** FIM PROGRAMA   ****************************
