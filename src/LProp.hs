module LProp where

import Data.List

-- Definición del tipo de dato Prop
data Prop = Var String 
          | Cons Bool 
          | Not Prop
          | And Prop Prop
          | Or Prop Prop
          | Impl Prop Prop
          | Equiv Prop Prop
          deriving (Eq)

-- Ejercicio 1. Define una instancia de la clase Show para el tipo Prop. El resultado debe ser una
-- cadena de caracteres que representa la expresión proposicional en notación infija.
instance Show Prop where
    -- Aquí va su código.

-- Definición de la precedencia de operadores.
infixl 5 `And`, `Or`
infixl 4 `Equiv`
infixr 3 `Impl`

-- Para manejar operadores infijos.
(¬) :: Prop -> Prop 
(¬) = Not

(/\) :: Prop -> Prop -> Prop
(/\) = And

(\/) :: Prop -> Prop -> Prop
(\/) = Or

(-->) :: Prop -> Prop -> Prop
(-->) = Impl

(<->) :: Prop -> Prop -> Prop
(<->) = Equiv

-- Sinónimo para sustituciones.
type Sustitucion = (String, Prop)

-- Sinónimo para asignación de valores de verdad.
type Estado = [(String, Bool)]

-- Ejercicio 2. Completa la función vars que devuelve el conjunto (representado como una lista sin
-- repeticiones) de las variables proposicionales de una fórmula.
vars :: Prop -> [String]
-- Aquí va su código.

-- Ejercicio 3. Completa la función sust para que realice la sustitución textual correspondiente.
sust :: Prop -> Sustitucion -> Prop
-- Aquí va su código.

-- Ejercicio 4. Completa la función interpreta que dada una fórmula y un estado de las variables
-- regrese la interpretación de ésta.
-- Aquí va su código.

-- Ejercicio 5. Completa la función modelos que dada una fórmula devuelva una lista de estados que
-- satisfacen a ésta.
modelos :: Prop -> [Estado]
-- Aquí va su código.

-- Ejercicio 6. Se dice que dos fórmulas P y Q son lógicamente equivalentes si para todo estado de
-- las variables I sucede que I(p) = I(q). Completa la función equiv que determine si dos fórmulas
-- son lógicamente equivalentes.
equiv :: Prop -> Prop -> Bool
-- Aquí va su código.

-- Ejercicio 7. Completa la función tautologia que determina si una fórmula es tautología.
tautologia :: Prop -> Bool
-- Aquí va su código.

-- Ejercicio 8. Completa la función contradicción que determina si una fórmula es contradicción.
contradiccion :: Prop -> Bool
-- Aquí va su código.

-- Ejercicio 9. Completa la función satisfacible que determina si una fórmula es satisfacible.
satisfacible :: Prop -> Bool
-- Aquí va su código.

-- Ejercicio 10. Completa la función insatisfacible que determina si una fórmula es insatisfacible.
insatisfacible :: Prop -> Bool
-- Aquí va su código.

-- Ejercicio 11. Completa la función satisfacibleConj que determine si un conjunto de fórmulas es
-- satisfacible bajo un determinado estado de las variables.
satisfacibleConj :: [Prop] -> Estado -> Bool
-- Aquí va su código.

-- Ejercicio 12. Completa la función satConj que determine si un conjunto de fórmulas es 
-- satisfacible.
satConj :: [Prop] -> Bool
-- Aquí va su código.

-- Ejercicio 13. Completa la función insatisfacibleConj que determine si un conjunto de fórmulas es
-- insatisfacible bajo un determinado estado de las variables.
insatisfacibleConj :: [Prop] -> Estado -> Bool
-- Aquí va su código.

-- Ejercicio 14. Completa la función insatConj que determine si un conjunto de fórmulas es 
-- insatisfacible.
insatConj :: [Prop] -> Bool
-- Aquí va su código.

-- Ejercicio 15. Completa la función consecuencia que dado un conjunto de fórmulas y una fórmula
-- determine si ésta última es consecuencia de dicho conjunto. Hint: Revisar el principio de 
-- refutación.
consecuencia :: [Prop] -> Prop -> Bool
-- Aquí va su código.
