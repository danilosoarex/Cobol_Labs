      *****************************************************************
      * DATA     :  16/02/2024
      * AUTOR    : VAGNER RENATO BELLACOSA
      * OBJETIVO : PROGRAMA EXEMPLO EVALUATE WHEN COM ALSO
      * CPD      : INEFE
      *****************************************************************
      *-----------------------*
       IDENTIFICATION DIVISION.
      *-----------------------*

       PROGRAM-ID. COBOL034.
       AUTHOR. VAGNER BELLACOSA.
       DATE-WRITTEN. 16/02/24 @ 22:20:00.
       DATE-COMPILED. 2024-02-16.
       INSTALLATION. INEFE.
       SECURITY. NORMAL.

      *---------------------*
       ENVIRONMENT DIVISION.
      *---------------------*

      *-------------*
       DATA DIVISION.
      *-------------*

       WORKING-STORAGE SECTION.

       01 AGE                       PIC 9(3).
       01 GENDER                    PIC X(1).

      *------------------*
       PROCEDURE DIVISION.
      *------------------*

           ACCEPT AGE.
           ACCEPT GENDER.

           EVALUATE TRUE ALSO TRUE
               WHEN AGE > 60 ALSO GENDER = 'M'
                    DISPLAY 'THE MAN IS RETIRED   '
               WHEN AGE > 60 ALSO GENDER = 'F'
                    DISPLAY 'THE WOMAN IS RETIRED  '
               WHEN AGE <= 60 ALSO GENDER = 'M'
                    DISPLAY 'THE MAN IS NOT RETIRED   '
               WHEN AGE <= 60 ALSO GENDER = 'F'
                    DISPLAY 'THE WOMAN IS NOT RETIRED  '
               WHEN OTHER
                    DISPLAY 'INVALID INPUT      '
                    DISPLAY 'AGE =' AGE ' AND GENDER =' GENDER
           END-EVALUATE.

           STOP RUN.

       END PROGRAM COBOL034.
      ********************** FIM DO PROGRAMA ***************************
