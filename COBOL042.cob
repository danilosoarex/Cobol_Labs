      *****************************************************************
      * DATA     :  08/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO ARRAY UNID COM INDEX
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL042.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 08/06/23 @ 22:05:00.
       DATE-COMPILED. 2023-06-08.
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
        01 WSS-STORE.
           05 WSS-PRODUCT OCCURS 3 TIMES INDEXED BY IDX.
             10 WSS-ITEM-CODE         PIC 9(05) VALUE ZEROES.
      *
        01 WSS-ITEM-VAL               PIC 9(05) COMP-3 VALUE 12345 .
      *
        77 WSS-COMPT                  PIC 9(05).
        77 WSS-INDICE-LOUCO           PIC 9(01) VALUE ZERO.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL042'.
           DISPLAY 'EXEMPLO DE ARRAY UNID COM INDEX'.
           DISPLAY ' '.


           SET IDX TO 1 .

           PERFORM PROD-DETAILS UNTIL IDX > 3.

      ************************************************************

           DISPLAY ' '
           DISPLAY ' INDICE 4'

           IF IDX < 3
             SET IDX UP BY 1
           ELSE
             SET IDX TO 1
           END-IF.

      **** SET IDX DOWN BY 2.
      *    ADD 1 TO  WSS-ITEM-CODE(IDX).

           COMPUTE WSS-COMPT =  WSS-ITEM-CODE(IDX) + 55.

           DISPLAY " COMPT    =  "  WSS-COMPT.
           DISPLAY " PRODUCT  =  "  WSS-ITEM-CODE(IDX).
           DISPLAY ' '.

      ************************************************************

           DISPLAY ' '
           DISPLAY ' INDICE 0'

      ***  SET IDX DOWN BY 4.
      ***  SET IDX TO 0.


           IF WSS-INDICE-LOUCO < 1 OR
              WSS-INDICE-LOUCO > 3
              MOVE 2   TO WSS-INDICE-LOUCO
           END-IF.

           COMPUTE WSS-COMPT =  WSS-ITEM-CODE(WSS-INDICE-LOUCO)
                                + 55.

           DISPLAY " COMPT    =  "  WSS-COMPT.
           DISPLAY " PRODUCT  =  "  WSS-ITEM-CODE(WSS-INDICE-LOUCO).
           DISPLAY ' '.

      ************************************************************
           DISPLAY ' '
           DISPLAY ' INDICE 1'
      *    ADD 1 TO  WSS-ITEM-CODE(IDX).

           SET IDX TO 1.
      *    ADD 1 TO  WSS-ITEM-CODE(IDX).

           COMPUTE WSS-COMPT =  WSS-ITEM-CODE(IDX) + 55.

           DISPLAY " COMPT    =  "  WSS-COMPT.
           DISPLAY " PRODUCT  =  "  WSS-ITEM-CODE(IDX).

      ************************************************************
           DISPLAY ' '
           DISPLAY ' INDICE 2'
           SET IDX TO 2.
      *    ADD 1 TO  WSS-ITEM-CODE(IDX).

           COMPUTE WSS-COMPT =  WSS-ITEM-CODE(IDX) + 55.

           DISPLAY " COMPT    =  "  WSS-COMPT.
           DISPLAY " PRODUCT  =  "  WSS-ITEM-CODE(IDX).

      ************************************************************
           DISPLAY ' '
           DISPLAY ' INDICE 3'

           SET IDX UP BY 1.

           COMPUTE WSS-COMPT =  WSS-ITEM-CODE(IDX) + 55.

           DISPLAY " COMPT    =  "  WSS-COMPT.
           DISPLAY " PRODUCT  =  "  WSS-ITEM-CODE(IDX).
      **

           STOP RUN.
      **
       PROD-DETAILS .

           DISPLAY '  WSS-ITEM-VAL  = ' WSS-ITEM-VAL.

           MOVE WSS-ITEM-VAL         TO WSS-ITEM-CODE(IDX).

           DISPLAY " PRODUCT  =  "  WSS-ITEM-CODE(IDX).

           ADD 1 TO WSS-ITEM-VAL.

           SET IDX UP BY 1.

       END PROGRAM COBOL042.
      ********************** FIM PROGRAMA   ****************************
