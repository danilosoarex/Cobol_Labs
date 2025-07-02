      *****************************************************************
      * DATA     : 06/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO ARQUIVO QSAM LOOP
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL026.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 06/06/23 @ 17:05:00.
       DATE-COMPILED. 2023-06-06.
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
       FD OUTPTFL
           LABEL RECORDS ARE STANDARD
           BLOCK CONTAINS 27920 CHARACTERS
           RECORD CONTAINS 80 CHARACTERS
           RECORDING MODE IS F.
      ***  DATA RECORD IS REG-OUTPUT.
      *
       01 REG-OUTPUT           PIC X(80).
      *
      *
       WORKING-STORAGE SECTION.
      *
       01 REG-DADOS.
          05 REG-ORDEM         PIC 999.
          05 FILLER            PIC X VALUE ';'.
          05 REG-NOME.
            10 REG-NOME-CLI      PIC X(18).
            10 REG-NOME-ORD      PIC 99.
          05 FILLER            PIC X VALUE ';'.
          05 REG-DATA-NASC     PIC X(10).
          05 REDEFINES REG-DATA-NASC.
             10  REG-ANO-NASC  PIC 9(04).
             10  FILLER        PIC X(01).
             10  REG-ANO-MES   PIC 9(02).
             10  FILLER        PIC X(01).
             10  REG-ANO-DIA   PIC 9(02).
          05 FILLER            PIC X VALUE ';'.
          05 FILLER            PIC X(46).
      *
       01  WSS-VARIAVEL-AUX.
          05  WSS-EOF            PIC A(01).
          05  FS-STATUS          PIC 99.
      *
       77 WSS-RANDOM-NUMBER1 PIC 999 VALUE ZEROES.
       77 WSS-RANDOM-NUMBER2 PIC 999 VALUE ZEROES.
       77 WSS-REG-GRAVADOS   PIC 999 VALUE ZEROES.
       77 WSS-CICLO          PIC 99  VALUE 15.
       77 WSS-SALTO          PIC 999 VALUE 231.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

       001-INICIALIZAR SECTION.

           DISPLAY 'COBOL026'.
           DISPLAY 'EXEMPLO DE OPEN WRITE CLOSE QSAM FILE'.

           PERFORM ROT-OPEN-FILE
              THRU ROT-OPEN-FILE-EXIT.

       002-WORKFILE    SECTION.

           PERFORM ROT-WRITE-FILE
              THRU ROT-WRITE-FILE-EXIT  WSS-CICLO TIMES.

       003-PROCEDIMENTOS-FINAIS SECTION.

           PERFORM ROT-CLOSE-FILE
              THRU ROT-CLOSE-FILE-EXIT.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA COBOL026                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO OK             *'.
           DISPLAY '*                                         *'.
           DISPLAY '* CONTADOR ALEATORIO : ' WSS-SALTO.
           DISPLAY '* REGISTRO GRAVADOS  : ' WSS-REG-GRAVADOS.
           DISPLAY '*                                         *'.
           DISPLAY '*******************************************'.

           STOP RUN.

       004-PARAGRAFOS SECTION.

       ROT-OPEN-FILE.

           DISPLAY 'ROT-OPEN-FILE'.

           OPEN OUTPUT OUTPTFL.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA ABERTURA DO ARQUIVO OUTPTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-OPEN-FILE-EXIT.
           EXIT.

       ROT-WRITE-FILE.

           DISPLAY 'ROT-WRITE-FILE'.

           ADD  01                 TO   WSS-REG-GRAVADOS
                                        WSS-SALTO.

           MOVE  'WILSON LUPINO'   TO   REG-NOME-CLI.
           MOVE  '2014-05-11'      TO   REG-DATA-NASC.
           MOVE  WSS-REG-GRAVADOS  TO   REG-ORDEM.
           MOVE  WSS-REG-GRAVADOS  TO   REG-NOME-ORD.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           MOVE WSS-RANDOM-NUMBER1 TO   REG-ANO-DIA.
           MOVE WSS-RANDOM-NUMBER2 TO   REG-ANO-MES.

           MOVE  REG-DADOS         TO   REG-OUTPUT.

           DISPLAY ' REG-DADOS : ' REG-DADOS.
           DISPLAY ' REG-NOME-CLI   : ' REG-NOME-CLI.
           DISPLAY ' REG-DATA-NASC  : ' REG-DATA-NASC.

           WRITE REG-OUTPUT
           END-WRITE.

           IF WSS-REG-GRAVADOS = 15
             MOVE LOW-VALUES       TO REG-OUTPUT
             WRITE REG-OUTPUT
             MOVE HIGH-VALUES      TO REG-OUTPUT
             WRITE REG-OUTPUT
             ADD 02    TO   WSS-REG-GRAVADOS
           END-IF.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA GRAVACAO DO ARQUIVO OUTPTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-WRITE-FILE-EXIT.
           EXIT.

       ROT-CLOSE-FILE.

           DISPLAY 'ROT-CLOSE-FILE'.

           CLOSE OUTPTFL.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NO FECHAMENTO DO ARQUIVO OUTPTFL '
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
           STOP RUN.
      **** CALL ABEND.
      *    EXIT PROGRAM.
      *
       ROT-ABEND-EXIT.
           EXIT.

       ROT-ALEATORIA.

           COMPUTE WSS-RANDOM-NUMBER1 = FUNCTION RANDOM * 31.
           COMPUTE WSS-RANDOM-NUMBER2 = FUNCTION RANDOM * 12.
           DISPLAY ' '.
           DISPLAY ' 1 --> ' WSS-RANDOM-NUMBER1
                   ' 2 --> ' WSS-RANDOM-NUMBER2
           DISPLAY ' '.
       ROT-ALEATORIA-EXIT.
           EXIT.

       END PROGRAM COBOL026.
      ********************** FIM PROGRAMA   ****************************
