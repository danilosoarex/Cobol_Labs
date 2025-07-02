      *****************************************************************
      * DATA     :  08/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO ARRAY UNIDIMENSIONAL
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL044.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 08/06/23 @ 21:31:00.
       DATE-COMPILED. 2023-06-08.
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
       77 WSS-INDEX     PIC 99 VALUE ZERO.
      *
       01 WSS-SEMANA.
           05 WSS-DIA01 PIC A(07) VALUE 'DOMINGO'.
           05 WSS-DIA02 PIC A(07) VALUE 'SEGUNDA'.
           05 WSS-DIA03 PIC A(07) VALUE 'TERCA'.
           05 WSS-DIA04 PIC A(07) VALUE 'QUARTA'.
           05 WSS-DIA05 PIC A(07) VALUE 'QUINTA'.
           05 WSS-DIA06 PIC A(07) VALUE 'SEXTA'.
           05 WSS-DIA07 PIC A(07) VALUE 'SABADO'.
      *
       01 TABELA-DIA-SEMANA REDEFINES WSS-SEMANA.
             05 WSS-DIA-NOME OCCURS 7 TIMES PIC A(07) .
      *
       01 WSS-DIA-SEMANA   PIC S9 SIGN LEADING SEPARATE.

      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL044'.
           DISPLAY 'EXEMPLO DE ARRAY UNIDIMENSIONAL '.
           DISPLAY ' '.

           MOVE ZEROES   TO WSS-INDEX.

           DISPLAY ' EXEMPLO VERBOSO 7 VARIAVEIS '.
           DISPLAY ' WSS-DIA01 = ' WSS-DIA01.
           DISPLAY ' WSS-DIA02 = ' WSS-DIA02.
           DISPLAY ' WSS-DIA03 = ' WSS-DIA03.
           DISPLAY ' WSS-DIA04 = ' WSS-DIA04.
           DISPLAY ' WSS-DIA05 = ' WSS-DIA05.
           DISPLAY ' WSS-DIA06 = ' WSS-DIA06.
           DISPLAY ' SEXTOU '.
           DISPLAY ' WSS-DIA07 = ' WSS-DIA07.
           DISPLAY ' '.


           DISPLAY ' EXEMPLO DE ARRAY UM DIMENSAO'.

           PERFORM 07 TIMES

             ADD 01    TO  WSS-INDEX
*******      COMPUTE WSS-INDEX = WSS-INDEX + 1.

             IF WSS-INDEX = 6
               DISPLAY WSS-INDEX ' - '
                       WSS-DIA-NOME(WSS-INDEX)
                       ' SEXTOU !!!'
             ELSE
               DISPLAY WSS-INDEX ' - '
                       WSS-DIA-NOME(WSS-INDEX)
             END-IF

           END-PERFORM.

           DISPLAY ' FIM : ' WSS-INDEX

           DISPLAY ' '.

           ACCEPT WSS-DIA-SEMANA FROM DAY-OF-WEEK.

           DISPLAY ' WSS-DIA-SEMANA = ' WSS-DIA-SEMANA.

           DISPLAY ' '.
           DISPLAY ' HOJE EH ' WSS-DIA-NOME(WSS-DIA-SEMANA).
           DISPLAY ' '.


           DISPLAY ' '.
           DISPLAY ' AMANHA EH ' WSS-DIA-NOME(WSS-DIA-SEMANA + 1).
           DISPLAY ' WSS-DIA-SEMANA = ' WSS-DIA-SEMANA.

           ADD 1      TO WSS-DIA-SEMANA.

           DISPLAY ' '.

           IF WSS-DIA-SEMANA > 7
             DISPLAY ' AMANHA EH ' WSS-DIA-NOME(1)
           ELSE
             DISPLAY ' AMANHA EH ' WSS-DIA-NOME(WSS-DIA-SEMANA)
           END-IF.

           DISPLAY ' WSS-DIA-SEMANA = ' WSS-DIA-SEMANA.

           DISPLAY ' '.

           IF ( WSS-DIA-SEMANA + 8 ) > 7
             MOVE 7 TO WSS-DIA-SEMANA
           ELSE
             MOVE 1 TO WSS-DIA-SEMANA
           END-IF.

           DISPLAY ' AMANHA EH ' WSS-DIA-NOME(WSS-DIA-SEMANA).

           IF ( WSS-DIA-SEMANA - 8 ) < 1
             MOVE 1 TO WSS-DIA-SEMANA
           ELSE
             MOVE 7 TO WSS-DIA-SEMANA
           END-IF.

           DISPLAY ' AMANHA EH ' WSS-DIA-NOME(WSS-DIA-SEMANA ).

           STOP RUN.

       END PROGRAM COBOL044.
      ********************** FIM PROGRAMA   ****************************
