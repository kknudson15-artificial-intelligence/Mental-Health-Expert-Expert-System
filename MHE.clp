;*************************************************************************************************************
;* Programmer: Kyle Knudson & Joe Palmersten                                                                                  *                      
;*                                                                                                           *   
;* Title: Mental Health Evaluator                                                                            *       
;*                                                                                                           *                       
;*                                                                                                           *                          
;* Date: 2/20/19                                                                                             *                   
;*                                                                                                           *                       
;* Description:                                                                                              *                           
;* Mental Health evlauator that determines if a mental disorder exists and what treatment plan to follow.    *
;*                                                                                                           *                       
;* 148 Rules                                                                                                 *                       
;* 11 Modules                                                                                                *                       
;*************************************************************************************************************

;**********************************
;defmodules                       *
;**********************************

;7 Rules
(defmodule ISCREEN
(export deftemplate patient))

(deftemplate ISCREEN::patient
(slot name)
(multislot birthdate (default NONE))
(slot gender (default NONE))
(multislot height (default NONE))
(slot weight (default NONE))
(slot high_weight (default NONE))
(slot low_weight (default NONE))
(slot ideal_weight (default NONE))
)


;9 Rules
(defmodule SCOFF
(import ISCREEN deftemplate patient)
(export deftemplate eat))

(deftemplate SCOFF::eat 
(slot name)
(slot Q1 (default NONE))
(slot Q2 (default NONE))
(slot Q3 (default NONE))
(slot Q4 (default NONE))
(slot Q5 (default NONE))
(slot score (default NONE)))


;34 Rules
(defmodule EAT
(import ISCREEN deftemplate patient)
(import SCOFF deftemplate eat)
(export deftemplate eat26)
)

(deftemplate EAT::eat26
(slot name)
(slot Q1 (default NONE))
(slot Q2 (default NONE))
(slot Q3 (default NONE))
(slot Q4 (default NONE))
(slot Q5 (default NONE))
(slot Q6 (default NONE))
(slot Q7 (default NONE))
(slot Q8 (default NONE))
(slot Q9 (default NONE))
(slot Q10 (default NONE))
(slot Q11 (default NONE))
(slot Q12 (default NONE))
(slot Q13 (default NONE))
(slot Q14 (default NONE))
(slot Q15 (default NONE))
(slot Q16 (default NONE))
(slot Q17 (default NONE))
(slot Q18 (default NONE))
(slot Q19 (default NONE))
(slot Q20 (default NONE))
(slot Q21 (default NONE))
(slot Q22 (default NONE))
(slot Q23 (default NONE))
(slot Q24 (default NONE))
(slot Q25 (default NONE))
(slot Q26 (default NONE))
(slot score (default NONE))
(slot Anorexia(default NONE))
(slot Bulimia(default NONE))
(slot Binge(default NONE))
)


;12 Rules
(defmodule GAD
(import ISCREEN deftemplate patient)
(import SCOFF deftemplate eat)
(export deftemplate GAD7)
)
(deftemplate GAD::GAD7
(slot name)
(slot Q1  (default NONE))
(slot Q2 (default NONE))
(slot Q3  (default NONE))
(slot Q4  (default NONE))
(slot Q5  (default NONE))
(slot Q6  (default NONE))
(slot Q7  (default NONE))
(slot score (default NONE))
)


;15 Rules
(defmodule PHQ
(import GAD deftemplate GAD7)
(import ISCREEN deftemplate patient)
(import SCOFF deftemplate eat)
(export deftemplate PHQ9)
)


;**********************************
;deftemplate                      *
;**********************************


(deftemplate PHQ::PHQ9
(slot name)
(slot PQ1 (default NONE))
(slot PQ2 (default NONE))
(slot PQ3 (default NONE))
(slot PQ4 (default NONE))
(slot PQ5 (default NONE))
(slot PQ6 (default NONE))
(slot PQ7 (default NONE))
(slot PQ8 (default NONE))
(slot PQ9 (default NONE))
(slot seasonals (type SYMBOL)(default NONE))
(slot Major (default NONE))
(slot Persistent (default NONE))
(slot score2 (default NONE))
)


;13 Rules
(defmodule PANIC
(import GAD deftemplate GAD7)
(import ISCREEN deftemplate patient)
(import SCOFF deftemplate eat)
(import PHQ deftemplate PHQ9)
(export deftemplate panic)
)

(deftemplate PANIC::panic 
(slot name)
(slot Q1 (default NONE))
(slot Q2 (default NONE))
(slot Q3 (default NONE))
(slot Q4 (default NONE))
(slot Q5 (default NONE))
(slot Q6 (default NONE))
(slot Q7 (default NONE))
(slot Q8 (default NONE))
(slot Q9 (default NONE))
(slot Q10 (default NONE))
(slot score (default NONE)))



;13 Rules
(defmodule SOCIAL
(import GAD deftemplate GAD7)
(import ISCREEN deftemplate patient)
(import SCOFF deftemplate eat)
(import PHQ deftemplate PHQ9)
(import PANIC deftemplate panic)
(export deftemplate social)
)

(deftemplate SOCIAL::social 
(slot name)
(slot Q1 (default NONE))
(slot Q2 (default NONE))
(slot Q3 (default NONE))
(slot Q4 (default NONE))
(slot Q5 (default NONE))
(slot Q6 (default NONE))
(slot Q7 (default NONE))
(slot Q8 (default NONE))
(slot Q9 (default NONE))
(slot Q10 (default NONE))
(slot score (default NONE)))




;20 Rules
(defmodule MOOD
(import GAD deftemplate GAD7)
(import ISCREEN deftemplate patient)
(import SCOFF deftemplate eat)
(import PHQ deftemplate PHQ9)
(import SOCIAL deftemplate social)
(import PANIC deftemplate panic)
(export deftemplate mood)
)

(deftemplate MOOD::mood 
(slot name)
(slot Q1 (default NONE))
(slot Q2 (default NONE))
(slot Q3 (default NONE))
(slot Q4 (default NONE))
(slot Q5 (default NONE))
(slot Q6 (default NONE))
(slot Q7 (default NONE))
(slot Q8 (default NONE))
(slot Q9 (default NONE))
(slot Q10 (default NONE))
(slot Q11 (default NONE))
(slot Q12 (default NONE))
(slot Q13 (default NONE))
(slot Q14 (default NONE))
(slot Q15 (default NONE))
(slot Q16 (default NONE))
(slot Q17 (default NONE))
(slot score (default NONE)))





