      *****************************************************************
      * DATA     :  23/01/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO INTRISEC FUNCTIONS DATE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL046.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 23/01/24 @ 21:41:00.
       DATE-COMPILED. 2024-01-23.
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
       01  WSS-CURRENT-DATE-FIELDS.
          05  WSS-CURRENT-DATE.
              10  WSS-CURRENT-YEAR   PIC  9(4).
              10  WSS-CURRENT-MONTH  PIC  9(2).
              10  WSS-CURRENT-DAY    PIC  9(2).
          05  WSS-CURRENT-TIME.
              10  WSS-CURRENT-HOURS  PIC  9(2).
              10  WSS-CURRENT-MINUTE PIC  9(2).
              10  WSS-CURRENT-SECOND PIC  9(2).
              10  WSS-CURRENT-MS     PIC  9(2).
          05  WSS-DIFF-FROM-GMT      PIC S9(4).
      *
       01  WSS-TODAY        PIC 9(8).
       01  WSS-FUTURE-DATE  PIC 9(8).
      *
       01 WSS-DATETIME             PIC X(21).
       01 WSS-JULIAN               PIC 9(06).
       01 WSS-JULIAN-DATE          PIC 9(06).
       01 WSS-JUL-DATE             PIC 9(06).
       01 WSS-INTEGER-DATE         PIC 9(08).
       01 WSS-INT-DATE             PIC 9(08).
       01 WSS-CURRENT-DATE-DATA    PIC 9(21).
       01 WSS-DAYS                 PIC 9(03).
       01 WSS-DATE                 PIC 9(08).
       01 WSS-DATE-1               PIC 9(08).
       01 WSS-DATE-2               PIC 9(08).
      *
       01 WSS-FORMATTED-DT.
          05 WSS-FORMATTED-DTE-TME.
             15 WSS-FORMATTED-YEAR PIC  9(4).
             15 FILLER             PIC X VALUE '-'.
             15 WSS-FORMATTED-MONTH PIC 9(2).
             15 FILLER             PIC X VALUE '-'.
             15 WSS-FORMATTED-DY   PIC  9(2).
             15 FILLER             PIC X VALUE '-'.
             15 WSS-FORMATTED-HOUR PIC  9(2).
             15 FILLER             PIC X VALUE ':'.
             15 WSS-FORMATTED-MINS PIC  9(2).
             15 FILLER             PIC X VALUE ':'.
             15 WSS-FORMATTED-SEC  PIC  9(2).
             15 FILLER             PIC X VALUE ':'.
             15 WSS-FORMATTED-MS   PIC  9(2).
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL046'.
           DISPLAY 'EXEMPLO DE FUNCOES COM DATA     '.
           DISPLAY ' '.
      *
       0000-MAIN-PARA.

           INITIALIZE WSS-CURRENT-DATE-DATA.

           DISPLAY ' 0000-MAIN-PARA'.

           MOVE FUNCTION CURRENT-DATE TO WSS-CURRENT-DATE-DATA.

           DISPLAY ' WSS-CURRENT-DATE-DATA = '
                     WSS-CURRENT-DATE-DATA.
           DISPLAY ' '.

       0010-EXEMPLO-01.

           DISPLAY ' 0010-EXEMPLO-01';

           MOVE FUNCTION CURRENT-DATE TO WSS-DATETIME.
           MOVE WSS-DATETIME(1:4)     TO WSS-FORMATTED-YEAR.
           MOVE WSS-DATETIME(5:2)     TO WSS-FORMATTED-MONTH.
           MOVE WSS-DATETIME(7:2)     TO WSS-FORMATTED-DY.
           MOVE WSS-DATETIME(9:2)     TO WSS-FORMATTED-HOUR.
           MOVE WSS-DATETIME(11:2)    TO WSS-FORMATTED-MINS.
           MOVE WSS-DATETIME(13:2)    TO WSS-FORMATTED-SEC.
           MOVE WSS-DATETIME(15:2)    TO WSS-FORMATTED-MS.

           DISPLAY ' WSS-DATETIME = '
                   WSS-DATETIME.
           DISPLAY ' WSS-FORMATTED-DT = '
                   WSS-FORMATTED-DT.
           DISPLAY ' '.

       0020-EXEMPLO-02.

           DISPLAY ' 0020-EXEMPLO-02'.

           MOVE FUNCTION CURRENT-DATE TO WSS-CURRENT-DATE-FIELDS

           DISPLAY ' WSS-CURRENT-DATE-FIELDS= '
                     WSS-CURRENT-DATE-FIELDS

           DISPLAY ' '.

       0030-EXEMPLO-03.

           DISPLAY ' 0030-EXEMPLO-03'.

           MOVE FUNCTION CURRENT-DATE (1:8) TO WSS-TODAY.

           DISPLAY ' WSS-TODAY = '
                    WSS-TODAY

           COMPUTE WSS-FUTURE-DATE =
                         FUNCTION INTEGER-OF-DATE (WSS-TODAY)

           DISPLAY ' WSS-FUTURE-DATE = '
                    WSS-FUTURE-DATE

           MOVE 19791023  TO WSS-DATE

           DISPLAY ' WSS-DATE = '
                   WSS-DATE

           COMPUTE WSS-INTEGER-DATE =
                         FUNCTION INTEGER-OF-DATE (WSS-DATE)

           DISPLAY ' WSS-INTEGER-DATE = '
                    WSS-INTEGER-DATE

           MOVE 00138357 TO WSS-INT-DATE

           DISPLAY ' WSS-INT-DATE = '
                   WSS-INT-DATE

           COMPUTE WSS-DATE =
                         FUNCTION DATE-OF-INTEGER (WSS-INT-DATE)

           DISPLAY ' WSS-DATE = '
                   WSS-DATE

           MOVE 2024113  TO WSS-JUL-DATE

           COMPUTE WSS-INTEGER-DATE =
                         FUNCTION INTEGER-OF-DAY (WSS-JUL-DATE)

           DISPLAY ' WSS-JUL-DATE     = '
                   WSS-JUL-DATE

           DISPLAY ' WSS-INTEGER-DATE = '
                   WSS-INTEGER-DATE

           MOVE 19740314 TO WSS-INT-DATE

           DISPLAY ' WSS-INT-DATE = '
                   WSS-INT-DATE

           COMPUTE WSS-JULIAN-DATE =
                         FUNCTION DAY-OF-INTEGER (WSS-INT-DATE)

           DISPLAY ' WSS-JULIAN-DATE = '
                   WSS-JULIAN-DATE

           MOVE 19790726            TO WSS-DATE-2
           MOVE 19830911            TO WSS-DATE-1

           DISPLAY ' WSS-DATE-1 = ' WSS-DATE-1
           DISPLAY ' WSS-DATE-2 = ' WSS-DATE-2

           COMPUTE WSS-DAYS = FUNCTION INTEGER-OF-DATE (WSS-DATE-1)
                       - FUNCTION INTEGER-OF-DATE (WSS-DATE-2)

           DISPLAY ' WSS-DAYS = '
                   WSS-DAYS

           COMPUTE WSS-DATE = FUNCTION DATE-OF-INTEGER
                        (FUNCTION INTEGER-OF-DAY (WSS-JULIAN))


           DISPLAY ' WSS-DATE = '
                   WSS-DATE.

       9999-MAIN-EXIT.
           STOP RUN.

       END PROGRAM COBOL046.
      ********************** FIM PROGRAMA   ****************************
