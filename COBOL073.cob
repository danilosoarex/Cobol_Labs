      *****************************************************************
      * DATA     :  16/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA COMPARACAO DE COMANDOS COMPUTE ADD SUBTRACT
      *            VEJA O DIVIDE COMPLETO
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL073.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 16/06/23 @ 23:15:00.
       DATE-COMPILED. 2023-06-16.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      **********************
       ENVIRONMENT DIVISION.
      **********************
      ***************
       DATA DIVISION.
      ***************
       WORKING-STORAGE SECTION.
      *
       77  WSS-A                  PIC 9(04)  VALUE 100.
       77  WSS-B                  PIC 9(04)  VALUE 500.
       77  WSS-C                  PIC 9(04)  VALUE  10.
       77  WSS-D                  PIC 9(04)  VALUE   5.
       77  WSS-E                  PIC 9(04)  VALUE  25.
       77  WSS-X                  PIC 9(04)  VALUE ZEROES.
       77  WSS-Y                  PIC 9(04)  VALUE ZEROES.
       77  WSS-Z                  PIC 9(04)  VALUE ZEROES.
       77  WSS-INCREMENT          PIC 9(02)  VALUE ZEROES.
       77  WSS-INCREMENTO1        PIC 9(02)  VALUE ZEROES.
       77  WSS-INCREMENTO2        PIC 9(02)  VALUE ZEROES.
       77  WSS-INCREMENTO3        PIC 9(02)  VALUE ZEROES.
       77  WS-RESULT              PIC 9(04)  VALUE ZEROES.
       77  WS-TAMANHO-1           PIC 9(04)  VALUE ZEROES.
       77  WSS-TOTAL-COST         PIC 9(04)  VALUE 1000.
       77  WSS-NUMBER-PURCHASED   PIC 9(04)     VALUE 500.
       77  WSS-ANSWER             PIC 9(04)V99  VALUE ZEROES.
       77  WSS-BALANCE            PIC 9(04)     VALUE ZEROES.
       77  WSS-OVERDRAFT          PIC 9(04)     VALUE ZEROES.
      *
      ********************
       PROCEDURE DIVISION.
      ********************

           DISPLAY 'COBOL073'.
           DISPLAY 'EXEMPLO DE CONTAS VERBOSAS E NAO'.
           DISPLAY ' '.

           DISPLAY 'VERIFIQUE ESTA CONTA'.

           COMPUTE WSS-Z = WSS-A + WSS-B / WSS-C ** WSS-D - WSS-E
           DISPLAY ' WSS-X   = '  WSS-X.
           DISPLAY ' WSS-Y   = '  WSS-Y.
           DISPLAY ' WSS-Z   = '  WSS-Z.

           DISPLAY '  ' .
           DISPLAY 'AGORA ESTA CONTA'.

           COMPUTE  WSS-X WSS-Y WSS-Z = WSS-A + WSS-B / WSS-C **
                                        WSS-D - WSS-E

           DISPLAY ' WSS-X   = '  WSS-X.
           DISPLAY ' WSS-Y   = '  WSS-Y.
           DISPLAY ' WSS-Z   = '  WSS-Z.

           DISPLAY '  ' .
           DISPLAY 'AGORA ESTA CONTA'.
           DISPLAY 'FAZEM O MESMO, UMA VERBOSA OUTRA NAO'.
           COMPUTE WSS-INCREMENT = WSS-INCREMENT + 1.

           DISPLAY ' 1O. -  WSS-INCREMENT '  WSS-INCREMENT.

           ADD 1 TO WSS-INCREMENT.

           DISPLAY ' 2O. -  WSS-INCREMENT '  WSS-INCREMENT.

           DISPLAY '  ' .
           DISPLAY 'ESTA AQUI IGUALZINHO'.
           DISPLAY 'FAZEM O MESMO, UMA VERBOSA OUTRA NAO'.

           COMPUTE WSS-BALANCE = WSS-BALANCE - WSS-OVERDRAFT

           DISPLAY ' 1O. -  WSS-WSS-BALANCE = ' WSS-BALANCE.
           SUBTRACT WSS-OVERDRAFT FROM WSS-BALANCE
           END-SUBTRACT.


           DISPLAY ' 2O. -  WSS-WSS-BALANCE = ' WSS-BALANCE.

           DISPLAY '  ' .
           DISPLAY 'ESTA EH A MELHOR DE TODAS'.

           COMPUTE  WSS-INCREMENTO1   = WSS-INCREMENTO1 + 1
           COMPUTE  WSS-INCREMENTO2   = WSS-INCREMENTO2 + 1
           COMPUTE  WSS-INCREMENTO3   = WSS-INCREMENTO3 + 1

           DISPLAY ' WSS-INCREMENTO1 =  ' WSS-INCREMENTO1.
           DISPLAY ' WSS-INCREMENTO2 =  ' WSS-INCREMENTO2.
           DISPLAY ' WSS-INCREMENTO3 =  ' WSS-INCREMENTO3.
           ADD 1 TO WSS-INCREMENTO1,
                    WSS-INCREMENTO2,
                    WSS-INCREMENTO3
           END-ADD.

           DISPLAY ' WSS-INCREMENTO1 =  ' WSS-INCREMENTO1.
           DISPLAY ' WSS-INCREMENTO2 =  ' WSS-INCREMENTO2.
           DISPLAY ' WSS-INCREMENTO3 =  ' WSS-INCREMENTO3.

           DIVIDE 100            BY 23
             GIVING WSS-ANSWER.

           DISPLAY '  ' .
           DISPLAY 'WSS-ANSWER = ' WSS-ANSWER.

           DISPLAY '  ' .
           DISPLAY ' BRINQUEMOS COM O DIVIDE'.
      *
      *************************** ROTINA DE DIVISAO.
       DIVIDE-TOTAL-COST.

           DISPLAY 'DIVIDE-TOTAL-COST'

           MOVE ZEROES   TO WSS-NUMBER-PURCHASED.

    **** COMANDO IMPERATIVO SUCETIVEL A ERROS
      *    DIVIDE WSS-TOTAL-COST BY WSS-NUMBER-PURCHASED
      *      GIVING WSS-ANSWER
      *    END-DIVIDE.

    **** COMANDO IMPERATIVO CONDICIONAL COM TRATAMENTO DE ERROS
    *** FUNCIONA COM COMPUTE ADD SUBTRACT DIVIDE E MULTIPLY

           DIVIDE WSS-TOTAL-COST BY WSS-NUMBER-PURCHASED
             GIVING WSS-ANSWER
             ON SIZE ERROR
             DISPLAY "ERROR IN DIVIDE-TOTAL-COST PARAGRAPH"
             DISPLAY "SPENT " WSS-TOTAL-COST, " FOR "
                    WSS-NUMBER-PURCHASED
             MOVE 171          TO  RETURN-CODE
             PERFORM FINISH
           END-DIVIDE.
      *
      *************************** SAIDA A QUENTE ERRO NA DIVISAO
       FINISH.
           STOP RUN.

       END PROGRAM COBOL073.
      ********************** FIM PROGRAMA   ****************************