;13 Rules
(defmodule DIAGNOSIS 
(import ISCREEN ?ALL)
(import SCOFF ?ALL)
(import PHQ ?ALL)
(import EAT ?ALL)
(import GAD ?ALL)
(import PANIC ?ALL)
(import SOCIAL ?ALL)
(import MOOD ?ALL)
(export deftemplate diagnosis)
)

(deftemplate DIAGNOSIS::diagnosis
(slot name (default NONE))
(slot Anxiety (default NO))
(slot Socials(default NO))
(slot Depression (default NO))
(slot Panic (default NO))
(slot Mood (default NO))
(slot Eating(default NO))
(slot None(default NO))
)


;11 Rules
(defmodule TREATMENT
(import SCOFF ?ALL)
(import PHQ ?ALL)
(import EAT ?ALL)
(import GAD ?ALL)
(import PANIC ?ALL)
(import SOCIAL ?ALL)
(import MOOD ?ALL)
(import DIAGNOSIS ?ALL)
)

;1 Rules
(defmodule MAIN
(import ISCREEN ?ALL)
(import SCOFF ?ALL)
(import PHQ ?ALL)
(import EAT ?ALL)
(import GAD ?ALL)
(import PANIC ?ALL)
(import SOCIAL ?ALL)
(import MOOD ?ALL)
(import DIAGNOSIS ?ALL)
)

;**********************************
;deffacts                         *
;**********************************
(deffacts GAD::initial-information
(Ascore 0)
)
(deffacts PHQ::initial-information2
(score2 0)
)

(deffacts SCOFF::initial
(score 0))

(deffacts EAT::initial
(score 0)
(score2 0)
(score3 0)
(score4 0)
)

(deffacts PANIC::initial
(pscore 0)
)

(deffacts SOCIAL::initial
(sscore 0)
)

(deffacts MOOD::initial
(mscore 0)
)

;**********************************
;defrules                         *
;**********************************


(defrule MAIN::start
=>
(printout t "Welcome to the Mental Health Evaluator!" crlf)
(printout t "---------------------------------------------------------------------------------------" crlf)
(focus ISCREEN SCOFF GAD PHQ MOOD DIAGNOSIS TREATMENT)
)


(defrule ISCREEN::get-patient-name
(declare(salience 50))
=>
(printout t "First off, what is your name?" crlf)
(bind ?response(read))
f1 <-(assert (patient(name ?response)))
)

(defrule ISCREEN::date-of-birth
?f1<-(patient(name ?name) (birthdate NONE))
=>
(printout t "Enter your Date of Birth in the form: MM DD YYYY" crlf)
(bind ?response (explode$ (readline)))
(modify ?f1 (birthdate ?response)))


(defrule ISCREEN::gender
?f1<-(patient(name ?name) (gender NONE))
=>
(printout t "What is your gender (Male or Female)" crlf)
(bind ?response(read))
(modify ?f1 (gender ?response))
)

(defrule ISCREEN::height
?f1<-(patient(name ?name) (height NONE))
=>
(printout t "Enter your Height in the form: Feet inches" crlf)
(bind ?response (explode$ (readline)))

(modify ?f1 (height ?response))
)

(defrule ISCREEN::current_weight
?f1<-(patient(name ?name) (weight NONE))
=>
(printout t "What is your current weight in pounds" crlf)
(bind ?response(read))
(modify ?f1 (weight ?response))
)

(defrule ISCREEN::highest_weight
?f1<-(patient(name ?name) (high_weight NONE))
=>
(printout t "What is your highest weight in pounds (excluding pregnancies)" crlf)
(bind ?response(read))
(modify ?f1 (high_weight ?response))
)

(defrule ISCREEN::lowest_weight
?f1<-(patient(name ?name) (low_weight NONE))
=>
(printout t "What is your lowest weight in pounds" crlf)
(bind ?response(read))
(modify ?f1 (low_weight ?response))
)


(defrule SCOFF::entry
(declare(salience 40))
(patient(name ?name))
=>
(printout t "---------------------------------------------------------------------------------------" crlf)
(printout t " Enter 0 for No and 1 for yes" crlf)
(printout t "---------------------------------------------------------------------------------------" crlf)
f1 <-(assert (eat(name ?name)))
)

(defrule SCOFF::SQ1
?f1<-(eat(name ?name) (Q1 NONE))
=>
(printout t "Do you make yourself Sick becuase you fell uncomfortably full?" crlf)
(bind ?response(read))
(modify ?f1 (Q1 ?response))
(assert (add-to-sum ?response))
)

(defrule SCOFF::SQ2
?f1<-(eat(name ?name) (Q2 NONE))
=>
(printout t "Do you worry you have lost Control over how much you eat?" crlf)
(bind ?response(read))
(modify ?f1 (Q2 ?response))
(assert (add-to-sum ?response))
)

(defrule SCOFF::SQ3
?f1<-(eat(name ?name) (Q3 NONE))
=>
(printout t "Have you recently lost more than one stone (14 lbs) in a 3 month period?" crlf)
(bind ?response(read))
(modify ?f1 (Q3 ?response))
(assert (add-to-sum ?response))
)

(defrule SCOFF::SQ4
?f1<-(eat(name ?name) (Q4 NONE))
=>
(printout t "Do you believe yourself to be Fat when others say you are too thin?" crlf)
(bind ?response(read))
(modify ?f1 (Q4 ?response))
(assert (add-to-sum ?response))
)

(defrule SCOFF::SQ5
?f1<-(eat(name ?name) (Q5 NONE))
=>
(printout t "Would you say that food dominates your life?" crlf)
(bind ?response(read))
(modify ?f1 (Q5 ?response))
(assert (add-to-sum ?response))
)

(defrule SCOFF::sum-scores
?sum <- (score ?total)
?new-score <- (add-to-sum ?score)
=>
(retract ?sum ?new-score)
(assert (score (+ ?total ?score)))
)


(defrule SCOFF::eval
(declare (salience -100))
?f1<-(eat(name ?name) (score NONE))
(score ?score)
=>
(modify ?f1 (score ?score))
(if (>= ?score 2)
then 
(clear-focus-stack)
(focus EAT GAD PHQ MOOD DIAGNOSIS TREATMENT)
))

(defrule SCOFF::eval2
(declare (salience -110))
(score ?score)
(>= ?score 2)
=>
(clear-focus-stack)
(focus EAT GAD PHQ MOOD DIAGNOSIS TREATMENT)
)




