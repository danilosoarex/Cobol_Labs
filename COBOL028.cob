      *****************************************************************
      * DATA     : 15/01/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO READ ARQUIVO SEQUENCIAL
      *            COM MULTIPLOS REGISTROS (LOOP)
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL028.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 15/01/24 @ 20:25:00.
       DATE-COMPILED. 2024-01-15.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.
      **********************

      **********************
       ENVIRONMENT DIVISION.
      **********************
      *
       CONFIGURATION SECTION.
      *
       SOURCE-COMPUTER. IBM-I.
       OBJECT-COMPUTER. IBM-I.
       SPECIAL-NAMES.
      *
      *    CLASS CLS-ANO-VALID IS "1900" THRU "2099"
      *    CLASS CLS-MES-VALID IS "01" THRU "12".
      *
       INPUT-OUTPUT SECTION.
      *
       FILE-CONTROL.
           SELECT INPUTFL    ASSIGN TO INPUTFL
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FS-STATUS.
      *
      ***************
       DATA DIVISION.
      ***************
      *
       FILE SECTION.
      *
       FD INPUTFL
           LABEL RECORDS ARE STANDARD
           BLOCK CONTAINS 27920 CHARACTERS
           RECORD CONTAINS 80 CHARACTERS
           RECORDING MODE IS F.
      ***  DATA RECORD IS REG-INPUT.
      *
       01 REG-INPUT            PIC X(80).
      *
      *
       WORKING-STORAGE SECTION.
      *
       01 REG-DADOS.
          05 REG-NOME-CLI      PIC X(20).
          05 REG-DATA-NASC     PIC X(10) VALUE 'YYYY/MM/DD'.
          05 REDEFINES REG-DATA-NASC.
             10  REG-ANO-NASC  PIC 9(04).
             10  FILLER        PIC X(01).
             10 WSS-MES-DIA.
               15  REG-ANO-MES   PIC 9(02).
               15  FILLER        PIC X(01).
               15  REG-ANO-DIA   PIC 9(02).
          05 FILLER            PIC X(50).
      *
      * EXEMPLO RENAMES
      *
       66 WSS-MES-DIA  RENAMES REG-ANO-MES THROUGH  REG-ANO-DIA.
      *

       01  WSS-VARIAVEL-AUX.
          05  WSS-EOF            PIC A(01).
          05  FS-STATUS          PIC 99.
      *
       77 WSS-RANDOM-NUMBER1 PIC 999 VALUE ZEROES.
       77 WSS-RANDOM-NUMBER2 PIC 999 VALUE ZEROES.
       77 WSS-REG-LIDOS      PIC 999 VALUE ZEROES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL028'.
           DISPLAY 'EXEMPLO DE OPEN READ CLOSE QSAM FILE'.
           DISPLAY '        MULTIPLOS REGISTROS (LOOP)  '.

           PERFORM ROT-OPEN-FILE
              THRU ROT-OPEN-FILE-EXIT.

           PERFORM ROT-READ-FILE
               UNTIL WSS-EOF = 'Y'.

           PERFORM ROT-CLOSE-FILE
              THRU ROT-CLOSE-FILE-EXIT.

           PERFORM ROT-ESTATISTICA
              THRU ROT-ESTATISTICA-EXIT.

           STOP RUN.

      ***************************************************************
      * PROCEDIMENTOS
      ***************************************************************
       ROT-OPEN-FILE.

           DISPLAY 'ROT-OPEN-FILE'.

           OPEN INPUT INPUTFL.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA ABERTURA DO ARQUIVO INPUTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-OPEN-FILE-EXIT.
           EXIT.

       ROT-READ-FILE.

           DISPLAY 'ROT-READ-FILE'.

           READ INPUTFL INTO REG-DADOS
               AT END MOVE 'Y' TO WSS-EOF
           END-READ

           IF FS-STATUS > 0 AND WSS-EOF NOT = 'Y'
              DISPLAY 'ERRO NA LEITURA DO ARQUIVO INPUTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           ELSE
              IF WSS-EOF = 'Y'
                DISPLAY ' '
                DISPLAY 'ARQUIVO VAZIO'
                DISPLAY ' '
              ELSE
                MOVE  REG-INPUT         TO   REG-DADOS
                ADD  01                 TO   WSS-REG-LIDOS

                IF REG-ANO-NASC IS NUMERIC
                  IF REG-ANO-NASC < 1900 OR REG-ANO-NASC > 2099
                     DISPLAY ' ANO INVALIDO'
                     DISPLAY ' '
                  END-IF
                ELSE
                  DISPLAY ' ESPACO INVALIDO NO ANO'
                  DISPLAY ' '
                END-IF

                IF REG-ANO-MES  IS NUMERIC
                  IF REG-ANO-MES > 12 OR REG-ANO-MES = 0
                     DISPLAY ' MES INVALIDO'
                     DISPLAY ' '
                  END-IF
                ELSE
                  DISPLAY ' ESPACO INVALIDO MES'
                  DISPLAY ' '
                END-IF

                IF REG-ANO-DIA  IS NUMERIC
                  IF REG-ANO-DIA > 31
                     DISPLAY ' DIA INVALIDO'
                     DISPLAY ' '
                  ELSE
                     IF WSS-MES-DIA = '02-30' OR
                        WSS-MES-DIA = '02-31' OR
                        WSS-MES-DIA = '02/30' OR
                        WSS-MES-DIA = '02/31'
                       DISPLAY ' DIA INVALIDO'
                       DISPLAY ' '
                     END-IF
                  END-IF
                ELSE
                  DISPLAY ' ESPACO INVALIDO DIA'
                  DISPLAY ' '
                END-IF


                DISPLAY ' REG-DADOS : ' REG-DADOS
                DISPLAY ' REG-NOME-CLI   : ' REG-NOME-CLI
                DISPLAY ' REG-DATA-NASC  : ' REG-DATA-NASC
                DISPLAY ' ANO NASC.      : '
                                             REG-ANO-NASC
                DISPLAY ' MES NASC.      : '
                                             REG-ANO-MES
                DISPLAY ' DIA NASC.      : '
                                             REG-ANO-DIA

              END-IF
           END-IF.
       ROT-READ-FILE-EXIT.
           EXIT.

       ROT-CLOSE-FILE.

           DISPLAY 'ROT-CLOSE-FILE'.

           CLOSE INPUTFL.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NO FECHAMENTO DO ARQUIVO INPUTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.
       ROT-CLOSE-FILE-EXIT.
           EXIT.

       ROT-ABEND.
           DISPLAY '*******************************************'.
           DISPLAY ' ABEND PROGRAMADO '.
           DISPLAY ' ERRO ENCONTRADO : '  RETURN-CODE.
           DISPLAY ' FAVOR AVISAR O ANALISTA RESPONSAVEL'.
           DISPLAY '*******************************************'.
      **** CALL ABEND.
      ***  EXIT PROGRAM.
           STOP RUN.
       ROT-ABEND-EXIT.
           EXIT.

       ROT-ESTATISTICA.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA COBOL028                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO OK             *'.
           DISPLAY '* REGISTRO LIDOS : ' WSS-REG-LIDOS.
           DISPLAY '*******************************************'.

       ROT-ESTATISTICA-EXIT.
           EXIT.

       ROT-ALEATORIA.
           COMPUTE WSS-RANDOM-NUMBER1 = FUNCTION RANDOM * 50.
           COMPUTE WSS-RANDOM-NUMBER2 = FUNCTION RANDOM * 25.
           DISPLAY ' '.
           DISPLAY ' 1 --> ' WSS-RANDOM-NUMBER1
                   ' 2 --> ' WSS-RANDOM-NUMBER2
           DISPLAY ' '.
       ROT-ALEATORIA-EXIT.
           EXIT.

       END PROGRAM COBOL028.
      ********************** FIM PROGRAMA   ****************************
