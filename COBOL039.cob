      *****************************************************************
      * DATA     :  09/06/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO MULTIPLOS IFS E EVALUATE
      *            E ESCREVE EXTENSO ATé 19
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL039.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 09/06/23 @ 20:39:00.
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
        01 WSS-VALOR                 PIC 999.
        01 FILLER REDEFINES WSS-VALOR.
           05 WSS-VALOR-CENTENA      PIC 9.
           05 WSS-VALOR-DECIMAL      PIC 9.
           05 WSS-VALOR-UNITARIO     PIC 9.
      *
        01 REG-CLIENTE.
          05 REG-NOME                PIC X(15).
          05 REG-CPF                 PIC 9(11).
          05 REG-DATA-NASC           PIC X(10).
      *
        01 REG-FUNCIONARIO.
          05 REG-DATA-NASC           PIC X(10).
          05 REG-CPF                 PIC 9(11).
          05 REG-NOME                PIC X(15).
      *
      ********************
       PROCEDURE DIVISION.
      ********************
           DISPLAY 'COBOL039'.
           DISPLAY 'EXEMPLO DE MULTIPLOS IFS       '.
           DISPLAY ' '.

           PERFORM ROT-CORRESPONDING.

           DISPLAY ' '.

           MOVE  6                  TO WSS-VALOR.

           IF WSS-VALOR < 10
             DISPLAY ' WSS-VALOR : ' WSS-VALOR
             IF WSS-VALOR < 5
                DISPLAY ' EH MENOR    '
             ELSE
                DISPLAY ' EH MAIOR    ' WSS-VALOR
             END-IF
           ELSE
             DISPLAY ' WSS-VALOR : ' WSS-VALOR
             IF WSS-VALOR < 15
                DISPLAY ' EH MENOR    '
             ELSE
                DISPLAY ' EH MAIOR    ' WSS-VALOR
             END-IF
           END-IF.

      ** ESCREVE O NUMERO POR EXTENSO DE DECIMAL E UNIDADE
      ** LIMITADO ATE 19, ACIMA DISSO OCORRERA ERRO
           MOVE 0                    TO  WSS-VALOR
           PERFORM ROT-EXTENSO.

           MOVE 10                   TO  WSS-VALOR
           PERFORM ROT-EXTENSO.

           MOVE 8                    TO  WSS-VALOR
           PERFORM ROT-EXTENSO.
           MOVE 14                   TO  WSS-VALOR
           PERFORM ROT-EXTENSO.

           MOVE 20                   TO  WSS-VALOR
           PERFORM ROT-EXTENSO.

           STOP RUN.

       ROT-EXTENSO.

           DISPLAY ' '.

           DISPLAY ' WSS-VALOR = ' WSS-VALOR
                   ' DECIMAL   = ' WSS-VALOR-DECIMAL
                   ' UNITARIO  = '  WSS-VALOR-UNITARIO.


           IF WSS-VALOR-DECIMAL = 0  AND WSS-VALOR-UNITARIO = 0
              DISPLAY 'ZERO'
           ELSE
             IF WSS-VALOR-DECIMAL = 0
                EVALUATE WSS-VALOR-UNITARIO
                  WHEN 1
                    DISPLAY 'UM'
                  WHEN 2
                    DISPLAY 'DOIS'
                  WHEN 3
                    DISPLAY 'TRES'
                  WHEN 4
                    DISPLAY 'QUATRO'
                  WHEN 5
                    DISPLAY 'CINCO'
                  WHEN 6
                    DISPLAY 'SEIS'
                  WHEN 7
                    DISPLAY 'SETE'
                  WHEN 8
                    DISPLAY 'OITO'
                  WHEN 9
                    DISPLAY 'NOVE'
                  WHEN OTHER
                    DISPLAY ' '
                END-EVALUATE
             END-IF
           END-IF.

           IF WSS-VALOR-DECIMAL = 1  AND WSS-VALOR-UNITARIO = 0
              DISPLAY 'DEZ'
           ELSE
             IF WSS-VALOR-DECIMAL = 1
                EVALUATE WSS-VALOR-UNITARIO
                  WHEN 1
                    DISPLAY 'ONZE'
                  WHEN 2
                    DISPLAY 'DOZE'
                  WHEN 3
                    DISPLAY 'TREZE'
                  WHEN 4
                    DISPLAY 'QUATORZE'
                  WHEN 5
                    DISPLAY 'QUINZE'
                  WHEN 6
                    DISPLAY 'DEZESSEIS'
                  WHEN 7
                    DISPLAY 'DEZESSETE'
                  WHEN 8
                    DISPLAY 'DEZOITO'
                  WHEN 9
                    DISPLAY 'DEZONOVE'
                  WHEN OTHER
                    DISPLAY ' '
                END-EVALUATE
             ELSE
               IF WSS-VALOR-DECIMAL >= 2
                 DISPLAY 'NUMERO FORA DO LIMITE'
               END-IF
             END-IF
           END-IF.

       ROT-CORRESPONDING.

           DISPLAY 'ROT-CORRESPONDING'.

           MOVE  'TABAJARA JR'      TO   REG-NOME OF REG-CLIENTE
           MOVE  12345678901        TO   REG-CPF OF REG-CLIENTE
           MOVE  '25-12-1969'       TO   REG-DATA-NASC OF REG-CLIENTE

           DISPLAY ' REG-CLIENTE   ->>>> ' REG-CLIENTE.

           MOVE CORR REG-CLIENTE       TO REG-FUNCIONARIO.

           DISPLAY ' REG-FUNCIONARIO ->> ' REG-FUNCIONARIO.

           MOVE REG-NOME OF REG-CLIENTE (10:2) TO  REG-NOME OF
                                                   REG-FUNCIONARIO.

           DISPLAY ' REG-FUNCIONARIO ->> ' REG-FUNCIONARIO.

       END PROGRAM COBOL039.
      ********************** FIM PROGRAMA   ****************************
