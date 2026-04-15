;; Actividad complementaria N° 4 (Situaciones Problemáticas) 
;; Para los siguientes ejercicios escriba la expresión algebraica que los resuelve y luego su 
;; versión para Common Lisp:  
;; 1.  El Costo del Cine
;; Un grupo de amigos va al cine. Compran n entradas a 8 dólares cada una y 3 combos de 
;; palomitas a 5 dólares cada uno. El total se divide equitativamente entre los n amigos. 
;; ¿Cuánto debe pagar cada uno? 
(defun operacion1 (n)
    (/ (+ (* 8 n) (* 3 5)) n))


;; 2. Conversión de Temperatura 
;; Un científico necesita convertir una lectura de temperatura de grados Fahrenheit (F) a 
;; grados Celsius (C). La regla es: resta 32 al valor en Fahrenheit, multiplica el resultado por 5 
;; y finalmente divide entre 9. 
(defun operacion2 (f)
    (/ (* (- f 32) 5) 9))


;; 3. Interés Compuesto Simple 
;; Calcula el monto final (M) de una inversión inicial (P) tras un año, con una tasa de interés 
;; anual (r) expresada en decimal, usando la fórmula: M=P(1+r) 
;; Expresión Algebraica: P(1+r)  
(defun operacion3 (p r)
    (* p (+ 1 r)))


;; 4. Caída Libre 
;; Un objeto se deja caer desde una altura inicial h0 . La posición final h después de un tiempo t 
;; está dada por la gravedad g (9.8 m/s). 
(defun operacion4 (ho ti)
  (- ho (* 0.5 9.8 (expt ti 2))))


;; 5. El Rectángulo Áureo 
;; Tienes un rectángulo cuyo largo es L y su ancho es W. Quieres calcular el perímetro, pero 
;; luego restarle el área para un experimento geométrico extraño. 
;; Pista: Perímetro =2(L+W) ; Área =L*W 
;; Expresión Algebraica:  (2⋅(L+W))−(L⋅W)  
(defun operacion5 (l w)
    (- (* (+ l w) 2) (* l w)))


;; 6. Promedio Ponderado 
;; Un estudiante tiene una nota de examen (E) que vale el 70% y una nota de tareas (T) que 
;; vale el 30%. Escribe la expresión para su nota final
(defun operacion6 (nota-e nota-t)
  (+ (* 0.7 nota-e) (* 0.3 nota-t)))

(defun mostrar-resultados ()
    (format t "Operación 1: ~a~%" (operacion1 3))
    (format t "Operación 2: ~a~%" (operacion2 95))
    (format t "Operación 3: ~a~%" (operacion3 200 0.2))
    (format t "Operación 4: ~a~%" (operacion4 100 3))
    (format t "Operación 5: ~a~%" (operacion5 10 20))
    (format t "Operación 6: ~a~%" (operacion6 10 1)))


(mostrar-resultados)