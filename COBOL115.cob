      *****************************************************************
      * DATA     :  27/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO SET & ADDRESS OF
      *            APONTADO PONTO DE
      * CPD      : INEFE
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************
      *
       PROGRAM-ID. COBOL115
      *
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 27/08/24 @ 19:52:00.
       DATE-COMPILED. 2024-08-27.
       INSTALLATION. INEFE CPD MARIST.
       SECURITY. PROGRAMA EDUCACIONAL.
      *
      **********************
       ENVIRONMENT DIVISION.
      **********************
      *
       CONFIGURATION SECTION.
      *
       SOURCE-COMPUTER. IBM-370 WITH DEBUGGING MODE.
      *
       OBJECT-COMPUTER. IBM-370.
      *
      ****************
       DATA DIVISION.
      ****************
      *
       WORKING-STORAGE SECTION.
      *
       01  VAR-P               USAGE POINTER.
       01  VAR-W                    PIC X(2).
      *
       LINKAGE SECTION.
      *
       01  VAR-L                           PIC X(2).
      *
      *-------------------
       PROCEDURE DIVISION.
      *-------------------
      *
       MAIN_SECTION        SECTION.

           DISPLAY ' COBOL115  '.
           DISPLAY ' USO DE USAGE POINTER, SET E ADDRESS OF '
           DISPLAY ' '.

           SET VAR-P TO ADDRESS OF VAR-W.
           SET VAR-P TO ADDRESS OF VAR-L.

           DISPLAY VAR-P.

           STOP RUN.

       END PROGRAM COBOL115.
      ********************** FIM DO PROGRAMA ***************************
