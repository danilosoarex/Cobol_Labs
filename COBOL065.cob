      *****************************************************************
      * DATA     :  15/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO DE FUNCOES INTRINSECAS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL065.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 15/06/23 @ 21:05:00.
       DATE-COMPILED. 2023-06-15.
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
       01 WSS-LOAN           PIC 9(9)V99.
       01 WSS-PAYMENT        PIC 9(9)V99.
       01 WSS-INTEREST       PIC 9(9)V99.
       01 WSS-NUMBER-PERIODS PIC 99.
       01 WSS-TAX-S          PIC 99V999 VALUE .045.
       01 WSS-TAX-T          PIC 99V999 VALUE .02.
       01 WSS-TAX-W          PIC 99V999 VALUE .035.
       01 WSS-TAX-B          PIC 99V999 VALUE .03.
       01 WSS-AVE-TAX        PIC 99V999.
       01 WSS-MEDIAN-TAX     PIC 99V999.
       01 WSS-TAX-RANGE      PIC 99V999.
       01 WSS-X              PIC 999V999.
       01 WSS-Z              PIC 999V999.
      *
       LOCAL-STORAGE SECTION.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL065'.
           DISPLAY 'EXEMPLO DE FUNCOES INTRINSECAS'.
           DISPLAY ' '.

      ******************************************************************
           DISPLAY ' '.
           DISPLAY ' EXEMPLO FUNCTION ANNUITY'.

           COMPUTE WSS-LOAN = 15000
           COMPUTE WSS-INTEREST = .12
           COMPUTE WSS-NUMBER-PERIODS = 36

           COMPUTE WSS-PAYMENT = WSS-LOAN *
                                 FUNCTION ANNUITY( (WSS-INTEREST / 12)
                                                    WSS-NUMBER-PERIODS)

           DISPLAY 'WSS-PAYMENT = ' WSS-PAYMENT.

      ******************************************************************
           DISPLAY ' '.
           DISPLAY ' EXEMPLO FUNCTION LOG SQRT REM'.
           COMPUTE WSS-Z = FUNCTION LOG(FUNCTION SQRT (2 * WSS-X + 1)) +
                           FUNCTION REM(WSS-X 2)

           DISPLAY 'WSS-Z = ' WSS-Z.

      ******************************************************************
           DISPLAY ' '.
           DISPLAY ' EXEMPLO FUNCTION MEAN'.

           COMPUTE WSS-AVE-TAX = FUNCTION MEAN (WSS-TAX-S WSS-TAX-T
                                                WSS-TAX-W WSS-TAX-B)

           DISPLAY 'WSS-AVE-TAX = '  WSS-AVE-TAX.

      ******************************************************************
           DISPLAY ' '.
           DISPLAY ' EXEMPLO FUNCTION MEDIAN'.

           COMPUTE WSS-MEDIAN-TAX = FUNCTION MEDIAN (WSS-TAX-S
                                                     WSS-TAX-T
                                                     WSS-TAX-W
                                                     WSS-TAX-B)

           DISPLAY 'WSS-MEDIAN-TAX = '  WSS-MEDIAN-TAX.

      ******************************************************************
           DISPLAY ' '.
           DISPLAY ' EXEMPLO FUNCTION RANGE '.

           COMPUTE WSS-TAX-RANGE = FUNCTION RANGE (WSS-TAX-S WSS-TAX-T
                                                   WSS-TAX-W WSS-TAX-B)

           DISPLAY 'WSS-TAX-RANGE  = '  WSS-TAX-RANGE.

      ******************************************************************
           DISPLAY ' '.
           DISPLAY ' CALCULO RAIZ QUADRADA  '.

           COMPUTE WSS-Z =   (2 * 1250  + 1).

           DISPLAY ' A RAIZ QUADRADA DE ' WSS-Z.

           COMPUTE WSS-Z =   (2 * WSS-X + 1) ** ( 1 / 2 ).

           DISPLAY ' WSS-Z = ' WSS-Z.

           COMPUTE WSS-Z = FUNCTION SQRT (2 * 1250 + 1).

           DISPLAY '1 - WSS-Z = ' WSS-Z.

           STOP RUN.

       END PROGRAM COBOL065.

      ********************** FIM PROGRAMA   ****************************
