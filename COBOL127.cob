******* PROGRAMA LE UM ARQUIVO, FAZ DISPLAY, VALIDA O REGISTRO
******* SE OK - GRAVA SAIDA 01, SE ERRO GRAVA SAIDA 02
******* SEÇÕES, ESTATISTICA E USO DO RETURN-CODE PARA OPERACAO
      *
      *AREA AREA
      * A    B
001001*8901*345678901234567890123456789012345678901234567890123456789012
      *-----------------------*
       IDENTIFICATION DIVISION.
      *-----------------------*
      *
       PROGRAM-ID. COBOL127.
      *
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 03/06/25 @ 21:08:54.
       DATE-COMPILED. 2025-06-03.
       INSTALLATION. INEFE.
       SECURITY. COMENTARIOS GERAIS.
      *
      *---------------------*
       ENVIRONMENT DIVISION.
      *---------------------*

      *----------------------*
       CONFIGURATION SECTION.
      *----------------------*
      *
       SOURCE-COMPUTER. IBM-I.
       OBJECT-COMPUTER. IBM-I.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
      *--------------------*
       INPUT-OUTPUT SECTION.
      *--------------------*
      *
      * ARQUIVO QSAM
      *
       FILE-CONTROL.

      * ARQUIVO DE CLIENTES
           SELECT INPUTFL    ASSIGN TO INPUTFL
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE  IS SEQUENTIAL
           FILE STATUS  IS FS-STATUS.
      *
      * ARQUIVO DE CLIENTES OK
           SELECT OUTPUT1    ASSIGN TO OUTPUT1
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE  IS SEQUENTIAL
           FILE STATUS  IS FS-STATUS.
      *
      * ARQUIVO DE CLIENTES COM ERRO
           SELECT OUTPUT2    ASSIGN TO OUTPUT2
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE  IS SEQUENTIAL
           FILE STATUS  IS FS-STATUS.
      *
      *--------------*
       DATA DIVISION.
      *--------------*

      *-------------*
       FILE SECTION.
      *-------------*
      *
       FD INPUTFL
           LABEL RECORDS ARE STANDARD
           RECORD CONTAINS 80 CHARACTERS
           RECORDING MODE IS F.
      *
       01 REG-INPUT.
         05 REG-CLIENTE        PIC X(10).
         05 REG-CLIENTE-COD    PIC 9(05).
         05 REG-PRODUTO-COD    PIC 9(04).
         05 REG-PRODUTO-PRECO  PIC 9(06)V99.
         05 REG-PRODUTO-QTD    PIC 9(03).
         05 REG-FORNEC-COD     PIC 9(03).
         05 REG-VENDEDOR-COD   PIC 9(03).
         05 REG-DATA-VENDA     PIC 9(08).
         05 REG-DATA-ENTREGA   PIC 9(08).
         05 REG-COMENTARIO     PIC X(28).
      *
       FD OUTPUT1
           LABEL RECORDS ARE STANDARD
           RECORD CONTAINS 80 CHARACTERS
           RECORDING MODE IS F.
      *
       01 REG-OUTPUT-OK.
         05 REG-CLIENTE        PIC X(10).
         05 REG-CLIENTE-COD    PIC 9(05).
         05 REG-PRODUTO-COD    PIC 9(04).
         05 REG-PRODUTO-PRECO  PIC 9(06)V99.
         05 REG-PRODUTO-QTD    PIC 9(03).
         05 REG-FORNEC-COD     PIC 9(03).
         05 REG-VENDEDOR-COD   PIC 9(03).
         05 REG-DATA-VENDA     PIC 9(08).
         05 REG-DATA-ENTREGA   PIC 9(08).
         05 REG-COMENTARIO     PIC X(28).
      *
       FD OUTPUT2
           LABEL RECORDS ARE STANDARD
           RECORD CONTAINS 100 CHARACTERS
           RECORDING MODE IS F.
      *
       01 REG-OUTPUT-ERRO.
         05 REG-CLIENTE        PIC X(10).
         05 REG-CLIENTE-COD    PIC 9(05).
         05 REG-PRODUTO-COD    PIC 9(04).
         05 REG-PRODUTO-PRECO  PIC 9(06)V99.
         05 REG-PRODUTO-QTD    PIC 9(03).
         05 REG-FORNEC-COD     PIC 9(03).
         05 REG-VENDEDOR-COD   PIC 9(03).
         05 REG-DATA-VENDA     PIC 9(08).
         05 REG-DATA-ENTREGA   PIC 9(08).
         05 REG-COMENTARIO     PIC X(28).
         05 REG-ERRO-COD       PIC 999.
         05 REG-ERRO-DESCR     PIC X(17).
      *
      *-----------------------*
       WORKING-STORAGE SECTION.
      *-----------------------*

       01 WSS-DATA.
         05 WSS-DATA-ANO   PIC 9(04).
         05 WSS-DATA-MES   PIC 9(02).
         05 WSS-DATA-DIA   PIC 9(02).
      *
       01 WSS-HORA.
         05 WSS-HORA-HH    PIC 9(02).
         05 WSS-HORA-MI    PIC 9(02).
         05 WSS-HORA-SS    PIC 9(02).
         05 WSS-HORA-ML    PIC 9(02).
      *
       01 WSS-DATA-EDIT.
         05 WSS-DATA-DIA   PIC 9(02).
         05 WSS-BARRA1     PIC X(01).
         05 WSS-DATA-MES   PIC 9(02).
         05 WSS-BARRA2     PIC X(01).
         05 WSS-DATA-ANO   PIC 9(04).
      *
       01 WSS-HORA-EDIT.
         05 WSS-HORA-HH    PIC 9(02).
         05 WSS-DOISPT1    PIC X(01).
         05 WSS-HORA-MI    PIC 9(02).
         05 WSS-DOISPT2    PIC X(01).
         05 WSS-HORA-SS    PIC 9(02).
      *
       77 WSS-REG-LIDOS    PIC 9(05).
       77 WSS-REG-GRAVOK   PIC 9(05).
       77 WSS-REG-GRAVERR  PIC 9(05).
      *
       77 WSS-STATUS-ARQ   PIC X(03).
         88 WSS-REG-OK     VALUE 'OK'.
         88 WSS-REG-NOK    VALUE 'NOK'.
      *
       01  WSS-VARIAVEL-AUX.
          05  FLAG-EOF           PIC A(01).
          05  FS-STATUS          PIC 99.
      *
      *
      *------------------*
       PROCEDURE DIVISION.
      *------------------*

       MAIN-SECTION               SECTION.

           PERFORM  ROT-BUSCA-DATA.

           PERFORM  ROT-DISPLAY.

           PERFORM  ROT-OPEN-FILE
              THRU  ROT-OPEN-FILE-EXIT.

           PERFORM  ROT-LER-VENDA
              UNTIL FLAG-EOF = 'S'

           PERFORM  ROT-LIMPA-VAR.

           PERFORM  ROT-ESTATISTICA.

           STOP RUN.

       ARQUIVOS-SECTION           SECTION.

           DISPLAY 'ARQUIVOS-SECTION    '.

       ROT-OPEN-FILE.

           DISPLAY 'ROT-OPEN-FILE'.

       ROT-OPEN-FILE-INP.

      *    ARQUIVO DE VENDAS CLIENTES - ENTRADA
           OPEN INPUT  INPUTFL.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA ABERTURA DO ARQUIVO INPUTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-OPEN-FILE-OUT1.

      *    ARQUIVO DE VENDAS CLIENTES - SAIDA OK
           OPEN OUTPUT OUTPUT1.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA ABERTURA DO ARQUIVO OUTPUT1 '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.

       ROT-OPEN-FILE-OUT2.

      *    ARQUIVO DE VENDAS CLIENTES - SAIDA COM ERRO
           OPEN OUTPUT OUTPUT2.

           IF FS-STATUS > 0
              DISPLAY 'ERRO NA ABERTURA DO ARQUIVO OUTPUT2 '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           END-IF.
      *
       ROT-OPEN-FILE-EXIT.
           EXIT.

       ROT-LER-VENDA.

           READ INPUTFL
                        AT END MOVE 'S' TO FLAG-EOF
           END-READ

           IF FS-STATUS > 0 AND FLAG-EOF NOT = 'S'
              DISPLAY 'ERRO NA LEITURA DO ARQUIVO INPUTFL '
              DISPLAY 'FS-STATUS : ' FS-STATUS
              MOVE FS-STATUS    TO  RETURN-CODE
              PERFORM ROT-ABEND
           ELSE
              IF FLAG-EOF = 'S'
                DISPLAY ' '
                DISPLAY 'ARQUIVO VAZIO'
                DISPLAY 'NENHUM REGISTRO ENCONTRADO NESTE PROCESSAMENTO'
                DISPLAY 'FS-STATUS : ' FS-STATUS
              ELSE
                ADD  01                 TO   WSS-REG-LIDOS
                PERFORM ROT-VALIDA-REG-VENDA
                PERFORM ROT-TRATAR-SAIDA
              END-IF
           END-IF.

       ROT-GRAVA-REG-OK.


           WRITE REG-OUTPUT-OK
           END-WRITE.

           ADD  01          TO WSS-REG-GRAVOK
             ON SIZE ERROR DISPLAY 'ERRO NO CONTADOR GRAVAOK'
                           PERFORM ROT-ABEND
           END-ADD.

       ROT-GRAVA-REG-NOK.

           WRITE REG-OUTPUT-ERRO
           END-WRITE.

           ADD  01          TO WSS-REG-GRAVERR
             ON SIZE ERROR DISPLAY 'ERRO NO CONTADOR GRAVAERR'
                           PERFORM ROT-ABEND
           END-ADD.

       LOGICA-PRINCIPAL           SECTION.

           DISPLAY 'LOGICA-PRINCIPAL    '.

       ROT-VALIDA-REG-VENDA.

           MOVE 'OK'           TO WSS-STATUS-ARQ.

           MOVE CORR REG-INPUT TO REG-OUTPUT-OK.

           MOVE CORR REG-INPUT TO REG-OUTPUT-ERRO.

           IF REG-CLIENTE OF REG-INPUT EQUAL SPACES
             AND WSS-REG-OK
             MOVE 01                        TO REG-ERRO-COD
             MOVE 'NOME CLIENTE EM BRANCO ' TO REG-ERRO-DESCR
             MOVE 'NOK'                     TO WSS-STATUS-ARQ
           END-IF.

           IF REG-CLIENTE-COD OF REG-INPUT EQUAL ZEROES
             AND WSS-REG-OK
             MOVE 02                        TO REG-ERRO-COD
             MOVE 'CODIGO CLIENTE ZERADO  ' TO REG-ERRO-DESCR
             MOVE 'NOK'                     TO WSS-STATUS-ARQ
           END-IF.

           IF NOT REG-CLIENTE-COD OF REG-INPUT IS NUMERIC
             AND WSS-REG-OK
             MOVE 03                        TO REG-ERRO-COD
             MOVE 'CODIGO CLIENTE ERRADO  ' TO REG-ERRO-DESCR
             MOVE 'NOK'                     TO WSS-STATUS-ARQ
           END-IF.

           IF REG-PRODUTO-COD  OF REG-INPUT EQUAL ZEROES
             AND WSS-REG-OK
             MOVE 04                        TO REG-ERRO-COD
             MOVE 'CODIGO PRODUTO ZERADO  ' TO REG-ERRO-DESCR
             MOVE 'NOK'                     TO WSS-STATUS-ARQ
           END-IF.

           IF NOT REG-PRODUTO-COD  OF REG-INPUT IS NUMERIC
             AND WSS-REG-OK
             MOVE 05                        TO REG-ERRO-COD
             MOVE 'CODIGO PRODUTO ERRADO  ' TO REG-ERRO-DESCR
             MOVE 'NOK'                     TO WSS-STATUS-ARQ
           END-IF.

           IF REG-PRODUTO-PRECO OF REG-INPUT EQUAL ZEROES
             AND WSS-REG-OK
             MOVE 06                        TO REG-ERRO-COD
             MOVE 'PRECO ZERADO           ' TO REG-ERRO-DESCR
             MOVE 'NOK'                     TO WSS-STATUS-ARQ
           END-IF.

           IF REG-PRODUTO-QTD OF REG-INPUT EQUAL ZEROES
             AND WSS-REG-OK
             MOVE 07                        TO REG-ERRO-COD
             MOVE 'QUANTIDADE ZERADA      ' TO REG-ERRO-DESCR
             MOVE 'NOK'                     TO WSS-STATUS-ARQ
           END-IF.

           IF REG-FORNEC-COD  OF REG-INPUT EQUAL ZEROES
             AND WSS-REG-OK
             MOVE 08                           TO REG-ERRO-COD
             MOVE 'CODIGO FORNECEDOR INVALIDO' TO REG-ERRO-DESCR
             MOVE 'NOK'                     TO WSS-STATUS-ARQ
           END-IF.

           IF REG-VENDEDOR-COD OF REG-INPUT EQUAL ZEROES
             AND WSS-REG-OK
             MOVE 09                         TO REG-ERRO-COD
             MOVE 'CODIGO VENDEDOR INVALIDO' TO REG-ERRO-DESCR
             MOVE 'NOK'                     TO WSS-STATUS-ARQ
           END-IF.

           IF REG-DATA-VENDA OF REG-INPUT EQUAL ZEROES
             AND WSS-REG-OK
             MOVE 10                         TO REG-ERRO-COD
             MOVE 'DATA DE VENDA   INVALIDA' TO REG-ERRO-DESCR
             MOVE 'NOK'                     TO WSS-STATUS-ARQ
           END-IF.

           IF REG-DATA-ENTREGA  OF REG-INPUT EQUAL ZEROES
             AND WSS-REG-OK
             MOVE 10                         TO REG-ERRO-COD
             MOVE 'DATA DE ENTREGA INVALIDA' TO REG-ERRO-DESCR
             MOVE 'NOK'                      TO WSS-STATUS-ARQ
           END-IF.

       ROT-TRATAR-SAIDA.

           EVALUATE TRUE
             WHEN WSS-REG-OK
                PERFORM ROT-GRAVA-REG-OK
             WHEN WSS-REG-NOK
                PERFORM ROT-GRAVA-REG-NOK
             WHEN OTHER
                 DISPLAY 'TRATAMENTO DE REGISTRO INESPERADO'
                 MOVE 999               TO RETURN-CODE
                 PERFORM ROT-ABEND

           END-EVALUATE.

       ARQUITETURA-SECTION        SECTION.

           DISPLAY 'ARQUITETURA-SECTIOM '.

       ROT-BUSCA-DATA.

           ACCEPT WSS-DATA   FROM DATE YYYYMMDD.
           ACCEPT WSS-HORA   FROM TIME.

           MOVE CORR WSS-DATA TO WSS-DATA-EDIT.
           MOVE CORR WSS-HORA TO WSS-HORA-EDIT.

           MOVE '/'          TO WSS-BARRA1, WSS-BARRA2.
           MOVE ':'          TO WSS-DOISPT1, WSS-DOISPT2.

       ROT-DISPLAY.
           DISPLAY 'COBOL127'.
           DISPLAY 'INICIO DO PROCESSO EM '
                   WSS-DATA-EDIT ' NA HORA ' WSS-HORA-EDIT.

           PERFORM ROT-INITIALIZE.

       ROT-INITIALIZE.

           INITIALIZE WSS-REG-LIDOS
           INITIALIZE WSS-REG-GRAVOK
           INITIALIZE WSS-REG-GRAVERR.

       ROT-ESTATISTICA.

           DISPLAY ' '.
           DISPLAY '******************************************'.
           DISPLAY '*** TERMINO OK DO PROCESSAMENTO        ***'.
           DISPLAY '******************************************'.
           DISPLAY ' LIDOS             = ' WSS-REG-LIDOS
           DISPLAY ' GRAVADOS OK       = ' WSS-REG-GRAVOK
           DISPLAY ' GRAVADOS COM ERRO = ' WSS-REG-GRAVERR
           DISPLAY '******************************************'.

       ROT-ABEND.

           DISPLAY ' '.
           MOVE FS-STATUS          TO RETURN-CODE
           DISPLAY '******************************************'.
           DISPLAY '*** TERMINO COM ERRO DE PROCESSAMENTO  ***'.
           DISPLAY '******************************************'.
           DISPLAY ' CODIGO DE ERRO : ' RETURN-CODE
           DISPLAY '******************************************'.

       ROT-LIMPA-VAR.

           INITIALIZE  REG-OUTPUT-OK.
           INITIALIZE  REG-OUTPUT-ERRO.


      ********************** FIM DO PROGRAMA****************************
