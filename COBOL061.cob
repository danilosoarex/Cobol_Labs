      *****************************************************************
      * DATA     : 11/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO ARQUIVO SEQUENCIAL N REGISTROS
      *          : USANDO COPY BOOK E COPY PROCEDURE
      *          : GRAVANDO SAIDA
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL061.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 05/06/23 @ 15:35:00.
       DATE-COMPILED. 2023-06-11.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

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
       FILE-CONTROL.
           COPY  'COPY0421'.
      *
           SELECT OUTPTFL    ASSIGN TO OUTPTFL
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
           COPY  'COPY0422'.
      *
       FD OUTPTFL
           LABEL RECORDS ARE STANDARD
           BLOCK CONTAINS 27920 CHARACTERS
           RECORD CONTAINS 80 CHARACTERS
           RECORDING MODE IS F.
      ***  DATA RECORD IS REG-OUTPUT.
      *
       01 REG-OUTPUT           PIC X(80).
      *
       WORKING-STORAGE SECTION.
      *
           COPY  'COPY0423'.
      *
       01  WSS-VARIAVEL-AUX.
          05  WSS-EOF            PIC A(01).
          05  FS-STATUS          PIC 99.
      *
       77 WSS-REG-LIDOS      PIC 999 VALUE ZEROES.
       77 WSS-REG-GRAVADOS   PIC 999 VALUE ZEROES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL061'.
           DISPLAY 'EXEMPLO DE OPEN READ WRITE CLOSE QSAM FILE'.
           DISPLAY 'USANDO COPY BOOK E COPY PROCEDURE'.

           PERFORM ROT-OPEN-FILE
              THRU ROT-OPEN-FILE-EXIT.

           PERFORM ROT-READ-FILE
              THRU ROT-READ-FILE-EXIT
              UNTIL WSS-EOF EQUAL 'Y'.

           PERFORM ROT-CLOSE-FILE
              THRU ROT-CLOSE-FILE-EXIT.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA COBOL061                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO OK             *'.
           DISPLAY '*                                         *'.
           DISPLAY '* REGISTRO LIDOS      : ' WSS-REG-LIDOS.
           DISPLAY '* REGISTRO GRAVADOS   : ' WSS-REG-GRAVADOS.
           DISPLAY '*******************************************'.

           STOP RUN.
      *****************************************************************
       ROT-OPEN-FILE.

           DISPLAY 'ROT-OPEN-FILE'.

           MOVE 'N'                 TO WSS-EOF.

      * ARQUIVO DE ENTRADA
           OPEN INPUT INPUTFL.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA ABERTURA DO ARQUIVO INPUTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

      * ARQUIVO DE SAIDA.
           OPEN OUTPUT OUTPTFL.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA ABERTURA DO ARQUIVO OUTPTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-OPEN-FILE-EXIT.
           EXIT.

      ***************************************************************
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
                NEXT SENTENCE
              ELSE
                ADD  01                 TO   WSS-REG-LIDOS
                MOVE REG-DADOS          TO   REG-INPUT
                DISPLAY ' REG-INPUT      : ' REG-INPUT
                DISPLAY ' REG-NOME       : ' REG-NOME
                DISPLAY ' REG-DATA-NASC  : ' REG-DATA-NASC
                PERFORM ROT-WRITE-FILE
                   THRU ROT-WRITE-FILE-EXIT
              END-IF
           END-IF.

       ROT-READ-FILE-EXIT.
           EXIT.
      *****************************************************************
       ROT-WRITE-FILE.

           DISPLAY 'ROT-WRITE-FILE'.


           ADD  01                 TO   WSS-REG-GRAVADOS.

           MOVE  'RUA PORTUGAL NUM. 30'  TO  REG-ENDERECO.
           MOVE  'CAMPINAS'              TO  REG-CIDADE.
           MOVE  'SP'                    TO  REG-ESTADO.
           MOVE  '13120-100'             TO  REG-CEP.

           MOVE  REG-DADOS         TO   REG-OUTPUT.

           WRITE REG-OUTPUT
           END-WRITE.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA GRAVACAO DO ARQUIVO OUTPTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-WRITE-FILE-EXIT.
           EXIT.

      *****************************************************************
       ROT-CLOSE-FILE.

           DISPLAY 'ROT-CLOSE-FILE'.
      * FECHA ARQUIVO INPUT
           CLOSE INPUTFL.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NO FECHAMENTO DO ARQUIVO INPUTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

      * FECHA ARQUIVO SAIDA
           CLOSE OUTPTFL.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NO FECHAMENTO DO ARQUIVO OUTPTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-CLOSE-FILE-EXIT.
           EXIT.

      ******************************************************************
       ROT-ABEND.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY ' ABEND PROGRAMADO '.
           DISPLAY ' ERRO ENCONTRADO : '  RETURN-CODE.
           DISPLAY ' FAVOR AVISAR O ANALISTA RESPONSAVEL'.
           DISPLAY '*******************************************'.

      *    CALL 'ABEND-ROT'.

           STOP RUN.
       ROT-ABEND-EXIT.
           EXIT.

           COPY  'COPY0424'.

       END PROGRAM COBOL061.
      ********************** FIM PROGRAMA   ****************************
