      *****************************************************************
      * DATA     : 29/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO ARQUIVO QSAM LOOP
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL117.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 29/08/24 @ 21:18:00.
       DATE-COMPILED. 2024-08-29.
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
      ***************
       DATA DIVISION.
      ***************
      *
       FILE SECTION.
      *
       FD OUTPTFL
           LABEL RECORDS ARE STANDARD
           RECORD CONTAINS 135 CHARACTERS
           RECORDING MODE IS F.
      ***  DATA RECORD IS REG-DADOS.
      *
       COPY COPY116A.
      *
      *
       WORKING-STORAGE SECTION.
      *
      *
       01  WSS-VARIAVEL-AUX.
          05  WSS-EOF            PIC A(01).
          05  FS-STATUS          PIC 99.
      *
       77 WSS-RANDOM-NUMBER1 PIC 999 VALUE ZEROES.
       77 WSS-RANDOM-NUMBER2 PIC 999 VALUE ZEROES.
       77 WSS-REG-GRAVADOS   PIC 999 VALUE ZEROES.
       77 WSS-CICLO          PIC 99  VALUE 15.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

       001-INICIALIZAR SECTION.

           DISPLAY 'COBOL117'.
           DISPLAY 'EXEMPLO DE OPEN WRITE CLOSE QSAM FILE'.

           DISPLAY LENGTH OF REG-DADOS.

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
           DISPLAY '*** PROGRAMA COBOL117                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO OK             *'.
           DISPLAY '*                                         *'.
           DISPLAY '* REGISTRO GRAVADOS : ' WSS-REG-GRAVADOS.
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

           ADD  01                 TO   WSS-REG-GRAVADOS.

           INITIALIZE REG-DADOS
              REPLACING ALPHANUMERIC BY   SPACES
                        NUMERIC      BY   ZEROES.

           MOVE  'WILSON LUPINO'   TO   REG-NOME.
           MOVE  '2014-05-11'      TO   REG-DATA-NASC.
           MOVE  WSS-REG-GRAVADOS  TO   REG-ORDEM.
           MOVE  'RUA A NO 15'     TO   REG-ENDERECO
           MOVE  'TAUBATE'         TO   REG-CIDADE
           MOVE  'SP'              TO   REG-ESTADO
           MOVE  '18000-100'       TO   REG-CEP
           MOVE   123              TO   REG-COMP1-4
           MOVE   123456           TO   REG-COMP2-8
           MOVE  -123456           TO   REG-COMP3-5
           MOVE  -789012           TO   REG-COMP3-6
           MOVE  1000              TO   REG-COMP4-2
           MOVE  2000000           TO   REG-COMP4-4
           MOVE  3000000000        TO   REG-COMP4-8
           MOVE  -1000             TO   REG-COMP5-2
           MOVE  -2000000          TO   REG-COMP5-4
           MOVE  -3000000000       TO   REG-COMP5-8

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           MOVE WSS-RANDOM-NUMBER1 TO   REG-ANO-DIA.
           MOVE WSS-RANDOM-NUMBER2 TO   REG-ANO-MES.

           DISPLAY ' REG-DADOS : ' REG-DADOS.
           DISPLAY ' REG-NOME   : ' REG-NOME.
           DISPLAY ' REG-DATA-NASC  : ' REG-DATA-NASC.

           WRITE REG-DADOS
           END-WRITE.

           IF WSS-REG-GRAVADOS = 15
             MOVE LOW-VALUES       TO REG-DADOS
             WRITE REG-DADOS
             MOVE HIGH-VALUES      TO REG-DADOS
             WRITE REG-DADOS
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
      **** CALL ABEND.
           STOP RUN.
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

       END PROGRAM COBOL117.
      ********************** FIM PROGRAMA   ****************************
