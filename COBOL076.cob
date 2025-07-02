      *****************************************************************
      * DATA     :  17/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : EXEMPLO CALL CPF
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL076  RECURSIVE.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 17/06/23 @ 21:05:00.
       DATE-COMPILED. 2023-06-17.
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
       01 WSS-NUMB        PIC 9(4) VALUE 10.
       01 WSS-FACT        PIC 9(8) VALUE 0.
       01 WSS-DATA-COMPIL PIC X(16).
      *
       01 WSS-SUBPROGRAMA PIC X(08) VALUE 'COBOL075'.
      *
       LOCAL-STORAGE SECTION.
      *
       01 WSS-NUM         PIC 9(4).
      *
       COPY COPY0651.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           MOVE  FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL.
           DISPLAY 'COBOL076'.
           DISPLAY 'EXEMPLO DE PROGRAMA INDO E VOLTANDO'.
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL.
           DISPLAY ' '.

           INITIALIZE  WSS-CPF-LINKAGE.

      *    PRIMEIRA CHAMADA ESTATICA

           MOVE 14403535899           TO  WSS-CPF-REC.

           DISPLAY ' '.
           DISPLAY ' INDO     '.
           DISPLAY 'WSS-CPF-REC    = ' WSS-CPF-REC.
           DISPLAY 'WSS-CPF-GERADO = ' WSS-CPF-GERADO.

    ****   CHAMADA ESTATICA DO SUBPROGRAMA
           CALL 'COBOL075' USING WSS-CPF-LINKAGE.

           IF WSS-RETURN-CODE NOT EQUAL ZEROES
              DISPLAY 'CODIGO DO ERRO   : ' WSS-RETURN-CODE
              DISPLAY 'MENSAGEM DE ERRO : ' WSS-MENSAGEM
           END-IF.

           DISPLAY ' '.
           DISPLAY ' VOLTANDO '.
           DISPLAY 'WSS-CPF-REC    = ' WSS-CPF-REC.
           DISPLAY 'WSS-CPF-GERADO = ' WSS-CPF-GERADO.
           DISPLAY ' '.

      *    SEGUNDA  CHAMADA ESTATICA
           INITIALIZE  WSS-CPF-LINKAGE.

           MOVE 14403535810        TO   WSS-CPF-REC

    ****   CHAMADA ESTATICA DO SUBPROGRAMA
           CALL 'COBOL075' USING WSS-CPF-LINKAGE.

           IF WSS-RETURN-CODE NOT EQUAL ZEROES
              DISPLAY 'CODIGO DO ERRO   : ' WSS-RETURN-CODE
              DISPLAY 'MENSAGEM DE ERRO : ' WSS-MENSAGEM
           END-IF.

           DISPLAY ' '.
           DISPLAY ' VOLTANDO  CHAMADA 2'.
           DISPLAY 'WSS-CPF-REC    = ' WSS-CPF-REC.
           DISPLAY 'WSS-CPF-GERADO = ' WSS-CPF-GERADO.
           DISPLAY ' '.

      *    TERCEIRA CHAMADA DINAMICA
           DISPLAY ' '.
           DISPLAY ' CHAMADA DINAMICA '.
           MOVE 01564654891           TO  WSS-CPF-REC.
    ****
    ****   CHAMADA DINAMICA DO SUBPROGRAMA
    ****   TEM BUG NA TERCEIRA VOLTA

           INITIALIZE WSS-CPF-LINKAGE.

           CALL WSS-SUBPROGRAMA  USING WSS-CPF-LINKAGE.

           IF WSS-RETURN-CODE NOT EQUAL ZEROES
              DISPLAY 'CODIGO DO ERRO   : ' WSS-RETURN-CODE
              DISPLAY 'MENSAGEM DE ERRO : ' WSS-MENSAGEM
           END-IF.

           DISPLAY ' '.
           DISPLAY ' VOLTANDO DA TERCEIRA'.
           DISPLAY 'WSS-CPF-REC    = ' WSS-CPF-REC.
           DISPLAY 'WSS-CPF-GERADO = ' WSS-CPF-GERADO.

           STOP RUN.

       END PROGRAM COBOL076.
      ********************** FIM PROGRAMA   ****************************
