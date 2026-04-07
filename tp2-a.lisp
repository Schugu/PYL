;; Actividad N° 1: Funciones numéricas simples 
;; NOTA: Todas las funciones deben recibir parámetros. 
;; a. Definir un función que determine si un número n es par. 
(defun es-par (num)
  (if (not (integerp num))
      (format t "El numero ~a no es entero~%" num)
      (if (evenp num)
          (format t "El numero ~a es par~%" num)
          (format t "El numero ~a no es par~%" num))))

;; (es-par 2)

;; b. Definir una función que determine si un número n múltiplo de un número m. 
(defun es-multiplo (n m)
  (if (or (not (integerp n)) (not (integerp m)))
      (format t "Los numeros ingresados no son enteros~%")
      (if (zerop m)
          (format t "El numero ~a no puede ser 0~%" m)
          (if (= (mod n m) 0)
              (format t "El numero ~a es multiplo de ~a~%" n m)
              (format t "El numero ~a no es multiplo de ~a~%" n m)))))

;; (es-multiplo 10 5)

;; c. Definir una función que determine si el número a es mayor que un número b. 
(defun es-mayor (a b)
  (if (or (not (integerp a)) (not (integerp b)))
      (format t "Los numeros ingresados no son enteros~%")
      (if (> a b)
          (format t "El numero ~a es mayor que ~a~%" a b)
          (format t "El numero ~a no es mayor que ~a~%" a b))))

;; (es-mayor 5 10)


;; d. Definir una función que determine si un número n está entre dos números a y b.    
(defun esta-el-num (n a b)
  (if (or (not (integerp n)) (not (integerp a)) (not (integerp b)))
      (format t "Los numeros ingresados no son enteros~%")
      (if (or (< n a) (> n b)) 
          (format t "El numero ~a no esta entre ~a y ~a~%" n a b)
          (format t "El numero ~a esta entre ~a y ~a~%" n a b))))

;; (esta-el-num 20 10 30)