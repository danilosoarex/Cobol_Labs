      *****************************************************************
      * DATA     :  17/06/2023
      * AUTOR    : CAZE
      * ADPATADO : VAGNER RENATO BELLACOSA
      * PROGRAMA : CALCULA O CPF PADRONIZACAO VARIAVEIS CALCULOS
      *            EXEMPLO DE SUBPROGRAMA
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL075.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 17/06/23 @ 23:15:00.
       DATE-COMPILED. 2023-06-17.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
      * LOGICA DO CALCULO:
      *
      * 9 4 5 8 1 5 9 0 3 =
      * X X X X X X X X X
      * 1 2 3 4 5 6 7 8 9
      * - - - - - - - - -
      * 9 8 1 3 5 3 6 0 2 = 189 / 11 = 17 RESTO 2 ---?
      *     5 2   0 3   7                       |    |
      *                                         |    |
      * 9 4 5 8 1 5 9 0 3 2 <-------------------?    |
      * X X X X X X X X X X                          |
      * 0 1 2 3 4 5 6 7 8 9                          |
      * - - - - - - - - - -                          |
      * 0 4 1 2 4 2 5 0 2 1 = 163 / 11 = 14 RESTO 9  |
      *     0 4   5 4   4 8                       |  |
      *                                           |  |
      * RESULTADO: 94581590329                    |  |
      *                     µµ                    |  |
      *                     ||                    |  |
      *                     |?--------------------?  |
      *                     ?------------------------?
      *
      * OBS: SE RESTO FOR > 9, CONSIDERAR 0.
      *
      * HTTP://WWW.GERADORWSS-CPF.COM/
      *
      * EXEMPLOS: 703.868.563-54
      *           765.513.853-20
      *           121.457.278-25
      *****************************************************************
      *---------------------
       ENVIRONMENT DIVISION.
      *---------------------
      *---- ----------
       DATA DIVISION.
      *--------------
      *------------------------
       WORKING-STORAGE SECTION.
      *------------------------
       01 WSS-GERAL.
        05  I                               PIC 9(002) VALUE 0.
        05  F                               PIC 9(001) VALUE 1.
        05  G                               PIC 9(001) VALUE 0.
        05  WSS-INTEIRO                     PIC 9(002) VALUE 0.
        05  WSS-RESTO                       PIC 9(002) VALUE 0.
        05  WSS-TOTAL                       PIC 9(003) VALUE 0.
        05  WSS-DATA-COMPIL                 PIC X(016) VALUE SPACES.
      *----
       01  WSS-CPF-CALC.
           03  WSS-D1                      PIC 9(001).
           03  WSS-D2                      PIC 9(001).
           03  WSS-D3                      PIC 9(001).
           03  WSS-D4                      PIC 9(001).
           03  WSS-D5                      PIC 9(001).
           03  WSS-D6                      PIC 9(001).
           03  WSS-D7                      PIC 9(001).
           03  WSS-D8                      PIC 9(001).
           03  WSS-D9                      PIC 9(001).
           03  WSS-D10                     PIC 9(001).
           03  WSS-D11                     PIC 9(001).
      *----
       01  WSS-CPF-I REDEFINES WSS-CPF-CALC.
           03  WSS-CPF-DIG OCCURS 11 TIMES.
               05  WSS-DIG                 PIC 9(001).
      *----------------
       LINKAGE SECTION.
      *----------------
       COPY COPY0651.

      *-----------------------------------------
       PROCEDURE DIVISION USING WSS-CPF-LINKAGE.
      *-----------------------------------------

           INITIALIZE WSS-CPF-CALC.
           INITIALIZE WSS-GERAL.
           INITIALIZE WSS-CPF-OUTPUT.

           MOVE 1             TO F.

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.

           DISPLAY ' '.
           DISPLAY ' COBOL075 '.
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.

           PERFORM RECEBE-CPF.

           PERFORM CALCULA-PRIMEIRO-DIGITO.

           PERFORM CALCULA-SEGUNDO-DIGITO.

           PERFORM GERA-CPF.

           PERFORM FIM.

      ******************************************************************
      * ROTINA RECEBE O WSS-CPF
      ******************************************************************
       RECEBE-CPF.

           IF WSS-CPF-REC NOT NUMERIC
             MOVE 10                  TO WSS-RETURN-CODE
             MOVE 'CPF NAO NUMERICO'  TO WSS-MENSAGEM
             PERFORM FIM
           END-IF.

           IF WSS-CPF-REC = 0
             MOVE 20                   TO WSS-RETURN-CODE
             MOVE 'CPF NAO INFORMADO'  TO WSS-MENSAGEM
             PERFORM FIM
           END-IF.

           MOVE WSS-CPF-REC TO WSS-CPF-CALC.
      *
      ******************************************************************
      * ROTINA CALCULA O PRIMEIRO WSS-DIGITO
      ******************************************************************
       CALCULA-PRIMEIRO-DIGITO.

           DISPLAY '  CALCULA-PRIMEIRO-DIGITO '.

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 9
              COMPUTE WSS-TOTAL = WSS-TOTAL + WSS-DIG(I) * F
              ADD 1 TO F
           END-PERFORM.
      *----

           DIVIDE WSS-TOTAL BY 11 GIVING WSS-INTEIRO
              REMAINDER WSS-RESTO
           END-DIVIDE.

           IF WSS-RESTO > 9 THEN
              MOVE 0 TO WSS-D10
           ELSE
              MOVE WSS-RESTO TO WSS-D10
           END-IF.

           MOVE 0 TO WSS-TOTAL.

      ******************************************************************
      * ROTINA CALCULA O SEGUNDO WSS-DIGITO
      ******************************************************************
       CALCULA-SEGUNDO-DIGITO.

           DISPLAY '   CALCULA-SEGUNDO-DIGITO '.

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
              COMPUTE WSS-TOTAL = WSS-TOTAL + WSS-DIG(I) * G
              ADD 1 TO G
           END-PERFORM.
      *----
           DIVIDE WSS-TOTAL BY 11 GIVING WSS-INTEIRO
              REMAINDER WSS-RESTO
           END-DIVIDE.

           IF WSS-RESTO > 9 THEN
              MOVE 0 TO WSS-D11
           ELSE
              MOVE WSS-RESTO TO WSS-D11
           END-IF.

      ******************************************************************
      * ROTINA GRAVA O WSS-CPF CALCULADO
      ******************************************************************
       GERA-CPF.

           MOVE WSS-CPF-CALC           TO WSS-CPF-GERADO.

           IF WSS-CPF-REC NOT EQUAL WSS-CPF-GERADO
             MOVE 30                   TO WSS-RETURN-CODE
             MOVE 'DIGITO INVALIDO  '  TO WSS-MENSAGEM
      ***   PERFORM FIM
           END-IF.


      ******************************************************************
      * ROTINA FINALIZA O PROGRAMA
      ******************************************************************
       FIM.
           GOBACK.

       END PROGRAM COBOL075.
      ********************** FIM PROGRAMA   ****************************
