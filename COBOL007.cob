000100***************************************************************** 00010003
000110                                                                  00020003
                                                                        00021003
000200* DATA     : 03/01/2024                                           00030003
000300* AUTOR    : VAGNER RENATO BELLACOSA                              00040003
000400* OBJETIVO : PROGRAMA VARIAVEIS BASICO                            00050003
000500* CPD      : INEFE                                                00060003
000600***************************************************************** 00070003
000700                                                                  00080003
000800 IDENTIFICATION DIVISION.                                         00090003
000900*                                                                 00100003
001000 PROGRAM-ID. COBOL007.                                            00110003
                                                                        00111003
001100 AUTHOR. VAGNER BELLACOSA.                                        00120003
001200 DATE-WRITTEN. 03/01/24 @ 22:54:54.                               00130003
001300 DATE-COMPILED. 2024-01-03.                                       00140003
001400*                                                                 00150003
001500 ENVIRONMENT DIVISION.                                            00160003
001600*                                                                 00170003
001700 CONFIGURATION SECTION.                                           00180003
                                                                        00181003
                                                                        00182003
                                                                        00183003
001800*                                                                 00190003
001900 SPECIAL-NAMES.                                                   00200003
002000*                                                                 00210003
002100     DECIMAL-POINT IS COMMA.                                      00220003
002200*                                                                 00230003
002300 INPUT-OUTPUT SECTION.                                            00240003
002400*                                                                 00250003
002500 DATA DIVISION.                                                   00260003
002600*                                                                 00270003
002700 WORKING-STORAGE SECTION.                                         00280003
002800*                                                                 00290003
002900 77 WSS-ALFABETICA             PIC A(10) VALUE SPACES.            00300003
003000 77 WSS-ALFANUMERICO           PIC X(10) VALUE HIGH-VALUES.       00310003
003100 01 WSS-NUMERICO               PIC 9(10) VALUE ZEROES.            00320004
003100 01 REDEFINES WSS-NUMERICO.                                       00321004
         05 WSS-NUM-STRING           PIC X(10).                         00322004
003200*                                                                 00330003
003300 PROCEDURE DIVISION.                                              00340003
003400*                                                                 00350003
003500     DISPLAY 'PROGRAMA COBOL007'.                                 00360003
003600     DISPLAY ' '.                                                 00370003
003700     DISPLAY 'TESTE 001'.                                         00380003
003800     DISPLAY 'WSS-ALFABETICA   = ' WSS-ALFABETICA                 00390003
003900     DISPLAY 'WSS-ALFANUMERICO = ' WSS-ALFANUMERICO               00400003
004000     DISPLAY 'WSS-NUMERICO     = ' WSS-NUMERICO                   00410003
004100                                                                  00420003
004200     DISPLAY ' '.                                                 00430003
004300     MOVE    'ABCDEFGHIJ'     TO WSS-ALFABETICA.                  00440003
004400     MOVE    '1@#$%¨&* !'     TO WSS-ALFANUMERICO.                00450003
004500     MOVE    9999999999       TO WSS-NUMERICO.                    00460003
004600                                                                  00470003
004700     DISPLAY 'TESTE 002'.                                         00480003
004800     DISPLAY 'WSS-ALFABETICA   = ' WSS-ALFABETICA                 00490003
004900     DISPLAY 'WSS-ALFANUMERICO = ' WSS-ALFANUMERICO               00500003
005000     DISPLAY 'WSS-NUMERICO     = ' WSS-NUMERICO                   00510003
005100                                                                  00520003
005200     DISPLAY ' '.                                                 00530003
005300                                                                  00540003
005400     INITIALIZE  WSS-ALFABETICA.                                  00550003
005500     INITIALIZE  WSS-ALFANUMERICO.                                00560003
005600     INITIALIZE  WSS-NUMERICO.                                    00570003
005700                                                                  00580003
005800     DISPLAY 'TESTE 003'.                                         00590003
005900     DISPLAY 'WSS-ALFABETICA   = ' WSS-ALFABETICA                 00600003
006000     DISPLAY 'WSS-ALFANUMERICO = ' WSS-ALFANUMERICO               00610003
006100     DISPLAY 'WSS-NUMERICO     = ' WSS-NUMERICO                   00620003
006200                                                                  00630003
006300****                                                              00640003
006400     MOVE    '%@#$%6'         TO WSS-ALFABETICA.                  00650003
006500     MOVE    789012           TO WSS-ALFANUMERICO.                00660003
006600     MOVE    ZEROES           TO WSS-NUMERICO.                    00670003
006700                                                                  00680003
006800     DISPLAY 'TESTE 003'.                                         00690003
006900     DISPLAY 'WSS-ALFABETICA   = ' WSS-ALFABETICA                 00700003
007000     DISPLAY 'WSS-ALFANUMERICO = ' WSS-ALFANUMERICO               00710003
007100     DISPLAY 'WSS-NUMERICO     = ' WSS-NUMERICO                   00720003
007200                                                                  00730003
007300     DISPLAY ' '.                                                 00740003
007400                                                                  00750003
006300****                                                              00751004
006400     MOVE    '%@#$%6'         TO WSS-ALFABETICA.                  00752004
006500     MOVE    789012           TO WSS-ALFANUMERICO.                00753004
006600     MOVE    'COBOL'          TO WSS-NUM-STRING.                  00754004
006700                                                                  00755004
006800     DISPLAY 'TESTE 004'.                                         00756004
006900     DISPLAY 'WSS-ALFABETICA   = ' WSS-ALFABETICA                 00757004
007000     DISPLAY 'WSS-ALFANUMERICO = ' WSS-ALFANUMERICO               00758004
007100     DISPLAY 'WSS-NUMERICO     = ' WSS-NUMERICO                   00759004
                                                                        00759104
           ADD     001               TO WSS-NUMERICO                    00759204
                                                                        00759304
007100     DISPLAY 'WSS-NUMERICO     = ' WSS-NUMERICO                   00759404
007100     DISPLAY 'WSS-NUM-STRING   = ' WSS-NUM-STRING.                00759504
007200                                                                  00759604
007300     DISPLAY ' '.                                                 00759704
007400                                                                  00759804
007500     STOP RUN.                                                    00760003
007600*                                                                 00770003
007700*END COBOL007.                                                    00780003
007800********************* FIM DO PROGRAMA ****************************00790003
