      *****************************************************************
      * DATA     : 20/05/2025
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO ARQUIVO QSAM LOOP
      *            LER REGISTROS, FAZER FILTRO E GERAR 2 SAIDAS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL126.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 20/05/25 @ 19:28:00.
       DATE-COMPILED. 2025-05-20.
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
           SELECT INPUTFL    ASSIGN TO INPUTFL
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE  IS SEQUENTIAL
           FILE STATUS  IS FS-STATUS.
      *
           SELECT OUTPTFL1   ASSIGN TO OUTPTFL1
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE  IS SEQUENTIAL
           FILE STATUS  IS FS-STATUS.
      *
           SELECT OUTPTFL2    ASSIGN TO OUTPTFL2
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE  IS SEQUENTIAL
           FILE STATUS  IS FS-STATUS.
      *
      ***************
       DATA DIVISION.
      ***************
      *
       FILE SECTION.
      *
       FD INPUTFL
           LABEL RECORDS ARE STANDARD
           RECORD CONTAINS 140 CHARACTERS
           RECORDING MODE IS F.
      *
       01 REG-INPUT.
         COPY COPY126.
      *
       FD OUTPTFL1
           LABEL RECORDS ARE STANDARD
           RECORD CONTAINS 140 CHARACTERS
           RECORDING MODE IS F.
      *
       01 REG-OUTPUT1.
         COPY COPY126.
      *
       FD OUTPTFL2
           LABEL RECORDS ARE STANDARD
           RECORD CONTAINS 140 CHARACTERS
           RECORDING MODE IS F.
      *
       01 REG-OUTPUT2.
         COPY COPY126.
      *
       WORKING-STORAGE SECTION.
      *
       01 WSS-VARIAVEL-AUX.
          05 WSS-EOF             PIC A(01).
          05 FS-STATUS           PIC 99.
            88 FLG-EOF           VALUE 10.
      *
       77 WSS-RANDOM-NUMBER1 PIC 999   VALUE ZEROES.
       77 WSS-RANDOM-NUMBER2 PIC 999   VALUE ZEROES.
       77 WSS-REG-LIDOS      PIC 99999 VALUE ZEROES.
       77 WSS-REG-GRAVADOS1  PIC 99999 VALUE ZEROES.
       77 WSS-REG-GRAVADOS2  PIC 99999 VALUE ZEROES.
       77 WSS-CICLO          PIC 99    VALUE 15.
       77 WSS-FLUXO          PIC X(01).
        88 FLG-FLUXO         VALUE '1'.
        88 FLG-FLUXO-OFF     VALUE '2'.
        88 FLG-FLUXO-TRACE   VALUE '3'.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

      *********************************+*******
       001-MAIN-SECTION                SECTION.
      *********************************+*******

           PERFORM 002-PROCEDIMENTOS-INICIAIS.

           PERFORM ROT-OPEN-FILE
              THRU ROT-OPEN-FILE-EXIT.

           PERFORM ROT-READ-FILE
              THRU ROT-READ-FILE-EXIT  UNTIL FLG-EOF.

           PERFORM ROT-CLOSE-FILE
              THRU ROT-CLOSE-FILE-EXIT.

           PERFORM ROT-ESTATISTICA
              THRU ROT-ESTATISTICA-EXIT.

           STOP RUN.

      *********************************+*******
       002-PROCEDIMENTOS-INICIAIS      SECTION.
      *********************************+*******

       ROT-DISPLAY.

           DISPLAY 'COBOL126'.
           DISPLAY 'EXEMPLO DE LEITURA DE ARQUIVO E GRAVACAO '
           DISPLAY '           EM DOIS ARQUIVOS DE SAIDA'.

           DISPLAY 'TAMANHO DO ARQUIVO INPUT   ' LENGTH OF REG-INPUT.
           DISPLAY 'TAMANHO DO ARQUIVO OUTPUT1 ' LENGTH OF REG-OUTPUT1.
           DISPLAY 'TAMANHO DO ARQUIVO OUTPUT2 ' LENGTH OF REG-OUTPUT2.

       ROT-PULA-LINHA.

           DISPLAY ' ROT-PULA-LINHA'.
           DISPLAY ' '.
           DISPLAY ' '.

      *********************************+*******
       004-TRATA-ARQUIVOS              SECTION.
      *********************************+*******

       ROT-OPEN-FILE.

           DISPLAY 'ROT-OPEN-FILE'.

      *    ABRIR ARQUIVO INPUT
           OPEN INPUT  INPUTFL.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA ABERTURA DO ARQUIVO INPUTFL'
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

      *    ABRIR ARQUIVO OUTPUT1
           OPEN OUTPUT OUTPTFL1.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA ABERTURA DO ARQUIVO OUTPTFL1'
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

      *    ABRIR ARQUIVO OUTPUT2
           OPEN OUTPUT OUTPTFL2.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA ABERTURA DO ARQUIVO OUTPTFL2'
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-OPEN-FILE-EXIT.
           EXIT.

       ROT-READ-FILE.

           DISPLAY 'ROT-READ-FILE'.

     ****  READ INPUTFL INTO REG-DADOS
           READ INPUTFL
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
                 ADD 01                TO WSS-REG-LIDOS
                 PERFORM ROT-WRITE-FILE
              END-IF
           END-IF.

       ROT-READ-FILE-EXIT.
           EXIT.

       ROT-WRITE-FILE.

           DISPLAY 'ROT-WRITE-FILE'.

           PERFORM ROT-MOVER-VARIAVEIS.

           IF FLG-FLUXO
              PERFORM ROT-GRAVAR1
           ELSE
              PERFORM ROT-GRAVAR2
           END-IF.

           IF WSS-REG-GRAVADOS1 = 1 OR
              WSS-REG-GRAVADOS1 = 5000
             MOVE LOW-VALUES       TO REG-INPUT
             PERFORM ROT-GRAVAR1
             MOVE HIGH-VALUES      TO REG-INPUT
             PERFORM ROT-GRAVAR1
           END-IF.

           IF WSS-REG-GRAVADOS2 = 100 OR
              WSS-REG-GRAVADOS2 = 4000
             MOVE LOW-VALUES       TO REG-INPUT
             PERFORM ROT-GRAVAR2
             MOVE HIGH-VALUES      TO REG-INPUT
             PERFORM ROT-GRAVAR2
           END-IF.

       ROT-WRITE-FILE-EXIT.
           EXIT.

       ROT-GRAVAR1.

           MOVE REG-INPUT     TO REG-OUTPUT1.

           SET FLG-FLUXO-OFF  TO TRUE.

           WRITE REG-OUTPUT1
           END-WRITE.

           IF FS-STATUS = 00
              ADD     01              TO   WSS-REG-GRAVADOS1
                ON SIZE ERROR PERFORM ROT-ABEND
              END-ADD
           END-IF.

       ROT-GRAVAR2.

           MOVE REG-INPUT     TO REG-OUTPUT2.

           SET FLG-FLUXO      TO TRUE

           WRITE REG-OUTPUT2
           END-WRITE

           IF FS-STATUS = 00
              ADD     01              TO   WSS-REG-GRAVADOS2
                ON SIZE ERROR PERFORM  ROT-ABEND
              END-ADD
           ELSE
              DISPLAY 'ERRO NA GRAVACAO DO ARQUIVO OUTPTFL2'
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

      *********************************+*********
       500-LOGICA-AUXILIAR             SECTION.
      *********************************+*********

        ROT-LIMPA-OUTPUT.

           INITIALIZE REG-OUTPUT1
              REPLACING ALPHANUMERIC BY   SPACES
                        NUMERIC      BY   ZEROES.

           INITIALIZE REG-OUTPUT2
              REPLACING ALPHANUMERIC BY   SPACES
                        NUMERIC      BY   ZEROES.

        ROT-MOVER-VARIAVEIS.

           PERFORM ROT-LIMPA-OUTPUT.

           PERFORM ROT-ALEATORIA
              THRU ROT-ALEATORIA-EXIT.

           MOVE WSS-RANDOM-NUMBER1 TO   REG-ANO-DIA OF REG-INPUT.
           MOVE WSS-RANDOM-NUMBER2 TO   REG-ANO-MES OF REG-INPUT.

           DISPLAY ' REG-DADOS      : ' REG-INPUT.
           DISPLAY ' REG-NOME       : ' REG-NOME OF REG-INPUT.
           DISPLAY ' REG-DATA-NASC  : ' REG-DATA-NASC OF REG-INPUT.

           MOVE  'WILSON LUPINO'   TO   REG-NOME OF REG-INPUT.
           MOVE  '2014-05-11'      TO   REG-DATA-NASC OF REG-INPUT.
           MOVE  WSS-REG-GRAVADOS1 TO   REG-ORDEM OF REG-INPUT.
           MOVE  'RUA A NO 15'     TO   REG-ENDERECO OF REG-INPUT.
           MOVE  'TAUBATE'         TO   REG-CIDADE OF REG-INPUT.
           MOVE  'SP'              TO   REG-ESTADO OF REG-INPUT.
           MOVE  '18000-100'       TO   REG-CEP OF REG-INPUT.
           MOVE   123              TO   REG-COMP1-4 OF REG-INPUT.
           MOVE   123456           TO   REG-COMP2-8 OF REG-INPUT.
           MOVE  -123456           TO   REG-COMP3-5 OF REG-INPUT.
           MOVE  -789012           TO   REG-COMP3-6 OF REG-INPUT.
           MOVE  1000              TO   REG-COMP4-2 OF REG-INPUT.
           MOVE  2000000           TO   REG-COMP4-4 OF REG-INPUT.
           MOVE  3000000000        TO   REG-COMP4-8 OF REG-INPUT.
           MOVE  -1000             TO   REG-COMP5-2 OF REG-INPUT.
           MOVE  -2000000          TO   REG-COMP5-4 OF REG-INPUT.
           MOVE  -3000000000       TO   REG-COMP5-8 OF REG-INPUT.

      *********************************+*********
       999-PROCEDIMENTOS-FINAIS        SECTION.
      *********************************+*********

       ROT-CLOSE-FILE.

           DISPLAY 'ROT-CLOSE-FILE'.

      *    FECHAR OUTPUT1
           CLOSE OUTPTFL1.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NO FECHAMENTO DO ARQUIVO OUTPTFL1 '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

      *    FECHAR OUTPUT2
           CLOSE OUTPTFL2.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NO FECHAMENTO DO ARQUIVO OUTPTFL2'
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-CLOSE-FILE-EXIT.
           EXIT.

       ROT-ESTATISTICA.

           DISPLAY ' '.
           DISPLAY '*******************************************'.
           DISPLAY '*** PROGRAMA COBOL126                   ***'.
           DISPLAY '*******************************************'.
           DISPLAY '* TERMINO DE PROCESSAMENTO OK             *'.
           DISPLAY '*                                         *'.
           DISPLAY '* REGISTRO LIDOS     : ' WSS-REG-LIDOS.
           DISPLAY '* REGISTRO GRAVADOS 1: ' WSS-REG-GRAVADOS1.
           DISPLAY '* REGISTRO GRAVADOS 2: ' WSS-REG-GRAVADOS2.
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

       END PROGRAM COBOL126.
      ********************** FIM PROGRAMA   ****************************
