module PruebasPractica02 where

import Test.QuickCheck
import LProp

-- Auxiliares
p = Var "p"
q = Var "q"
r = Var "r"
s = Var "s"
t = Var "t"

-- Ejercicio 1
prueba1 = show ((p `And` q) `Or` r) == "((p /\\ q) \\/ r)"
prueba2 = show (p `Impl` r `Equiv` q) == "(p -> (r <-> q))"
prueba3 = show (Not (Var "p" `Or` Var "q" `Impl`(Not  (Var "r")))) == "(¬((p \\/ q) -> (¬r)))"

-- Ejercicio 2
prueba4 = vars (p `And` q `Impl` r `Or` q) == ["p", "q", "r"]
prueba5 = vars ((p `And` (r `And` t)) `Impl` r) == ["p","r","t"]
prueba6 = vars ((p `Impl` (q `Or` r)) `And` ((Not p) `Impl` s)) == ["p", "q", "r", "s"]

-- Ejercicio 3
prueba7 = sust (p `Impl` q `And` r) ("q", s `And` t) == p --> ((s /\ t) /\ r)
prueba8 = sust (p `Impl` p `Or` q) ("p", q) == (q --> (q \/ q))
prueba9 = sust (p `Impl` q) ("p", (sust (r `Or` s) ("s", q `Equiv` t))) == ((r \/ (q <-> t)) --> q)

-- Ejercicio 4
prueba10 = interpreta (r `Impl` p `And` q) [("p",True),("q",True),("r",False)] == True
prueba11 = interpreta ((Not q) `And` r `And` q) [("q", True),("r",False)] == False
prueba12 = interpreta ((p `Impl` (q `Or` r)) `And` ((Not t) `Impl` s)) [("p",True),("q",False),("r",True),("t",False),("s",True)] == True

-- Ejercicio 5
prueba13 = modelos (p `And` q) == [[("p",True),("q",True)]]
prueba14 = modelos (p `Impl` (q `Or` r)) == [[("p",False),("q",False),("r",False)],[("p",False),("q",False),("r",True)],
                                            [("p",False),("q",True),("r",False)],[("p",False),("q",True),("r",True)],
                                            [("p",True),("q",False),("r",True)],[("p",True),("q",True),("r",False)],
                                            [("p",True),("q",True),("r",True)]]
prueba15 = modelos (sust ((p `And`q) `Equiv` t) ("t", (Not p) `And` q)) == [[("p",False),("q",False)],[("p",True),("q",False)]]

-- Ejercicio 6
prueba16 = equiv (Not (p `And` q)) ((Not q) `Or` (Not p)) == True
prueba17 = equiv (p `Impl` q `Or` r) ((Not (q `Or` r)) `Impl` (Not p)) == True
prueba18 = equiv ((p `Impl` (q `And` r)) `And` ((Not p) `Impl` s)) ((Not (p `And` q `And` r)) `And` (p `Equiv` s)) == False

-- Ejercicio 7
prueba19 = tautologia (Not (p `And` q) `Equiv` ((Not p) `Or` (Not q))) == True
prueba20 = tautologia ((p `And` (q `And` r)) `Impl` (p `Impl` (q `Impl` r))) == True
prueba21 = tautologia (sust (p `Impl` q) ("p", (sust (r `Or` s) ("s",(q `Equiv` t))))) == False

-- Ejercicio 8
prueba22 = contradiccion ((p `Impl` q) `And` p `And` (Not q)) == True
prueba23 = contradiccion ((p `Impl` (q `Or` r)) `And` ((Not p) `Impl` s)) == False
prueba24 = contradiccion (sust (p `Impl` q) ("p", (sust (r `Or` s) ("s",(q `Equiv` t))))) == False

-- Ejercicio 9
prueba25 = satisfacible (Not (p `Or` q) `Equiv` ((Not p) `And` q)) == True
prueba26 = satisfacible ((q `And` (Not  p)) `Or` ((Not r) `And` s)) == True
prueba27 = satisfacible ((p `Impl` q) `And` p `And` (Not q)) == False

-- Ejercicio 10
prueba28 = insatisfacible ((p `Impl`q) `And` p `And` (Not q)) == True
prueba29 = insatisfacible (Not (p `Or` r `Impl` (Not q))) == True
prueba30 = insatisfacible ((p `And` (q `And` r)) `Impl` (p `Impl` (q `Impl` r))) == False

-- Ejercicio 11
prueba31 = satisfacibleConj [p `Impl` r, q `Impl` s, (Not r) `Or` (Not s)] [("p",False),("q",False),("r",False),("s",False)] == True
prueba32 = satisfacibleConj [(Not q) `And` r `Or` p `Or` q, p `And` r] [("p",True),("q",True),("r",False)] == False
prueba33 = satisfacibleConj [q `Or` r `Or` s, (Not (q `Or` r)), (Not (r `Or` s)), (Not (s `Or` q))] [("q",False),("r",True),("s",False)] == False

