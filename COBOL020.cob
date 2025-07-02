      *****************************************************************
      * DATA     :  31/05/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VARIAVEL NUMERICA COMP
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL020.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 31/05/23 @ 18:45:00.
       DATE-COMPILED. 2023-05-31.
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
       77 WSS-VAL-A USAGE IS COMP-1.
       77 WSS-VAL-B USAGE IS COMP-2.
       77 WSS-VAL-C        PIC S9(3) USAGE IS COMP-3.
       77 WSS-VAL-D        PIC S9(4) USAGE IS COMP-3.
       77 WSS-NUM-MASK     PIC ZZZ9.
       77 WSS-NUM-MASK-POS PIC +ZZZ9.
       77 WSS-NUM-MASK-NEG PIC -ZZZ9.

      ********************
       PROCEDURE DIVISION.
      ********************
       MAIN-ROUTINE.
           DISPLAY '** COMP-1 USAGE DISPLAY **'.

           MOVE 999 TO WSS-VAL-A.

           DISPLAY 'CASO 001'.
           DISPLAY 'VALUE OF WSS-VAL-A IS: ' WSS-VAL-A.
           DISPLAY 'LENGHTH OF WSS-VAL-A IS: ' LENGTH OF WSS-VAL-A.
           DISPLAY '** COMP-2 USAGE DISPLAY **'.
           DISPLAY ' '.

           MOVE 999 TO WSS-VAL-B.

           DISPLAY 'CASO 002'.
           DISPLAY 'VALUE OF WSS-VAL-B IS: ' WSS-VAL-B.
           DISPLAY 'LENGHTH OF WSS-VAL-B IS: ' LENGTH OF WSS-VAL-B.
           DISPLAY '** COMP-3 USAGE USING 2 BYTES DISPLAY **'.
           DISPLAY ' '.

           MOVE 999 TO WSS-VAL-C.

           DISPLAY 'CASO 003'.
           DISPLAY 'VALUE OF WSS-VAL-C IS: ' WSS-VAL-C.
           DISPLAY 'LENGHTH OF WSS-VAL-C IS: ' LENGTH OF WSS-VAL-C.
           DISPLAY '** COMP-3 USAGE USING 3 BYTES DISPLAY**'.
           DISPLAY ' '.

           MOVE -999 TO WSS-VAL-C.

           DISPLAY 'CASO 004'.
           DISPLAY 'VALUE OF WSS-VAL-C IS: ' WSS-VAL-C.
           DISPLAY 'LENGHTH OF WSS-VAL-C IS: ' LENGTH OF WSS-VAL-C.
           DISPLAY '** COMP-3 USAGE USING 3 BYTES DISPLAY**'.
           DISPLAY ' '.

           MOVE 999 TO WSS-VAL-D.

           DISPLAY 'CASO 005'.
           DISPLAY 'VALUE OF WSS-VAL-D IS: ' WSS-VAL-D.
           DISPLAY 'LENGHTH OF WSS-VAL-D IS: ' LENGTH OF WSS-VAL-D.
           DISPLAY ' '.

           MOVE -1999 TO WSS-VAL-D.

           DISPLAY 'CASO 006'.
           DISPLAY 'VALUE OF WSS-VAL-D IS: ' WSS-VAL-D.
           DISPLAY 'LENGHTH OF WSS-VAL-D IS: ' LENGTH OF WSS-VAL-D.
           DISPLAY ' '.

           DISPLAY ' '.
           DISPLAY 'CASO 007'.
           MOVE -10                   TO    WSS-NUM-MASK
           MOVE -10                   TO    WSS-NUM-MASK-POS
           MOVE -10                   TO    WSS-NUM-MASK-NEG.

           DISPLAY ' WSS-NUM-MASK      = ' WSS-NUM-MASK
           DISPLAY ' WSS-NUM-MASK-POS  = ' WSS-NUM-MASK-POS
           DISPLAY ' WSS-NUM-MASK-NEG  = ' WSS-NUM-MASK-NEG

           DISPLAY ' '.
           DISPLAY 'CASO 008'.
           MOVE +123                  TO    WSS-NUM-MASK
           MOVE +123                  TO    WSS-NUM-MASK-POS
           MOVE +123                  TO    WSS-NUM-MASK-NEG.

           DISPLAY ' WSS-NUM-MASK      = ' WSS-NUM-MASK
           DISPLAY ' WSS-NUM-MASK-POS  = ' WSS-NUM-MASK-POS
           DISPLAY ' WSS-NUM-MASK-NEG  = ' WSS-NUM-MASK-NEG

           DISPLAY 'CASO 009'.
           MOVE 246                   TO    WSS-NUM-MASK
           MOVE 246                   TO    WSS-NUM-MASK-POS
           MOVE 246                   TO    WSS-NUM-MASK-NEG.

           DISPLAY ' WSS-NUM-MASK      = ' WSS-NUM-MASK
           DISPLAY ' WSS-NUM-MASK-POS  = ' WSS-NUM-MASK-POS
           DISPLAY ' WSS-NUM-MASK-NEG  = ' WSS-NUM-MASK-NEG

           STOP RUN.

       END PROGRAM COBOL020.
      ********************** FIM PROGRAMA   ****************************
