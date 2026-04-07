;; Función 
(defun holaMundo ()
        (print "Hola mundo"))

;(holaMundo)

;; Función con paso de parámetros
(defun saludar (nombre)
        (print (concatenate 'string "Hola " nombre)))

;(saludar "Leandro")

;; Problemita
(defun imprimirNumeros(n)
         (loop for i from 1 to n do
            (cond
                ((and (= (mod i 3) 0) (= (mod i 5) 0))
                    (print "FizzBuzz"))
                ((= (mod i 3) 0)
                    (print "Fizz"))
                ((= (mod i 5) 0)
                    (print "Buzz"))
                (t
                    (print i)))))

(imprimirNumeros 5)