-- Ejercicio 12
prueba34 = satConj [p `Impl` r, q `Impl` s, (Not r) `Or` (Not s)] == True
prueba35 = satConj [p `Equiv` q, q `Equiv` s, p , (Not s)] == True
prueba36 = satConj [(Not (p `And` q)) `And` (Not (p `And` r)), q `Or` r, (Not (p `Or` (Not r)))] == True

-- Ejercicio 13
prueba37 = insatisfacibleConj [p `Impl` q, p, Not q] [("p",True),("q",False)] == True
prueba38 = insatisfacibleConj [q `Or` r `Or` s, (Not (q `Or` r)), (Not (r `Or` s)), (Not (s `Or` q))] [("q",False),("r",True),("s",False)] == True
prueba39 = insatisfacibleConj [(p `Or` q) `Impl` r, (Not r), (Not p)] [("p", False),("r", False),("q", False)] == False

-- Ejercicio 14
prueba40 = insatConj [p `Impl` q, p, Not q] == True
prueba41 = insatConj [(p `Or` q) `Impl` r, (Not r), (Not p)] == True
prueba42 = insatConj [(Not q) `Impl` (Not r),(Not r) `Impl` (Not p),(Not p) `Impl` (Not q), q `Equiv` r] == True

-- Ejercicio 15
prueba43 = consecuencia [p `Impl` r, q `Impl` s, (Not r) `Or` (Not s)] ((Not p) `Or` (Not q)) == True
prueba44 = consecuencia [p, (Not q)] (Not (p `Impl` q)) == True
prueba45 = consecuencia [p `Or` q, p `Impl` r, q `Impl` r] r == True

-- Calificación:
correctas = length $ filter (== True) [prueba1,prueba2,prueba3,prueba4,prueba5,prueba6,prueba7,prueba8,
                                       prueba9,prueba10,prueba11,prueba12,prueba13,prueba14,prueba15,prueba16,
                                       prueba17,prueba18,prueba19,prueba20,prueba21,prueba22,prueba23,prueba24,
                                       prueba25,prueba26,prueba27,prueba28,prueba29,prueba30,prueba31,prueba32,
                                       prueba33,prueba34,prueba35,prueba36,prueba37,prueba38,prueba39,prueba40,
                                       prueba41,prueba42,prueba43,prueba44,prueba45]
calificacion = (fromIntegral correctas :: Float) * 10 / 45

run = do putStr "Prueba 1:  " 
         quickCheck prueba1
         putStr "Prueba 2:  "
         quickCheck prueba2
         putStr "Prueba 3:  "
         quickCheck prueba3
         putStr "Prueba 4:  "
         quickCheck prueba4
         putStr "Prueba 5:  "
         quickCheck prueba5
         putStr "Prueba 6:  "
         quickCheck prueba6
         putStr "Prueba 7:  "
         quickCheck prueba7
         putStr "Prueba 8:  "
         quickCheck prueba8
         putStr "Prueba 9:  "
         quickCheck prueba9
         putStr "Prueba 10: "
         quickCheck prueba10
         putStr "Prueba 11: "
         quickCheck prueba11
         putStr "Prueba 12: "
         quickCheck prueba12
         putStr "Prueba 13: "
         quickCheck prueba13
         putStr "Prueba 14: "
         quickCheck prueba14
         putStr "Prueba 15: "
         quickCheck prueba15
         putStr "Prueba 16: " 
         quickCheck prueba16
         putStr "Prueba 17: "
         quickCheck prueba17
         putStr "Prueba 18: "
         quickCheck prueba18
         putStr "Prueba 19: "
         quickCheck prueba19
         putStr "Prueba 20: "
         quickCheck prueba10
         putStr "Prueba 21: "
         quickCheck prueba21
         putStr "Prueba 22: "
         quickCheck prueba22
         putStr "Prueba 23: "
         quickCheck prueba23
         putStr "Prueba 24: "
         quickCheck prueba24
         putStr "Prueba 25: "
         quickCheck prueba25
         putStr "Prueba 26: "
         quickCheck prueba26
         putStr "Prueba 27: "
         quickCheck prueba27
         putStr "Prueba 28: "
         quickCheck prueba28
         putStr "Prueba 29: "
         quickCheck prueba29
         putStr "Prueba 30: "
         quickCheck prueba30
         putStr "Prueba 31: " 
         quickCheck prueba13
         putStr "Prueba 32: "
         quickCheck prueba32
         putStr "Prueba 33: "
         quickCheck prueba33
         putStr "Prueba 34: "
         quickCheck prueba34
         putStr "Prueba 35: "
         quickCheck prueba35
         putStr "Prueba 36: "
         quickCheck prueba36
         putStr "Prueba 37: "
         quickCheck prueba37
         putStr "Prueba 38: "
         quickCheck prueba38
         putStr "Prueba 39: "
         quickCheck prueba39
         putStr "Prueba 40: "
         quickCheck prueba40
         putStr "Prueba 41: "
         quickCheck prueba41
         putStr "Prueba 42: "
         quickCheck prueba42
         putStr "Prueba 43: "
         quickCheck prueba43
         putStr "Prueba 44: "
         quickCheck prueba44
         putStr "Prueba 45: "
         quickCheck prueba45
         putStr "\nCalificación: "
         putStr ((show calificacion) ++ "\n")


