;; Actividad N°6: 
;; A partir de un determinado valor de temperatura, que será ingresado por el operador, definir 
;; una función llamada clima que me indique el estado del clima, teniendo en cuenta: 
;; Temperatura |    Clima 
;; < 0         |    Helado 
;; = 0 y < 10  |    Frio 
;; = 10 y < 20 |    Templado 
;; = 20 y < 30 |    Cálido 
;; > 30        |    Abrasador 

(defun clima (temp)
    (cond
        ((< temp 0) (format t "Clima Helado.~%"))
        ((and (>= temp 0) (< temp 10)) (format t "Clima Frio.~%"))
        ((and (>= temp 10) (< temp 20)) (format t "Clima Templado.~%"))
        ((and (>= temp 20) (< temp 30)) (format t "Clima Cálido.~%"))
        ((>= temp 30) (format t "Clima Abrasador.~%"))))

(defun ingresar-datos ()
    (format t "Ingrese la temperatura en grados Celsius (°C): ")
    (finish-output)
    (let((temp (read)))
        (clima temp)))

(ingresar-datos)