      *****************************************************************
      * DATA     :  05/01/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : ESTRUTURA DO COBOL AS 4 DIVISOES
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL008.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 05/01/24 @ 22:59:54.
       DATE-COMPILED. 2024-01-05.
      *
       ENVIRONMENT DIVISION.
      *
       CONFIGURATION SECTION.
      *
       SPECIAL-NAMES.
      *
           DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT SECTION.
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
      *
      *77 WSS-NUM                    PIC 999 VALUE ZERO.
       77 WSS-NUM                    PIC 999.
       77 WSS-DAY-YYYYDDD            PIC 9(07).
       77 WSS-DAY-YYYYMMDD           PIC 9(08).
       77 WSS-YYYYMMDD               PIC 9(08).
       77 WSS-DAY-YYMMDD             PIC 9(06).
       77 WSS-HHMMSS                 PIC 9(06).
       77 WSS-HHMMSSCC               PIC 9(10).
       77 WSS-TIMESTAMP              PIC 9(21).
       77 WSS-DIA-SEMANA             PIC 9.
       77 WSS-HELLO-WORLD            PIC A(20) VALUE 'HELLO WORLD'.

       PROCEDURE DIVISION.
      *
       000-SESSAO-INICIAL.

           DISPLAY '000-SESSAO-INICIAL'.

           PERFORM 100-SAY-HELLO
              THRU 300-SAY-GOODBYE.

           PERFORM 400-LIMPA.

           PERFORM 200-GET-DATE.

           PERFORM 300-SAY-GOODBYE.

       099-SESSAO-FINAL.

           DISPLAY '099-SESSAO-FINAL'.

           STOP RUN.

       100-SAY-HELLO.

           DISPLAY ' '.
           DISPLAY '100-SAY-HELLO'.

           DISPLAY WSS-HELLO-WORLD.

           DISPLAY ' '.

       100-SAY-HELLO-EXIT.
           EXIT.

       200-GET-DATE.

           DISPLAY ' '.
           DISPLAY '200-GET-DATE'.
           DISPLAY ' '.
           MOVE 'FUNCOES INTRISECAS ' TO WSS-HELLO-WORLD
           DISPLAY WSS-HELLO-WORLD.


           ACCEPT WSS-DAY-YYYYDDD  FROM DAY.
           ACCEPT WSS-DAY-YYYYMMDD FROM DATE.
           ACCEPT WSS-DAY-YYMMDD   FROM DATE.

           MOVE FUNCTION CURRENT-DATE (1:8) TO WSS-YYYYMMDD.

           ACCEPT WSS-HHMMSS       FROM TIME.
           ACCEPT WSS-HHMMSSCC     FROM TIME.
           ACCEPT WSS-TIMESTAMP    FROM TIME.

           MOVE  FUNCTION CURRENT-DATE TO WSS-TIMESTAMP

           ACCEPT WSS-DIA-SEMANA   FROM DAY-OF-WEEK.

       200-GET-DATE-EXIT.
           EXIT.

       300-SAY-GOODBYE.

           DISPLAY ' '.
           DISPLAY '300-SAY-GOODBYE'.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' WSS-DAY-YYYYDDD  ' WSS-DAY-YYYYDDD.
           DISPLAY ' WSS-DAY-YYYYMMDD ' WSS-DAY-YYYYMMDD.
           DISPLAY ' WSS-YYYYMMDD     ' WSS-YYYYMMDD.
           DISPLAY ' WSS-DAY-YYMMDD   ' WSS-DAY-YYMMDD.
           DISPLAY ' WSS-HHMMSS       ' WSS-HHMMSS.
           DISPLAY ' WSS-HHMMSSCC     ' WSS-HHMMSSCC.
           DISPLAY ' WSS-TIMESTAMP    ' WSS-TIMESTAMP.
           DISPLAY ' WSS-DIA-SEMANA   ' WSS-DIA-SEMANA.
           DISPLAY ' WSS-NUM  01      ' WSS-NUM.
           MOVE 456                    TO WSS-NUM.
           DISPLAY ' WSS-NUM  02      ' WSS-NUM.
           MOVE 12                     TO WSS-NUM.
           DISPLAY ' WSS-NUM  03      ' WSS-NUM.
           DISPLAY ' '.

       300-SAY-GOODBYE-EXIT.
           EXIT.

       400-LIMPA.

           INITIALIZE WSS-DAY-YYYYDDD.
           INITIALIZE WSS-HELLO-WORLD.
           INITIALIZE WSS-DAY-YYYYMMDD.
           INITIALIZE WSS-DAY-YYMMDD.
           INITIALIZE WSS-HHMMSS.
           INITIALIZE WSS-HHMMSSCC.
           INITIALIZE WSS-DIA-SEMANA.

           DISPLAY ' '.
           DISPLAY '400-LIMPA'.
           DISPLAY ' '.
           DISPLAY ' WSS-HELLO-WORLD  ' WSS-HELLO-WORLD.
           DISPLAY ' WSS-DAY-YYYYDDD  ' WSS-DAY-YYYYDDD.
           DISPLAY ' WSS-DAY-YYYYMMDD ' WSS-DAY-YYYYMMDD.
           DISPLAY ' WSS-DAY-YYMMDD   ' WSS-DAY-YYMMDD.
           DISPLAY ' WSS-HHMMSS       ' WSS-HHMMSS.
           DISPLAY ' WSS-HHMMSSCC     ' WSS-HHMMSSCC.
           DISPLAY ' WSS-DIA-SEMANA   ' WSS-DIA-SEMANA.
           DISPLAY ' '.

       400-LIMPA-EXIT.
           EXIT.
      *
      *END COBOL008.
      ********************* FIM DO PROGRAMA ****************************
