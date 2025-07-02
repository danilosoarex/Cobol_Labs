      *****************************************************************
      * DATA     :  10/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO BUSCA DE VALOR EM VARIAVEL
      *            VIA LACO DE REPETICAO E POR SEARCH INDEX/ALL
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL047.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 10/06/23 @ 19:30:00.
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
       01  WSS-DATAN8                 PIC 9(08).
      *
       01  FILLER    REDEFINES  WSS-DATAN8.
         05  WSS-PARAM-ANO            PIC 9(04).
         05  WSS-PARAM-MES            PIC 9(02).
      *
      * TABELA UNIDIMENSIONAL INDEXADA POR INDICE
         01 WSS-NOME-VARIAVEL.
            05  FILLER                PIC A(10) VALUE 'JANEIRO'.
            05  FILLER                PIC A(10) VALUE 'FEVEREIRO'.
            05  FILLER                PIC A(10) VALUE 'MARCO'.
            05  FILLER                PIC A(10) VALUE 'ABRIL'.
            05  FILLER                PIC A(10) VALUE 'MAIO'.
            05  FILLER                PIC A(10) VALUE 'JUNHO'.
            05  FILLER                PIC A(10) VALUE 'JULHO'.
            05  FILLER                PIC A(10) VALUE 'AGOSTO'.
            05  FILLER                PIC A(10) VALUE 'SETEMBRO'.
            05  FILLER                PIC A(10) VALUE 'OUTUBRO'.
            05  FILLER                PIC A(10) VALUE 'NOVEMBRO'.
            05  FILLER                PIC A(10) VALUE 'DEZEMBRO'.
      *
         01 WSS-CALENDARIO REDEFINES WSS-NOME-VARIAVEL.
            05 WSS-MESES       OCCURS 12 TIMES
                               INDEXED BY IDX-A.
               10 WSS-NOME-MES        PIC A(10).
      *
      * ATENCAO : SISTEMA DATA EUROPEU   - INICIO DOMINGO
      * ATENCAO : SISTEMA DATA AMERICANO -  INICIO SEGUNDA
      *
         01 WSS-DIA-SEMANA.
            05  FILLER                PIC X(13) VALUE 'DOMINGO'.
            05  FILLER                PIC X(13) VALUE 'SEGUNDA-FEIRA'.
            05  FILLER                PIC X(13) VALUE 'TERCA-FEIRA'.
            05  FILLER                PIC X(13) VALUE 'QUARTA-FEIRA'.
            05  FILLER                PIC X(13) VALUE 'QUINTA-FEIRA'.
            05  FILLER                PIC X(13) VALUE 'SEXTA-FEIRA'.
            05  FILLER                PIC X(13) VALUE 'SABADO'.
      *
         01 WSS-SEMANA     REDEFINES WSS-DIA-SEMANA.
            05 WSS-WEEK        OCCURS 07 TIMES.
               10 WSS-NOME-DIA        PIC X(13).
      *
         77 WSS-COUNT                 PIC 99   VALUE ZEROES.
         77 WSS-ENCONTREI             PIC A(1) VALUE SPACE.
         77 WSS-DAYWEEK               PIC 9    VALUE ZERO.
         77 WSS-PED-FRUTA             PIC 99   VALUE ZEROES.
      *
       01 WSS-PRECO-FRUTAS.
         05 FILLER               PIC X(14) VALUE '01ABACAXI 0500'.
         05 FILLER               PIC X(14) VALUE '02BANANA  0100'.
         05 FILLER               PIC X(14) VALUE '03LARANJA 0200'.
         05 FILLER               PIC X(14) VALUE '04MACA    0350'.
         05 FILLER               PIC X(14) VALUE '05MORANGO 0199'.
         05 FILLER               PIC X(14) VALUE '06ABACATE 0235'.
         05 FILLER               PIC X(14) VALUE '07CAQUI   0099'.
         05 FILLER               PIC X(14) VALUE '08KIWI    0148'.
         05 FILLER               PIC X(14) VALUE '09MAMAO   0241'.
         05 FILLER               PIC X(14) VALUE '10PESSEGO 0435'.
         05 FILLER               PIC X(14) VALUE '11AMEIXA  0335'.
         05 FILLER               PIC X(14) VALUE '12MELAO   0335'.
         05 FILLER               PIC X(14) VALUE '13UVA     0060'.
         05 FILLER               PIC X(14) VALUE '77777777777777'.
         05 FILLER               PIC X(14) VALUE '99999999999999'.
      *
       01 FILLER                 REDEFINES  WSS-PRECO-FRUTAS.
         05 TABELA-PRECOS           OCCURS 15 TIMES
                                    ASCENDING KEY IS TAB-COD-FRUTA
                                    INDEXED BY IDX-B.
           10 TAB-COD-FRUTA      PIC 99.
           10 TAB-NOM-FRUTA      PIC X(08).
           10 TAB-PRE-FRUTA      PIC 99V99.
      *
       77 IDX-C               USAGE IS INDEX.

      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL047'.
           DISPLAY 'EXEMPLO DE BUSCA EM TABELA UNIDIMENSIONAL'.
           DISPLAY ' '.

      *****************************************************************
           DISPLAY ' '.
           DISPLAY 'TABELA SIMPLES COM VALOR FIXO.'.
           DISPLAY 'BUSCA POR LACO DE REPETICAO   '.
           DISPLAY ' '.

           INITIALIZE  WSS-COUNT.

           ACCEPT WSS-DATAN8    FROM DATE YYYYMMDD.
           ACCEPT WSS-DAYWEEK   FROM DAY-OF-WEEK

      *    MODO DIRETO POR PONTEIRO
           DISPLAY 'DESCUBRO O NOME DO MES POR PONTEIRO POSICIONAL'.
           DISPLAY 'MES CORRENTE = ' WSS-NOME-MES(WSS-PARAM-MES).

           MOVE  'N'              TO WSS-ENCONTREI.

           DISPLAY ' DATA DO PROCESSAMENTO = ' WSS-DATAN8

           PERFORM UNTIL WSS-ENCONTREI = 'S'

               ADD       1        TO    WSS-COUNT

               DISPLAY WSS-COUNT

               IF  WSS-COUNT  = WSS-PARAM-MES
                 DISPLAY 'MES CORRENTE = '
                          WSS-NOME-MES(WSS-COUNT)
                 MOVE 'S'          TO WSS-ENCONTREI
               END-IF

           END-PERFORM.

           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY 'POSICIONAMENTO DIRETO NA OCORRENCIA DA TABELA'

           IF WSS-PARAM-MES > 0 AND WSS-PARAM-MES < 13
             DISPLAY 'MES CORRENTE = '
                          WSS-NOME-MES(WSS-PARAM-MES)
           END-IF.

           DISPLAY ' '.

      *************************************************************
      *    MODO DIRETO POR PONTEIRO
           DISPLAY ' '.
           DISPLAY 'DESCUBRO O DIA DA SEMANA POR PONTEIRO POSICIONAL'.
           DISPLAY 'DIA DA SEMANA = ' WSS-NOME-DIA(WSS-DAYWEEK).

           INITIALIZE  WSS-COUNT.

           MOVE  'N'              TO WSS-ENCONTREI.

           PERFORM UNTIL WSS-ENCONTREI = 'S'

               ADD       1        TO    WSS-COUNT

               DISPLAY WSS-COUNT

               IF  WSS-COUNT  = WSS-DAYWEEK
                 DISPLAY 'DIA DA SEMANA = '
                       WSS-NOME-DIA(WSS-COUNT)
                 MOVE 'S'          TO WSS-ENCONTREI
               END-IF

           END-PERFORM.

           DISPLAY ' '.

      *****************************************************************
      * BUSCA POR INDICE
           DISPLAY ' '.
           DISPLAY 'AQUI LEMOS UMA TABELA APENAS PELO INDICE'.
           DISPLAY 'SEM USO DE SEARCH             '.
           DISPLAY ' '.

      *    DEFINE O LIMITE DA BUSCA
           SET IDX-B TO 15.
           SET IDX-C TO IDX-B.

           PERFORM VARYING IDX-B FROM 1 BY 1
                         UNTIL IDX-B > IDX-C
                 DISPLAY ' CODIGO FRUTA : ' TAB-COD-FRUTA(IDX-B)
                         ' FRUTA     : ' TAB-NOM-FRUTA(IDX-B)
                         ' PRECO     : ' TAB-PRE-FRUTA(IDX-B)
           END-PERFORM.

           DISPLAY ' '.

      *****************************************************************
      * BUSCA POR INDICE

           DISPLAY ' '.
           DISPLAY 'AQUI PEGAMOS UM ITEM NA TABELA'.
           DISPLAY 'DIRETAMENTE PELO INDEX        '.
           DISPLAY ' '.

      *    POSICIONA NA PRIMEIRA OCORRENCIA
           SET IDX-B TO 1.

           DISPLAY ' EXIBE A FRUTA NA PRIMEIRA POSICAO DO INDICE'.
           DISPLAY ' CODIGO FRUTA : ' TAB-COD-FRUTA(IDX-B)
                   ' FRUTA     : ' TAB-NOM-FRUTA(IDX-B)
                   ' PRECO     : ' TAB-PRE-FRUTA(IDX-B).
           DISPLAY ' '.

      *****************************************************************
      * BUSSWAP NEXTEARCH VARYING
           DISPLAY ' '.
           DISPLAY 'TABELA SIMPLES COM VALOR FIXO.'.
           DISPLAY 'BUSCA POR SEARCH VARYING      '.
           DISPLAY ' '.

           MOVE        00                  TO WSS-PED-FRUTA.

           DISPLAY   'CASO 001 '.
           PERFORM   ROT-SEARCH-VARY.
           DISPLAY   ' '.

           MOVE        12                  TO WSS-PED-FRUTA.
           DISPLAY   'CASO 002 '.
           PERFORM   ROT-SEARCH-VARY.
           DISPLAY   ' '.

           MOVE        05                  TO WSS-PED-FRUTA.

           DISPLAY   'CASO 003 '.
           PERFORM   ROT-SEARCH-VARY.
           DISPLAY   ' '.

           MOVE        99                  TO WSS-PED-FRUTA.

           DISPLAY   'CASO 004 '.
           PERFORM   ROT-SEARCH-VARY.
           DISPLAY   ' '.
           MOVE        14                  TO WSS-PED-FRUTA.

           DISPLAY   'CASO 005 '.
           PERFORM   ROT-SEARCH-VARY.
           DISPLAY   ' '.

      *****************************************************************
      * BUSCA USANDO SEARCH ALL
           DISPLAY ' '.
           DISPLAY 'TABELA SIMPLES COM VALOR FIXO.'.
           DISPLAY 'BUSCA POR SEARCH ALL - BINARIA'.
           DISPLAY ' '.

           MOVE        00                  TO WSS-PED-FRUTA.

           DISPLAY   'CASO 001 '.
           PERFORM   ROT-SEARCH-ALL
           DISPLAY   ' '.

           MOVE        12                  TO WSS-PED-FRUTA.

           DISPLAY   'CASO 002 '.
           PERFORM   ROT-SEARCH-ALL.
           DISPLAY   ' '.

           MOVE        05                  TO WSS-PED-FRUTA.

           DISPLAY   'CASO 003 '.
           PERFORM   ROT-SEARCH-ALL.
           DISPLAY   ' '.

           MOVE        99                  TO WSS-PED-FRUTA.
           DISPLAY   'CASO 004 '.
           PERFORM   ROT-SEARCH-ALL.
           DISPLAY   ' '.

           MOVE        14                  TO WSS-PED-FRUTA.

           DISPLAY   'CASO 005 '.
           PERFORM   ROT-SEARCH-ALL.
           DISPLAY   ' '.


      *****************************************************************
      * USANDO SUBSCRITORES
           DISPLAY ' '.
           DISPLAY 'INCREMENTANDO A TABELA POR SUBSCRITORES'.
           DISPLAY 'MOVIMENTANDO CAMPOS           '.
           DISPLAY ' '.

           MOVE 14                    TO TAB-COD-FRUTA(14).
           MOVE 'MEXIRICA'            TO TAB-NOM-FRUTA(14).
           MOVE 214                   TO TAB-PRE-FRUTA(14).

           ADD  1                     TO TAB-PRE-FRUTA(14).

           MOVE        14                  TO WSS-PED-FRUTA.

           DISPLAY 'DEBUG'
           DISPLAY 'TAB-COD-FRUTA(14) = ' TAB-COD-FRUTA(14)
           DISPLAY 'TAB-NOM-FRUTA(14) = ' TAB-NOM-FRUTA(14)
           DISPLAY 'TAB-PRE-FRUTA(14) = ' TAB-PRE-FRUTA(14)
           DISPLAY   ' '.

           DISPLAY   'CASO 001 '.
           PERFORM   ROT-SEARCH-VARY.
           DISPLAY   ' '.

      *****************************************************************
      * BUSCA USANDO SEARCH COM USO DE INDEX  SERIAL
           DISPLAY ' '.
           DISPLAY 'TABELA SIMPLES COM VALOR FIXO.'.
           DISPLAY 'BUSCA POR SEARCH  INDICE SERIAL' .
           DISPLAY ' '.

           SET IDX-A TO 1.

           MOVE "N" TO WSS-ENCONTREI.

           PERFORM UNTIL WSS-ENCONTREI = 'S'

             SEARCH WSS-MESES
               AT END  MOVE "S" TO WSS-ENCONTREI
                       DISPLAY ' FALHOU A BUSCA'

               WHEN WSS-NOME-MES(IDX-A) = 'JANEIRO'
                  DISPLAY "MES " WSS-NOME-MES(IDX-A)
                      ' OBAAA COMECOU O ANO'

               WHEN WSS-NOME-MES(IDX-A) = 'JUNHO'
                  DISPLAY "MES " WSS-NOME-MES(IDX-A)
                      ' FESTA JUNINA - SANTOS POPULARES'
                  MOVE 'S' TO WSS-ENCONTREI

               WHEN WSS-NOME-MES(IDX-A) = 'DEZEMBRO'
                  DISPLAY "MES " WSS-NOME-MES(IDX-A)
                      ' ESTA ACABANDO O ANO'
             END-SEARCH

             SET IDX-A   UP BY 1

           END-PERFORM.

      *****************************************************************
      ***  FIM
           STOP RUN.

      *****************************************************************
      * ROTINA SEARCH VARYING NA TABELA
       ROT-SEARCH-VARY.

             SET IDX-B              TO 1.

             SEARCH TABELA-PRECOS  VARYING  IDX-B
               AT END
                 DISPLAY 'ERRO NA TABELA'
                 DISPLAY 'NAO ENCONTREI ESTE CODIGO DE FRUTA : '
                          WSS-PED-FRUTA
             WHEN TAB-COD-FRUTA(IDX-B) = WSS-PED-FRUTA
                 DISPLAY ' CODIGO FRUTA : ' WSS-PED-FRUTA
                         ' FRUTA     : ' TAB-NOM-FRUTA(IDX-B)
                         ' PRECO     : ' TAB-PRE-FRUTA(IDX-B)
             END-SEARCH.

       ROT-SEARCH-VARY-EXIT.
           EXIT.

      *****************************************************************
      * ROTINA SEARCH ALL NA TABELA
       ROT-SEARCH-ALL.
           DISPLAY ' PROCURANDO : ' WSS-PED-FRUTA.

           SEARCH ALL TABELA-PRECOS
             AT END
                 DISPLAY 'ERRO NA TABELA'
                 DISPLAY 'NAO ENCONTREI ESTE CODIGO DE FRUTA : '

             WHEN TAB-COD-FRUTA(IDX-B) = WSS-PED-FRUTA
                 DISPLAY ' CODIGO FRUTA : ' WSS-PED-FRUTA
                         ' FRUTA     : ' TAB-NOM-FRUTA(IDX-B)
                         ' PRECO     : ' TAB-PRE-FRUTA(IDX-B)
           END-SEARCH.

       ROT-SEARCH-ALL-EXIT.
           EXIT.

       END PROGRAM COBOL047.
      ********************** FIM PROGRAMA   ****************************
