      *****************************************************************
      * DATA     :  26/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO USO class
      *            USO clausula alphabetic e is
      * CPD      : INEFE
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************
      *
       PROGRAM-ID. COBOL114
      *
       AUTHOR. VAGNER BELLACOSA.
       INSTALLATION. INEFE CPD MARIST.
       DATE-WRITTEN. 26/08/24 @ 19:52:00.
       DATE-COMPILED. 2024-08-26.
       INSTALLATION. INEFE.
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
       SPECIAL-NAMES.
      *
      *
           CLASS CLS-HEXNUMBER IS "0" THRU "9", "A" THRU "F"
           CLASS CLS-REALNAME IS "A" THRU "Z", "a" THRU "z", "'", SPACE.
      *
      ****************
       DATA DIVISION.
      ****************
      *
       WORKING-STORAGE SECTION.
      *
       77 WSS-NUMIN             PIC X(4).
       77 WSS-NAMEIN            PIC X(15).
      *
      *-------------------
       PROCEDURE DIVISION.
      *-------------------
      *
       MAIN_SECTION        SECTION.

           DISPLAY ' COBOL114  '.
           DISPLAY ' USO DE CLASS'
           DISPLAY ' '.

      ***  HEX NUMBER"
           ACCEPT WSS-NUMIN.

           DISPLAY ' WSS-NUMIN = ' WSS-NUMIN ' ' LENGTH OF WSS-NUMIN
           ' BYTES '

           IF WSS-NUMIN IS CLS-HEXNUMBER THEN
             DISPLAY WSS-NUMIN " IS A HEX NUMBER"
           ELSE
             DISPLAY WSS-NUMIN " IS NOT A HEX NUMBER"
           END-IF

           DISPLAY ' '.

      *    NOME EM CARACTERES
           ACCEPT WSS-NAMEIN

           DISPLAY ' WSS-NAMEIN = ' WSS-NUMIN ' ' LENGTH OF WSS-NAMEIN
           ' BYTES '

           IF WSS-NAMEIN IS ALPHABETIC
             DISPLAY WSS-NAMEIN " IS ALPHABETIC"
           ELSE
             DISPLAY WSS-NAMEIN " IS NOT ALPHABETIC"
           END-IF

           IF WSS-NAMEIN IS CLS-REALNAME THEN
             DISPLAY WSS-NAMEIN " IS A REAL NAME"
           ELSE
             DISPLAY WSS-NAMEIN " IS NOT A REAL NAME"
           END-IF

           STOP RUN.

       END PROGRAM COBOL114.
      ********************** FIM DO PROGRAMA ***************************
