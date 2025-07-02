      *****************************************************************
      * DATA     :  26/06/2025
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : LE O ARQUIVO FOLHAFUN E GERA ARQUIVO CSV
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      **************************
       PROGRAM-ID. COBOL093.                                            00040000
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
       INPUT-OUTPUT SECTION.                                            00122000
      *
       FILE-CONTROL.                                                    00123000
      *
           SELECT FUNCI ASSIGN TO FUNCI                                 00124000
                  ORGANIZATION IS SEQUENTIAL                            00125000
                  ACCESS MODE  IS SEQUENTIAL                            00126000
                  FILE STATUS  IS ST-FUNCI.                             00127000
      *
           SELECT FOLHACSV ASSIGN TO FOLHACSV                           00128000
                  ORGANIZATION IS SEQUENTIAL                            00125000
                  ACCESS MODE  IS SEQUENTIAL                            00126000
                  FILE STATUS  IS ST-FUNCI.                             00127000
      *
      *--------------                                                   00129000
       DATA DIVISION.                                                   00130000
      *--------------                                                   00140000
      *
       FILE SECTION.                                                    00150000
       FD   FUNCI                                                       00151000
            RECORDING MODE IS F                                         00152000
            RECORD CONTAINS 80 CHARACTERS.                              00153000
      *----                                                             00154000
       01   REG-FUNCI.                                                  00155000
            03 MATRICULA                   PIC 9(008).                  00156000
            03 NOME                        PIC X(040).                  00157000
            03 SEXO                        PIC X(001).                  00158000
            03 SALARIO                     PIC 9(005)V99.               00159000
            03 DATA-ADMISSAO               PIC 9(008).                  00159100
            03 DEPARTAMENTO                PIC X(005).                  00159200
            03 HORA-EXTRA                  PIC 9(002).                  00159300
            03 FILLER                      PIC X(009).                  00159400
      *----                                                             00159500
       FD FOLHACSV                                                      00159600
            RECORDING MODE IS F                                         00152000
            RECORD CONTAINS 80 CHARACTERS.                              00153000
      *----                                                             00159700
       01   REG-CSV.                                                    00155000
            03 MATRICULA                   PIC 9(008).                  00156000
            03 CSV1                        PIC X.
            03 NOME                        PIC X(040).                  00157000
            03 CSV2                        PIC X.
            03 SEXO                        PIC X(001).                  00158000
            03 CSV3                        PIC X.
            03 SALARIO                     PIC 9(005)V99.               00159000
            03 CSV4                        PIC X.
            03 DATA-ADMISSAO               PIC 9(008).                  00159100
            03 CSV5                        PIC X.
            03 DEPARTAMENTO                PIC X(005).                  00159200
            03 CSV6                        PIC X.
            03 HORA-EXTRA                  PIC 9(002).                  00159300
            03 CSV7                        PIC X.
            03 FILLER                      PIC X(02).

      *                                                                 00159900
      *------------------------                                         00160000
       WORKING-STORAGE SECTION.                                         00170000
      *------------------------                                         00180000
       77  VLR-HORAEXT           PIC 9(004)V99 COMP-3 VALUE 50,00.      00190000
       77  ST-FUNCI                        PIC 9(002) VALUE 0.          00190100
       77  ST-FOLHACSV                     PIC 9(002) VALUE 0.          00190100
       77  CNT-LINHAS                      PIC 9(002) COMP-3 VALUE 61.  00190200
       77  SALARIO-EXT                     PIC 9(005)V99 COMP-3.        00190300
       77  WSS-REG-LIDOS                   PIC 9999 VALUE ZEROES.       00190300
       77  WSS-REG-GRAVADOS                PIC 9999 VALUE ZEROES.       00190300
       77  WSS-EOF                         PIC X VALUE 'N'.             00190300
       77  MASCARA-SALARIO                 PIC ZZ.ZZ9,99.               00190400
       77  MASCARA-DATA                    PIC 99/99/9999.              00190500
       77  GERAL-SALARIO                   PIC 9(12)V99 COMP-3.
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
      *----                                                             00197000
      *-------------------                                              00293500
       PROCEDURE DIVISION.                                              00293600
      *-------------------                                              00293700
       MAIN-SECTION                       SECTION.


           PERFORM ROT-INI-PGM.                                         00293800

           PERFORM 0000-CARGA-DATAHORA.                                 00293800

           PERFORM 1000-OPEN-FUNCI.                                     00293900

           PERFORM 1001-LER-FUNCI.                                      00293900

           PERFORM 1002-FECHAR-FUNCI.                                   00293900

           PERFORM ROT-ESTATISTIC.

           STOP RUN.                                                    00294000

      *----                                                             00295000
       RELATORIO-SECTION                 SECTION.

       0000-CARGA-DATAHORA.                                             00296000

           DISPLAY '0000-CARGA-DATAHORA'.

           MOVE  FUNCTION CURRENT-DATE  TO DATA-HORA.                   00297000

       1001-LER-FUNCI.                                                  00359000

           DISPLAY '1001-LER-FUNCI'.

           READ FUNCI
            AT END MOVE 'Y' TO WSS-EOF
           END-READ.

           IF ST-FUNCI NOT EQUAL 0 AND WSS-EOF NOT = 'Y'  THEN          00354000
              DISPLAY 'COBOL093 - ERRO READ FUNCI  FS=' ST-FUNCI        00356000
              MOVE ST-FUNCI     TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           ELSE
              ADD 001           TO  WSS-REG-LIDOS
              MOVE ZEROES       TO  WSS-REG-GRAVADOS
           END-IF.

           PERFORM UNTIL WSS-EOF = 'Y'

              MOVE CORR REG-FUNCI  TO REG-CSV

              MOVE ';'             TO CSV1, CSV2, CSV3, CSV4, CSV5,
                                      CSV6, CSV7

              WRITE REG-CSV                                                00470
              END-WRITE

              IF ST-FOLHACSV NOT EQUAL 0 THEN                           00354000
                DISPLAY 'COBOL093 - ERRO WRITE FOLHACSV FS='            00356000
                ST-FOLHACSV
                MOVE ST-FOLHACSV  TO RETURN-CODE
                PERFORM ROT-ABEND
                  THRU ROT-ABEND-EXIT
              ELSE
                ADD 001           TO  WSS-REG-GRAVADOS
              END-IF

              READ FUNCI
                AT END MOVE 'Y' TO WSS-EOF
              END-READ

              IF ST-FUNCI NOT EQUAL 0 AND WSS-EOF NOT = 'Y'  THEN
                 DISPLAY 'COBOL093 - ERRO READ FUNCI FS=' ST-FUNCI
                 MOVE ST-FUNCI    TO RETURN-CODE
                 PERFORM ROT-ABEND
                    THRU ROT-ABEND-EXIT
              ELSE
                 IF WSS-EOF NOT = 'Y'
                   ADD 001           TO  WSS-REG-LIDOS
                 END-IF
              END-IF

           END-PERFORM.

      *----                                                             00520400

      *----                                                             00351000
       ARQUIVOS-SECTION                  SECTION.

       1000-OPEN-FUNCI.                                                 00352000

           DISPLAY '1000-OPEN-FUNCI'.                                   00352000

           OPEN INPUT FUNCI.

           IF ST-FUNCI NOT EQUAL 0 THEN                                 00354000
              DISPLAY 'COBOL093 - ERRO OPEN FUNCI FS=' ST-FUNCI         00356000
              MOVE ST-FUNCI                  TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

           OPEN OUTPUT FOLHACSV.

           IF ST-FOLHACSV NOT EQUAL 0 THEN                              00354000
              DISPLAY 'COBOL093 - ERRO OPEN FOLHACSV FS=' ST-FOLHACSV   00356000
              MOVE ST-FOLHACSV               TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

      *----                                                             00510000

       1002-FECHAR-FUNCI.                                               00520000

           DISPLAY '1002-FECHAR-FUNCI'.

           CLOSE FUNCI.                                                 00520100

           IF ST-FUNCI NOT EQUAL 0 THEN
              DISPLAY 'COBOL093 - ERRO CLOSE FUNCI FS=' ST-FUNCI
              MOVE ST-FUNCI    TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

           CLOSE FOLHACSV.                                              00520100

           IF ST-FOLHACSV NOT EQUAL 0 THEN
              DISPLAY 'COBOL093 - ERRO CLOSE RELATFUN FS=' ST-FOLHACSV
              MOVE ST-FOLHACSV TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

      ******************************************************************
       ARQUITETURA-SECTION               SECTION.

       ROT-INI-PGM.

           DISPLAY 'COBOL093'
           DISPLAY ' IMPRIME RELATORIO'.


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

      **** MOVE  CNT-LINHAS     TO WSS-REG-GRAVADOS.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA COBOL093                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO: OK            *'.
           DISPLAY '* REGISTRO LIDOS       : ' WSS-REG-LIDOS.
           DISPLAY '* REGISTRO GRAVADOS    : ' WSS-REG-GRAVADOS.
           DISPLAY '*******************************************'.

       ROT-ESTATISTIC-EXIT.
           EXIT.

      *END  COBOL093.
      ********************** FIM DO PROGRAMA ***************************
