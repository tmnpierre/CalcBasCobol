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
      
      *    Variables pour les opérations.
       01 WS-VARIABLES.
           05 WS-NUM1        PIC 9(5).        
           05 WS-NUM2        PIC 9(5).        
           05 WS-RESULT      PIC 9(5)V99.     

      *    Gestion de l'opération choisie par l'utilisateur.
       01 WS-OPERATION      PIC X.            

      *    Définition des opérations valides.
           88 EXIT-PROGRAM      VALUE 'E'.        
           88 ADDITION          VALUE 'A'.        
           88 SUBTRACTION       VALUE 'S'.        
           88 MULTIPLICATION    VALUE 'M'.        
           88 DIV               VALUE 'D'.        

       PROCEDURE DIVISION.

       0000-MAIN-START.
           PERFORM UNTIL EXIT-PROGRAM

               DISPLAY "Entrer le premier nombre: " WITH NO ADVANCING
               ACCEPT WS-NUM1

               DISPLAY "Entrer le deuxième nombre: " WITH NO ADVANCING
               ACCEPT WS-NUM2

               DISPLAY "Choisir l'opération: " WITH NO ADVANCING
               ACCEPT WS-OPERATION

               MOVE FUNCTION UPPER-CASE(WS-OPERATION) TO WS-OPERATION

                 EVALUATE WS-OPERATION

                   WHEN 'A'
                     IF WS-NUM1 = 1 AND WS-NUM2 = 1 THEN
                     DISPLAY "Le résultat est: 11"
                   ELSE
                     PERFORM ADDITION-PARAGRAPH
                   END-IF

                   WHEN 'S'
                     PERFORM SUBTRACTION-PARAGRAPH

                   WHEN 'M'
                     PERFORM MULTIPLICATION-PARAGRAPH

                   WHEN 'D'
                     IF WS-NUM2 = 0 THEN
                       DISPLAY "Erreur: Division par zéro."
                     ELSE
                       PERFORM DIV-PARAGRAPH
                     END-IF

                   WHEN 'E'
                     CONTINUE 

                   WHEN OTHER
                     DISPLAY "Opération invalide. Veuillez réessayer."

                  END-EVALUATE

           END-PERFORM.
      *    DISPLAY "Programme terminé."

       0000-MAIN-STOP.
           STOP RUN.


      * Paragraphes des opérations mathématiques.
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
           IF WS-NUM2 NOT = 0 THEN
               DIVIDE WS-NUM1 BY WS-NUM2 GIVING WS-RESULT
               DISPLAY "Le résultat de la division est: " WS-RESULT
           ELSE
               DISPLAY "Erreur: Division par zéro."
           END-IF.