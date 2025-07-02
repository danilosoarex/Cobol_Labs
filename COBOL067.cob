      *****************************************************************
      * DATA     :  06/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA PERFORM INLINE
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL067
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 20/06/23 @ 21:35:00.
       DATE-COMPILED. 2023-06-20.
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
       01 WSS-DATA-COMPIL           PIC X(16) VALUE SPACES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL067'.
           DISPLAY 'EXEMPLO PERFOM INLINE '.

           DISPLAY ' SEU USO E IDEAL QUANDO QUEREMOS LIMITAR UMA'.
           DISPLAY ' LOGICA ESPECIFICA, DANDO DESTAQUE AO TRECHO'.

           PERFORM
             MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL
             DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL
             DISPLAY ' '
           END-PERFORM.

           STOP RUN.

       END PROGRAM COBOL067.
      ********************** FIM PROGRAMA   ****************************
