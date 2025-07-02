      *****************************************************************
      * DATA     : 20/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO PONTEIRO COM ACESSO AO USER-ID
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL079.

       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 20/06/23 @ 10:50:00.
       DATE-COMPILED. 2023-06-20.
       INSTALLATION. INEFE CPD MARIST EDUCATIONAL.
       SECURITY. PROGRAMA EDUCACIONAL.

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
       01  WSS-PSA-POINTER POINTER.
       01  WSS-USERID           PIC X(8).
      *
       01 WSS-VARIAVEIS         PIC X(20) VALUE SPACES.
       01 WSS-COUNT             PIC 9(03) VALUE ZEROES.
       01 WSS-DATA-COMPIL       PIC X(16) VALUE SPACES.
       01 WSS-TAMANHO           PIC 9(04) VALUE ZEROES.
      *
       LINKAGE SECTION.
      *
       01  WSS-PSA.
         02  FILLER             PIC X(548).
         02  WSS-ASCB-POINTER POINTER.
       01  WSS-ASCB.
         02  FILLER             PIC X(108).
         02  WSS-ASXB-POINTER POINTER.
       01  WSS-ASXB.
         02  FILLER             PIC X(192).
         02  WSS-ASUSER         PIC X(8).
      *
      *************************************
       PROCEDURE DIVISION.
      *************************************

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.
           DISPLAY 'COBOL079'.
           DISPLAY 'EXEMPLO DE PONTEIRO BUSCA WSS-USERID'.
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

           SET WSS-PSA-POINTER     TO NULL
           SET ADDRESS OF WSS-PSA  TO WSS-PSA-POINTER
           SET ADDRESS OF WSS-ASCB TO WSS-ASCB-POINTER
           SET ADDRESS OF WSS-ASXB TO WSS-ASXB-POINTER

           MOVE WSS-ASUSER         TO WSS-USERID

           DISPLAY 'ADDRESS SPACE WSS-USERID = ' WSS-USERID

           STOP RUN.

       END PROGRAM COBOL079.
      ********************** FIM PROGRAMA   ****************************
