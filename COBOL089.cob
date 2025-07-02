      *****************************************************************
      * DATA     :  10/03/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : LE O ARQUIVO FOLHAFUN, CALCULA SALARIO E IMPRIME
      *            RELATORIO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      **************************
       PROGRAM-ID. COBOL089.                                            00040000
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
                  ACCESS MODE IS SEQUENTIAL                             00126000
                  FILE STATUS IS ST-FUNCI.                              00127000
      *
           SELECT RLATFUN ASSIGN TO RLATFUN                             00128000
                  ORGANIZATION IS SEQUENTIAL                            00125000
                  ACCESS MODE IS SEQUENTIAL                             00126000
                  FILE STATUS IS ST-RLATFUN.                            00127000
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
         FD RLATFUN.                                                    00159600
      *----                                                             00159700
         01 REG-RLATFUN                    PIC X(080).                  00159800
      *----                                                             00159900
      *------------------------                                         00160000
       WORKING-STORAGE SECTION.                                         00170000
      *------------------------                                         00180000
       77  VLR-HORAEXT           PIC 9(004)V99 COMP-3 VALUE 50,00.      00190000
       77  ST-FUNCI                        PIC 9(002) VALUE 0.          00190100
       77  ST-RLATFUN                      PIC 9(002) VALUE 0.          00190100
       77  CNT-LINHAS                      PIC 9(002) COMP-3 VALUE 61.  00190200
       77  CNT-GRAVADOS                    PIC 9(004)
                                                   COMP-3 VALUE 1.
       77  SALARIO-EXT                     PIC 9(005)V99 COMP-3.        00190300
       77  WSS-REG-LIDOS                   PIC 9999 VALUE ZEROES.       00190300
       77  WSS-REG-GRAVADOS                PIC 9999 VALUE ZEROES.       00190300
       77  WSS-NOME-DEPTO                  PIC X(05) VALUE SPACES.
       77  WSS-EOF                         PIC X VALUE 'N'.             00190300
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
      *----                                                             00197000
       01  CAB01.                                                       00198000
           03 FILLER                       PIC X(019) VALUE 'COBOL089'. 00199000
           03 FILLER                       PIC X(051)                   00200000
              VALUE 'SISTEMA DE FOLHA DE PAGAMENTO - SIFOPAG'.          00210000
           03 CAB-DIA                      PIC X(002).                  00220000
           03 FILLER                       PIC X(001)                   00230000
              VALUE '/'.                                                00240000
           03 CAB-MES                      PIC X(002).                  00250000
           03 FILLER                       PIC X(001)                   00260000
              VALUE '/'.                                                00270000
           03 CAB-ANO                      PIC X(004).                  00280000
      *----                                                             00281000
       01  CAB02.                                                       00282000
           03 CAB-HORA                     PIC X(002).                  00283000
           03 FILLER                       PIC X(001) VALUE ':'.        00284000
           03 CAB-MINUTO                   PIC X(002).                  00285000
           03 FILLER                       PIC X(001) VALUE ':'.        00286000
           03 CAB-SEGUNDO                  PIC X(003).                  00287000
           03 FILLER                       PIC X(061) VALUE ALL '='.    00288000
           03 FILLER                       PIC X(006) VALUE ' PAG. '.   00289000
           03 CAB-PAGINA                   PIC 9(004) VALUE 0.          00290000
      *----                                                             00290100
       01  CAB03.                                                       00290200
           03 FILLER                       PIC X(025) VALUE SPACES.     00290300
           03 FILLER                       PIC X(014)
                                               VALUE 'DEPARTAMENTO: '.
           03 CAB-NOME-DEPTO               PIC X(030) VALUE SPACES.     00290500
           03 FILLER                       PIC X(011).                  00290600
      *----                                                             00290100
       01  CAB04.                                                       00290200
           03 FILLER                       PIC X(018) VALUE SPACES.     00290300
           03 FILLER                       PIC X(026) VALUE 'NOME'.     00290400
           03 FILLER                       PIC X(016) VALUE 'DT-ADMISS'.00290500
           03 FILLER                       PIC X(015) VALUE 'SALARIO'.  00290600
           03 FILLER                       PIC X(005) VALUE 'DEPTO'.    00290700
      *----                                                             00290800
       01  CAB05.                                                       00290900
           03 FILLER                       PIC X(040) VALUE ALL '-'.    00291000
           03 FILLER                       PIC X(004) VALUE SPACES.     00292000
           03 FILLER                       PIC X(010) VALUE ALL '-'.    00292100
           03 FILLER                       PIC X(006) VALUE SPACES.     00292200
           03 FILLER                       PIC X(009) VALUE ALL '-'.    00292300
           03 FILLER                       PIC X(006) VALUE SPACES.     00292400
           03 FILLER                       PIC X(005) VALUE ALL '-'.    00292500
      *----                                                             00292600
       01  DET01.                                                       00292700
           03 NOME-DET                     PIC X(040) VALUE SPACES.     00292800
           03 FILLER                       PIC X(004) VALUE SPACES.     00292900
           03 DATA-DET                     PIC X(010) VALUE SPACES.     00293000
           03 FILLER                       PIC X(006) VALUE SPACES.     00293100
           03 SALARIO-DET                  PIC X(009) VALUE SPACES.     00293200
           03 FILLER                       PIC X(006) VALUE SPACES.     00293300
           03 DEPTO-DET                    PIC X(005) VALUE SPACES.     00293400
      *-------------------                                              00293500
       PROCEDURE DIVISION.                                              00293600
      *-------------------                                              00293700

           DISPLAY 'COBOL089'
           DISPLAY ' IMPRIME RELATORIO'.

           PERFORM 0000-CARGA-DATAHORA.                                 00293800

           PERFORM 1000-OPEN-FUNCI.                                     00293900

           PERFORM 1001-LER-FUNCI.                                      00293900

           PERFORM 1002-FECHAR-FUNCI.                                   00293900

           PERFORM ROT-ESTATISTIC.

           STOP RUN.                                                    00294000

      *----                                                             00295000
       0000-CARGA-DATAHORA.                                             00296000

           DISPLAY '0000-CARGA-DATAHORA'.

           MOVE  FUNCTION CURRENT-DATE  TO DATA-HORA                    00297000
           MOVE DH-HORA                 TO CAB-HORA                     00298000
           MOVE DH-MINUTO               TO CAB-MINUTO                   00299000
           MOVE DH-SEGUNDO              TO CAB-SEGUNDO                  00300000
           MOVE DH-DIA                  TO CAB-DIA                      00310000
           MOVE DH-MES                  TO CAB-MES                      00320000
           MOVE DH-ANO                  TO CAB-ANO.                     00330000

      *----                                                             00351000
       1000-OPEN-FUNCI.                                                 00352000

           DISPLAY '1000-OPEN-FUNCI'.                                   00352000

           OPEN INPUT FUNCI.

           IF ST-FUNCI NOT EQUAL 0 THEN                                 00354000
              DISPLAY 'COBOL089 - ERRO OPEN FUNCI FS=' ST-FUNCI         00356000
              MOVE ST-FUNCI                  TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

           OPEN OUTPUT RLATFUN.

           IF ST-RLATFUN NOT EQUAL 0 THEN                               00354000
              DISPLAY 'COBOL089 - ERRO OPEN FOLHAFUN FS=' ST-RLATFUN    00356000
              MOVE ST-RLATFUN                TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

      *----                                                             00358000
       1001-LER-FUNCI.                                                  00359000

           DISPLAY '1001-LER-FUNCI'.

           READ FUNCI
            AT END MOVE 'Y' TO WSS-EOF
           END-READ.

           MOVE  DEPARTAMENTO  TO WSS-NOME-DEPTO.

           IF ST-FUNCI NOT EQUAL 0 AND WSS-EOF NOT = 'Y'  THEN          00354000
              DISPLAY 'COBOL089 - ERRO READ FUNCI  FS=' ST-FUNCI        00356000
              MOVE ST-FUNCI     TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           ELSE
              ADD 001           TO  WSS-REG-LIDOS
           END-IF.

           PERFORM UNTIL WSS-EOF = 'Y'

              PERFORM 2000-CALCULA-SALARIO                                 00380

              MOVE DATA-ADMISSAO   TO MASCARA-DATA                         00390
              MOVE NOME            TO NOME-DET                             00400
              MOVE MASCARA-SALARIO TO SALARIO-DET                          00410
              MOVE MASCARA-DATA    TO DATA-DET                             00420
              MOVE DEPARTAMENTO    TO DEPTO-DET                            00430

              IF   CNT-LINHAS GREATER 60 OR                                00440
                   DEPARTAMENTO  NOT EQUAL WSS-NOME-DEPTO
                   MOVE  DEPARTAMENTO  TO WSS-NOME-DEPTO
                   PERFORM 3000-IMPRIME-CABECALHOS                         00450
              END-IF                                                       00460

              WRITE REG-RLATFUN FROM DET01                                 00470
              END-WRITE

              IF ST-RLATFUN NOT EQUAL 0 THEN                            00354000
                DISPLAY 'COBOL089 - ERRO WRITE FOLHAFUN FS='            00356000
                ST-RLATFUN
                MOVE ST-RLATFUN   TO RETURN-CODE
                PERFORM ROT-ABEND
                  THRU ROT-ABEND-EXIT
              END-IF

              ADD  1            TO CNT-LINHAS                              00480
              ADD  1            TO CNT-GRAVADOS                            00480

              READ FUNCI                                                   00360
                AT END MOVE 'Y' TO WSS-EOF
              END-READ

              ADD 001           TO  WSS-REG-LIDOS

              IF ST-FUNCI NOT EQUAL 0 AND WSS-EOF NOT = 'Y'  THEN
                 DISPLAY 'COBOL089 - ERRO READ FUNCI FS=' ST-FUNCI
                 MOVE ST-FUNCI    TO RETURN-CODE
                 PERFORM ROT-ABEND
                    THRU ROT-ABEND-EXIT
              END-IF
           END-PERFORM.

      *----                                                             00510000
       1002-FECHAR-FUNCI.                                               00520000

           DISPLAY '1002-FECHAR-FUNCI'.

           CLOSE FUNCI.                                                 00520100

           IF ST-FUNCI NOT EQUAL 0 THEN
              DISPLAY 'COBOL089 - ERRO CLOSE FUNCI FS=' ST-FUNCI
              MOVE ST-FUNCI    TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

           CLOSE RLATFUN.                                               00520100

           IF ST-RLATFUN NOT EQUAL 0 THEN
              DISPLAY 'COBOL089 - ERRO CLOSE RELATFUN FS=' ST-RLATFUN
              MOVE ST-RLATFUN  TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.


      *----                                                             00520400
       2000-CALCULA-SALARIO.                                            00520500

           COMPUTE SALARIO-EXT = SALARIO + (HORA-EXTRA * VLR-HORAEXT)   00520600
              ON SIZE ERROR MOVE ZEROES TO SALARIO-EXT
                            DISPLAY ' ERRO NO CALCULO DO SALARIO'
           END-COMPUTE.

           MOVE SALARIO-EXT TO MASCARA-SALARIO.                         00520700

      *----                                                             00521000
       3000-IMPRIME-CABECALHOS.                                         00522000

           DISPLAY '3000-IMPRIME-CABECALHOS'

           EVALUATE WSS-NOME-DEPTO
             WHEN 'FINAN'
               MOVE 'FINANCEIRO '               TO CAB-NOME-DEPTO
             WHEN 'PESSO'
               MOVE 'RECURSOS HUMANOS'          TO CAB-NOME-DEPTO
             WHEN 'PRODU'
               MOVE 'PRODUCAO   '               TO CAB-NOME-DEPTO
             WHEN 'ADMIN'
               MOVE 'ADMINISTRATIVO'            TO CAB-NOME-DEPTO
             WHEN 'LOGIN'
               MOVE 'LOGISTICA  '               TO CAB-NOME-DEPTO
             WHEN 'VENDA'
               MOVE 'MARKETING E VENDAS'        TO CAB-NOME-DEPTO
             WHEN OTHER
               MOVE 'DESCONHECIDO      '        TO CAB-NOME-DEPTO
           END-EVALUATE.

           ADD   1           TO CAB-PAGINA                              00523000

           MOVE  5           TO CNT-LINHAS                              00524000

           WRITE REG-RLATFUN FROM CAB01 AFTER ADVANCING PAGE            00525000
           END-WRITE.

           IF ST-RLATFUN NOT EQUAL 0 THEN                               00354000
              DISPLAY 'COBOL089 - ERRO WRITE FOLHAFUN FS=' ST-RLATFUN   00356000
              MOVE ST-RLATFUN  TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF

           WRITE REG-RLATFUN FROM CAB02 AFTER ADVANCING 1               00526000
           END-WRITE.

           IF ST-RLATFUN NOT EQUAL 0 THEN                               00354000
              DISPLAY 'COBOL089 - ERRO WRITE FOLHAFUN FS=' ST-RLATFUN   00356000
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF

           WRITE REG-RLATFUN FROM CAB03 AFTER ADVANCING 2               00527000
           END-WRITE.

           IF ST-RLATFUN NOT EQUAL 0 THEN                               00354000
              DISPLAY 'COBOL089 - ERRO WRITE FOLHAFUN FS=' ST-RLATFUN   00356000
              MOVE ST-RLATFUN  TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF

           WRITE REG-RLATFUN FROM CAB04 AFTER ADVANCING 1               00528000
           END-WRITE.

           IF ST-RLATFUN NOT EQUAL 0 THEN                               00354000
              DISPLAY 'COBOL089 - ERRO WRITE FOLHAFUN FS=' ST-RLATFUN   00356000
              MOVE ST-RLATFUN  TO RETURN-CODE
              PERFORM ROT-ABEND
                 THRU ROT-ABEND-EXIT
           END-IF.

           WRITE REG-RLATFUN FROM CAB05 AFTER ADVANCING 1               00528000
           END-WRITE.

           IF ST-RLATFUN NOT EQUAL 0 THEN                               00354000
              DISPLAY 'COBOL089 - ERRO WRITE FOLHAFUN FS=' ST-RLATFUN   00356000
              MOVE ST-RLATFUN  TO RETURN-CODE
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
           DISPLAY '*** PROGRAMA COBOL089                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO: OK            *'.
           DISPLAY '* REGISTRO LIDOS       : ' WSS-REG-LIDOS.
           DISPLAY '* REGISTRO GRAVADOS    : ' WSS-REG-GRAVADOS.
           DISPLAY '*******************************************'.

       ROT-ESTATISTIC-EXIT.
           EXIT.

      *END  COBOL089.
      ********************** FIM DO PROGRAMA ***************************
