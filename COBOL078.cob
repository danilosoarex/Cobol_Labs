      *****************************************************************
      * DATA     :  18/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO ROUNDED ON SIZE ERROR
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL078.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 18/06/23 @ 18:35:00.
       DATE-COMPILED. 2023-06-18.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.
      *
       ENVIRONMENT DIVISION.
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
      *
          01 VALORES.
            05 WSS-DATA-A PIC 99V999 VALUE 20.534.
            05 WSS-DATA-B PIC 99V999 VALUE 11.963.
            05 WSS-DATA-C PIC 99V9.
      *
         01  WSS-PACK-DECIMAL-SIGN-6-3 PIC S9(6)V999 COMP-3.
         01  WSS-BINARY-SIGN-6-3       PIC S9(6)V999 COMP VALUE 0.
      *
         01  WSS-DISPLAY-SIGN-7-2      PIC S9(7)V99
                                      SIGN TRAILING SEPARATE.
         01  WSS-DISPLAY-SIGN-7-2A     PIC S9(7)V99.
      *
         01  WSS-EDIT-FIELD-7-2         PIC Z,ZZZ,ZZZ.99+.
         01  WSS-ZONED-DECIMAL-SIGN-6-3 PIC S9(6)V999  VALUE 0.
      *
         01  WSS-WINDOWED-YEAR  DATE FORMAT YY PICTURE 99
                            VALUE IS 50.
      *
       PROCEDURE DIVISION.
      *
           DISPLAY ' '.
           DISPLAY 'EXEMPLO DO COMANDO ROUNDED'.

           ADD WSS-DATA-A WSS-DATA-B GIVING WSS-DATA-C
             ROUNDED
                        ON SIZE ERROR PERFORM DEU-RUIM
                        NOT ON SIZE ERROR PERFORM BELEZA
           END-ADD.
      *
           DISPLAY 'WSS-DATA-C             ' WSS-DATA-C
      *
           MOVE 10          TO WSS-PACK-DECIMAL-SIGN-6-3.

           ADD WSS-PACK-DECIMAL-SIGN-6-3 TO ZERO
              GIVING WSS-DISPLAY-SIGN-7-2 ROUNDED
                        ON SIZE ERROR PERFORM DEU-RUIM
                        NOT ON SIZE ERROR PERFORM BELEZA
           END-ADD.
      *
           DISPLAY 'A WSS-DISPLAY-SIGN-7-2 = ' WSS-DISPLAY-SIGN-7-2.

           MOVE WSS-DISPLAY-SIGN-7-2 TO WSS-DISPLAY-SIGN-7-2A

           DISPLAY ' '
           DISPLAY ' SEM SINAL '
           DISPLAY 'WSS-DISPLAY-SIGN-7-2A = ' WSS-DISPLAY-SIGN-7-2A
           DISPLAY ' '
      *
           ADD WSS-PACK-DECIMAL-SIGN-6-3 TO ZERO
              GIVING WSS-EDIT-FIELD-7-2 ROUNDED
                        ON SIZE ERROR PERFORM DEU-RUIM
                        NOT ON SIZE ERROR PERFORM BELEZA
           END-ADD.
      *
           DISPLAY 'B WSS-EDIT-FIELD-7-2   = ' WSS-EDIT-FIELD-7-2
      *
           ADD WSS-BINARY-SIGN-6-3 TO ZERO
              GIVING WSS-DISPLAY-SIGN-7-2 ROUNDED
                        ON SIZE ERROR PERFORM DEU-RUIM
                        NOT ON SIZE ERROR PERFORM BELEZA
           END-ADD.
      *
           DISPLAY 'C WSS-EDIT-FIELD-7-2   = ' WSS-EDIT-FIELD-7-2
      *
           DIVIDE WSS-ZONED-DECIMAL-SIGN-6-3 BY ZERO
              GIVING WSS-EDIT-FIELD-7-2 ROUNDED
                        ON SIZE ERROR PERFORM DEU-RUIM
                        NOT ON SIZE ERROR PERFORM BELEZA
           END-DIVIDE.
      *
           DISPLAY 'D WSS-EDIT-FIELD-7-2   = ' WSS-EDIT-FIELD-7-2
      *
           ADD WSS-ZONED-DECIMAL-SIGN-6-3 TO ZERO
              GIVING WSS-DISPLAY-SIGN-7-2 ROUNDED
           END-ADD.
      *
           DISPLAY 'WSS-EDIT-FIELD-7-2   = ' WSS-EDIT-FIELD-7-2
      *
           DISPLAY ' '.
           DISPLAY 'EXEMPLO DO COMANDO ON SIZE ERROR'.
      *
           SUBTRACT 01 FROM WSS-WINDOWED-YEAR
                        ON SIZE ERROR PERFORM DEU-RUIM
                        NOT ON SIZE ERROR PERFORM BELEZA
           END-SUBTRACT
      *
           SUBTRACT 20 FROM WSS-WINDOWED-YEAR
                        ON SIZE ERROR PERFORM DEU-RUIM
                        NOT ON SIZE ERROR PERFORM BELEZA
           END-SUBTRACT
      *
           STOP RUN.
      *
       DEU-RUIM.
           DISPLAY 'DEU RUIM NA CONTA'.
           DISPLAY 'WSS-WINDOWED-YEAR = ' WSS-WINDOWED-YEAR.

       BELEZA.
           DISPLAY 'ISSO AI NADA ACONTECEU'.
           DISPLAY 'WSS-WINDOWED-YEAR = ' WSS-WINDOWED-YEAR.

      *
       END PROGRAM COBOL078.
**************************** FIM DO PROGRAMA ***************************
