      *****************************************************************
      * DATA     :  11/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO BUSCA DE VALOR EM VARIAVEL
      *            VIA LACO DE REPETICAO E POR SEARCH INDEX/ALL
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL048.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 11/06/23 @ 10:30:00.
       DATE-COMPILED. 2023-06-11.
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
         77 WSS-COUNT                 PIC 99   VALUE ZEROES.
         77 WSS-ENCONTREI             PIC A(1) VALUE SPACE.
         77 WSS-DAYWEEK               PIC 9    VALUE ZERO.
         77 WSS-PED-FRUTA             PIC 99   VALUE ZEROES.
         77 WSS-PRECO-CALC            PIC 99V99 VALUE ZEROES.
      *
       01 WSS-PRECO-FRUTAS.
         05 FILLER               PIC X(13) VALUE '01ABACAXI0500'.
         05 FILLER               PIC X(13) VALUE '02BANANA 0100'.
         05 FILLER               PIC X(13) VALUE '03LARANJA0200'.
         05 FILLER               PIC X(13) VALUE '04MACA   0350'.
         05 FILLER               PIC X(13) VALUE '05MORANGO0199'.
         05 FILLER               PIC X(13) VALUE '06ABACATE0235'.
         05 FILLER               PIC X(13) VALUE '07CAQUI  0099'.
         05 FILLER               PIC X(13) VALUE '08KIWI   0148'.
         05 FILLER               PIC X(13) VALUE '09MAMAO  0241'.
         05 FILLER               PIC X(13) VALUE '10PESSEGO0435'.
         05 FILLER               PIC X(13) VALUE '11AMEIXA 0335'.
         05 FILLER               PIC X(13) VALUE '12MELAO  0335'.
         05 FILLER               PIC X(13) VALUE '13UVA    0060'.
      *
       01 FILLER                 REDEFINES  WSS-PRECO-FRUTAS.
         05 TABELA-PRECOS           OCCURS 99 TIMES
                                    ASCENDING KEY IS TAB-COD-FRUTA
                                    INDEXED BY IDX-B.
           10 TAB-COD-FRUTA      PIC 99.
           10 TAB-NOM-FRUTA      PIC X(07).
           10 TAB-PRE-FRUTA      PIC 99V99.
      *
       77 IDX-C               USAGE IS INDEX.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL048'.
           DISPLAY 'EXEMPLO DE BUSCA VIA PONTEIRO DE INDICE'.
           DISPLAY ' '.
      *****************************************************************
      * BUSCA POR INDICE

           DISPLAY ' '.
           DISPLAY 'AQUI LEMOS UMA TABELA APENAS PELO INDICE'.
           DISPLAY 'SEM USO DE SEARCH             '.
           DISPLAY ' '.

      *    DEFINE O LIMITE DA BUSCA
           SET IDX-B TO 13.
           SET IDX-C TO IDX-B.

           PERFORM VARYING IDX-B FROM 1 BY 1
                         UNTIL IDX-B > IDX-C
                 DISPLAY ' CODIGO FRUTA : ' TAB-COD-FRUTA(IDX-B)
                         ' FRUTA     : ' TAB-NOM-FRUTA(IDX-B)
                         ' PRECO     : ' TAB-PRE-FRUTA(IDX-B)
           END-PERFORM.


      *    DISPLAY ' ABENDOU '
      *    DISPLAY ' CODIGO FRUTA : ' TAB-COD-FRUTA(IDX-B)
      *                   ' FRUTA : ' TAB-NOM-FRUTA(IDX-B)
      *                   ' PRECO : ' TAB-PRE-FRUTA(IDX-B)
      *****************************************************************
      * BUSCA POR INDICE

           DISPLAY ' '.
           DISPLAY 'AQUI PEGAMOS UM ITEM NA TABELA'.
           DISPLAY 'DIRETAMENTE PELO INDEX        '.
           DISPLAY ' '.

      *    POSICIONA NA PRIMEIRA OCORRENCIA
           SET IDX-B TO 5.

           DISPLAY ' EXIBE A FRUTA NA PRIMEIRA POSICAO DO INDICE'.
           DISPLAY ' CODIGO FRUTA : ' TAB-COD-FRUTA(IDX-B)
                   ' FRUTA     : ' TAB-NOM-FRUTA(IDX-B)
                   ' PRECO     : ' TAB-PRE-FRUTA(IDX-B).
           DISPLAY ' '.

      *    MOVIMENTA O INDICE 3 PONTEIRO ABAIXO
           SET IDX-B DOWN BY 3.

           DISPLAY ' EXIBE A FRUTA 12 INDICES ABAIXO'.
           DISPLAY ' CODIGO FRUTA : ' TAB-COD-FRUTA(IDX-B)
                   ' FRUTA     : ' TAB-NOM-FRUTA(IDX-B)
                   ' PRECO     : ' TAB-PRE-FRUTA(IDX-B).
           DISPLAY ' '.

      *    MOVIMENTA O INDICE 05 PONTEIRO ACIMA
           SET IDX-B UP BY 5.

           DISPLAY ' EXIBE A FRUTA 5 INDICES ACIMA'.
           DISPLAY ' CODIGO FRUTA : ' TAB-COD-FRUTA(IDX-B)
                   ' FRUTA     : ' TAB-NOM-FRUTA(IDX-B)
                   ' PRECO     : ' TAB-PRE-FRUTA(IDX-B).
           DISPLAY ' '.

      *    CRIA NOVOS VALORES NO LIMBO
           MOVE 14                  TO  TAB-COD-FRUTA(14)
           MOVE 'MEXERICA'          TO  TAB-NOM-FRUTA(14)
           MOVE 99                  TO  TAB-PRE-FRUTA(14).

           DISPLAY ' CODIGO FRUTA : ' TAB-COD-FRUTA(14)
                   ' FRUTA     : ' TAB-NOM-FRUTA(14)
                   ' PRECO     : ' TAB-PRE-FRUTA(14).
           DISPLAY ' '.

           MOVE 14                   TO WSS-COUNT.

           PERFORM 85 TIMES
            ADD 01                   TO  WSS-COUNT
            MOVE WSS-COUNT           TO  TAB-COD-FRUTA(WSS-COUNT)
            MOVE 'MEXERICA'          TO  TAB-NOM-FRUTA(WSS-COUNT)
            ADD 01                   TO  WSS-PRECO-CALC
            MOVE WSS-PRECO-CALC      TO  TAB-PRE-FRUTA(WSS-COUNT)

            DISPLAY ' TAB-COD-FRUTA(WSS-COUNT) '
                      TAB-COD-FRUTA(WSS-COUNT)
            DISPLAY ' TAB-NOM-FRUTA(WSS-COUNT)'
                      TAB-NOM-FRUTA(WSS-COUNT)
            DISPLAY ' TAB-PRE-FRUTA(WSS-COUNT)'
                      TAB-PRE-FRUTA(WSS-COUNT)

           END-PERFORM.

      *****************************************************************
      ***  FIM
           STOP RUN.

       END PROGRAM COBOL048.
      ********************** FIM PROGRAMA   ****************************
