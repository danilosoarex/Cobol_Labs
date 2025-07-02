      *****************************************************************
      * DATA     : 05/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO READ ARQUIVO SEQUENCIAL
      *            MULTIPLAS LEITURAS ATE EOF
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL027.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 05/06/23 @ 12:05:00.
       DATE-COMPILED. 2023-06-05.
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
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT SECTION.
      *
      * TRATAMENTO DE ARQUIVO QSAM
      *
       FILE-CONTROL.
           SELECT INPUTFL    ASSIGN TO INPUTFL
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE  IS SEQUENTIAL
           FILE STATUS  IS FS-STATUS.

      ***************
       DATA DIVISION.
      ***************
      *
       FILE SECTION.
      *
       FD INPUTFL
           LABEL RECORDS ARE STANDARD
      *    BLOCK CONTAINS 27920 CHARACTERS
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
          05 REG-DATA-NASC     PIC X(10).
          05 REDEFINES REG-DATA-NASC.
             10  REG-ANO-NASC  PIC 9(04).
             10  FILLER        PIC X(01).
             10  REG-ANO-MES   PIC 9(02).
             10  FILLER        PIC X(01).
             10  REG-ANO-DIA   PIC 9(02).
          05 REG-ENDERECO      PIC X(20).
          05 REG-CEP           PIC X(09).
          05 REG-UF            PIC X(02).
          05 FILLER            PIC X(19).
      *
       01  WSS-VARIAVEL-AUX.
          05  WSS-EOF            PIC A(01).
            88 FLAG-EOF          VALUE 'Y'.
            88 FLAG-NOT          VALUE 'N'.
          05  FS-STATUS          PIC 99.
            88 FS-EOF            VALUE 10.
      *
       77 WSS-RANDOM-NUMBER1 PIC 999 VALUE ZEROES.
       77 WSS-RANDOM-NUMBER2 PIC 999 VALUE ZEROES.
       77 WSS-REG-LIDOS      PIC 999 VALUE ZEROES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

       MAIN-SECTION           SECTION.

           PERFORM PROC-INICIAIS.

           PERFORM ROT-READ-FILE
              THRU ROT-READ-FILE-EXIT
              UNTIL FLAG-EOF

           PERFORM ROT-CLOSE-FILE
              THRU ROT-CLOSE-FILE-EXIT.

           PERFORM ROT-ESTATISTICA.

           STOP RUN.

      *------------------------------------------------------
       PROC-INICIAIS  SECTION.
      *------------------------------------------------------

           DISPLAY ' PROC-INICIAIS'.

       ROT-DISPLAY.

           DISPLAY 'COBOL027'.
           DISPLAY 'EXEMPLO DE OPEN READ CLOSE QSAM FILE'.
           DISPLAY '           LER APENAS 1 REGISTRO    '.

       ROT-PREPARA-AMBIENTE.

           DISPLAY ' ROT-PREPARA-AMBIENTE'.

           PERFORM ROT-OPEN-FILE.

      *------------------------------------------------------
       ACESSO-ARQUIVO-SECTION SECTION.
      *------------------------------------------------------

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

      *-----------------------------------------------------------------
       PROC-ARQUIVO SECTION.
      *-----------------------------------------------------------------

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
                DISPLAY 'ARQUIVO VAZIO'
                DISPLAY ' FS-STATUS : ' FS-STATUS
              ELSE
                MOVE  REG-INPUT         TO   REG-DADOS
                ADD  01                 TO   WSS-REG-LIDOS
                DISPLAY ' REG-DADOS      : ' REG-DADOS
                DISPLAY ' '
                DISPLAY ' REG-DATA-NASC  : ' REG-DATA-NASC
                DISPLAY ' REG-ENDERECO   : ' REG-ENDERECO
                DISPLAY ' REG-CEP        : ' REG-CEP
                DISPLAY ' REG-UF         : ' REG-UF
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

      **************************************************************
      * SECAO FINAL
      **************************************************************
       ROTINAS-FINAIS  SECTION.

       ROT-ESTATISTICA.
           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA COBOL027                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO OK             *'.
           DISPLAY '*                                         *'.
           DISPLAY '* REGISTRO LIDOS : ' WSS-REG-LIDOS.
           DISPLAY '*                                         *'.
           DISPLAY '*******************************************'.
       ROT-ESTATISTICA-EXIT.
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

       ROT-ALEATORIA.
           COMPUTE WSS-RANDOM-NUMBER1 = FUNCTION RANDOM * 50.
           COMPUTE WSS-RANDOM-NUMBER2 = FUNCTION RANDOM * 25.
           DISPLAY ' '.
           DISPLAY ' 1 --> ' WSS-RANDOM-NUMBER1
                   ' 2 --> ' WSS-RANDOM-NUMBER2
           DISPLAY ' '.
       ROT-ALEATORIA-EXIT.
           EXIT.

       END PROGRAM COBOL027.
      ********************** FIM PROGRAMA   ****************************
