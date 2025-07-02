      *****************************************************************
      * DATA     :  21/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO CALL EXECUTANDO COMANDO NO TSO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL069
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 21/06/23 @ 12:15:00.
       DATE-COMPILED. 2023-06-21.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************


      ***************
       DATA DIVISION.
      ***************
      *
       WORKING-STORAGE SECTION.
      *
      * DECLARACOES DE ARMAZENAMENTO EM FUNCIONAMENTO
       01 PARM1                   PIC S9(9) COMP.
       01 PARM2                   PIC X(80).
       01 PARM3                   PIC S9(9) VALUE +80 COMP.
       01 PARM4                   PIC S9(9) VALUE  +0 COMP.
       01 PARM5                   PIC S9(9) VALUE +0 COMP.
       01 PARM6                   PIC S9(9) VALUE +0 COMP.
      *
       77 WSS-DATA-COMPIL             PIC X(16).
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL069'.
           DISPLAY 'CALL EXECUTANDO COMANDO NO TSO   '.

           DISPLAY ' '
           MOVE FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL
           DISPLAY ' '

           MOVE 261        TO PARM1

      *    MOVE 'ALLOCATE FI(MYDDNAME) DA(''MY.OWN.DATASET'') SHR'
      *                                      TO PARM2
           MOVE 'ALLOCATE FI(JCL1234)
      -          'DA(''KC02746.WORKBOOK.COBOL'') SHR'
                                             TO PARM2
           CALL 'TSOLNK' USING PARM1 PARM2 PARM3 PARM4 PARM5 PARM6

           IF RETURN-CODE NOT = 0
             DISPLAY 'ALLOC FAILED WITH TSO RETURN-CODE = ' RETURN-CODE
           END-IF

           STOP RUN.

       END PROGRAM COBOL069.
      ********************** FIM PROGRAMA   ****************************
