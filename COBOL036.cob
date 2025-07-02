      *****************************************************************
      * DATA     :  10/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO OCCURS DINAMICO E FIXO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL036.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 10/06/23 @ 08:30:00.
       DATE-COMPILED. 2023-06-10.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
       FILE SECTION.
      *
       WORKING-STORAGE SECTION.
      *
       77 WSS-ITEM-VAL               PIC 9(05) VALUE 19324.
       77 WSS-SUB                    PIC 9(01) VALUE 01.
       77 WSS-COUNT                  PIC 9(10) VALUE 00.
      *
        01 WSS-VALOR                 PIC 999.
        01 FILLER REDEFINES WSS-VALOR.
           05 WSS-VALOR-CENTENA      PIC 9.
           05 WSS-VALOR-DECIMAL      PIC 9.
           05 WSS-VALOR-UNITARIO     PIC 9.
      *
      * TABELA UNIDIMENSIONAL SIMPLES
        01  WSS-TABELA.
          05  WSS-TAB-CLIENTE PIC A(12) VALUE 'VIP'
                                                OCCURS 5 TIMES.
      *
      * TABELA UNID DINAMICA PODERA CONTER 0 ATE 25 OCORRENCIAS
      * SABEREMOS APENAS EM TEMPO DE EXECUCAO
        01  WSS-EMISS-NOTA-FISCAL.
          05 WSS-NOTA-FISCAL         PIC 99.
          05  WSS-ITENS-LINHA  OCCURS 0 TO 25 TIMES
                               DEPENDING ON WSS-NOTA-FISCAL.
            10  WSS-QTD-PROD         PIC 9999.
            10  WSS-ITEM-DESC        PIC X(30).
            10  WSS-ITEM-PRECO       PIC S9(5)V99
                                  SIGN  LEADING  SEPARATE.
      *
      * TABELA UNIDIMENSIONAL INDEXADA POR INDICE
         01 WSS-STORE.
            05 WSS-PRODUTO     OCCURS 3 TIMES
                                      INDEXED BY IDX.
               10 WSS-ITEM-CODE PIC 9(05).
      *
      *
      * TABELA BIDIMENSIONAL
      *
       01 WSS-TABLE.
          05 WSS-COMPRIMENTO         OCCURS 3 TIMES.
           10 WSS-PARTE1        PIC A(04) VALUE 'BOM'.
           10 WSS-COMPLEMENTO        OCCURS 2 TIMES.
              15 WSS-DIA        PIC X(8) VALUE 'DIA     '.
      *
      *
      * TABELA BIDIMENSIONAL  - DOMINO
      *
       01 WSS-TB-DOMINO.
      * NUMERO PARTE ESQUERDA
          05 WSS-PECA                OCCURS 6 TIMES.
           10 WSS-NUMESQ        PIC 9 VALUE ZERO.
      * NUMERO PARTE DIREITA
           10 WSS-BUCHA              OCCURS 6 TIMES.
              15 WSS-NUMDIR     PIC 9 VALUE ZERO.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL036'.
           DISPLAY 'EXEMPLO DE TABELAS UNIDIMENSIONAIS'.
           DISPLAY ' '.
      *****************************************************************
           DISPLAY ' '.
           DISPLAY 'EXEMPLO 1'.
           DISPLAY 'TABELA SIMPLES COM VALOR FIXO.'.
           DISPLAY 'VEJA QUE DECLARAMOS UMA UNICA VEZ'.
           DISPLAY ' '.

           INITIALIZE  WSS-COUNT.

           DISPLAY ' PERFORM INLINE 5 VEZES '
           DISPLAY ' '.

           INITIALIZE WSS-COUNT.


           PERFORM 6 TIMES

      *      ADD 1                 TO  WSS-COUNT

             IF WSS-COUNT > 0 AND WSS-COUNT < 6
               IF WSS-COUNT = 3
                 MOVE 'MANE'   TO  WSS-TAB-CLIENTE(WSS-COUNT)
               END-IF

               DISPLAY  WSS-COUNT ' - WSS-TAB-CLIENTE '
                                 WSS-TAB-CLIENTE(WSS-COUNT)
             END-IF

             ADD 1                 TO  WSS-COUNT

           END-PERFORM.

      *****************************************************************
           DISPLAY ' '.
           DISPLAY 'EXEMPLO 2'.
           DISPLAY ' '.
           DISPLAY 'MOVIMENTANDO TABELA POR INDICE.'.
           DISPLAY 'PRESTE ATENCAO AO SET IDX      '.
           DISPLAY ' '.

           SET IDX TO 3 .

           MOVE 1 TO WSS-SUB.

           MOVE 0 TO WSS-ITEM-CODE(1)
                     WSS-ITEM-CODE(2)
                     WSS-ITEM-CODE(3).

           PERFORM  PROD-DETALHES  UNTIL WSS-SUB > 3.

      *****************************************************************
           DISPLAY ' '.
           DISPLAY 'EXEMPLO 3'.
           DISPLAY ' '.
           DISPLAY 'TRABALHANDO COM TABELA VARIAVEL.'.
           DISPLAY 'VEJA QUE APENAS AGORA SABEMOS O TAMANHO REAL  '.
           DISPLAY ' '.
           INITIALIZE  WSS-COUNT.

           MOVE   25             TO  WSS-NOTA-FISCAL.

           PERFORM WSS-NOTA-FISCAL TIMES

              IF WSS-NOTA-FISCAL > 0 AND
                 WSS-NOTA-FISCAL <= 25

                ADD 1              TO  WSS-COUNT
                ADD 1 WSS-COUNT    TO  WSS-QTD-PROD(WSS-COUNT)

      *** EXEMPLO INICIAL DE STRING
                STRING  'PRODUTO TIPO '          DELIMITED BY SIZE
                         WSS-QTD-PROD(WSS-COUNT) DELIMITED BY SPACE
                                        INTO WSS-ITEM-DESC(WSS-COUNT)
                END-STRING

                COMPUTE  WSS-ITEM-PRECO(WSS-COUNT) =
                             WSS-QTD-PROD(WSS-COUNT) * (99 / 100) + 4
                     ON SIZE ERROR DISPLAY ' ESTOURO DE CAPACIDADE'
                END-COMPUTE

      *** EXEMPLO FINAL DE STRING
                DISPLAY WSS-NOTA-FISCAL ' WSS-QTD-PROD = '
                                      WSS-QTD-PROD(WSS-COUNT)
                        ' - ' WSS-ITEM-DESC(WSS-COUNT)
                        ' - R$' WSS-ITEM-PRECO(WSS-COUNT)
              END-IF

              DISPLAY ' EXEMPLO STRING = '
                      WSS-ITEM-DESC(WSS-COUNT)

           END-PERFORM.

      *****************************************************************
           DISPLAY ' '.
           DISPLAY ' EXEMPLO 4'.
           DISPLAY ' '.
           DISPLAY 'TABELA BIDIMENSIONAL 3 X 2     '.
           DISPLAY 'PRESTE ATENCAO AO VALUE        '.
           DISPLAY ' '.

           INITIALIZE  WSS-COUNT.

           PERFORM  3              TIMES

              ADD 1                      TO  WSS-COUNT

              DISPLAY ' '
              DISPLAY WSS-COUNT ' - ' WSS-PARTE1(WSS-COUNT) ' '
                      WSS-DIA(WSS-COUNT , 1) ' '
                      WSS-DIA(WSS-COUNT , 2)

              IF WSS-COUNT > 1
                IF WSS-COUNT = 2
                  MOVE 'TARDE '          TO  WSS-DIA(WSS-COUNT, 1)
                  MOVE '       '         TO  WSS-DIA(WSS-COUNT, 2)
                ELSE
                  MOVE 'NOITE '          TO  WSS-DIA(WSS-COUNT, 1)
                  MOVE '       '         TO  WSS-DIA(WSS-COUNT, 2)
                END-IF
              ELSE
                  MOVE '       '         TO  WSS-DIA(WSS-COUNT, 2)
              END-IF

           END-PERFORM

           DISPLAY ' '.
           INITIALIZE  WSS-COUNT.

           PERFORM  3              TIMES

              ADD 1              TO  WSS-COUNT

              DISPLAY WSS-COUNT ' - ' WSS-PARTE1(WSS-COUNT) ' '
                      WSS-DIA(WSS-COUNT, 1)  ' '
                      WSS-DIA(WSS-COUNT, 2)
           END-PERFORM.

      ***  FIM
           STOP RUN.


      * INCREMENTA PRODUTO
       PROD-DETALHES.

           MOVE WSS-ITEM-VAL TO WSS-ITEM-CODE(IDX).

           DISPLAY "TABELA 1 " WSS-ITEM-CODE(1).
           DISPLAY "TABELA 2 " WSS-ITEM-CODE(2).
           DISPLAY "TABELA 3 " WSS-ITEM-CODE(3).
           DISPLAY " ".
           DISPLAY "PRODUTO " WSS-SUB " " WSS-ITEM-CODE(IDX).

           ADD 1 TO WSS-ITEM-VAL.
           ADD 1 TO WSS-SUB.

           SET IDX UP BY 1.

           IF IDX > 3
             DISPLAY ' '
             DISPLAY 'ERROOOOOOOOO'
             PERFORM DISPLAY-ANOMALIA
             SET IDX DOWN BY 1
             DISPLAY ' '
           END-IF.

       PROD-DETALHES-EXIT.
           EXIT.

       DISPLAY-ANOMALIA.
           DISPLAY ' '
           DISPLAY ' ESTOURO DE INDICE'.
           DISPLAY ' NOVA REGRA DE NEGOCIO'.
           DISPLAY ' NAO EH ERRO, APENAS WARNIG'.
           DISPLAY ' '.
       DISPLAY-ANOMALIA-EXIT.
           EXIT.

       END PROGRAM COBOL036.
      ********************** FIM PROGRAMA   ****************************
