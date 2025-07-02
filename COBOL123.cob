      *****************************************************************
      * DATA     : 12/09/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA TORRE DE HANOI
      *            AGRADECIMENTO A UWE GRAF
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL123.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 12/09/24 @ 21:18:00.
       DATE-COMPILED. 2024-09-12.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************
      *
       CONFIGURATION SECTION.
      *
       INPUT-OUTPUT SECTION.
      *
      ***************
       DATA DIVISION.
      ***************
      *
       WORKING-STORAGE SECTION.
      *
       01 DISK-STACK.
         05 DISK-NUMBER         PIC S9(3) COMP.
         05 STACK-ITEM          OCCURS 99 TIMES.
           10 DISK-NBR          PIC 99.
           10 SOURCE-STACK      PIC X(06).
           10 DEST-STACK        PIC X(06).
           10 SPARE-STACK       PIC X(06).
           10 WHAT              PIC 9.
      *
       01 LCL.
         05 LCL-DISK-NBR        PIC 99.
         05 LCL-SOURCE-STACK    PIC X(06) VALUE 'SOURCE'.
         05 LCL-DEST-STACK      PIC X(06) VALUE 'DEST'.
         05 LCL-SPARE-STACK     PIC X(06) VALUE 'SPARE'.
         05 LCL-WHAT            PIC 9.
      *
       01 FILLER.
         05 SWAP-STACK          PIC X(6).
         05 TO-DO               PIC 9.
      *
       77  WSS-DATA-COMPIL      PIC X(16).
       77  WSS-MESSAGE          PIC X(80).
      *
       LOCAL-STORAGE SECTION.
      *
       LINKAGE SECTION.
      *
       01 LS-PARAMETER.
         05 LS-PARM-LEN         PIC 9(04) COMP.
         05 LS-PARM-DISK-NUM    PIC X(80).
         05 FILLER REDEFINES LS-PARM-DISK-NUM.
           10 LS-PARM-DISK-NUMBER PIC 9(18).

      *
      ****************************************
       PROCEDURE DIVISION USING LS-PARAMETER.
      ****************************************
      *
       MAIN-SECTION           SECTION.

           PERFORM ROT-HEADER
              THRU ROT-HEADER-EXIT.

           PERFORM ROT-VALID-PARM
              THRU ROT-VALID-PARM-EXIT.

           PERFORM ROT-INIT-MOVE
              THRU ROT-INIT-MOVE-EXIT.

           STOP RUN.
      *
      ******************************************************************
      * CODE SECTION
      ******************************************************************
       CODE-SECTION      SECTION.

      *
      * DISPLAY HEADER PROGRAM
      *
       ROT-HEADER.

           DISPLAY 'COBOL123'
           DISPLAY 'HANOI TOWER CHALLENGE'
           DISPLAY 'FUNNY COBOL'
           DISPLAY ' '.

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

       ROT-HEADER-EXIT.
           EXIT.

      *
      * VALIDATE PARM PARAMETERS
      *
       ROT-VALID-PARM.

           DISPLAY ' '.
           DISPLAY '*******************************************'
           DISPLAY '*** PARAMETERS RECEIVED IN THIS PROCESS ***'
           DISPLAY '*** LS-PARM-LEN = ' LS-PARM-LEN
                                             ' BYTES        ***'
           DISPLAY '*** LS-PARM-DISK-NUM = '
                        LS-PARM-DISK-NUM
           DISPLAY '*******************************************'
           DISPLAY ' '.

           IF LS-PARM-LEN = 0
             MOVE 'PARM IS MISSING'   TO WSS-MESSAGE
             MOVE 110                 TO RETURN-CODE
             PERFORM ROT-ABEND
           END-IF.

           IF LS-PARM-LEN > 80
             MOVE 'PARM IS TOO BIG'   TO WSS-MESSAGE
             MOVE 120                 TO RETURN-CODE
             PERFORM ROT-ABEND
           END-IF.

           IF LS-PARM-DISK-NUM EQUAL SPACES
             MOVE 'SPACE IS INVALID PARM'  TO WSS-MESSAGE
             MOVE 130                 TO RETURN-CODE
             PERFORM ROT-ABEND
           END-IF.

           IF LS-PARM-DISK-NUMBER EQUAL ZEROES
             MOVE 'ZEROES IS INVALID PARM'  TO WSS-MESSAGE
             MOVE 140                 TO RETURN-CODE
             PERFORM ROT-ABEND
           END-IF.

           IF FUNCTION NUMVAL(LS-PARM-DISK-NUM(1:LS-PARM-LEN))> 99
             MOVE 'NUMBER IS GREATER THAN 99'  TO WSS-MESSAGE
             MOVE 150                 TO RETURN-CODE
             PERFORM ROT-ABEND
           ELSE
             COMPUTE LCL-DISK-NBR =
                     FUNCTION NUMVAL(LS-PARM-DISK-NUM(1:LS-PARM-LEN))
             END-COMPUTE
           END-IF.


       ROT-VALID-PARM-EXIT.
           EXIT.

      *
      * FIRST MOVE OF HANOI TOWER
      *
       ROT-INIT-MOVE.

           DISPLAY '-------------------------------------------------'
           DISPLAY 'DISK NUMBERS    : ' LCL-DISK-NBR
           DISPLAY '-------------------------------------------------'

           MOVE 1 TO DISK-NUMBER, TO-DO
           MOVE LCL TO STACK-ITEM (1)

      *    LOOPING FOR MOVE ALL DISKS
           PERFORM MOVE-ONE
             UNTIL DISK-NUMBER = 0

           DISPLAY '-------------------------------------------------'.

       ROT-INIT-MOVE-EXIT.
           EXIT.

      *
      * MOVES DISKS AND VALIDATE NEXT POINTER
      *
       MOVE-ONE.

           MOVE STACK-ITEM(DISK-NUMBER) TO LCL

           IF TO-DO = 1
             PERFORM MOVE-DISKS-AWAY
           ELSE
             IF TO-DO = 2
               PERFORM  SHOW-DISK-MOVED
             ELSE
               IF TO-DO = 3
                 PERFORM MOVE-DISKS-BACK
               ELSE
                 MOVE WHAT(DISK-NUMBER) TO TO-DO
                 SUBTRACT 1 FROM DISK-NUMBER
               END-IF
             END-IF
           END-IF.

       MOVE-ONE-EXIT.
           EXIT.

      *
      * RETURN DISK TO HOME TOWER
      *
       MOVE-DISKS-BACK.

           MOVE LCL-SPARE-STACK  TO SWAP-STACK
           MOVE LCL-SOURCE-STACK TO LCL-SPARE-STACK
           MOVE SWAP-STACK       TO LCL-SOURCE-STACK

           PERFORM MOVE-THE-DISKS.

      *
      * DISPLAY SYSOUT
      *
       SHOW-DISK-MOVED.

           COMPUTE TO-DO = TO-DO + 1

           DISPLAY '*** MOVE DISK ' LCL-DISK-NBR
                   ' FROM '     LCL-SOURCE-STACK
                   ' TO '       LCL-DEST-STACK.

      *
      * CALCULATE NEW POSITION OF DISK
      *
       MOVE-THE-DISKS.

           ADD 1 TO TO-DO

           IF LCL-DISK-NBR > 1
              SUBTRACT 1    FROM LCL-DISK-NBR
              MOVE    TO-DO TO LCL-WHAT
              ADD 1         TO DISK-NUMBER
              MOVE    LCL   TO STACK-ITEM (DISK-NUMBER)
              MOVE    1     TO TO-DO
           END-IF.

      *
      * MOVE DISK FOR NEW POSITION
      *
       MOVE-DISKS-AWAY.

           MOVE LCL-SPARE-STACK TO SWAP-STACK
           MOVE LCL-DEST-STACK  TO LCL-SPARE-STACK
           MOVE SWAP-STACK      TO LCL-DEST-STACK

           PERFORM MOVE-THE-DISKS.

      *
      * ABEND - HOT OUTLET
      *
       ROT-ABEND.

           DISPLAY ' '
           DISPLAY '*************************************************'
           DISPLAY '*** ABEND ABEND ABEND ABEND ABEND ABEND ABEND ***'
           DISPLAY '*************************************************'
           DISPLAY '***                                           ***'
           DISPLAY '*** PLEASE NOTIFY THE RESPONSIBLE ANALYST     ***'
           DISPLAY '***                                           ***'
           DISPLAY '*** MESSAGE : ' WSS-MESSAGE
           DISPLAY '*** RETURN CODE : ' RETURN-CODE
           DISPLAY '***                                           ***'
           DISPLAY '*************************************************'.

           STOP RUN.

       ROT-ABEND-EXIT.
           EXIT.

       END PROGRAM COBOL123.
      ********************** FIM DO PROGRAMA ***************************
