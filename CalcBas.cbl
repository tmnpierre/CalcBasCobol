      *    *************************************************************
      *    PROGRAMME DE CALCUL BASIQUE                                    
      *    Ce programme permet à l'utilisateur de choisir une opération   
      *    mathématique (addition, soustraction, multiplication,          
      *    division) à effectuer sur deux nombres et continue à exécuter  
      *    jusqu'à ce que "E" soit saisi. Une vérification est effectuée  
      *    pour éviter la division par zéro, affichant un message         
      *    d'erreur le cas échéant.Pour l'addition de 1 + 1, une réponse 
      *    humoristique "11", inspirée par JCVD, est retournée.           
      *    *************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. CalcBas.
       AUTHOR. Pierre.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-VARIABLES.
           05 WS-NUM1        PIC 9(5).        
           05 WS-NUM2        PIC 9(5).        
           05 WS-RESULT      PIC 9(5)V99.     
           05 WS-DIV-RESULT  PIC 9(5)V99 VALUE 0.

       PROCEDURE DIVISION.
       0000-MAIN-START.
           DISPLAY "Entrer le premier nombre: " WITH NO ADVANCING
           ACCEPT WS-NUM1

           DISPLAY "Entrer le deuxième nombre: " WITH NO ADVANCING
           ACCEPT WS-NUM2

           PERFORM ADDITION-PARAGRAPH
           PERFORM SUBTRACTION-PARAGRAPH
           PERFORM MULTIPLICATION-PARAGRAPH
           PERFORM DIV-PARAGRAPH

           DISPLAY "Programme terminé.".

       0000-MAIN-STOP.
           STOP RUN.

       ADDITION-PARAGRAPH.
           ADD WS-NUM2 TO WS-NUM1 GIVING WS-RESULT.
           DISPLAY "Le résultat de l'addition est: " WS-RESULT.

       SUBTRACTION-PARAGRAPH.
           SUBTRACT WS-NUM2 FROM WS-NUM1 GIVING WS-RESULT.
           DISPLAY "Le résultat de la soustraction est: " WS-RESULT.

       MULTIPLICATION-PARAGRAPH.
           MULTIPLY WS-NUM1 BY WS-NUM2 GIVING WS-RESULT.
           DISPLAY "Le résultat de la multiplication est: " WS-RESULT.

       DIV-PARAGRAPH.
           DIVIDE WS-NUM1 BY WS-NUM2 GIVING WS-DIV-RESULT
           DISPLAY "Le résultat de la division est: " WS-DIV-RESULT.