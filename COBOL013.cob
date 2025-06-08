      *****************************************************************
      * DATA     :  24/05/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO DE PERFORM E NAVEGACAO ENTRE PARAGRAFOS
      *            EXPLORAMOS OS COMANDOS ACCEPT DISPLAY FUNCOES
      *            EXPLORAMOS OS COMANDOS ACCEPT DISPLAY FUNCOES
      * CPD      : INEFE
      *****************************************************************
      ****************************************************************
      **           I D          D I V I S I O N                    ***
      ****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    COBOL013.
      ****************************************************************
      **           D A T A      D I V I S I O N                    ***
      ****************************************************************
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
      ****************************************************************
      **  DECLARATIONS FOR THE LOCAL DATE/TIME SERVICE.
      ****************************************************************
       01   FEEDBACK.
        02   FB-SEVERITY      PIC 9(4) BINARY.
        02   FB-DETAIL        PIC X(10).
      *
       77   DEST-OUTPUT       PIC S9(9) BINARY.
       77   LILDATE           PIC S9(9) BINARY.
       77   LILSECS           COMP-2.
       77   GREG              PIC X(17).
      ****************************************************************
      **  DECLARATIONS FOR THE LOCAL DATE/TIME FOR DISPLAY
      ****************************************************************
       01  WSS-CAMPOS-AUXILIARES.
           05 WSS-YYYYMMDD          PIC  X(008).
           05 WSS-YYMMDD            PIC  X(006).
           05 WSS-HHMMSS            PIC  X(006).
           05 WSS-HHMMSSCC          PIC  X(008).
           05 WSS-DIA-SEMANA        PIC  9(001).
           05 WSS-ANO-DIA           PIC  9(005).
           05 WSS-DAY-YYYYDDD       PIC  9(007).
      ****************************************************************
      **  DECLARATIONS FOR MESSAGES AND PATTERN FOR DATE FORMATTING.
      ****************************************************************
       01   PATTERN.
        02                    PIC 9(4) BINARY VALUE 45.
        02                    PIC X(45) VALUE
            "TODAY IS WWWWWWWWWWWWZ, MMMMMMMMMMZ ZD, YYYY.".
       77   START-MSG         PIC X(80) VALUE
            "CALLABLE SERVICE EXAMPLE STARTING.".

       77   ENDING-MSG        PIC X(80) VALUE
            "CALLABLE SERVICE EXAMPLE ENDING.".
       77   STR               PIC X(100) VALUE " ".
       77   STRING-LEN        PIC X(080) VALUE " ".
      ****************************************************************
      **           P R O C      D I V I S I O N                    ***
      ****************************************************************
       PROCEDURE DIVISION.
      *
       000-MAIN-LOGIC.
           DISPLAY '  '.
           DISPLAY '000-MAIN-LOGIC'.
           DISPLAY '  '.
           DISPLAY '  '.

           PERFORM 100-SAY-HELLO
              THRU 300-SAY-GOODBYE.

           PERFORM 200-GET-DATE.

           PERFORM 300-SAY-GOODBYE.

           STOP RUN.
      **
      ** SETUP INITIAL VALUES AND SAY WE ARE STARTING.
      **
       100-SAY-HELLO.

           DISPLAY '  '.
           DISPLAY '100-SAY-HELLO'.
           DISPLAY '  '.
           DISPLAY '  '.
      *
           MOVE 80 TO STRING-LEN.
           MOVE 02 TO DEST-OUTPUT.
           MOVE START-MSG TO STR.
           DISPLAY 'START-MSG'.

       100-SAY-HELLO-EXIT.
           EXIT.
      *
       200-GET-DATE.

           DISPLAY '  '.
           DISPLAY '200-GET-DATE'.
           DISPLAY '  '.
           DISPLAY '  '.

           ACCEPT WSS-DAY-YYYYDDD FROM DAY YYYYDDD.
           ACCEPT WSS-YYYYMMDD    FROM DATE YYYYMMDD.
           ACCEPT WSS-YYMMDD      FROM DATE.
           ACCEPT WSS-HHMMSS      FROM TIME.
           ACCEPT WSS-HHMMSSCC    FROM TIME.
           ACCEPT WSS-DIA-SEMANA  FROM DAY-OF-WEEK.
           ACCEPT WSS-ANO-DIA     FROM DAY.

       200-GET-DATE-EXIT.
           EXIT.

       300-SAY-GOODBYE.

             DISPLAY '  '.
             DISPLAY '300-SAY-GOODBYE'.
             DISPLAY '  '.
             DISPLAY '  '.
             DISPLAY "WSS-DAY-YYYYDDD - " WSS-DAY-YYYYDDD
             DISPLAY "WSS-YYYYMMDD   - " WSS-YYYYMMDD
             DISPLAY "WSS-YYMMDD     - " WSS-YYMMDD
             DISPLAY "WSS-HHMMSS     - " WSS-HHMMSS
             DISPLAY "WSS-HHMMSSCC   - " WSS-HHMMSSCC
             DISPLAY "WSS-DIA-SEMANA - " WSS-DIA-SEMANA
             DISPLAY 'ENDING-MSG'.
             DISPLAY " ".
             DISPLAY "BOA NOITE A TODOS".

       300-SAY-GOODBYE-EXIT.
             EXIT.

       END PROGRAM COBOL013.
      ********************* FIM DO PROGRAMA ****************************
