;; Actividad N° 1: Escribir las siguientes expresiones aritméticas necesarias, en notación 
;; prefija (notación polaca) con la sintaxis de LISP, para realizar los cálculos indicados. 
;; Ejemplo en notación estándar: 2 * ( 3 + 5 ) 
;; Ejemplo en notación prefija: (* 2 (+ 3 5)) 

;; 1. Calcular el área: Area = ( A * B) y el perímetro: p = ( 2 A + 2 B) de un rectángulo  
(setq a (* A B))
(setq p (+ (* 2 A) (* 2 B)))

;; 2. Calcular el área de un trapecio: (( b1 + b2) / 2 ) * h 
(setq t (* (/ (+ b1 b2) 2) h))

;; 3. Calcular el área de una circunferencia (área = PI * r2) y el perímetro ( 2 PI * r) 
(setq a (* PI (expt r 2)))
(setq p (* (* 2 PI) r))

;; 4. Calcular la cantidad de dólares que podemos comprar con $520.300 teniendo en 
;; cuenta la cotización DÓLAR BANCO NACIÓN = $1450,50.  
(setq cant (/ 520300 1450.50))

;; 5. Si 1 ha equivale a 10.000 m², escriba la expresión aritmética para calcular la 
;; cantidad de m² que equivalen a X ha y luego transcríbala en sintaxis de LISP. 
;; X * 10.000
(setq c (* X 10000))




;; Actividad N° 2: escriba las expresiones aritméticas necesarias para resolver las siguientes 
;; situaciones problemáticas y luego transcríbalas a notación prefija en sintaxis de LISP; 
;; puede utilizar nombres de variables cuando lo crea necesario. 
;; Luego ponga a prueba las expresiones  escritas, evaluándolas al asignarle los valores 
;; numéricos que considere adecuados. 

;; 1. Un profesor registra dos notas por cada alumno y necesita calcular el promedio de 
;; las mismas.   
(setq alumno1 (list 6 8))
(setq alumno2 (list 10 10))

(defun promedio (notas)
  (/ (apply #'+ notas) (float (length notas))))

(promedio alumno1)
(promedio alumno2)


;; 2. Un bibliotecario debe calcular cuántos libros puede acomodar en una biblioteca, 
;; sabiendo que en cada estante entran 8 libros y que la biblioteca tiene 15 estantes.   
(setq total-cant-libros (* 8 15))

;; Función para calcular
(defun total-libros (cant-libros cant-estanterias)
    (* cant-libros cant-estanterias))

(total-libros 8 15)


;; 3. Una vendedora de joyas debe calcular su ganancia,  sabiendo que posee 8 cajas de 
;; aros y que en cada caja hay 15 pares. Sabiendo, además, que cada par tiene un 
;; costo de $15,45.  
(setq costo-por-par 15.45)

(defun total-pares (cant-cajas cant-pares)
  (* cant-cajas cant-pares))

(defun valor-total (cant-pares)
  (* cant-pares costo-por-par))

(valor-total (total-pares 8 15))


;; 4. Calcular la cantidad de estampillas que tiene Felipe en su álbum. El mismo tiene 14 
;; páginas y cada página tiene 2 filas con 9 estampillas en cada fila.  
(defun cant-estamp-por-pag (filas columnas)
  (* filas columnas))

(defun cant-estamp-por-album (total-estamp-por-pag cant-pag)
  (* total-estamp-por-pag cant-pag))

(cant-estamp-por-album (cant-estamp-por-pag 2 9) 14)


;; 5. Calcular la cantidad de plata que tiene ahorrada Pedro si tiene 6 monedas de $10, 4 
;; billetes de $50, 1 billete de $500 y 5 billetes de $100. Si luego gasta ¼ de su dinero, 
;; ¿cuánto dinero le queda?  
(defun contar-plata (efectivo)
  (apply #'+ efectivo))

(defun restar-porcentaje (total porcentaje)
  (* total (- 1 porcentaje)))

(restar-porcentaje(contar-plata (list (* 6 10) (* 4 50) 500 (* 5 100)))0.25)


;; 6. En un tanque hay 357 litros de agua, en otro 49.800 centilitros y en el tercero 1.765 
;; litros. Si se reparte toda el agua en envases de 20 litros, ¿cuántos envases se 
;; necesitarán?  
(defun centi-a-litros (centilitros)
    (/ centilitros 100))

(defun calcular-envases (total-litros tam-envase)
    (/ total-litros tam-envase))

(calcular-envases (+ (+ 357 1765) (centi-a-litros 49800)) 20)


;; 7. En un almacén hay 62 sacos de papas. Cada saco pesa 85 kg. Si se venden la mitad 
;; de las papas, ¿cuántos kilos quedarán sin vender?  
(defun contar-kilos-papas (cant-sacos peso)
  (* cant-sacos peso))

(defun restar-porcentaje (total porcentaje)
  (* total (- 1 porcentaje)))

(restar-porcentaje (contar-kilos-papas 62 85) 0.50)


;; 8. Durante su primer año, la estación de bomberos recibió 40 alertas. Al año siguiente 
;; recibió un 20% más. ¿Cuántas alertas recibió en su corta historia?
(defun calcular-porcentaje (total porcentaje)
  (* total porcentaje))

(+ 40 (calcular-porcentaje 40 0.20))




;; Actividad N° 3: Utilizar las funciones básicas de LISP para realizar las siguientes 
;; operaciones:  

;; 1. Dada la lista: (A B (C D) E) 
(setq lista '(A B (C D) E))
;; a. Extrae el átomo A. 
(car lista)
;; b. Extrae la sublista (C D). 
(caddr lista)
;; c. Extrae el último átomo. 
(nth 3 lista)
;; d. Obtén la lista (A B (C D)). 
(butlast lista)

;; 2. Dada la lista: ( (A B) (C . D) ( ( E ) ) ) 
(setq lista '( (A B) (C . D) ((E)) ) )
;; a. Extrae la lista (A B). 
(car lista)
;; b. Extrae el átomo d del par punteado. 
(cdr (cadr lista))
;; c. Extrae el átomo E. 
(car (car (caddr lista)))
;; d. Extrae la sublista ((E)). 
(caddr lista)
;; e. De la lista (A (B (C . D))), extrae el par punteado (C . D) 
(setq lista2 '(A (B (C . D))))
(cadr (cadr lista))

;; 3. Dada la lista: (1 (2 3) 4) 
(setq lista '(1 (2 3) 4))
;; a. Extrae (1 (2 3)) 
(butlast lista)
;; b. Extrae el átomo 2
(car (cadr lista))