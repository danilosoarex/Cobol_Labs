      *****************************************************************
      * DATA     :  01/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA PIC EDITAVEIS NUMERICOS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL012.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 01/06/23 @ 20:10:00.
       DATE-COMPILED. 2023-06-01.
      *
       ENVIRONMENT DIVISION.
      *
       CONFIGURATION SECTION.
      *
       SPECIAL-NAMES.
      *
           DECIMAL-POINT IS COMMA.
      *
       DATA DIVISION.
      *
        WORKING-STORAGE SECTION.
      *
        77 REL-COD-MASK           PIC ZZZ.
        77 REL-COD-PT-BR          PIC ZZZ9.
        77 REL-COD-DEC-PT-BR      PIC ZBZZ9,99.
        77 REL-COD-BLOQ           PIC *99,99.
        77 REL-COD-SPACE          PIC 9B9.
        77 REL-COD-FAKE           PIC 99,00.
        77 REL-COD-SIGNAL1        PIC +ZZ9.
        77 REL-COD-SIGNAL2        PIC 99+.
        77 REL-COD-SIGNAL3        PIC 99+.
        77 REL-COD-SIGNAL4        PIC +99.
        77 REL-COD-SIGNAL5        PIC -99.
        77 REL-COD-SIGNAL6        PIC 99-.
        77 REL-COD-SIGNAL7        PIC -99.
        77 REL-COD-MONEY          PIC $9(4).
        77 WSS-PRECO              PIC 9(05)V99.
        77 REL-PRECO              PIC $ZZ.ZZ9,99.
        77 REL-VL-SEM-ZEROS       PIC --------9 VALUE ZEROS.
        77 REL-VL-SEM-ZEROS-SNL   PIC ++++++++9 VALUE ZEROS.
        77 REL-DATA               PIC ZZ/ZZ/ZZZZ.
        77 REL-VALOR              PIC -999.999,99.
        77 REL-VALOR-1            PIC -ZZZBZZZ.ZZ9,99.
        77 REL-VALOR-2            PIC -999B999.999V99.
        77 REL-VALOR-SNL          PIC S9(09)V9(2).
      *
       PROCEDURE DIVISION.

           DISPLAY 'PROGRAMA COBOL012'.

       PROGRAM-BEGIN.

           DISPLAY 'ESTE PROGRAMA TEM 4 DIVISIONS'.
           DISPLAY 'TRES PARAGRAFOS'.
           DISPLAY 'E 4 SENTENCAS   '.
           DISPLAY ' '.

       PROGRAM-DISPLAY.

           MOVE  ZEROES      TO   REL-COD-MASK

           DISPLAY 'REL-COD-MASK = ' REL-COD-MASK

           MOVE  123         TO   REL-COD-MASK
           DISPLAY ' REL-COD-MASK       = '  REL-COD-MASK

           MOVE  11900       TO   REL-COD-PT-BR
           DISPLAY ' REL-COD-PT-BR      = '  REL-COD-PT-BR

           MOVE  154355      TO   REL-COD-DEC-PT-BR
           DISPLAY ' REL-COD-DEC-PT-BR  = '  REL-COD-DEC-PT-BR

           MOVE  7777        TO   REL-COD-BLOQ
           DISPLAY ' REL-COD-BLOQ       = '  REL-COD-BLOQ

           MOVE  66          TO   REL-COD-SPACE
           DISPLAY ' REL-COD-SPACE      = '  REL-COD-SPACE

           MOVE  88          TO   REL-COD-FAKE
           DISPLAY ' REL-COD-FAKE       = '  REL-COD-FAKE

           MOVE  -12         TO   REL-COD-SIGNAL1
           DISPLAY 'REL-COD-SIGNAL1  = ' REL-COD-SIGNAL1

           MOVE  8766        TO   REL-COD-SIGNAL1
           DISPLAY ' REL-COD-SIGNAL1    = '  REL-COD-SIGNAL1

           MOVE  -56         TO   REL-COD-SIGNAL2
           DISPLAY ' REL-COD-SIGNAL2    = '  REL-COD-SIGNAL2

           MOVE  56          TO   REL-COD-SIGNAL3
           DISPLAY ' REL-COD-SIGNAL3    = '  REL-COD-SIGNAL3

           MOVE  56          TO   REL-COD-SIGNAL4
           DISPLAY ' REL-COD-SIGNAL4    = '  REL-COD-SIGNAL4

           MOVE  -56         TO   REL-COD-SIGNAL5
           DISPLAY ' REL-COD-SIGNAL5    = '  REL-COD-SIGNAL5

           MOVE  -56         TO   REL-COD-SIGNAL6
           DISPLAY ' REL-COD-SIGNAL6    = '  REL-COD-SIGNAL6

           MOVE  56          TO   REL-COD-SIGNAL7
           DISPLAY ' REL-COD-SIGNAL7    = '  REL-COD-SIGNAL7

           MOVE  18765       TO   REL-COD-MONEY
           DISPLAY ' REL-COD-MONEY      = '  REL-COD-MONEY.

           MOVE  12345       TO   WSS-PRECO
           DISPLAY ' WSS-PRECO          = '  WSS-PRECO.

           MOVE  WSS-PRECO      TO   REL-PRECO
           DISPLAY ' REL-PRECO          = '  REL-PRECO.

           MOVE  12732234       TO   REL-VL-SEM-ZEROS.
           DISPLAY ' REL-VL-SEM-ZEROS     '  REL-VL-SEM-ZEROS.

           MOVE  12732234       TO   REL-VL-SEM-ZEROS-SNL.
           DISPLAY ' REL-VL-SEM-ZEROS-SNL '  REL-VL-SEM-ZEROS-SNL.

           MOVE  12732234       TO   REL-DATA.
           DISPLAY ' REL-DATA             '  REL-DATA.

           MOVE  732234         TO   REL-VALOR.
           DISPLAY ' REL-VALOR            '  REL-VALOR.

           MOVE  012732234      TO   REL-VALOR-SNL.
           DISPLAY ' REL-VALOR-SNL        '  REL-VALOR-SNL.

           DISPLAY ' '
           DISPLAY ' '

           MOVE 12,50         TO REL-VALOR-1.
           MOVE 12,50         TO REL-VALOR-2.
           DISPLAY ' REL-VALOR-1 = ' REL-VALOR-1.
           DISPLAY ' REL-VALOR-2 = ' REL-VALOR-2.

           MOVE 100           TO REL-VALOR-1.
           MOVE 100           TO REL-VALOR-2.
           DISPLAY ' REL-VALOR-1 = ' REL-VALOR-1.
           DISPLAY ' REL-VALOR-2 = ' REL-VALOR-2.

           MOVE ZEROES        TO REL-VALOR-1.
           DISPLAY ' REL-VALOR-1 = ' REL-VALOR-1.

       PROGRAM-DONE.
           STOP RUN.

       END PROGRAM COBOL012.
      ********************** FIM PROGRAMA   ****************************
