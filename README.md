## Práctica 2: Sintaxis y semántica de la Lógica Proposicional

**Entrega: Jueves 2 de marzo de 2023**

*La práctica podrá realizasrse en equipos de máximo 3 integrantes*

### Instrucciones

1. Completar las funciones faltantes del módulo [LProp](src/LProp.hs) y cargarlo correctamente en el 
   intérprete. 

   ```bash
   > ghci LProp.hs 
   GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
   [1 of 1] Compiling LProp     ( LProp.hs, interpreted )
   Ok, one module loaded.
   *LProp>
   ```

   **Es requisito indispensable para revisar el resto de ejercicios que esta parte funcione correctamente. En caso contrario la calificación de la práctica será CERO.**

1. Ejecutar el archivo de pruebas unitarias [PruebasPractica02](src/PruebasPractica02.hs) y asegurarse de pasar 
   todos los casos contenidos en el mismo.

   ```bash
   > ghci PruebasPractica02.hs 
   GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
   [1 of 2] Compiling LProp     ( LProp.hs, interpreted )
   [2 of 2] Compiling PruebasPractica02 ( PruebasPractica02.hs, interpreted )
   Ok, two modules loaded.
   *PruebasPractica02> run
   Prueba 1: +++ OK, passed 1 test.
   Prueba 2: +++ OK, passed 1 test.
   Prueba 3: +++ OK, passed 1 test.
   ...
   ```

### Restricciones

- La hora máxima de entrega será a las **23:59:59** de la fecha indicada al inicio de este documento.

- Para poder pedir una prórroga sobre la entrega es requisito **indispensable** que todos los equipos de estudiantes
  hagan cambios (*commit*) constantes a su repositorio a lo largo del periodo de realización de la práctica.

- **Todas las copias serán calificadas automáticamente con cero**.

### Material de consulta

- Capítulo 2 del manual de prácticas disponible en la página del curso.

- Hoogle (API de Haskell): [https://hoogle.haskell.org/](https://hoogle.haskell.org/)

- Funciones útiles: `++`, `nub`, `lookup`, ...
