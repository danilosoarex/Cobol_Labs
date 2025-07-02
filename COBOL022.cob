      *****************************************************************
      * DATA     :  13/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO COMPUTACIONAL-1
      *            COMP-2 COMP-3 COMP-4 COMP-5 E COMP
      *            EXEMPLO DE CALCULO E TAMANHO DE AREA DE MEMORIA
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL022.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 13/08/24 @ 15:55:00.
       DATE-COMPILED. 2024-08-13.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************

        CONFIGURATION SECTION.
         SPECIAL-NAMES.  DECIMAL-POINT IS COMMA.
      *
      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       01 WSS-VAR-COMP1.
          05 WSS-PI          USAGE IS COMP-1.
          05 WSS-RADIUS      USAGE IS COMP-1.
          05 WSS-AREA        USAGE IS COMP-1.

       01 WSS-VAR-COMP2.
          05 WSS-PI2         USAGE IS COMP-2.
          05 WSS-RADIUS2     USAGE IS COMP-2.
          05 WSS-AREA2       USAGE IS COMP-2.

       01 WSS-VAR-COMP3.
          05 WSS-PI3         PIC 9(03)V9(15) USAGE IS COMP-3.
          05 WSS-RADIUS3     PIC 9(03)V9(15) USAGE IS COMP-3.
          05 WSS-AREA3       PIC 9(03)V9(15) USAGE IS COMP-3.

       01 WSS-VAR-COMP4.
          05 WSS-PI4         PIC 9(03)V9(15) USAGE IS COMP-4.
          05 WSS-RADIUS4     PIC 9(03)V9(15) USAGE IS COMP-4.
          05 WSS-AREA4       PIC 9(03)V9(15) USAGE IS COMP-4.

       01 WSS-VAR-COMP4A.
          05 WSS-PI4A        PIC 9(03)V9(15) USAGE IS COMP.
          05 WSS-RADIUS4A    PIC 9(03)V9(15) USAGE IS COMP.
          05 WSS-AREA4A      PIC 9(03)V9(15) USAGE IS COMP.

       01 WSS-VAR-COMP5.
          05 WSS-PI5         PIC 9(03)V9(15) USAGE IS COMP-5.
          05 WSS-RADIUS5     PIC 9(03)V9(15) USAGE IS COMP-5.
          05 WSS-AREA5       PIC 9(03)V9(15) USAGE IS COMP-5.

      *********************
       PROCEDURE DIVISION.
      *********************

       MAIN-SECTION      SECTION.

           DISPLAY ' COBOL022'
           DISPLAY ' EXEMPLO PRATICO COMP  , COMP-1, COMP-2, COMP-3'
           DISPLAY '                 COMP-4 & COMP-5'
           DISPLAY ' '

           PERFORM EXEMPLO-COMP1.

           PERFORM EXEMPLO-COMP2.

           PERFORM EXEMPLO-COMP3.

           PERFORM EXEMPLO-COMP4.

           PERFORM EXEMPLO-COMP.

           PERFORM EXEMPLO-COMP5.

           PERFORM LISTA-VAR.

           STOP RUN.

      *-------------*
       EXEMPLO-COMP1.
      *-------------*

           DISPLAY 'EXEMPLO-COMP1'

           MOVE 3,14159265358979323846  TO WSS-PI.
           MOVE 10                      TO WSS-RADIUS.

           COMPUTE WSS-AREA = WSS-PI * (WSS-RADIUS ** 2).

           DISPLAY "THE AREA OF THE CIRCLE: " WSS-AREA.
           DISPLAY 'LENGTH OF WSS-AREA    : ' LENGTH OF WSS-AREA.

           PERFORM PULA-LINHA.

      *-------------*
       EXEMPLO-COMP2.
      *-------------*

           DISPLAY ' '
           DISPLAY 'EXEMPLO-COMP2'.

           MOVE 3,14159265358979323846  TO WSS-PI2.
           MOVE 10                      TO WSS-RADIUS2.

           COMPUTE WSS-AREA2 = WSS-PI2 * (WSS-RADIUS2 ** 2).

           DISPLAY "THE AREA OF THE CIRCLE: " WSS-AREA2.
           DISPLAY 'LENGTH OF WSS-AREA    : ' LENGTH OF WSS-AREA2.

           PERFORM PULA-LINHA.

      *-------------*
       EXEMPLO-COMP3.
      *-------------*

           DISPLAY ' '
           DISPLAY 'EXEMPLO-COMP3'.

           MOVE 3,14159265358979323846  TO WSS-PI3.
           MOVE 10                      TO WSS-RADIUS3.

           COMPUTE WSS-AREA3 = WSS-PI3 * (WSS-RADIUS3 ** 2).

           DISPLAY "THE AREA OF THE CIRCLE: " WSS-AREA3.
           DISPLAY 'LENGTH OF WSS-AREA    : ' LENGTH OF WSS-AREA3.

           PERFORM PULA-LINHA.

      *-------------*
       EXEMPLO-COMP .
      *-------------*

           DISPLAY ' '
           DISPLAY 'EXEMPLO-COMP '.

           MOVE 3,14159265358979323846  TO WSS-PI4A.
           MOVE 10                      TO WSS-RADIUS4A.

           COMPUTE WSS-AREA4A = WSS-PI4A * (WSS-RADIUS4A ** 2).

           DISPLAY "THE AREA OF THE CIRCLE: " WSS-AREA4A.
           DISPLAY 'LENGTH OF WSS-AREA    : ' LENGTH OF WSS-AREA4A.

           PERFORM PULA-LINHA.

      *-------------*
       EXEMPLO-COMP4.
      *-------------*

           DISPLAY ' '
           DISPLAY 'EXEMPLO-COMP4'.

           MOVE 3,14159265358979323846  TO WSS-PI4.
           MOVE 10                      TO WSS-RADIUS4.

           COMPUTE WSS-AREA4 = WSS-PI4 * (WSS-RADIUS4 ** 2).

           DISPLAY "THE AREA OF THE CIRCLE: " WSS-AREA4.
           DISPLAY 'LENGTH OF WSS-AREA    : ' LENGTH OF WSS-AREA4.

           PERFORM PULA-LINHA.

      *-------------*
       EXEMPLO-COMP5.
      *-------------*

           DISPLAY ' '
           DISPLAY 'EXEMPLO-COMP5'.

           MOVE 3,14159265358979323846  TO WSS-PI5.
           MOVE 10                      TO WSS-RADIUS5.

           COMPUTE WSS-AREA5 = WSS-PI5 * (WSS-RADIUS5 ** 2).

           DISPLAY "THE AREA OF THE CIRCLE: " WSS-AREA5.
           DISPLAY 'LENGTH OF WSS-AREA    : ' LENGTH OF WSS-AREA5.

           PERFORM PULA-LINHA.

      *-----------*
       PULA-LINHA.
      *-----------*

           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.

      *-----------*
       LISTA-VAR.
      *-----------*

           PERFORM PULA-LINHA.

           DISPLAY 'WSS-VAR-COMP1 = ' WSS-VAR-COMP1
                   ' '      LENGTH OF WSS-VAR-COMP1  ' BYTES '.
           DISPLAY ' '.

           DISPLAY 'WSS-VAR-COMP2 = ' WSS-VAR-COMP2
                   ' '      LENGTH OF WSS-VAR-COMP2  ' BYTES '.
           DISPLAY ' '.

           DISPLAY 'WSS-VAR-COMP3 = ' WSS-VAR-COMP3
                   ' '      LENGTH OF WSS-VAR-COMP3  ' BYTES '.
           DISPLAY ' '.

           DISPLAY 'WSS-VAR-COMP4 = ' WSS-VAR-COMP4
                   ' '      LENGTH OF WSS-VAR-COMP4  ' BYTES '.
           DISPLAY ' '.

           DISPLAY 'WSS-VAR-COMP  = ' WSS-VAR-COMP4A
                   ' '      LENGTH OF WSS-VAR-COMP4A ' BYTES '.
           DISPLAY ' '.

           DISPLAY 'WSS-VAR-COMP5 = ' WSS-VAR-COMP5
                   ' '      LENGTH OF WSS-VAR-COMP5  ' BYTES '.
           DISPLAY ' '.

       END PROGRAM COBOL022.

      ********************** FIM DO PROGRAMA ***************************
