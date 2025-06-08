      *****************************************************************
      * DATA     :  08/08/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA RECEBE PARM DE JCL
      * CPD      : INEFE
      *****************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. COBOL015.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 08/08/24 @ 20:10:00.
       DATE-COMPILED. 2024-08-08.
      *
       ENVIRONMENT DIVISION.
      *
      ***
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
      *
       77 WSS-NOME          PIC X(10) VALUE LOW-VALUES.
       77 WSS-TAMANHO       PIC ZZZ9.
      *
       LINKAGE SECTION.
      *
       01 LKS-PARM-IBM.
        05 LKS-PARAM-TAM    PIC S9(04) COMP.
        05 LKS-PARAM-GROUP.
         10 LKS-NUMERO      PIC 9(003).
      *
      *-------------------------------------
       PROCEDURE DIVISION USING LKS-PARM-IBM.
      *-------------------------------------
      *
      ** VALIDACAO
      *
           DISPLAY ' COBOL015'
           DISPLAY ' PARAMETROS RECEBIDOS NESTE PROCESSAMENTO'
           DISPLAY ' LKS-PARM-IBM    = ' LKS-PARM-IBM
           DISPLAY ' LKS-PARAM-TAM   = ' LKS-PARAM-TAM
           DISPLAY ' LKS-PARAM-GROUP = ' LKS-PARAM-GROUP
           DISPLAY ' LKS-NUMERO = ' LKS-NUMERO
           DISPLAY ' '.

           ACCEPT WSS-NOME.

           IF WSS-NOME EQUAL LOW-VALUE
             NEXT SENTENCE
           ELSE
             DISPLAY ' '
             DISPLAY ' OLA, ' WSS-NOME ' ESTE EH UM EXEPLO DE ACCEPT '
                     ' SYSIN'
             DISPLAY ' '
           END-IF.

           ACCEPT WSS-NOME.

           DISPLAY ' WSS-NOME ' WSS-NOME

           MOVE LKS-PARAM-TAM TO WSS-TAMANHO.

           IF LKS-PARAM-TAM > 3
             DISPLAY '********************************************'
             DISPLAY '*** ERRO GRAVE                           ***'
             DISPLAY '*** TAMANHO INFORMADO MAIOR QUE O ESPERADO *'
             DISPLAY '********************************************'
             DISPLAY ' NUMERO RECEBIDO LKS-NUMERO = ' LKS-NUMERO
             DISPLAY ' TAMANHO DO PARAMETRO = ' WSS-TAMANHO
             MOVE 100  TO RETURN-CODE
             PERFORM ROT-ABEND
           END-IF.

           IF LKS-PARAM-TAM < 3
             DISPLAY '********************************************'
             DISPLAY '*** ERRO GRAVE                           ***'
             DISPLAY '*** TAMANHO INFORMADO MENOR QUE O ESPERADO *'
             DISPLAY '********************************************'
             DISPLAY ' NUMERO RECEBIDO LKS-NUMERO = ' LKS-NUMERO
             DISPLAY ' TAMANHO DO PARAMETRO = ' WSS-TAMANHO
             MOVE 200  TO RETURN-CODE
             PERFORM ROT-ABEND
           END-IF.
      *
           IF LKS-NUMERO NOT NUMERIC
             DISPLAY '*******************************************'
             DISPLAY '*** ERRO GRAVE                          ***'
             DISPLAY '*** NAO EH UM NUMERO                    ***'
             DISPLAY '*******************************************'
             DISPLAY ' LKS-NUMERO = ' LKS-NUMERO
             MOVE 300  TO RETURN-CODE
             PERFORM ROT-ABEND
           END-IF.
      *
      ** EXIBE PARAMETRO
      *
           IF LKS-NUMERO > 100
             DISPLAY '***************************'
             DISPLAY '* '  LKS-NUMERO   ' NUMERO MAIOR QUE 100 '
           ELSE
             DISPLAY '***************************'
             DISPLAY '* NUMERO = ' LKS-NUMERO
             DISPLAY '***************************'
           END-IF.

           PERFORM ROT-DISP LKS-NUMERO TIMES

           DISPLAY ' **** '

           PERFORM ROT-DISP
              THRU ROT-DISP-EXIT.

           DISPLAY ' '
           DISPLAY ' NOVO EXEMPLO'.
           DISPLAY ' '

           PERFORM ROT-DISP
              THRU ROT-DISP-DOIS.

           STOP RUN.

       ROT-DISP.

           DISPLAY ' TESTE '.


       ROT-DISP-UM.

           DISPLAY ' UM    '.

       ROT-DISP-DOIS.

           DISPLAY ' DOIS  '.

       ROT-DISP-EXIT.

           DISPLAY ' SAI   '.
           EXIT.

       ROT-ABEND.

           DISPLAY ' CODIGO DE ERRO = ' RETURN-CODE

           STOP RUN.

       ROT-ABEND-EXIT.

           EXIT.

       END PROGRAM COBOL015.
      ********************** FIM DO PROGRAMA ***************************
