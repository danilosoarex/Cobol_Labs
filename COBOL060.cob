      *****************************************************************
      * DATA     : 11/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO ARQUIVO SEQUENCIAL N REGISTROS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL060.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 05/06/23 @ 16:35:00.
       DATE-COMPILED. 2023-06-11.
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
       FILE-CONTROL.
      * DEFINICAO DO ARQUIVO
           COPY  'COPY0421'.

      ***************
       DATA DIVISION.
      ***************
      *
       FILE SECTION.
      *
      * VARIAVEIS E FD DO ARQUIVO
           COPY  'COPY0422'.
      *
       WORKING-STORAGE SECTION.
      *
      * VARIAVEIS AUXILIARES DE USO DO ARQUIVO
           COPY COPY0423.
      *    COPY COPY0423      REPLACING REG BY REG-OUT.
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

       MAIN-SECTION   SECTION.

           PERFORM ROT-INICIAL
              THRU ROT-INICIAL-EXIT.

           PERFORM ROT-OPEN-FILE
              THRU ROT-OPEN-FILE-EXIT.

           PERFORM ROT-READ-FILE
              THRU ROT-READ-FILE-EXIT
              UNTIL WSS-EOF EQUAL 'Y'.

           PERFORM ROT-CLOSE-FILE
              THRU ROT-CLOSE-FILE-EXIT.

           PERFORM ROT-DISPLAY-CASE
              THRU ROT-DISPLAY-CASE-EXIT.

           PERFORM ROT-ESTATISTICA
              THRU ROT-ESTATISTICA-EXIT.

           STOP RUN.

      *****************************************************************
      *** CODIGOS AUXILIARES
      *****************************************************************
       CODE-SECTION   SECTION.

       ROT-INICIAL.

           DISPLAY ' '.
           DISPLAY 'COBOL060'.
           DISPLAY 'EXEMPLO DE OPEN READ CLOSE QSAM FILE'.
           DISPLAY 'EXEMPLO DE SECTION E PARAGRAFOS     '.
           DISPLAY 'USO DE IF ANINHADO SEM IDENTACAO    '.
           DISPLAY ' '.

       ROT-INICIAL-EXIT.
           EXIT.

       ROT-OPEN-FILE.

           DISPLAY 'ROT-OPEN-FILE'.

           MOVE 'N'                 TO WSS-EOF.

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
                NEXT SENTENCE
              ELSE
                ADD  01                 TO   WSS-REG-LIDOS
                MOVE REG-DADOS          TO   REG-INPUT
                DISPLAY ' REG-INPUT : ' REG-INPUT
                DISPLAY ' REG-NOME       : ' REG-NOME
                DISPLAY ' REG-DATA-NASC  : ' REG-DATA-NASC
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

       ROT-DISPLAY-CASE.

           DISPLAY ' ROT-DISPLAY-CASE'.

      * EXEMPLO DE CODIGO COBOL 74
      * NAO REPETIR ISSO NO SERVICO
      * CODIGO FEIO E ULTRAPASSADO
           IF WSS-REG-LIDOS IS NUMERIC
           DISPLAY 'NIVEL 1 DO IF'
           IF WSS-REG-LIDOS IS NUMERIC
           DISPLAY 'NIVEL 2 DO IF'
           IF WSS-REG-LIDOS IS NUMERIC
           DISPLAY 'NIVEL 3 DO IF'
           IF WSS-REG-LIDOS IS NUMERIC
           DISPLAY 'NIVEL 4 DO IF'.

           DISPLAY ' '.
           DISPLAY ' '.
      * EXEMPLO DE CODIGO COBOL 88
      * ESSE EH JOINHA
           IF WSS-REG-LIDOS IS NUMERIC
             DISPLAY 'NIVEL 1 DO IF'
             IF WSS-REG-LIDOS IS NUMERIC
               DISPLAY 'NIVEL 2 DO IF'
               IF WSS-REG-LIDOS IS NUMERIC
                 DISPLAY 'NIVEL 3 DO IF'
                 IF WSS-REG-LIDOS IS NUMERIC
                   DISPLAY 'NIVEL 4 DO IF'
                 END-IF
               END-IF
             END-IF
           END-IF.

       ROT-DISPLAY-CASE-EXIT.
           EXIT.

       ROT-ESTATISTICA.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA COBOL060                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO OK             *'.
           DISPLAY '* REGISTRO LIDOS : ' WSS-REG-LIDOS.
           DISPLAY '*******************************************'.

       ROT-ESTATISTICA-EXIT.
           EXIT.

      * COMANDOS DIVERSOS EXEMPLO DE USO DO COPYBOOK
           COPY  'COPY0424'.
      *
      * ROTINA DE ABEND
           COPY  'COPY0426'.

       END PROGRAM COBOL060.
      ********************** FIM PROGRAMA   ****************************
