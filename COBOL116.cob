      *****************************************************************
      * DATA     : 29/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO ARQUIVO SEQUENCIAL N REGISTROS
      *            FORMATO COMPUTACIONAL DE 1 A 5 E
      *            USO DE COPY BOOK
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL116.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 29/08/24 @ 16:35:00.
       DATE-COMPILED. 2024-08-29.
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
           COPY  'COPY0421'.

      ***************
       DATA DIVISION.
      ***************
      *
       FILE SECTION.
      *
           COPY  'COPY116A'.
      *
       WORKING-STORAGE SECTION.
      *
      *    COPY COPY0423.
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

           DISPLAY 'COBOL116'.
           DISPLAY 'EXEMPLO DE OPEN READ CLOSE QSAM FILE'.

           PERFORM ROT-OPEN-FILE
              THRU ROT-OPEN-FILE-EXIT.

           PERFORM ROT-READ-FILE
              THRU ROT-READ-FILE-EXIT
              UNTIL WSS-EOF EQUAL 'Y'.

           PERFORM ROT-CLOSE-FILE
              THRU ROT-CLOSE-FILE-EXIT.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA COBOL116                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO OK             *'.
           DISPLAY '* REGISTRO LIDOS : ' WSS-REG-LIDOS.
           DISPLAY '*******************************************'.

           STOP RUN.

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

       ROT-ABEND.
           DISPLAY '*******************************************'.
           DISPLAY ' ABEND PROGRAMADO '.
           DISPLAY ' ERRO ENCONTRADO : '  RETURN-CODE.
           DISPLAY ' FAVOR AVISAR O ANALISTA RESPONSAVEL'.
           DISPLAY '*******************************************'.
      **** CALL ABEND.
           STOP RUN.
       ROT-ABEND-EXIT.
           EXIT.

           COPY  'COPY0424'.
      *
           COPY  'COPY0426'.

       END PROGRAM COBOL116.
      ********************** FIM PROGRAMA   ****************************
