      *****************************************************************
      * DATA     :  13/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO COMPUTACIONAL-2
      *            CALCULO POR COMPUTE, USO DE NUMERO COMPACTADO E
      *            USO DA FUNCAO LENGTH PARA OBTER TAMANHO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL023.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 13/08/24 @ 16:55:00.
       DATE-COMPILED. 2024-08-13.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       01 WSS-VAR.
          05 WSS-PI          USAGE IS COMP-2.
          05 WSS-RADIUS      USAGE IS COMP-2.
          05 WSS-AREA        USAGE IS COMP-2.

       01 WSS-VAR3.
          05 WSS-PI3         PIC 9(6).
          05 WSS-RADIUS3     PIC 9(6).
          05 WSS-AREA3       PIC 9(6).

      *********************
       PROCEDURE DIVISION.
      *********************

           MOVE 3.1415918          TO WSS-PI.
           MOVE 10                 TO WSS-RADIUS.

           COMPUTE WSS-AREA = WSS-PI * (WSS-RADIUS ** 2)
              ON SIZE ERROR PERFORM ERRO-PGM
           END-COMPUTE.

           DISPLAY "THE AREA OF THE CIRCLE: " WSS-AREA.
           DISPLAY 'LENGTH  OF WSS-AREA   : ' LENGTH OF WSS-AREA.
           DISPLAY 'WSS-VAR               : ' WSS-VAR.
           DISPLAY 'LENGTH  OF WSS-VAR    : ' LENGTH OF WSS-VAR.

           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.

           MOVE 3.1415918          TO WSS-PI3.
           MOVE 10                 TO WSS-RADIUS3.

           COMPUTE WSS-AREA3 = WSS-PI3 * (WSS-RADIUS3 ** 8)
              ON SIZE ERROR PERFORM ERRO-PGM
           END-COMPUTE.

           DISPLAY "THE AREA OF THE CIRCLE: " WSS-AREA3.
           DISPLAY 'LENGTH  OF WSS-AREA   : ' LENGTH OF WSS-AREA3.
           DISPLAY 'WSS-VAR               : ' WSS-VAR3.
           DISPLAY 'LENGTH  OF WSS-VAR    : ' LENGTH OF WSS-VAR3.

           STOP RUN.

       ERRO-PGM.

           DISPLAY 'ERRO NO CALCULO'
           DISPLAY 'OCORREU ESTOURO DE VARIAVEL'
           MOVE  666             TO RETURN-CODE.

       END PROGRAM COBOL023.
      ********************** FIM DO PROGRAMA ***************************
