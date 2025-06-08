      *****************************************************************
      * DATA     :  05/01/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA TEORICO COM DIVERSOS COMANDOS
      *            NAO COMPILAVEL, POIS FALTAM OS COPYBOOKS
      *            E AS BIBLIOTECAS DB2 - APENAS EXEMPLO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      **************************
       PROGRAM-ID. COBOL009.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 24/01/05 @ 21:15:54.
       DATE-COMPILED. 2024-01-05.
      *
      **********************
       ENVIRONMENT DIVISION.
      **********************
      *
       CONFIGURATION SECTION.
      *
       SPECIAL-NAMES.
      *
           DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT SECTION.
      *
      *FILE-CONTROL.
      *  SELECT CATET001        ASSIGN TO CATET001
      *  FILE STATUS FLG-CAT001.
      *
      *  COPY "CATB0001"   FROM 100000 THRU 199000.
      *
      ***************
       DATA DIVISION.
      ***************
      *
       FILE SECTION.
      *
      *     COPY "CATB001" FROM 200000 THRU 299900.
      *
       WORKING-STORAGE SECTION.
      *
      *    EXEC SQL
      *        INCLUDE SQLCA
      *    END-EXEC.
      *
      *    COPY "CATBL01".
      *
       01  SXP-PID                      PIC X(08).
       77  WSS-DATAN8                   PIC X(21).
       77  WSS-HORAS                    PIC 9(08).
       77  WSS-DATAINV8                 PIC 9(04).
       77  WSS-TAMANHO                  PIC 9(04).
       77  WSS-ANOS                     PIC 9(03).
      *    COPY "CATDADOS".
      *
       77  OPEN-CATB001                 PIC X(01) VALUE SPACES.
      *
       LINKAGE SECTION.
      *
       01  LKS-PARAM-IBM.
           05  LKS-PARAM-TAM           PIC S9(4) COMP.
           05  LKS-PARAM-NOME          PIC A(5).
           05  LKS-PARAM-DTNASC        PIC X(10).
           05 FILLER  REDEFINES   LKS-PARAM-DTNASC.
             10 LSK-PARAM-ANO          PIC 9(04).
             10 FILLER                 PIC X(01).
             10 LSK-PARAM-MES          PIC 9(02).
             10 FILLER                 PIC X(01).
             10 LSK-PARAM-DIA          PIC 9(02).
           05  LKS-PARAM-SEXO          PIC X(1).
             88 LKS-MASCULINO       VALUE 'M'.
             88 LKS-FEMININO        VALUE 'F'.

      *****************************************
       PROCEDURE DIVISION USING LKS-PARAM-IBM.
      *****************************************
      *
           MOVE FUNCTION CURRENT-DATE  TO WSS-DATAN8.
           ACCEPT WSS-HORAS     FROM TIME.

      *
           DISPLAY " PROGRAMA  --> COBOL009 <--       ".
      *
       000-VALIDA-PARAMETRO.
      *
           IF LKS-PARAM-TAM  < 16
             MOVE 900    TO RETURN-CODE
             DISPLAY ' PARAMETRO COM TAMANHO INVALIDO'
             DISPLAY ' RETURN-CODE : ' RETURN-CODE
             PERFORM ROT-ABEND
                THRU ROT-ABEND-EXIT
           END-IF.

           IF LSK-PARAM-ANO  NOT NUMERIC
             DISPLAY ' ANO INVALIDO:' LSK-PARAM-ANO
             MOVE 945    TO RETURN-CODE
             DISPLAY ' RETURN-CODE : ' RETURN-CODE
             PERFORM ROT-ABEND
                THRU ROT-ABEND-EXIT
           END-IF.

           IF LSK-PARAM-MES  NOT NUMERIC
             DISPLAY ' MES INVALIDO:' LSK-PARAM-MES
             MOVE 946    TO RETURN-CODE
             DISPLAY ' RETURN-CODE : ' RETURN-CODE
             PERFORM ROT-ABEND
                THRU ROT-ABEND-EXIT
           END-IF.

           IF LSK-PARAM-DIA  NOT NUMERIC
             DISPLAY ' DIA INVALIDO:' LSK-PARAM-DIA
             MOVE 947    TO RETURN-CODE
             DISPLAY ' RETURN-CODE : ' RETURN-CODE
             PERFORM ROT-ABEND
                THRU ROT-ABEND-EXIT
           END-IF.

       001-PROCESSA-CLIENTE.
      *

           MOVE   LKS-PARAM-TAM      TO WSS-TAMANHO.
           MOVE WSS-DATAN8(1:4)  TO WSS-DATAINV8.

           COMPUTE WSS-ANOS = WSS-DATAINV8 - LSK-PARAM-ANO.

           DISPLAY ' WSS-TAMANHO      : ' WSS-TAMANHO.
           DISPLAY ' LKS-PARAM-IBM    : ' LKS-PARAM-IBM.
           DISPLAY ' LKS-PARAM-NOME   : ' LKS-PARAM-NOME.
           DISPLAY ' LKS-PARAM-DTNASC : ' LKS-PARAM-DTNASC.
           DISPLAY ' LSK-PARAM-ANO    : ' LSK-PARAM-ANO.
           DISPLAY '  '.
           DISPLAY ' WSS-DATAN8       : ' WSS-DATAN8.
           DISPLAY ' WSS-DATAINV8     : ' WSS-DATAINV8.
           DISPLAY ' WSS-HORAS        : ' WSS-HORAS.

           DISPLAY ' '.

       002-EXEMPLO-NIVEL88.

           IF LKS-MASCULINO
             DISPLAY ' MASCULINO'
             SET LKS-FEMININO      TO TRUE
             DISPLAY ' O SENHOR ' LKS-PARAM-NOME ' TEM ' WSS-ANOS

           ELSE
             DISPLAY ' FEMININO '
             SET LKS-MASCULINO     TO TRUE
             DISPLAY ' A SENHORITA ' LKS-PARAM-NOME ' TEM XXX ANOS'
           END-IF.

       003-CALCULO-ANO.

           MOVE 1979                  TO  LSK-PARAM-ANO.

           DISPLAY ' EXEMPLO MOVE FILHO AFETANDO VARIAVEL PAI'.
           DISPLAY ' LKS-PARAM-DTNASC : ' LKS-PARAM-DTNASC.

           ADD 1  TO  LSK-PARAM-ANO.

           DISPLAY ' EXEMPLO DE ADD NO FILHO AFETANDO VARIAVEL PAI'.
           DISPLAY ' LKS-PARAM-DTNASC : ' LKS-PARAM-DTNASC.
           DISPLAY 'LKS-PARAM-SEXO = ' LKS-PARAM-SEXO.

       004-PROCESSA-SECAO.

           PERFORM 003-CALCULO-ANO.

           STOP RUN.
      *
       ROT-ABEND.
           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY ' ABEND PROGRAMADO '.
           DISPLAY ' ERRO ENCONTRADO : '  RETURN-CODE.
           DISPLAY ' FAVOR AVISAR O ANALISTA RESPONSAVEL'.
           DISPLAY '*******************************************'.
           STOP RUN.
       ROT-ABEND-EXIT.
           EXIT.
      *
      *END PROGRAM COBOL009.
      ********************* FIM DO PROGRAMA ****************************

