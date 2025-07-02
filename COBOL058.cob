      *****************************************************************
      * DATA     :  12/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXAMPLO NIVEL 66 RENAME VARIAVEL
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL058.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 12/06/23 @ 17:15:00.
       DATE-COMPILED. 2023-06-12.
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
       01 WSS-VAR.
          02 WSS-GRP-ITEM1.
             05 WSS-VAR1      PIC X(10) VALUE "COBOL".
             05 FILLER        PIC X(01).
             05 WSS-VAR2      PIC X(08) VALUE "LENDARIO".
             05 FILLER        PIC X(01).
             05 WSS-VAR3      PIC X(01) VALUE "E".
             05 FILLER        PIC X(01).
             05 WSS-VAR4      PIC X(18) VALUE "SEUS PROGRAMADORES".
             05 FILLER        PIC X(01).
             05 WSS-VAR5      PIC X(10) VALUE "UNICOS".
      *
      * RENAMING WSS-GRP-ITEM1
          66 WSS-GRP-ITEM2  RENAMES WSS-VAR1 THROUGH WSS-VAR2.
          66 WSS-GRP-ITEM3  RENAMES WSS-VAR1 THROUGH WSS-VAR3.
          66 WSS-GRP-ITEM4  RENAMES WSS-VAR1 THROUGH WSS-VAR4.
          66 WSS-GRP-ITEM5  RENAMES WSS-VAR1 THROUGH WSS-VAR5.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL058'.
           DISPLAY 'PROGRAMA EXAMPLO NIVEL 66 RENAME VARIAVEL'.
           DISPLAY ' '.
           DISPLAY ' WSS-VAR       = ' WSS-VAR ' '  LENGTH OF WSS-VAR
                   ' BYTES '.
           DISPLAY ' WSS-GRP-ITEM1 = ' WSS-GRP-ITEM1
                   LENGTH OF WSS-GRP-ITEM1
                   ' BYTES '.
           DISPLAY ' WSS-VAR1      = ' WSS-VAR1     .
           DISPLAY ' WSS-VAR2      = ' WSS-VAR2     .
           DISPLAY ' WSS-VAR3      = ' WSS-VAR3     .
           DISPLAY ' WSS-VAR4      = ' WSS-VAR4     .
           DISPLAY ' WSS-VAR5      = ' WSS-VAR5     .
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.

      *****X***********************************************************

           DISPLAY ' EXEMPLO DO USO DE RENAMES '.
           DISPLAY ' '.

           DISPLAY "GROUP ITEM1: " WSS-GRP-ITEM1.

           DISPLAY "GROUP ITEM2: " WSS-GRP-ITEM2.

           DISPLAY "GROUP ITEM3: " WSS-GRP-ITEM3.

           DISPLAY "GROUP ITEM4: " WSS-GRP-ITEM4.

           DISPLAY "GROUP ITEM5: " WSS-GRP-ITEM5.

           MOVE 'PLI EH     LENDARIO'        TO WSS-GRP-ITEM2.

           DISPLAY "GROUP ITEM1: " WSS-GRP-ITEM1.

           STOP RUN.

       END PROGRAM COBOL058.
      ********************** FIM DO PROGRAMA **************************
