      *****************************************************************
      * DATA     :  30/05/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO HIERARQUIA DE VARIAVELS
      *            NIVEL 01 05 10 E DIVERSOS TIPOS DE VARIAVEIS
      *            USO DE REDEFINES
      *            EXEMPLO DE FILLER
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL017.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 30/05/23 @ 10:40:00.
       DATE-COMPILED. 2023-05-30.
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
       01  REG-ENTRADA.
         05 REG-COD-VENDA            PIC 9(05) VALUE ZEROES.
         05 REG-COD-PRODUTO.
           10 REG-COD-PRODT          PIC 9(04) VALUE ZEROES.
           10 REG-CHV-PRODT          PIC X(01) VALUE SPACES.
         05 REG-DATA-VENDA           PIC X(10) VALUE SPACES.
         05 FILLER  REDEFINES                REG-DATA-VENDA.
           10 REG-ANO-VENDA          PIC 9(04).
           10 FILLER                 PIC X(01).
           10 REG-MES-VENDA          PIC 9(02).
           10 FILLER                 PIC X(01).
           10 REG-DIA-VENDA          PIC 9(02).
           10 REG-ESTOURO            PIC 9(04).
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL017'.
           DISPLAY 'VARIAVEL HIERARQUIVA NIVEL 01'.
           DISPLAY '001 '.
           DISPLAY 'REG-ENTRADA      : ' REG-ENTRADA.
           DISPLAY ' '

           DISPLAY '002 '.
           DISPLAY 'REG-COD-VENDA    : ' REG-COD-VENDA.
           DISPLAY 'REG-COD-PRODUTO  : ' REG-COD-PRODUTO.
           DISPLAY 'REG-DATA-VENDA   : ' REG-DATA-VENDA.
           DISPLAY ' '

           MOVE 934                      TO REG-COD-VENDA.
           MOVE 2342                     TO REG-COD-PRODT.
           MOVE 'X'                      TO REG-CHV-PRODT.
           MOVE '2022-05-08'             TO REG-DATA-VENDA

           DISPLAY '003-A'.
           DISPLAY 'REG-ENTRADA      : ' REG-ENTRADA.
           DISPLAY ' '
           DISPLAY '003-B'.
           DISPLAY 'REG-COD-VENDA    : ' REG-COD-VENDA.
           DISPLAY 'REG-COD-PRODUTO  : ' REG-COD-PRODUTO.
           DISPLAY 'REG-DATA-VENDA   : ' REG-DATA-VENDA.
           DISPLAY ' '
           DISPLAY '003-C'.
           DISPLAY 'REG-ANO-VENDA    : ' REG-ANO-VENDA.
           DISPLAY 'REG-MES-VENDA    : ' REG-MES-VENDA.
           DISPLAY 'REG-DIA-VENDA    : ' REG-DIA-VENDA.
           DISPLAY ' '.

           MOVE 2024                     TO REG-ANO-VENDA.
           MOVE 12                       TO REG-MES-VENDA.
           MOVE 45                       TO REG-DIA-VENDA.

           DISPLAY '004 '.
           DISPLAY 'REG-DATA-VENDA   : ' REG-DATA-VENDA.

           DISPLAY ' '.
           DISPLAY '005 '.
           DISPLAY ' '.
           DISPLAY ' REG-ENTRADA     : '  REG-ENTRADA.
           INITIALIZE  REG-ENTRADA.
           DISPLAY ' REG-ENTRADA     : '  REG-ENTRADA.

           DISPLAY ' '.
           DISPLAY '006 '.
           DISPLAY ' '.
           DISPLAY ' REG-ESTOURO    = ' REG-ESTOURO

           MOVE 999    TO REG-ESTOURO.

           DISPLAY ' REG-ESTOURO    = ' REG-ESTOURO
           DISPLAY ' REG-ENTRADA    = ' REG-ENTRADA.

           STOP RUN.

       END PROGRAM COBOL017.
      ********************** FIM PROGRAMA   ****************************
