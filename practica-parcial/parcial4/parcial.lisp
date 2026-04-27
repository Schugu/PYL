;; Ejercicio N° 1: 
;; Analice la siguiente funcion: 
;; (defun listas (a b) 
;;     (cond 
;;         ((and (consp a) (atom b)) (list a b)) 
;;         ((and (not (atom a)) (consp b)) (append a b)) 
;;         ((and (not (consp a)) (not (atom b))) (cons a b)) 
;;         (T (list a b)))) 

;; a) Determinar el resultado que arrojaria si evalúo la misma con los siguientes parametros: 
;; b) Identificar la cantidad y tipo de elementos (si son átomos o listas) de las listas resultantes en el 
;; punto a. 
;; (listas (car '(+ 20 5 2)) (- (+ 3 12) 10))  => (+ 5)
;;              "+"               "5"
;; 1 lista y 2 átomos

;; (listas (cdr '(+ 3 (/ 16 4))) '(* 7 (- 15 5)))  => (3 (/ 16 4) * 7 (- 15 5)) 
;;                 (3 (/ 16 4))   (* 7 (- 15 5))
;; 9 átomos y 3 listas

;; (listas (> 13 9) (last '(* 3 8 (- 10 5)))) => (T (- 10 5))
;;         T        (- 10 5)
;; 2 Listas y 4 átomos

;; (listas (member 10 '(+ 13 4 10 7)) (evenp 4)) => ((10 7) T)
;;         (10 7)                          T
;; 2 Listas y 3 átomos


;; Ejercicio N° 2: (Consigna rediseñada para poder realizarse (para variar...))
;; a) Definir una función que solicite al operador la cantidad total de personas invitadas a la fiesta y
;; devuelva una lista formada por sublistas, donde cada sublista tendrá:
;;      Como primer elemento, el tipo de lugar donde se sentarán.
;;      Como segundo elemento, la cantidad de ese tipo de lugar que se necesitarán para que se
;;          sienten todos los invitados.
;;
;; Considerar que:
;;      Cada MESA tiene capacidad para 8 personas.
;;      Cada SILLON tiene capacidad para 4 personas.
;;      Cada PUFF tiene capacidad para 2 personas.
;;
;; La cantidad de lugares debe calcularse de manera que no queden personas sin asiento
;; (redondeando hacia arriba si es necesario).
;;
;; Por ejemplo, si el operador ingresa 150, la función deberá devolver una lista de la siguiente
;; forma: ((MESA 19) (SILLON 38) (PUFF 75))

(defun ingresar-cant-personas ()
    (format t "Ingrese la cantidad de personas: ")
    (finish-output)
    (let ((x (read)))
        (if (and (numberp x) (plusp x))
            x
            (progn 
                (format t "Debe ingresar un número entero. ~%")
                (ingresar-cant-personas)))))

(defun mostrar-posibles-lugares (cant)
    (list 
        (list 'MESA (ceiling cant 8))
        (list 'SILLON (ceiling cant 4))
        (list 'PUFF (ceiling cant 2))))


;; b) Definir una función predicado que recibe como parámetro la cantidad total de personas y la 
;; cantidad de sillones. La misma deberá determinar si es posible que la cantidad de personas 
;; ingresadas como parámetro puedan acomodarse en la cantidad de sillones ingresados también 
;; como parámetro. Recordar que en cada sillón pueden sentarse 4 personas. 

(defun se-pueden-sentar-sillones (personas sillones)
    (<= personas (* sillones 4)))

(defun mostrar-resultado-lugares ()
    (let ((cant (ingresar-cant-personas)))
        (format t "Cantidad de personas en cada tipo de lugar: ")
        (print (mostrar-posibles-lugares cant))
        
        (format t "~%¿Se pueden sentar ~a personas en ~a sillones?: ~a~%"
            cant 4
            (if (se-pueden-sentar-sillones cant 4) "Si" "No"))
    
    ))

;; (mostrar-resultado-lugares)


;; c) Se necesita también saber el importe que se deberá pagar por la comida. El valor del cubierto 
;; para las personas mayores es de $2500 y para los menores es de $1500. A partir de la cantidad de 
;; personas mayores y de la cantidad de personas menores que son ingresadas como parámetro, 
;; determinar el total que se debe abonar teniendo en cuenta que: 
;;      Si la cantidad de personas mayores es <= 150, no habrá descuento. 
;;      Si la cantidad de personas mayores es > 150 y <= 200, al total a abonar se le descuenta un 8%. 
;;      Si la cantidad de personas mayores es > a 200, al total a abonar se le descuenta un 12%.
(defun ingresar-personas ()
    (format t "Menores: ")
    (let ((menores (ingresar-cant-personas)))
        (format t "Mayores: ")
        (let ((mayores (ingresar-cant-personas)))
            (list menores mayores))))

(defun calc-total-pers (lista)
    (+ (first lista) (second lista)))

(defun calc-precio-total (lista)
    (+ (* (first lista) 1500) (* (second lista) 2500)))

(defun determinar-descuento (cant)
    (cond 
        ((> cant 200) 12)
        ((> cant 150) 8)
        (t 0)))

(defun aplicar-descuento (precio descuento)
        (- precio (* precio (/ descuento 100))))

(defun mostrar-resultado ()
    (let* ((personas (ingresar-personas))
            (menores (first personas))
            (mayores (second personas))
            (total-personas (+ menores mayores))
            (precio-total (calc-precio-total personas))
            (descuento (determinar-descuento mayores))
            (precio-final (aplicar-descuento precio-total descuento)))

        (format t "Total personas: ~a~%" total-personas)
        (format t "Menores: ~a~%" menores)
        (format t "Mayores: ~a~%" mayores)
        (format t "Precio total sin descuentos: ~a$~%" precio-total)
        (format t "Descuento a aplicar: ~a%~%" descuento)
        (format t "Precio total con descuento: ~a$~%" precio-final)))
            
(mostrar-resultado)