;; EJERCICIO Nº 1

;; a. Convertir la siguiente expresión aritmética en una función Lisp:
;;    Formula: (1 + i/m)^(m*t) * K
(defun expresion (i m ti k)
    (* (expt (+ 1 (/ i m)) (* m ti)) k))

;; b. A partir de la expresión obtenida en el pto a, determinar la cantidad 
;;    de átomos y listas que tiene dicha expresión y detallar cuáles son.
11 atomos (*, expt, +, 1, /, i, m, *, m, ti, k)
5 listas:
    1. (/ i m)
    2. (+ 1 (/ i m))
    3. (* m ti)
    4. (expt (+ 1 (/ i m)) (* m ti))
    5. (* (expt (+ 1 (/ i m)) (* m ti)) k)

;; c. A partir de la expresión obtenida en el punto a, extraer el átomo + 
;;    utilizando las funciones que ud crea conveniente.
(car (second (second '(* (expt (+ 1 (/ i m)) (* m ti)) k))))