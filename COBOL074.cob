      *****************************************************************
      * DATA     :  06/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA ADDRESS OF
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL074

       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 06/06/23 @ 22:40:00.
       DATE-COMPILED. 2023-06-06.
       INSTALLATION. INEFE CPD MARIST EDUCATIONAL.
       SECURITY. PROGRAMA EDUCACIONAL.
      *
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
       01  VAR-P     USAGE POINTER.
       01  VAR-W                           PIC X(2).
      *
       LINKAGE SECTION.
      *
       01  VAR-TEXT.
         05  VAR-L-COMP                    PIC 9(4) COMP.
         05  VAR-L                         PIC X(2).
      *
      ************************************
       PROCEDURE DIVISION USING VAR-TEXT.
      ************************************
           DISPLAY 'COBOLL064'.
           DISPLAY 'USO ADDRESS OF                   '.

           DISPLAY ' VAR-W  = ' VAR-W.

       MAIN1.

      ***** NAO FUNCIONARA, ENDERECO DE WORKING
            SET VAR-P TO ADDRESS OF VAR-W.

           DISPLAY ' ENDERECO VAR-W'.
           DISPLAY ' VAR-L  = ' VAR-L.
           DISPLAY ' VAR-W  = ' VAR-W.
           DISPLAY ' VAR-P  = ' VAR-P.
      ***** FUNIONA APONTA PARA O ENDERECO DA LINKAGE
            SET VAR-P TO ADDRESS OF VAR-L.

           DISPLAY ' ENDERECO VAR-L'.
           DISPLAY ' VAR-L  = ' VAR-L.
           DISPLAY ' VAR-W  = ' VAR-W.
           DISPLAY ' VAR-P  = ' VAR-P.

           STOP RUN.

       END PROGRAM COBOL074.
      ********************** FIM PROGRAMA   ****************************
