      *****************************************************************
      * DATA     : 12/09/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA TORRE DE HANOI
      *            AGRADECIMENTO A UWE GRAF
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL124.
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
       77  NUM-DISKS                   PIC 9 VALUE 4.
       77  STACK-POINTER               PIC 9 USAGE COMP.
       77  OLD-POINTER                 PIC 9 USAGE COMP.
      *
       01  GAMESET.
         05  STACK OCCURS 10 TIMES.
           10 N                        PIC 9 USAGE COMP.
           10 FROM-POLE                PIC 9 USAGE COMP.
           10 TO-POLE                  PIC 9 USAGE COMP.
           10 VIA-POLE                 PIC 9 USAGE COMP.
      *
      * TOWERS OF HANOI. ASSUMES PARAGRAPHS CAN BE CALLED RECURSIVELY
      *
      ********************
       PROCEDURE DIVISION.
      ********************

       HANOI.

           DISPLAY "TOWERS OF HANOI PUZZLE WITH ", NUM-DISKS, " DISKS.".

           MOVE 1         TO STACK-POINTER.
           MOVE NUM-DISKS TO N (STACK-POINTER).
           MOVE 1         TO FROM-POLE (STACK-POINTER).
           MOVE 2         TO TO-POLE (STACK-POINTER).
           MOVE 3         TO VIA-POLE (STACK-POINTER).

           PERFORM CHECK-MOVE.

           DISPLAY "TOWERS OF HANOI PUZZLE COMPLETED!".

           STOP RUN.
      *
       CHECK-MOVE.

           IF N(STACK-POINTER) > 0
             PERFORM MOVE-DISK
           END-IF.

       MOVE-DISK.

           MOVE STACK-POINTER TO OLD-POINTER.

           ADD 1 TO STACK-POINTER.

           SUBTRACT 1 FROM N(OLD-POINTER)
                      GIVING N(STACK-POINTER)
           END-SUBTRACT.

           MOVE FROM-POLE (OLD-POINTER) TO FROM-POLE (STACK-POINTER).
           MOVE VIA-POLE (OLD-POINTER)  TO TO-POLE (STACK-POINTER).
           MOVE TO-POLE (OLD-POINTER)   TO VIA-POLE (STACK-POINTER).

           PERFORM CHECK-MOVE.

           SUBTRACT 1 FROM STACK-POINTER
                  GIVING OLD-POINTER
           END-SUBTRACT.

           DISPLAY "MOVE DISK FROM ", FROM-POLE (OLD-POINTER),
               " TO ", TO-POLE (OLD-POINTER).

           SUBTRACT 1 FROM N (OLD-POINTER)
               GIVING N (STACK-POINTER)
           END-SUBTRACT.

           MOVE VIA-POLE (OLD-POINTER)  TO FROM-POLE (STACK-POINTER).
           MOVE TO-POLE (OLD-POINTER)   TO TO-POLE (STACK-POINTER).
           MOVE FROM-POLE (OLD-POINTER) TO VIA-POLE (STACK-POINTER).

           PERFORM CHECK-MOVE.

           SUBTRACT 1 FROM STACK-POINTER.

       END PROGRAM COBOL124.
      ******************************************************************
