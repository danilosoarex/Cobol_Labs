      *****************************************************************
      * DATA     :  10/03/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : BALANCE LINE COM DOIS ARQUIVOS
      *            INTERCALANDO REGISTROS DOS DOIS ARQUIVOS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      **************************
       PROGRAM-ID. COBOL091.                                            00040000
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 10/03/24 @ 22:20:00.
       DATE-COMPILED. 2024-03-10.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      *---------------------                                            00080000
       ENVIRONMENT DIVISION.                                            00090000
      *---------------------                                            00100000
        CONFIGURATION SECTION.                                          00110000
         SPECIAL-NAMES.  DECIMAL-POINT IS COMMA.                        00120000
      *----                                                             00121000
        INPUT-OUTPUT SECTION.                                           00122000
      *
       FILE-CONTROL.                                                    00123000
      *
           SELECT FUNCIN1 ASSIGN TO FUNCIN1                             00124000
                  ORGANIZATION IS SEQUENTIAL                            00125000
                  ACCESS MODE IS SEQUENTIAL                             00126000
                  FILE STATUS IS ST-FUNCIN1.                            00127000
      *
           SELECT FUNCIN2 ASSIGN TO FUNCIN2                             00124000
                  ORGANIZATION IS SEQUENTIAL                            00125000
                  ACCESS MODE IS SEQUENTIAL                             00126000
                  FILE STATUS IS ST-FUNCIN2.                            00127000
      *
           SELECT FUNCOUT ASSIGN TO FUNCOUT                             00128000
                  ORGANIZATION IS SEQUENTIAL                            00125000
                  ACCESS MODE IS SEQUENTIAL                             00126000
                  FILE STATUS IS ST-FUNCOUT.                            00127000
      *
      *--------------                                                   00129000
       DATA DIVISION.                                                   00130000
      *--------------                                                   00140000
       FILE SECTION.                                                    00150000
      *
       FD   FUNCIN1                                                     00151000
            RECORDING MODE IS F                                         00152000
            RECORD CONTAINS 80 CHARACTERS.                              00153000
      *----                                                             00154000
       01   REG-FUNCI1.                                                 00155000
            03 MATRICULA1                  PIC 9(008).                  00156000
            03 FILLER                      PIC X(072).                  00157000
      *----                                                             00159500
       FD   FUNCIN2                                                     00151000
            RECORDING MODE IS F                                         00152000
            RECORD CONTAINS 80 CHARACTERS.                              00153000
      *----                                                             00154000
       01   REG-FUNCI2.                                                 00155000
            03 MATRICULA2                  PIC 9(008).                  00156000
            03 FILLER                      PIC X(072).                  00157000
      *----                                                             00159500
       FD FUNCOUT
           LABEL RECORDS ARE STANDARD
           BLOCK CONTAINS 27920 CHARACTERS
           RECORD CONTAINS 80 CHARACTERS
           RECORDING MODE IS F.
      *     RECORDING MODE IS F                                         00152000
      *     RECORD CONTAINS 80 CHARACTERS.                              00153000
      *----                                                             00159700
         01 REG-FUNCOUT                    PIC X(080).                  00159800
      *----                                                             00159900
      *------------------------                                         00160000
       WORKING-STORAGE SECTION.                                         00170000
      *------------------------                                         00180000
       77  VLR-HORAEXT           PIC 9(004)V99 COMP-3 VALUE 50,00.      00190000
       77  ST-FUNCIN1                      PIC 9(002) VALUE 0.          00190100
       77  ST-FUNCIN2                      PIC 9(002) VALUE 0.          00190100
       77  ST-FUNCOUT                      PIC 9(002) VALUE 0.          00190100
       77  CNT-GRAVADOS                    PIC 9(004) COMP-3 VALUE 0.   00190200
       77  SALARIO-EXT                     PIC 9(005)V99 COMP-3.        00190300
       77  WSS-REG-INC01                   PIC 9999 VALUE ZEROES.       00190300
       77  WSS-REG-INC02                   PIC 9999 VALUE ZEROES.       00190300
       77  WSS-REG-GRAVADOS                PIC 9999 VALUE ZEROES.       00190300
       77  WSS-EOF1                        PIC X VALUE 'N'.             00190300
       77  WSS-EOF2                        PIC X VALUE 'N'.             00190300
       77  MASCARA-SALARIO                 PIC ZZ.ZZ9,99.               00190400
       77  MASCARA-DATA                    PIC 99/99/9999.              00190500
      *----                                                             00190600
       01  DATA-HORA.                                                   00190700
           03 DH-ANO                       PIC X(004).                  00190800
           03 DH-MES                       PIC X(002).                  00190900
           03 DH-DIA                       PIC X(002).                  00191000
           03 DH-HORA                      PIC X(002).                  00192000
           03 DH-MINUTO                    PIC X(002).                  00193000
           03 DH-SEGUNDO                   PIC X(002).                  00194000
           03 DH-MILESIMOS                 PIC X(002).                  00195000
           03 FILLER                       PIC X(005).                  00196000
      *-------------------                                              00293500
       PROCEDURE DIVISION.                                              00293600
      *-------------------                                              00293700

           DISPLAY 'COBOL091'
           DISPLAY ' BALANCE LINE'.

           PERFORM 0000-CARGA-DATAHORA.                                 00293800

           PERFORM 1000-OPEN-FUNCI.                                     00293900

           PERFORM 1001-LER-FUNCIN1.                                    00293900

           PERFORM 1010-LER-FUNCIN2.                                    00293900

           PERFORM 2010-PROCESS-RECDS.

           PERFORM 4002-FECHAR-FUNCI.                                   00293900

           PERFORM ROT-ESTATISTIC.

           STOP RUN.                                                    00294000

      *----                                                             00295000
       0000-CARGA-DATAHORA.                                             00296000

           DISPLAY '0000-CARGA-DATAHORA'.

           MOVE  FUNCTION CURRENT-DATE  TO DATA-HORA.                   00297000
      *    MOVE DH-HORA                 TO CAB-HORA                     00298000
      *    MOVE DH-MINUTO               TO CAB-MINUTO                   00299000
      *    MOVE DH-SEGUNDO              TO CAB-SEGUNDO                  00300000
      *    MOVE DH-DIA                  TO CAB-DIA                      00310000
      *    MOVE DH-MES                  TO CAB-MES                      00320000
      *    MOVE DH-ANO                  TO CAB-ANO.                     00330000

      *----                                                             00351000
       1000-OPEN-FUNCI.                                                 00352000

           DISPLAY '1000-OPEN-FUNCI'.                                   00352000

           OPEN INPUT FUNCIN1.

           IF ST-FUNCIN1 NOT EQUAL 0 THEN                               00354000
              DISPLAY 'COBOL091 - ERRO OPEN FUNCIN1 FS=' ST-FUNCIN1     00356000
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

           OPEN INPUT FUNCIN2.

           IF ST-FUNCIN2 NOT EQUAL 0 THEN                               00354000
              DISPLAY 'COBOL091 - ERRO OPEN FUNCIN2 FS=' ST-FUNCIN2     00356000
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

           OPEN OUTPUT FUNCOUT.

           IF ST-FUNCOUT NOT EQUAL 0 THEN                               00354000
              DISPLAY 'COBOL091 - ERRO OPEN FUNCOUT FS=' ST-FUNCOUT     00356000
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

      *----                                                             00358000
       1001-LER-FUNCIN1.                                                00359000

           DISPLAY '1001-LER-FUNCIN1'.

           READ FUNCIN1
            AT END MOVE 'Y' TO WSS-EOF1
           END-READ.

           IF ST-FUNCIN1 NOT EQUAL 0 AND WSS-EOF1 NOT = 'Y' THEN        00354000
              DISPLAY 'COBOL091 - ERRO READ FUNCI  FS=' ST-FUNCIN1      00356000
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           ELSE
              ADD 001           TO  WSS-REG-INC01
           END-IF.
      *----                                                             00358000
       1010-LER-FUNCIN2.                                                00359000

           DISPLAY '1010-LER-FUNCIN2'.

           READ FUNCIN2
            AT END MOVE 'Y' TO WSS-EOF2
           END-READ.

           IF ST-FUNCIN2 NOT EQUAL 0 AND WSS-EOF2 NOT = 'Y' THEN        00354000
              DISPLAY 'COBOL091 - ERRO READ FUNCI  FS=' ST-FUNCIN2      00356000
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           ELSE
              IF WSS-EOF2 = 'Y'
                MOVE  'Y' TO  WSS-EOF1
              END-IF
              ADD 001           TO  WSS-REG-INC02
           END-IF.

      *---------------------------------------------------------------*
       2000-PROCESS-RECDS SECTION.
      *---------------------------------------------------------------*
      *
       2010-PROCESS-RECDS.

            PERFORM UNTIL WSS-EOF1 = 'Y'
                 EVALUATE TRUE
                     WHEN MATRICULA1 > MATRICULA2
                          MOVE REG-FUNCI2   TO REG-FUNCOUT
                          PERFORM 3000-GRAVA-OUT
                          PERFORM 1010-LER-FUNCIN2
                     WHEN MATRICULA1 < MATRICULA2
                          MOVE REG-FUNCI1   TO REG-FUNCOUT
                          PERFORM 3000-GRAVA-OUT
                          PERFORM 1001-LER-FUNCIN1
                     WHEN MATRICULA1 = MATRICULA2
                          MOVE REG-FUNCI1   TO REG-FUNCOUT
                          PERFORM 3000-GRAVA-OUT
                          PERFORM 1001-LER-FUNCIN1
                          PERFORM 1010-LER-FUNCIN2
                     WHEN OTHER
                          CONTINUE
                END-EVALUATE
            END-PERFORM.
      *
       2099-EXIT.
            EXIT.
      *
       3000-GRAVA-OUT.

            DISPLAY '3000-GRAVA-OUT'.


            WRITE REG-FUNCOUT                                              00470
            END-WRITE

            IF ST-FUNCOUT NOT EQUAL 0 THEN                              00354000
              DISPLAY 'COBOL088 - ERRO WRITE FUNCOUT FS='               00356000
              ST-FUNCOUT
              MOVE ST-FUNCOUT     TO RETURN-CODE
              PERFORM ROT-ABEND
                THRU ROT-ABEND-EXIT
            END-IF.

            ADD    1            TO CNT-GRAVADOS.                           00480

      *----                                                             00510000
       4002-FECHAR-FUNCI.                                               00520000

           DISPLAY '4002-FECHAR-FUNCI'.

           CLOSE FUNCIN1                                                00520100

           IF ST-FUNCIN1 NOT EQUAL 0 THEN
              DISPLAY 'COBOL091 - ERRO CLOSE FUNCI FS=' ST-FUNCIN1
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

           CLOSE FUNCIN2.                                               00520100

           IF ST-FUNCIN2 NOT EQUAL 0 THEN
              DISPLAY 'COBOL091 - ERRO CLOSE FUNCI FS=' ST-FUNCIN2
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

           CLOSE FUNCOUT.                                               00520100

           IF ST-FUNCOUT NOT EQUAL 0 THEN
              DISPLAY 'COBOL091 - ERRO CLOSE RELATFUN FS=' ST-FUNCOUT
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

      ******************************************************************
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
       ROT-ESTATISTIC.

           MOVE  CNT-GRAVADOS   TO WSS-REG-GRAVADOS.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA COBOL091                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO: OK            *'.
           DISPLAY '* REGISTRO LIDOS IN1   : ' WSS-REG-INC01.
           DISPLAY '* REGISTRO LIDOS IN2   : ' WSS-REG-INC02.
           DISPLAY '* REGISTRO GRAVADOS    : ' WSS-REG-GRAVADOS.
           DISPLAY '*******************************************'.

       ROT-ESTATISTIC-EXIT.
           EXIT.
      ********************** FIM DO PROGRAMA ***************************
