      *****************************************************************
      * DATA     :  30/05/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO VARIAVEL ALFABETICA PIC A
      *            USO DE MASCARA, TESTES DE ERROS
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL010.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 30/05/23 @ 10:10:00.
       DATE-COMPILED. 2023-05-30.
      *
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ****************
       DATA DIVISION.
      ****************
       FILE SECTION.
      **
       WORKING-STORAGE SECTION.
      **
       77  WSS-ESPACO                PIC A(01)  VALUE SPACES.
       77  WSS-ALFABETO              PIC A(27)
                                                VALUE 'TESTE VARIAVEL'.
       77  WSS-ALFA1                 PIC BAABA(2)
                                                VALUE 'ABCDE'.
       77  WSS-ALFA2                 PIC BA(2)BAAA.                        OMENT
      *77  WSS-ALFA2                 PIC BX(2)BXXX  VALUE 'FAFEF'.        COMENT
       77  WSS-ALFA3                 PIC A(08)  VALUE 'EXEMPLO '.
       77  WSS-ALFA4                 PIC A(09)  VALUE 'COM VARIA'.
      **
      *********************
       PROCEDURE DIVISION.
      *********************

           DISPLAY 'COBOL010'.
           DISPLAY 'VARIAVEL NIVEL 77 TIPO ALFABETICA'.

           DISPLAY '001 '.
           DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.
           DISPLAY 'WSS-ESPACO   : ' WSS-ESPACO.

           MOVE 'ABCDEFGHIJK'        TO WSS-ALFABETO

           DISPLAY '002 '.
           DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.
           DISPLAY 'WSS-ESPACO   : ' WSS-ESPACO.

           MOVE 'LMNOPQRSTUVWXYZ'    TO WSS-ALFABETO

           DISPLAY '003 '.
           DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.
           DISPLAY 'WSS-ESPACO   : ' WSS-ESPACO.

           MOVE 'COBOL'              TO WSS-ALFABETO

           DISPLAY '004 '.
           DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.
           DISPLAY 'WSS-ESPACO   : ' WSS-ESPACO.

           MOVE "#"                  TO WSS-ALFABETO

           DISPLAY '005 '.
           DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.
           DISPLAY 'WSS-ESPACO   : ' WSS-ESPACO.

           MOVE "88"                 TO WSS-ALFABETO

           DISPLAY '006 '.
           DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.
           DISPLAY 'WSS-ESPACO   : ' WSS-ESPACO.

           MOVE 'A1B2C3D4E5F6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z5'
               TO WSS-ALFABETO

           DISPLAY '007 '.
           DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.
           DISPLAY 'WSS-ESPACO   : ' WSS-ESPACO.

           MOVE '@'  TO WSS-ALFABETO.

           DISPLAY '008 '.
           DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.

           DISPLAY '008B'.

           STRING WSS-ALFABETO  DELIMITED BY ' '
                  WSS-ALFA1 DELIMITED BY '/'
                  WSS-ALFA2 DELIMITED BY '/'
                  WSS-ALFA3 DELIMITED BY '/'
                                         INTO WSS-ALFABETO
               ON OVERFLOW     PERFORM CAPTURA-ERRO
               NOT ON OVERFLOW PERFORM DISPLAY-OK

           END-STRING.

           DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.

           DISPLAY '009 '.

           STRING  '@/LIXO' DELIMITED BY '/'
                   'TESTE ' DELIMITED BY '/'
                   'UM '    DELIMITED BY '/'
                   '123456789012345678901234567890' DELIMITED BY '/'
                                         INTO WSS-ALFABETO
             ON OVERFLOW PERFORM CAPTURA-ERRO
           END-STRING.

           DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.

           INITIALIZE WSS-ALFABETO.
           DISPLAY '010 '.
           DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.


           DISPLAY ' '
           DISPLAY ' MASCARA '
           DISPLAY ' '
           MOVE    'FAFEF'        TO WSS-ALFA2.
           DISPLAY ' WSS-ALFA1 = ' WSS-ALFA1
           DISPLAY ' WSS-ALFA2 = ' WSS-ALFA2.

      *    MOVE 999                  TO WSS-ALFABETO
      *
      *    DISPLAY '006 '.
      *    DISPLAY 'WSS-ALFABETO : ' WSS-ALFABETO.
      *    DISPLAY 'WSS-ESPACO   : ' WSS-ESPACO.
      *
           STOP RUN.

      ******************************************************************
      ***                       DEBUG SECTION                        ***
      ******************************************************************
       DEBUG-SECTION             SECTION.

       CAPTURA-ERRO.
           DISPLAY 'EXCEDEU O TAMANHO DA VARIAVEL'.
           MOVE 981 TO RETURN-CODE.

       DISPLAY-OK.
           DISPLAY 'TAMANHO OK'.
           MOVE 000 TO RETURN-CODE.

       END PROGRAM COBOL010.
      ********************** FIM PROGRAMA   ****************************
