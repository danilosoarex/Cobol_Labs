      *****************************************************************
      * DATA     :  20/12/2023
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : ESTRUTURA DO COBOL AS 4 DIVISOES
      * CPD      : INEFE
      *****************************************************************
      *************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. COBOL006.
       AUTHOR. VAGNER BELLACOSA.
       INSTALLATION. INEFE
       DATE-WRITTEN. 20/12/23 @ 22:59:54.
       DATE-COMPILED. 2023-12-20.
       SECURITY. COMENTARIOS DIVERSOS SOBRE O PROGRAMA
      *
      **********************
       ENVIRONMENT DIVISION.
      **********************
      *
       CONFIGURATION SECTION.
      *
       SOURCE-COMPUTER. IBM-ZOS.
       OBJECT-COMPUTER. IBM-ZOS.
      *
       SPECIAL-NAMES.
      *
           DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT SECTION.
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
      *
       01 WSS-REGISTROS.
         05 WSS-CONTADOR             PIC 99  VALUE ZERO.
         05 WSS-LIDOS                PIC 9(6).
         05 REDEFINES WSS-LIDOS.
          10 WSS-LIDOS-INI           PIC 9.
          10 WSS-QUANTIDADE          PIC 999.
          10 WSS-FINAL               PIC 99.
      *
       01 WSS-CPF                    PIC 9(11).
      *
       01 REDEFINES WSS-CPF.
         05 WSS-CPF-INTEIRO          PIC 9(09).
         05 WSS-CPF-DIGVER           PIC 99.
      *
       01 WSS-CEP                    PIC A(9).
      *
      *01 WSS-RESGISTROS.
      *  05 WSS-CONTADOR             PIC 99  VALUE ZERO.
      *  05 WSS-LIDOS                PIC 9(06) VALUE ZERO.
      *  05 REDEFINES WSS-LIDOS.
      *   10 WSS-LIDOS-INI           PIC 9.
      *
       77 WSS-NUM                    PIC 999 VALUE ZERO.
       77 WSS-NUM1                   PIC 999.
      *
       01 WSS-DATA                   PIC X(10) VALUE '2024-08-06'.
      *
       01 REDEFINES WSS-DATA.
         05 WSS-ANO                  PIC 9(04).
         05 FILLER                   PIC A.
         05 WSS-MES                  PIC 99.
         05 FILLER                   PIC A.
         05 WSS-DIA                  PIC 99.
       01 REDEFINES WSS-DATA.
         05 WSS-ANOMES               PIC X(07).
      *
      *
       01 REDEFINES WSS-DATA.
         05 WSS-DD                   PIC 9.
      *
      *
      *
       01 WSS-FRASE                  PIC X(80) VALUE SPACES.
       01 REDEFINES WSS-FRASE.
        05 WSS-PRIMO                 PIC X(20).
        05 WSS-SEGUNDO               PIC X(20).
        05 WSS-TERCERO               PIC X(20).
        05 WSS-QUARTO                PIC X(80).
      *
       01  WSS-ESTOURO.
           05  WSS-TAM4 PICTURE X(4).
           05  WSS-CABOOM REDEFINES WSS-TAM4.
             10 WSS-001    PICTURE 9(2).
             10 WSS-002    PICTURE 9(2).
      *      10 WSS-003    PICTURE 9(2).
      *
       01 WSS-SALARIO   PIC 9(12).
       01 REDEFINES WSS-SALARIO.
         05 WSS-TRILHAO PIC 999.
         05 WSS-BILHAO  PIC 999.
         05 WSS-MILHAO  PIC 999.
         05 WSS-MILHAR  PIC 9(03).
      *
       PROCEDURE DIVISION.
      *
           DISPLAY 'HELLO WORLD'.
           DISPLAY 'MEU PRIMEIRO PROGRAMA COBOL'.
           DISPLAY 'PRIMEIRA VEZ : ' WSS-NUM.

           DISPLAY ' WSS-SALARIO = ' WSS-SALARIO

           MOVE 1                  TO WSS-TRILHAO
           MOVE 020                TO WSS-BILHAO
           MOVE 300                TO WSS-MILHAO
           MOVE 004                TO WSS-MILHAR.

           DISPLAY ' WSS-SALARIO = ' WSS-SALARIO
           DISPLAY ' '.

           DISPLAY 'WSS-DATA = ' WSS-DATA.
           DISPLAY 'WSS-ANOMES = ' WSS-ANOMES.

           DISPLAY 'WSS-FRASE = '  WSS-FRASE

           MOVE
            'ABCDEFGHIJKLMNOPQRST 1ABCDEFGHIJKLMNOPQR 2ABCDEFGHIJKLMNOP
      -     '1234567890'
                     TO WSS-FRASE.

           DISPLAY ' WSS-PRIMO    = ' WSS-PRIMO
           DISPLAY ' WSS-SEGUNDO  = ' WSS-SEGUNDO
           DISPLAY ' WSS-TERCERO  = ' WSS-TERCERO
           DISPLAY ' WSS-QUARTO   = ' WSS-QUARTO.

      *    MOVE 'ABCDEFGHIJKLMNOPQRSTUVXWYZ ' TO WSS-PRIMO

      *    MOVE ' 1ABCDEFGHIJKLMNOPQRSTUVXWYZ ' TO WSS-SEGUNDO
      *    MOVE ' 2ABCDEFGHIJKLMNOPQRSTUVXWYZ ' TO WSS-TERCERO
      *    MOVE ' 3ABCDEFGHIJKLMNOPQRSTUVXWYZ !@#$%¨&*()' TO WSS-QUARTO.

           DISPLAY 'WSS-FRASE = '  WSS-FRASE
           DISPLAY 'WSS-QUARTO =  '  WSS-QUARTO.

           DISPLAY ' '.

           DISPLAY ' DATA 8 BYTES = ' WSS-ANO  WSS-MES WSS-DIA
           DISPLAY ' DIA          = ' WSS-DIA
           DISPLAY ' MES          = ' WSS-MES
           DISPLAY ' ANO          = ' WSS-ANO.
           DISPLAY ' WSS-ANOMES   = ' WSS-ANOMES.

           INITIALIZE WSS-REGISTROS.

           DISPLAY ' WSS-REGISTROS  = ' WSS-REGISTROS

           ADD 01 TO WSS-CONTADOR.

           DISPLAY ' '.
           DISPLAY ' WSS-REGISTROS  = ' WSS-REGISTROS
           DISPLAY ' WSS-CONTADOR   = ' WSS-CONTADOR
           DISPLAY ' WSS-LIDOS      = ' WSS-LIDOS
           DISPLAY ' WSS-LIDOS-INI  = ' WSS-LIDOS-INI
           DISPLAY ' WSS-QUANTIDADE = ' WSS-QUANTIDADE
           DISPLAY ' WSS-FINAL      = ' WSS-FINAL
           DISPLAY ' '.
      *
           MOVE 197403  TO WSS-LIDOS.
      *
           DISPLAY ' '.
           DISPLAY ' WSS-REGISTROS  = ' WSS-REGISTROS
           DISPLAY ' WSS-CONTADOR   = ' WSS-CONTADOR
           DISPLAY ' WSS-LIDOS      = ' WSS-LIDOS
           DISPLAY ' WSS-LIDOS-INI  = ' WSS-LIDOS-INI
           DISPLAY ' WSS-QUANTIDADE = ' WSS-QUANTIDADE
           DISPLAY ' WSS-FINAL      = ' WSS-FINAL
           DISPLAY ' '.
      *
           ADD WSS-CONTADOR TO WSS-LIDOS-INI
           ADD 22           TO WSS-QUANTIDADE
           ADD 33           TO WSS-FINAL.

           DISPLAY ' '.
           DISPLAY ' FIM'.
           DISPLAY ' WSS-REGISTROS  = ' WSS-REGISTROS
           DISPLAY ' WSS-CONTADOR   = ' WSS-CONTADOR
           DISPLAY ' WSS-LIDOS      = ' WSS-LIDOS
           DISPLAY ' WSS-LIDOS-INI  = ' WSS-LIDOS-INI
           DISPLAY ' WSS-QUANTIDADE = ' WSS-QUANTIDADE
           DISPLAY ' WSS-FINAL      = ' WSS-FINAL
           DISPLAY ' '.
      *
      *    COMPUTE WSS-NUM = WSS-NUM + 1974.

      *    DISPLAY 'APOS A ADICAO '.
      *    DISPLAY WSS-NUM.

      *    COMPUTE WSS-NUM = WSS-NUM ** 8.

      *    DISPLAY 'APOS A EXPONENCIACAO'.
      *    DISPLAY WSS-NUM.

           STOP RUN.
      *
      *END COBOL006.
      ********************* FIM DO PROGRAMA ****************************
