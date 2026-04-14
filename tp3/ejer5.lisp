;; Actividad N°5: 
;; Definir una función llamada clasifico-triángulos, la que a partir de los valores de los lados de 
;; un triángulo ingresados por el operador, clasifique el mismo en: isósceles, equilátero o 
;; escaleno. Tener en cuenta que todo triángulo debe cumplir que. “Un lado es menor que la 
;; suma de los otros dos y mayor que la diferencia”. 

(defun es-triangulo (a b c)
    (if (or 
        (not (< a (+ b c)))    
        (not (< b (+ a c))) 
        (not (< c (+ a b))))
        NIL
        T
    )
)

(defun clasificar-triangulo (a b c)
    (if (not (es-triangulo a b c))
        (format t "Error: no se puede clasificar ya que no es un triángulo.~%")
        (cond 
            ((and (= a b) (= a b c)) (format t "Triángulo Equilátero.~%"))
            ((or (= a b) (= a c) (= b c)) (format t "Triángulo Isóceles.~%"))
            ((and (/= a b) (/= b c) (/= a c)) (format t "Triángulo Escaleno.~%")))
    )
)

(defun ingresar-datos ()
    (format t "Ingrese el lado A: ")
    (finish-output)
    (let ((a (read)))
        (format t "Ingrese el lado B: ")
        (finish-output)
        (let ((b (read)))
            (format t "Ingrese el lado C: ")
            (finish-output)
            (let ((c (read)))
                (clasificar-triangulo a b c)))))

(ingresar-datos)