      *****************************************************************
      * DATA     :  25/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO USO DE RELATIONAL OPERATOR
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL111.
      *
       AUTHOR. VAGNER BELLACOSA.
       INSTALLATION. INEFE CPD MARIST.
       DATE-WRITTEN. 25/08/24 @ 19:52:00.
       DATE-COMPILED. 2024-08-25.
       INSTALLATION. INEFE.
       SECURITY. PROGRAMA EDUCACIONAL.
      *
       ENVIRONMENT DIVISION.
      *
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370 WITH DEBUGGING MODE.
       OBJECT-COMPUTER. IBM-370.
       SPECIAL-NAMES.
      *
           DECIMAL-POINT IS COMMA.
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
      *
       77 WSS-NUMERO-INI             PIC 999 VALUE 100.
       77 WSS-NUMERO-MIN             PIC 999 VALUE 300.
       77 WSS-NUMERO-FIN             PIC 999 VALUE 900.
      *
      *-------------------
       PROCEDURE DIVISION.
      *-------------------
      *
       MAIN_SECTION        SECTION.
           DISPLAY ' COBOL111  '.
           DISPLAY ' RELATIONAL OPERATOR'
           DISPLAY ' USE E ABUSE DOS OPERADORES RELACIONAIS'
           DISPLAY ' IF E EVALUEATE MAIS PODEROSO'.
           DISPLAY ' '.

      *   EXEMPLO DE MAIOR QUE

           DISPLAY ' IS GREATER THAN'
           DISPLAY ' '.

      *    IF WSS-NUMERO-MIN > WSS-NUMERO-INI
           IF WSS-NUMERO-MIN IS GREATER THAN WSS-NUMERO-INI
             DISPLAY WSS-NUMERO-MIN ' EH MAIOR QUE '
                     WSS-NUMERO-INI
           ELSE
             DISPLAY WSS-NUMERO-INI ' EH MAIOR QUE '
                     WSS-NUMERO-MIN
           END-IF.

           DISPLAY ' '.

      *   EXEMPLO DE MENOR QUE
           DISPLAY ' IS LESS THAN'
           DISPLAY ' '.

           IF WSS-NUMERO-FIN IS LESS THAN WSS-NUMERO-MIN
             DISPLAY WSS-NUMERO-MIN ' EH MENOR QUE '
                     WSS-NUMERO-FIN
           ELSE
             DISPLAY WSS-NUMERO-MIN ' EH MENOR QUE '
                     WSS-NUMERO-FIN
           END-IF.

           DISPLAY ' '.

      *   EXEMPLO DE EQUAL QUE

           DISPLAY ' IS EQUAL'
           DISPLAY ' '.

           IF WSS-NUMERO-FIN IS EQUAL WSS-NUMERO-INI
             DISPLAY WSS-NUMERO-FIN ' EH IGUAL '
                     WSS-NUMERO-INI
           ELSE
             DISPLAY WSS-NUMERO-INI ' EH DIFERENTE '
                     WSS-NUMERO-FIN
           END-IF.

           DISPLAY ' '.

      *   EXEMPLO DE NAO MAIOR QUE

           DISPLAY ' IS NOT GREATER THAN'
           DISPLAY ' '.

           IF WSS-NUMERO-INI IS NOT GREATER THAN WSS-NUMERO-MIN
             DISPLAY WSS-NUMERO-INI ' NAO EH MAIOR QUE '
                     WSS-NUMERO-MIN
           ELSE
             DISPLAY WSS-NUMERO-MIN ' EH MAIOR QUE '
                     WSS-NUMERO-INI
           END-IF.

           DISPLAY ' '.

      *   EXEMPLO DE NAO MENOR QUE

           DISPLAY ' IS NOT LESS THAN'
           DISPLAY ' '.

           IF WSS-NUMERO-MIN IS NOT LESS THAN WSS-NUMERO-FIN
             DISPLAY WSS-NUMERO-MIN ' NAO EH MENOR QUE '
                     WSS-NUMERO-FIN
           ELSE
             DISPLAY WSS-NUMERO-MIN ' EH MENOR QUE '
                     WSS-NUMERO-FIN
           END-IF.

           DISPLAY ' '.

      *   EXEMPLO DE IS NOT EQUAL QUE

           DISPLAY ' IS NOT EQUAL THAN'
           DISPLAY ' '.

           IF WSS-NUMERO-FIN IS NOT EQUAL WSS-NUMERO-INI
             DISPLAY WSS-NUMERO-FIN ' EH DIFERENTE '
                     WSS-NUMERO-INI
           ELSE
             DISPLAY WSS-NUMERO-INI ' EH IGUAL '
                     WSS-NUMERO-FIN
           END-IF.

           STOP RUN.

       END PROGRAM COBOL111.
      ********************** FIM DO PROGRAMA ***************************
