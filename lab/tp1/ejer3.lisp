;; Actividad complementaria N° 3:  
;; Intente pensar: ¿Qué valores se devuelven al evaluar estas expresiones? y luego 
;; compruebe su respuesta en su computadora. 
;; 1. (+ 3 5)  -> 8
;; 2. (3 + 5)  -> Error
;; 3. (+ 3 (5 6))  -> Error

(defun mostrar-resultados()
    (format t "1. (+ 3 5) = ~a~%" (+ 3 5))
    ;; (format t "2. (3 + 5) = ~a~%" (3 + 5) )
    ;; (format t "3. (+ 3 (5 6)) = ~a~%" (+ 3 (5 6)))
)

(mostrar-resultados)