(defrule EAT::entry
(declare(salience 40))
(patient(name ?name))
=>
(printout t "---------------------------------------------------------------------------------------" crlf)
(printout t"The scale for the following questions is as follows" crlf)
(printout t "0: Never" crlf)
(printout t "1: Rarely" crlf)
(printout t "2: Sometimes" crlf)
(printout t "3: Often" crlf)
(printout t "4: Usually" crlf)
(printout t "5: Always" crlf)
(printout t "---------------------------------------------------------------------------------------" crlf)
f1<-(assert (eat26(name ?name)))
)

(defrule EAT::EQ1
?f1<-(eat26(name ?name) (Q1 NONE))
=>
(printout t "Am terrified about being overweight" crlf)
(bind ?response(read))
(modify ?f1 (Q1 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::EQ2
?f1<-(eat26(name ?name) (Q2 NONE))
=>
(printout t "Avoid eating when I am hungry" crlf)
(bind ?response(read))
(modify ?f1 (Q2 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum4 ?response))
)

(defrule EAT::EQ3
?f1<-(eat26(name ?name) (Q3 NONE))
=>
(printout t "Find myself preoccupied with food" crlf)
(bind ?response(read))
(modify ?f1 (Q3 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum3 ?response))
)

(defrule EAT::EQ4
?f1<-(eat26(name ?name) (Q4 NONE))
=>
(printout t "Have gone on eating binges where I feel that I may not be able to stop." crlf)
(bind ?response(read))
(modify ?f1 (Q4 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum3 ?response))
)

(defrule EAT::EQ5
?f1<-(eat26(name ?name) (Q5 NONE))
=>
(printout t "Cut my food into small pieces" crlf)
(bind ?response(read))
(modify ?f1 (Q5 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum4 ?response))
)


(defrule EAT::EQ6
?f1<-(eat26(name ?name) (Q6 NONE))
=>
(printout t " Aware of the calorie content of foods that I eat" crlf)
(bind ?response(read))
(modify ?f1 (Q6 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::EQ7
?f1<-(eat26(name ?name) (Q7 NONE))
=>
(printout t "Particularly avoid food with a high carbohydrate content (i.e. bread, rice, potatoes, etc.)" crlf)
(bind ?response(read))
(modify ?f1 (Q7 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::EQ8
?f1<-(eat26(name ?name) (Q8 NONE))
=>
(printout t "Feel that others would prefer if I ate more." crlf)
(bind ?response(read))
(modify ?f1 (Q8 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum4 ?response))
)

(defrule EAT::EQ9
?f1<-(eat26(name ?name) (Q9 NONE))
=>
(printout t "Vomit after I have eaten." crlf)
(bind ?response(read))
(modify ?f1 (Q9 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum3 ?response))
)

(defrule EAT::EQ10
?f1<-(eat26(name ?name) (Q10 NONE))
=>
(printout t "Feel extremely guilty after eating." crlf)
(bind ?response(read))
(modify ?f1 (Q10 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)


(defrule EAT::EQ11
?f1<-(eat26(name ?name) (Q11 NONE))
=>
(printout t "Am preoccupied with a desire to be thinner." crlf)
(bind ?response(read))
(modify ?f1 (Q11 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::EQ12
?f1<-(eat26(name ?name) (Q12 NONE))
=>
(printout t "Think about burning up calories when I exercise" crlf)
(bind ?response(read))
(modify ?f1 (Q12 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::EQ13
?f1<-(eat26(name ?name) (Q13 NONE))
=>
(printout t "Other people think that I am too thin." crlf)
(bind ?response(read))
(modify ?f1 (Q13 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum4 ?response))
)

(defrule EAT::EQ14
?f1<-(eat26(name ?name) (Q14 NONE))
=>
(printout t "Am preoccupied with the thought of having fat on my body." crlf)
(bind ?response(read))
(modify ?f1 (Q14 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::EQ15
?f1<-(eat26(name ?name) (Q15 NONE))
=>
(printout t "Take longer than others to eat my meals." crlf)
(bind ?response(read))
(modify ?f1 (Q15 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum4 ?response))
)


(defrule EAT::EQ16
?f1<-(eat26(name ?name) (Q16 NONE))
=>
(printout t "Avoid foods with sugar in them" crlf)
(bind ?response(read))
(modify ?f1 (Q16 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::EQ17
?f1<-(eat26(name ?name) (Q17 NONE))
=>
(printout t "Eat diet foods" crlf)
(bind ?response(read))
(modify ?f1 (Q17 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::EQ18
?f1<-(eat26(name ?name) (Q18 NONE))
=>
(printout t "Feel that food controls my life" crlf)
(bind ?response(read))
(modify ?f1 (Q18 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum3 ?response))
)

(defrule EAT::EQ19
?f1<-(eat26(name ?name) (Q19 NONE))
=>
(printout t " Display self-control around food." crlf)
(bind ?response(read))
(modify ?f1 (Q19 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum4 ?response))
)

(defrule EAT::EQ20
?f1<-(eat26(name ?name) (Q20 NONE))
=>
(printout t "Feel that others pressure me to eat." crlf)
(bind ?response(read))
(modify ?f1 (Q20 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum4 ?response))
)

(defrule EAT::EQ21
?f1<-(eat26(name ?name) (Q21 NONE))
=>
(printout t "Give too much time and thought to food." crlf)
(bind ?response(read))
(modify ?f1 (Q21 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum3 ?response))
)

(defrule EAT::EQ22
?f1<-(eat26(name ?name) (Q22 NONE))
=>
(printout t "Feel uncomfortable after eating sweets" crlf)
(bind ?response(read))
(modify ?f1 (Q22 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::EQ23
?f1<-(eat26(name ?name) (Q23 NONE))
=>
(printout t "Engage in dieting behavior." crlf)
(bind ?response(read))
(modify ?f1 (Q23 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::EQ24
?f1<-(eat26(name ?name) (Q24 NONE))
=>
(printout t "Like my stomach to be empty" crlf)
(bind ?response(read))
(modify ?f1 (Q24 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::EQ25
?f1<-(eat26(name ?name) (Q25 NONE))
=>
(printout t "Have the impulse to vomit after meals" crlf)
(bind ?response(read))
(modify ?f1 (Q25 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum3 ?response))
)

(defrule EAT::EQ26
?f1<-(eat26(name ?name) (Q26 NONE))
=>
(printout t "Enjoy trying new rich foods." crlf)
(bind ?response(read))
(modify ?f1 (Q26 ?response))
(assert (add-to-sum ?response))
(assert (add-to-sum2 ?response))
)

(defrule EAT::sum-scores
?sum <- (score ?total)
?new-score <- (add-to-sum ?score)
=>
(retract ?sum ?new-score)
(assert (score (+ ?total ?score)))
)

(defrule EAT::sum-scores2
?sum <- (score2 ?total)
?new-score <- (add-to-sum2 ?score)
=>
(retract ?sum ?new-score)
(assert (score2 (+ ?total ?score)))
)

(defrule EAT::sum-scores3
?sum <- (score3 ?total)
?new-score <- (add-to-sum3 ?score)
=>
(retract ?sum ?new-score)
(assert (score3 (+ ?total ?score)))
)


(defrule EAT::sum-scores4
?sum <- (score4 ?total)
?new-score <- (add-to-sum4 ?score)
=>
(retract ?sum ?new-score)
(assert (score4 (+ ?total ?score)))
)

(defrule EAT::anorexia
(declare (salience -100))
?f1<-(eat26(name ?name) (Anorexia NONE))
(score ?score)
(test (> ?score 20))
(score2 ?score2)
(score3 ?score3)
(score4 ?score4)
=>
(if (and (> ?score2 ?score3) (> ?score2 ?score4))
then
(printout t "You have Anorexia" crlf)
(modify ?f1 (Anorexia Yes))
)
)

(defrule EAT::bulimia
(declare (salience -100))
?f1<-(eat26(name ?name) (Bulimia NONE))
(score ?score)
(test (> ?score 20))
(score2 ?score2)
(score3 ?score3)
(score4 ?score4)
=>
(if(and (> ?score3 ?score2) (> ?score3 ?score4))
then
(printout t "You have Bulimia" crlf)
(modify ?f1 (Bulimia Yes))
))

(defrule EAT::binge
(declare (salience -100))
?f1<-(eat26(name ?name) (Binge NONE))
(score ?score)
(test (> ?score 20))
(score2 ?score2)
(score3 ?score3)
(score4 ?score4)
=>
(if(and (> ?score4 ?score3) (> ?score4 ?score2))
then
(printout t "You have a binge eating disorder" crlf)
(modify ?f1 (Binge Yes))
))


(defrule GAD::get-name 
(declare(salience 50))
(patient (name ?name))
=>
f1 <-(assert (GAD7(name ?name)))
)

(defrule GAD::scale1 
(declare(salience 40))
=>
(printout t "---------------------------------------------------------------------------------------" crlf)
(printout t "Over the last 2 weeks, how often have you been bother by the following problems?" crlf)
(printout t"The scale for the following questions is as follows" crlf)
(printout t "0: Not at all" crlf)
(printout t "1: Several Days" crlf)
(printout t "2: More than half of the days" crlf)
(printout t "3: Nearly every day" crlf)
(printout t "---------------------------------------------------------------------------------------" crlf)
)

(defrule GAD::Q1
?f1<-(GAD7(name ?name) (Q1 NONE))
=> 
(printout t "Feeling nervous, anxious or on edge" crlf)
(bind ?input(read))
(modify ?f1 (Q1 ?input))
(assert (add-to-sum ?input))
)

(defrule GAD::Q2
?f1<-(GAD7(name ?name) (Q2 NONE))
=> 
(printout t "Not being able to stop or control worrying" crlf)
(bind ?input(read))
(modify ?f1 (Q2 ?input))
(assert (add-to-sum ?input))
)

(defrule GAD::Q3
?f1<-(GAD7(name ?name) (Q3 NONE))
=> 
(printout t "Worrying too much about different things" crlf)
(bind ?input(read))
(modify ?f1 (Q3 ?input))
(assert (add-to-sum ?input))
)

(defrule GAD::Q4
?f1<-(GAD7(name ?name) (Q4 NONE))
=> 
(printout t "Trouble relaxing" crlf)
(bind ?input(read))
(modify ?f1 (Q4 ?input))
(assert (add-to-sum ?input))
)

(defrule GAD::Q5
?f1<-(GAD7(name ?name) (Q5 NONE))
=> 
(printout t "Being so restless that it is hard to sit still" crlf)
(bind ?input(read))
(modify ?f1(Q5 ?input))
(assert (add-to-sum ?input))
)

(defrule GAD::Q6
?f1<-(GAD7(name ?name) (Q6 NONE))
=> 
(printout t "Becoming easily annoyed or irritable" crlf)
(bind ?input(read))
(modify ?f1 (Q6 ?input))
(assert (add-to-sum ?input))
)

(defrule GAD::Q7
?f1<-(GAD7(name ?name) (Q7 NONE))
=> 
(printout t "Feeling afraid as if something awful might happen" crlf)
(bind ?input(read))
(modify ?f1 (Q7 ?input))
(assert (add-to-sum ?input))
)

(defrule GAD::sum-scores
?sum <- (Ascore ?total)
?new-score <- (add-to-sum ?score)
=>
(retract ?sum ?new-score)
(assert (Ascore (+ ?total ?score)))
)

(defrule GAD::evaluation
(declare (salience -110))
(Ascore ?score)
=>
(if (> ?score 4)
then
(clear-focus-stack)
(focus PANIC SOCIAL PHQ MOOD DIAGNOSIS TREATMENT))
)

(defrule GAD::advice
(declare (salience -100))
?f1<-(GAD7(name ?name) (score NONE))
(Ascore ?score)
=>
(modify ?f1 (score ?score)))

;---------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------

;PHQ9 Rules

(defrule PHQ::scale2
(declare(salience 100))
(GAD7 (name ?name))
=>
(printout t "---------------------------------------------------------------------------------------" crlf)
(printout t "Over the last 2 weeks, how often have you been bother by the following problems?" crlf)
(printout t"The scale for the following questions is as follows" crlf)
(printout t "0: Not at all" crlf)
(printout t "1: Several Days" crlf)
(printout t "2: More than half of the days" crlf)
(printout t "3: Nearly every day" crlf)
(printout t "---------------------------------------------------------------------------------------" crlf)
f1 <-(assert (PHQ9(name ?name)))
)

(defrule PHQ::PQ1
?f1<-(PHQ9(name ?name) (PQ1 NONE))
=> 
(printout t "Little interest or pleasure in doing things" crlf)
(bind ?input(read))
(modify ?f1 (PQ1 ?input))
(assert (add-to-sum2 ?input))
)

(defrule PHQ::PQ2
?f1<-(PHQ9(name ?name) (PQ2 NONE))
=> 
(printout t "Feeling down, depressed, or hopeless" crlf)
(bind ?input(read))
(modify ?f1 (PQ2 ?input))
(assert (add-to-sum2 ?input))
)

(defrule PHQ::PQ3
?f1<-(PHQ9(name ?name) (PQ3 NONE))
=> 
(printout t "Trouble falling or staying asleep, or sleeping too much" crlf)
(bind ?input(read))
(modify ?f1 (PQ3 ?input))
(assert (add-to-sum2 ?input))
)

(defrule PHQ::PQ4
?f1<-(PHQ9(name ?name) (PQ4 NONE))
=> 
(printout t "Feeling tired or having little energy" crlf)
(bind ?input(read))
(modify ?f1 (PQ4 ?input))
(assert (add-to-sum2 ?input))
)

(defrule PHQ::PQ5
?f1<-(PHQ9(name ?name) (PQ5 NONE))
=> 
(printout t "Poor appetite or overeating" crlf)
(bind ?input(read))
(modify ?f1 (PQ5 ?input))
(assert (add-to-sum2 ?input))
)

(defrule PHQ::PQ6
?f1<-(PHQ9(name ?name) (PQ6 NONE))
=> 
(printout t "Feeling bad about yourself -- or that you are a failure or have let yourself or your family down" crlf)
(bind ?input(read))
(modify ?f1 (PQ6 ?input))
(assert (add-to-sum2 ?input))
)

(defrule PHQ::PQ7
?f1<-(PHQ9(name ?name) (PQ7 NONE))
=> 
(printout t "Trouble concentrating on things, such as reading the newspaper or watching television" crlf)
(bind ?input(read))
(modify ?f1 (PQ7 ?input))
(assert (add-to-sum2 ?input))
)

(defrule PHQ::PQ8
?f1<-(PHQ9(name ?name) (PQ8 NONE))
=> 
(printout t "Moving or speaking so slowly that other people could have noticed?" crlf)
(printout t "or the opposite --- being so fidgety or restless that you have been moving around a lot more than usual" crlf)
(bind ?input(read))
(modify ?f1 (PQ8 ?input))
(assert (add-to-sum2 ?input))
)

(defrule PHQ::PQ9
?f1<-(PHQ9(name ?name) (PQ9 NONE))
=> 
(printout t "Thoughts that you would be better off dead or of hurting yourself in some way" crlf)
(bind ?input(read))
(modify ?f1 (PQ9 ?input))
(assert (add-to-sum2 ?input))
)

(defrule PHQ::sum-scores2
?sum2 <- (score2 ?total)
?new-score2 <- (add-to-sum2 ?score)
=>
(retract ?sum2 ?new-score2)
(assert (score2 (+ ?total ?score)))
)

(defrule PHQ::seasonal
(declare (salience -90))
?f1<-(PHQ9(name ?name) (seasonals NONE))
(score2 ?score)
=>
(if (< ?score 9)
then
(printout t "Are your moods usually affected by the weather? (Yes or NO)" crlf)
(bind ?response (read))
(modify ?f1 (seasonals ?response)))
)

(defrule PHQ::majorQ
(declare (salience -90))
?f1<-(PHQ9(name ?name) (Major NONE))
(score2 ?score)
=>
(if (>= ?score 15)
then
(modify ?f1 (Major Yes)))
)

(defrule PHQ::PersistentQ
(declare (salience -95))
?f1<-(PHQ9(name ?name) (Major Yes) (Persistent NONE))
=>
(printout t "Have you be experiencing these moods/symptoms for approximately 2 years or more? (Yes or NO)" crlf)
(bind ?response (read))
(modify ?f1 (Persistent ?response))
)


(defrule PHQ::advice2
(declare (salience -100))
?f1<-(PHQ9(name ?name) (score2 NONE))
(score2 ?score)
=>
(modify ?f1 (score2 ?score)))



(defrule PANIC::entry
(declare(salience 40))
(patient(name ?name))
=>
(printout t "---------------------------------------------------------------------------------------" crlf)
(printout t"The scale for the following questions is as follows" crlf)
(printout t "0: Never" crlf)
(printout t "1: Ocassionally" crlf)
(printout t "2: Half of the time" crlf)
(printout t "3: Most of the time" crlf)
(printout t "4: All of the time" crlf)
(printout t "---------------------------------------------------------------------------------------" crlf)
f1<-(assert (panic(name ?name)))
)

(defrule PANIC::PQ1
?f1<-(panic(name ?name) (Q1 NONE))
=>
(printout t "felt moments of sudden terror, fear or fright, sometimes out of the blue (i.e., a panic attack)" crlf)
(bind ?response(read))
(modify ?f1 (Q1 ?response))
(assert (add-to-sum ?response))
)

(defrule PANIC::PQ2
?f1<-(panic(name ?name) (Q2 NONE))
=>
(printout t "felt anxious, worried, or nervous about having more panic attacks" crlf)
(bind ?response(read))
(modify ?f1 (Q2 ?response))
(assert (add-to-sum ?response))
)

(defrule PANIC::PQ3
?f1<-(panic(name ?name) (Q3 NONE))
=>
(printout t "had thoughts of losing control, dying, going crazy, or other bad things happening because of panic attacks" crlf)
(bind ?response(read))
(modify ?f1 (Q3 ?response))
(assert (add-to-sum ?response))
)

(defrule PANIC::PQ4
?f1<-(panic(name ?name) (Q4 NONE))
=>
(printout t "felt a racing heart, sweaty, trouble breathing, faint, or shaky" crlf)
(bind ?response(read))
(modify ?f1 (Q4 ?response))
(assert (add-to-sum ?response))
)

(defrule PANIC::PQ5
?f1<-(panic(name ?name) (Q5 NONE))
=>
(printout t "felt tense muscles, felt on edge or restless, or had trouble relaxing or trouble sleeping" crlf)
(bind ?response(read))
(modify ?f1 (Q5 ?response))
(assert (add-to-sum ?response))
)


(defrule PANIC::PQ6
?f1<-(panic(name ?name) (Q6 NONE))
=>
(printout t "avoided, or did not approach or enter, situations in which panic attacks might occur" crlf)
(bind ?response(read))
(modify ?f1 (Q6 ?response))
(assert (add-to-sum ?response))
)

(defrule PANIC::PQ7
?f1<-(panic(name ?name) (Q7 NONE))
=>
(printout t "left situations early, or participated only minimally because of panic attacks" crlf)
(bind ?response(read))
(modify ?f1 (Q7 ?response))
(assert (add-to-sum ?response))
)

(defrule PANIC::PQ8
?f1<-(panic(name ?name) (Q8 NONE))
=>
(printout t "spent a lot of time preparing for, or procrastinating about situations in which panic attacks might occur" crlf)
(bind ?response(read))
(modify ?f1 (Q8 ?response))
(assert (add-to-sum ?response))
)

(defrule PANIC::PQ9
?f1<-(panic(name ?name) (Q9 NONE))
=>
(printout t "distracted myself to avoid thinking about panic attacks" crlf)
(bind ?response(read))
(modify ?f1 (Q9 ?response))
(assert (add-to-sum ?response))
)

(defrule PANIC::PQ10
?f1<-(panic(name ?name) (Q10 NONE))
=>
(printout t "needed help to cope with panic attacks (eg. alcohol or medication, supersitious objects, other people)" crlf)
(bind ?response(read))
(modify ?f1 (Q10 ?response))
(assert (add-to-sum ?response))
)

(defrule PANIC::sum-scores2
?sum2 <- (pscore ?total)
?new-score2 <- (add-to-sum ?score)
=>
(retract ?sum2 ?new-score2)
(assert (pscore (+ ?total ?score)))
)

(defrule PANIC::average_score
(declare(salience -140))
?f1<-(panic(name ?name) (score NONE))
(pscore ?total)
=>
(modify ?f1 (score (/ ?total 10)))
(assert (average(/ ?total 10))
))



(defrule SOCIAL::entry
(declare(salience 40))
(patient(name ?name))
=>
(printout t "---------------------------------------------------------------------------------------" crlf)
(printout t"The scale for the following questions is as follows" crlf)
(printout t "0: Never" crlf)
(printout t "1: Ocassionally" crlf)
(printout t "2: Half of the time" crlf)
(printout t "3: Most of the time" crlf)
(printout t "4: All of the time" crlf)
(printout t "---------------------------------------------------------------------------------------" crlf)
f1<-(assert (social(name ?name)))
)

(defrule SOCIAL::SQ1
?f1<-(social(name ?name) (Q1 NONE))
=>
(printout t "felt moments of sudden terror, fear or fright in social situations" crlf)
(bind ?response(read))
(modify ?f1 (Q1 ?response))
(assert (add-to-sum ?response))
)

(defrule SOCIAL::SQ2
?f1<-(social(name ?name) (Q2 NONE))
=>
(printout t "felt anxious, worried, or nervous about social situations" crlf)
(bind ?response(read))
(modify ?f1 (Q2 ?response))
(assert (add-to-sum ?response))
)

(defrule SOCIAL::SQ3
?f1<-(social(name ?name) (Q3 NONE))
=>
(printout t "had thoughts of being rejected, humiliated, embararrassed, ridiculed, or offending others" crlf)
(bind ?response(read))
(modify ?f1 (Q3 ?response))
(assert (add-to-sum ?response))
)

(defrule SOCIAL::SQ4
?f1<-(social(name ?name) (Q4 NONE))
=>
(printout t "felt a racing heart, sweaty, trouble breathing, faint, or shaky in social situations" crlf)
(bind ?response(read))
(modify ?f1 (Q4 ?response))
(assert (add-to-sum ?response))
)

(defrule SOCIAL::SQ5
?f1<-(social(name ?name) (Q5 NONE))
=>
(printout t "felt tense muscles, felt on edge or restless, or had trouble relaxing in social situations" crlf)
(bind ?response(read))
(modify ?f1 (Q5 ?response))
(assert (add-to-sum ?response))
)


(defrule SOCIAL::SQ6
?f1<-(social(name ?name) (Q6 NONE))
=>
(printout t "avoided, or did not approach or enter, social situations" crlf)
(bind ?response(read))
(modify ?f1 (Q6 ?response))
(assert (add-to-sum ?response))
)

(defrule SOCIAL::SQ7
?f1<-(social(name ?name) (Q7 NONE))
=>
(printout t "left social situations early, or participated only minimally (e.g., said little, avoided eye contact)" crlf)
(bind ?response(read))
(modify ?f1 (Q7 ?response))
(assert (add-to-sum ?response))
)

(defrule SOCIAL::SQ8
?f1<-(social(name ?name) (Q8 NONE))
=>
(printout t "spent a lot of time preparing what to say or how to act in social situations" crlf)
(bind ?response(read))
(modify ?f1 (Q8 ?response))
(assert (add-to-sum ?response))
)

(defrule SOCIAL::SQ9
?f1<-(social(name ?name) (Q9 NONE))
=>
(printout t "distracted myself to avoid thinking about social situations" crlf)
(bind ?response(read))
(modify ?f1 (Q9 ?response))
(assert (add-to-sum ?response))
)

(defrule SOCIAL::SQ10
?f1<-(social(name ?name) (Q10 NONE))
=>
(printout t "needed help to cope with social situations (eg. alcohol or medication, supersitious objects, other people)" crlf)
(bind ?response(read))
(modify ?f1 (Q10 ?response))
(assert (add-to-sum ?response))
)

(defrule SOCIAL::sum-scores
?sum2 <- (sscore ?total)
?new-score2 <- (add-to-sum ?score)
=>
(retract ?sum2 ?new-score2)
(assert (sscore (+ ?total ?score)))
)

(defrule SOCIAL::average_score
(declare(salience -140))
?f1<-(social(name ?name) (score NONE))
(sscore ?total)
=>
(modify ?f1 (score (/ ?total 10)))
(assert (average(/ ?total 10))
))




(defrule MOOD::entry
(declare(salience 40))
(patient(name ?name))
=>
(printout t "---------------------------------------------------------------------------------------" crlf)
(printout t " Enter 0 for No and 1 for yes" crlf)
(printout t " Has there ever been a period of time when you were not your usual self and.." crlf)
(printout t "---------------------------------------------------------------------------------------" crlf)
f1 <-(assert (mood(name ?name)))
)

(defrule MOOD::MQ1
?f1<-(mood(name ?name) (Q1 NONE))
=>
(printout t "...you felt so good or so hyper that other people thought you were not your normal self or you were so hyper that you got into trouble?" crlf)
(bind ?response(read))
(modify ?f1 (Q1 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ2
?f1<-(mood(name ?name) (Q2 NONE))
=>
(printout t "...you were so irritable that you shouted at people or started fights or arguments?" crlf)
(bind ?response(read))
(modify ?f1 (Q2 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ3
?f1<-(mood(name ?name) (Q3 NONE))
=>
(printout t "...you felt much more self-confident than usual?" crlf)
(bind ?response(read))
(modify ?f1 (Q3 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ4
?f1<-(mood(name ?name) (Q4 NONE))
=>
(printout t "...you got much less sleep than usual and found you didn’t really miss it?" crlf)
(bind ?response(read))
(modify ?f1 (Q4 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ5
?f1<-(mood(name ?name) (Q5 NONE))
=>
(printout t "...you were much more talkative or spoke much faster than usual?" crlf)
(bind ?response(read))
(modify ?f1 (Q5 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ6
?f1<-(mood(name ?name) (Q6 NONE))
=>
(printout t "...thoughts raced through your head or you couldn’t slow your mind down?" crlf)
(bind ?response(read))
(modify ?f1 (Q6 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ7
?f1<-(mood(name ?name) (Q7 NONE))
=>
(printout t "...you were so easily distracted by things around you that you had trouble concentrating or staying on track?" crlf)
(bind ?response(read))
(modify ?f1 (Q7 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ8
?f1<-(mood(name ?name) (Q8 NONE))
=>
(printout t "...you had much more energy than usual?" crlf)
(bind ?response(read))
(modify ?f1 (Q8 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ9
?f1<-(mood(name ?name) (Q9 NONE))
=>
(printout t "...you were much more active or did many more things than usual?" crlf)
(bind ?response(read))
(modify ?f1 (Q9 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ10
?f1<-(mood(name ?name) (Q10 NONE))
=>
(printout t "...you were much more social or outgoing than usual, for example, you telephoned friends in the middle of the night?" crlf)
(bind ?response(read))
(modify ?f1 (Q10 ?response))
(assert (add-to-sum ?response))
)
(defrule MOOD::MQ11
?f1<-(mood(name ?name) (Q11 NONE))
=>
(printout t "...you were much more interested in sex than usual?" crlf)
(bind ?response(read))
(modify ?f1 (Q11 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ12
?f1<-(mood(name ?name) (Q12 NONE))
=>
(printout t "...you did things that were unusual for you or that other people might have thought were excessive, foolish, or risky?" crlf)
(bind ?response(read))
(modify ?f1 (Q12 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ13
?f1<-(mood(name ?name) (Q13 NONE))
=>
(printout t "...spending money got you or your family into trouble?" crlf)
(bind ?response(read))
(modify ?f1 (Q13 ?response))
(assert (add-to-sum ?response))
)

(defrule MOOD::MQ14
?f1<-(mood(name ?name) (Q14 NONE))
=>
(printout t "If you responded YES to more than one of the above, have several of these ever happened during the same period of time?" crlf)
(bind ?response(read))
(modify ?f1 (Q14 ?response))
)

(defrule MOOD::MQ15
?f1<-(mood(name ?name) (Q15 NONE))
=>
(printout t " Have any of your blood relatives (i.e. children, siblings, parents, grandparents,aunts, uncles) had manic-depressive illness or bipolar disorder?" crlf)
(bind ?response(read))
(modify ?f1 (Q15 ?response))
)

(defrule MOOD::MQ16
?f1<-(mood(name ?name) (Q16 NONE))
=>
(printout t "Has a health professional ever told you that you have manic-depressive illness or bipolar disorder?" crlf)
(bind ?response(read))
(modify ?f1 (Q16 ?response))
)

(defrule MOOD::MQ17
?f1<-(mood(name ?name) (Q17 NONE))
=>
(printout t "How much of a problem did any of these cause you – like being unable to work; having family, money or legal troubles; getting into arguments or fights? " crlf)
(printout t "0: No Problem" crlf)
(printout t "1: Minor Problem" crlf)
(printout t "2: Moderate Problem" crlf)
(printout t "3: Serious Problem" crlf)
(bind ?response(read))
(modify ?f1 (Q17 ?response))
)

(defrule MOOD::sum-scores
?sum <- (mscore ?total)
?new-score <- (add-to-sum ?score)
=>
(retract ?sum ?new-score)
(assert (mscore (+ ?total ?score)))
)

(defrule MOOD::score1
(declare (salience -100))
?f1<-(mood(name ?name) (score NONE))
(mscore ?score)
=>
(modify ?f1 (score ?score)))


(defrule DIAGNOSIS::entry
(declare (salience 100))
(patient (name ?name))
=>
(printout t "---------------------------------------------------------------------------------------" crlf)
(printout t "Diagnosis:" crlf)
(printout t "---------------------------------------------------------------------------------------" crlf)
(assert (diagnosis(name ?name)))
)

(defrule DIAGNOSIS::anxiety_diagnosis
(GAD7 (name ?name) (score ?score))
?f1<-(diagnosis (name ?name) (Anxiety NO))
=>
(if (and (<= ?score 9) (>= ?score 5))
then 
(printout t "Mild General Anxiety" crlf)
(modify ?f1 (Anxiety Yes)))

(if (and (<= ?score 14) (>= ?score 10))
then 
(printout t "Moderate General Anxiety" crlf)
(modify ?f1 (Anxiety Yes))
)

(if (>= ?score 15)
then 
(printout t "Severe General Anxiety" crlf) 
(modify ?f1 (Anxiety Yes))
)
)


(defrule DIAGNOSIS::depression_diagnosis
(PHQ9(name ?name) (score2 ?score))
?f1<-(diagnosis (name ?name) (Depression NO))
=>

(if (and (<= ?score 9) (>= ?score 5))
then 
(printout t "Mild Depression" crlf)
(modify ?f1 (Depression Yes))
 )
(if (and (<= ?score 14) (>= ?score 10))
then 
(printout t "Moderate Depression" crlf)
(modify ?f1 (Depression Yes))
)

(if (and (<= ?score 19) (>= ?score 15))
then 
(printout t "Moderately Severe Depression" crlf)
(modify ?f1 (Depression Yes))
)

(if (> ?score 19)
then 
(printout t "Severe Depression" crlf) 
(modify ?f1 (Depression Yes))
)
)



(defrule DIAGNOSIS::seasonal_diagnosis
(PHQ9(name ?name) (seasonals Yes))
=>
(printout t "Seasonal Depressive Disorder" crlf)
)



(defrule DIAGNOSIS::persistent_diagnosis
(PHQ9(name ?name) (Persistent Yes))
=>
(printout t "Persistent Major Depressive Disorder" crlf)
)

(defrule DIAGNOSIS::anorexia
(eat26(name ?name) (Anorexia Yes))
?f1<-(diagnosis (name ?name) (Eating NO))
=>
(printout t "Anorexia Nervosa" crlf)
(modify ?f1 (Eating Yes))
)

(defrule DIAGNOSIS::bulimia
(eat26(name ?name) (Bulimia Yes))
?f1<-(diagnosis (name ?name) (Eating NO))
=>
(printout t "Bulimia Nervosa" crlf)
(modify ?f1 (Eating Yes))
)

(defrule DIAGNOSIS::binge
(eat26(name ?name) (Binge Yes))
?f1<-(diagnosis (name ?name) (Eating NO))
=>
(printout t "Binge Eating Disorder" crlf)
(modify ?f1 (Eating Yes))
)



(defrule DIAGNOSIS::persistent_diagnosis
(PHQ9(name ?name) (Major Yes))
=>
(printout t "Major Depressive Disorder" crlf)
)

(defrule DIAGNOSIS::social_diagnosis
(social(name ?name)(score ?score))
?f1<-(diagnosis (name ?name) (Socials NO))
=>
(if (and (< ?score 1.5) (>= ?score 0.5))
then 
(printout t "Mild Social Anxiety" crlf)
(modify ?f1 (Socials Yes)) )

(if (and (< ?score 2.5) (>= ?score 1.5))
then 
(printout t "Moderate Social Anxiety" crlf)
(modify ?f1 (Socials Yes)))

(if (and (< ?score 3.5) (>= ?score 2.5))
then 
(printout t "Severe Social Anxiety" crlf)
(modify ?f1 (Socials Yes)))

(if (>= ?score 3.5)
then 
(printout t "Extreme Social Anxiety" crlf)
(modify ?f1 (Socials Yes)) )
)



(defrule DIAGNOSIS::panic_diagnosis
(panic(name ?name)(score ?score))
?f1<-(diagnosis (name ?name) (Panic NO))
=>
(if (and (< ?score 1.5) (>= ?score 0.5))
then 
(printout t "Mild Panic Attack" crlf) 
(modify ?f1 (Panic Yes)))

(if (and (< ?score 2.5) (>= ?score 1.5))
then 
(printout t "Moderate Panic Attack" crlf)
(modify ?f1 (Panic Yes)))

(if (and (< ?score 3.5) (>= ?score 2.5)
(modify ?f1 (Panic Yes)))
then 
(printout t "Severe Panic Attack" crlf)
(modify ?f1 (Panic Yes)))

(if (>= ?score 3.5)
then 
(printout t "Extreme Panic Attack" crlf) 
(modify ?f1 (Panic Yes)))
)




(defrule DIAGNOSIS::mood_disorder
(mood (name ?name) (score ?score) (Q14 1) (Q17 2|3))
?f1<-(diagnosis (name ?name) (Mood NO))
=>
(if (>= ?score 7)
then 
(printout t "Mood Disorder" crlf)
(modify ?f1 (Mood Yes))
))

(defrule DIAGNOSIS::none
(declare (salience -100))
(diagnosis (Anxiety NO))
(diagnosis(Depression NO))
(diagnosis(Socials NO))
(diagnosis(Panic NO))
(diagnosis(Mood NO))
(diagnosis(Eating NO))
?f1<-(diagnosis (name ?name)(None NO))
=>
(printout t "You have no Mental Health Disorders" crlf)
(modify ?f1 (None Yes))
)

(defrule TREATMENT::entry
(declare (salience 100))
=>
(printout t " " crlf)
(printout t "---------------------------------------------------------------------------------------" crlf)
(printout t "Treatment Plan:" crlf)
(printout t "---------------------------------------------------------------------------------------" crlf)
)

(defrule TREATMENT::GAD_treat
(diagnosis (Anxiety Yes))
=>
(printout t "General Anxiety:" crlf)
(printout t "Pharmacology Options: SSRIs, Anxiolytic, Antidepressant" crlf)
(printout t "Non-Pharmacology Options: Mindfulness therapy, Cognitive Behavioral Therapy, Psychotherapy " crlf)
(printout t " " crlf)
)

(defrule TREATMENT::Social_treat
(diagnosis (Socials Yes))
=>
(printout t "Social Anxiety:" crlf)
(printout t "Pharmacology Options: SSRIs, Antidepressant, sedative" crlf)
(printout t "Non-Pharmacology Options: Cognitive Behavioral therapy, Exposure therapy" crlf)
(printout t " " crlf)
)

(defrule TREATMENT::Panic_treat
(diagnosis (Panic Yes))
=>
(printout t "Panic Attack:" crlf)
(printout t "Pharmacology Options: SSRIs, SNRIs, Benzodiazepines" crlf)
(printout t "Non-Pharmacology Options: Psychotherapy" crlf)
(printout t " " crlf)
)

(defrule TREATMENT::Depression_treat
(diagnosis (Depression Yes))
=>
(printout t "Depression/Major Depressive Disorder:" crlf)
(printout t "Pharmacology Options: SSRIs, Antidepressants, Anxiolytic, Antipsychotic" crlf)
(printout t "Non-Pharmacology Options: Cognitive Behavioral Therapy, Behavioral therapy " crlf)
(printout t " " crlf)
)

(defrule TREATMENT::Mood_treat
(diagnosis (Mood Yes))
=>
(printout t "Bipolar Disorder:" crlf)
(printout t "Pharmacology Options: Anticonvulsant, antipsychotic, SSRIs" crlf)
(printout t "Non-Pharmacology Options: Cognitive Behavioral therapy, Psychoeducation, psychotherapy " crlf)
(printout t " " crlf)
)


(defrule TREATMENT::Eating_treat
(diagnosis (Eating Yes))
=>
(printout t "Eating Disorder:" crlf)
(printout t "Non-Pharmacology Options: Cognitive Behavioral therapy, Behavioral therapy, Psychotherapy, Psycho-education" crlf)
(printout t " " crlf)
)

(defrule TREATMENT::Seasonal_treat
(PHQ9(name ?name) (seasonals Yes))
=>
(printout t "Seasonal Affected Depression:" crlf)
(printout t "Non-Pharmacology Options: Light therapy, Cognitive Behavioral Therapy, Chronotherapy" crlf)
(printout t " " crlf)
)

(defrule TREATMENT::Persistent_treat
(PHQ9(name ?name) (Persistent Yes))
=>
(printout t "Persistent Depressive Disorder:" crlf)
(printout t "Pharmacology Options: SSRIs, antidepressants" crlf)
(printout t "Non-Pharmacology Options: Psychotherapy " crlf)
(printout t " " crlf)
)

(defrule TREATMENT::General_treat
(declare(salience 90))
(diagnosis(None ~Yes))
=>
(printout t "Non-clinical approaches for all disorders:" crlf)
(printout t "Support Groups" crlf)
(printout t "Relaxation techniques" crlf)
(printout t "Physical activities" crlf)
(printout t "Healthy dietary habits - Mediterranean diet" crlf)
(printout t "Avoid caffeine, alcohol, smoking, recreational drugs/ and or non-prescribed medications" crlf)
(printout t " " crlf)
(printout t " " crlf)
)

(defrule TREATMENT::no_treat
(diagnosis(None Yes))
=>
(printout t "No treatment needed at this time" crlf)
)



