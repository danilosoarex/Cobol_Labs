      *****************************************************************
      * DATA     :  06/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA PERFORM SIMPLES
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL062
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
      *
       WORKING-STORAGE SECTION.
      *
       01 WSS-ALL-CURRENT-DATE-DATA.
          05  WSS-CURRENT-DATE.
              10  WSS-CURRENT-YEAR         PIC 9(04).
              10  WSS-CURRENT-MONTH        PIC 9(02).
              10  WSS-CURRENT-DAY          PIC 9(02).
          05  WSS-CURRENT-TIME.
              10  WSS-CURRENT-HOURS        PIC 9(02).
              10  WSS-CURRENT-MINUTE       PIC 9(02).
              10  WSS-CURRENT-SECOND       PIC 9(02).
              10  WSS-CURRENT-MILLISECONDS PIC 9(02).
      *
       01 WSS-DATA-COMPIL           PIC X(16) VALUE SPACES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL062'.
           DISPLAY 'EXEMPLO PERFOM SIMPLES           '.

           DISPLAY ' SEU USO E IDEAL QUANDO QUEREMOS CHAMAR UMA '.
           DISPLAY ' ROTINA OU TRECHO DE CODIGO MAIS DE UMA VEZ '.


           DISPLAY ' '

           MOVE FUNCTION WHEN-COMPILED  TO WSS-DATA-COMPIL
           DISPLAY ' WSS-DATA-COMPIL = ' WSS-DATA-COMPIL
           DISPLAY ' '
           DISPLAY ' PRIMEIRA CHAMADA'.

      **   PERFORM ROT-DATA-HORA 10000 TIMES

           PERFORM ROT-DATA-HORA
              THRU ROT-DATA-HORA-EXIT.

           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY 'TIME STAMP : ' WSS-CURRENT-DATE.

           PERFORM ROT-APENAS-TIMESTAMP.

           DISPLAY ' '
           DISPLAY ' SEGUNDA CHAMADA'.

           PERFORM ROT-DATA-HORA
              THRU ROT-DATA-HORA-EXIT.

           DISPLAY ' '.
           DISPLAY ' '.

           PERFORM ROT-APENAS-HORA.

           STOP RUN.

      ****************************************************************
      *** ROTINA BUSCA DATA E HORA                                 ***
      ****************************************************************
       ROT-DATA-HORA.

           MOVE FUNCTION CURRENT-DATE TO WSS-ALL-CURRENT-DATE-DATA.

           DISPLAY 'TIME STAMP : ' WSS-CURRENT-DATE.
           DISPLAY 'WSS-CURRENT-DATE : ' WSS-CURRENT-DATE.
           DISPLAY 'WSS-CURRENT-TIME : ' WSS-CURRENT-TIME.

       ROT-APENAS-DATA.

           DISPLAY ' APENAS DATA '.
           DISPLAY 'WSS-CURRENT-DATE : ' WSS-CURRENT-DATE.

       ROT-APENAS-HORA.

           DISPLAY ' APENAS HORA '.
           DISPLAY 'WSS-CURRENT-TIME : ' WSS-CURRENT-TIME.

       ROT-APENAS-TIMESTAMP.

           DISPLAY ' APENAS TIMESTAMP'.
           DISPLAY 'TIME STAMP : ' WSS-CURRENT-DATE.

       ROT-DATA-HORA-EXIT.

           DISPLAY ' SAIU '.
           DISPLAY '  '.

           EXIT.

       END PROGRAM COBOL062.
      ********************** FIM PROGRAMA   ****************************
