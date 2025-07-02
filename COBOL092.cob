      *****************************************************************
      * DATA     :  15/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO SECTIONS E PARAGRAFOS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL092.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 15/08/24 @ 12:51:00.
       DATE-COMPILED. 2024-08-15.
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
       77  WSS-MARCADOR              PIC A(10) VALUE SPACES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

      * COMANDOS SIMPLES IMPERATIVOS
      * PULA PARA SEÁ„O
      *
      *
      *
           DISPLAY 'COBOL092'.
           DISPLAY 'USO DE SECTIONS E PARAGRAFOS     '.

           DISPLAY ' '.
           DISPLAY 'WSS-MARCADOR : ' WSS-MARCADOR.
           DISPLAY ' '.

           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' IREI CHAMAR AS SECTIONS E SEUS PARAGRAFOS'.
           DISPLAY ' '.
           DISPLAY ' '.

           PERFORM INICIO-ROT.

           DISPLAY ' '.

           PERFORM MEIO-ROT.

           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' IREI CHAMAR OS PAGRAFOS INDIVIDUALMENTE '.
           DISPLAY ' '.
           DISPLAY ' '.

           PERFORM ROT-10.

           PERFORM ROT-20.

           PERFORM ROT-30.

           PERFORM ROT-40.

           PERFORM ROT-50.

           PERFORM ROT-60.

           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' IREI CHAMAR OS GRUPO DE PARAGRAFOS '.
           DISPLAY ' '.
           DISPLAY ' '.

           PERFORM ROT-10
              THRU ROT-19.

           PERFORM FIM-ROT.

           STOP RUN.

      ******************************************************************
      * SECAO INICIAL INICIALIZA VARIAVEIS E ABRE ARQUIVOS
      ******************************************************************
       INICIO-ROT     SECTION.

           INITIALIZE WSS-MARCADOR.

           DISPLAY ' INICIO-ROT  '.
           DISPLAY ' WSS-MARCADOR  = ' WSS-MARCADOR.
           DISPLAY ' '.

       ROT-10.

           MOVE ' SHOW 10'     TO WSS-MARCADOR.

           DISPLAY ' ROT-10      '.
           DISPLAY ' WSS-MARCADOR  = ' WSS-MARCADOR.

       ROT-13.

           MOVE ' SHOW 13'     TO WSS-MARCADOR.

           DISPLAY ' ROT-13      '.
           DISPLAY ' WSS-MARCADOR  = ' WSS-MARCADOR.


       ROT-15.

           MOVE ' SHOW 15'     TO WSS-MARCADOR.

           DISPLAY ' ROT-15      '.
           DISPLAY ' WSS-MARCADOR  = ' WSS-MARCADOR.


       ROT-19.
           DISPLAY 'ROT-19'.

      **** PERFORM FIM-ABEND.


       ROT-20.

           MOVE ' SHOW 20'     TO WSS-MARCADOR.

           DISPLAY ' ROT-20      '.
           DISPLAY ' WSS-MARCADOR  = ' WSS-MARCADOR.

       ROT-30.

           MOVE ' SHOW 30'     TO WSS-MARCADOR.

           DISPLAY ' ROT-30      '.
           DISPLAY ' WSS-MARCADOR  = ' WSS-MARCADOR.
      **** EXIT.

      ******************************************************************
      * SECAO VALIDA ARQUIVOS E REGISTROS
      ******************************************************************
       MEIO-ROT     SECTION.

           INITIALIZE WSS-MARCADOR.

           DISPLAY ' MEIO-ROT  '.
           DISPLAY ' WSS-MARCADOR  = ' WSS-MARCADOR.
           DISPLAY ' '.

       ROT-40.

           MOVE ' SHOW 40'     TO WSS-MARCADOR.

           DISPLAY ' ROT-40      '.
           DISPLAY ' WSS-MARCADOR  = ' WSS-MARCADOR.

       ROT-50.

           MOVE ' SHOW 50'     TO WSS-MARCADOR.

           DISPLAY ' ROT-50      '.
           DISPLAY ' WSS-MARCADOR  = ' WSS-MARCADOR.

       ROT-60.

           MOVE ' SHOW 60'     TO WSS-MARCADOR.

           DISPLAY ' ROT-60      '.
           DISPLAY ' WSS-MARCADOR  = ' WSS-MARCADOR.

      ******************************************************************
      * SECAO PROCEDIMENTOS FINAIS
      ******************************************************************
       FIM-ROT           SECTION.

           DISPLAY ' '.
           DISPLAY ' PROCEDIMENTOS FINAIS '.
           DISPLAY ' '.

       FIM-ABEND   SECTION.

           MOVE 50            TO RETURN-CODE.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY 'ERRO PREVISTO NUMERO 50'.
           DISPLAY 'FAVOR AVISAR O ANALISTA RESPONSAVEL'.

           STOP RUN.

       END PROGRAM COBOL092.
      ********************** FIM PROGRAMA   ****************************
