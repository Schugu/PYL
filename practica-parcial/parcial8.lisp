;; Ejercicio 1 — 20 pts
;; Función simple
;; Cálculo de puntos en la tabla de posiciones

;; En la liga de fútbol, cada equipo acumula puntos según sus resultados: 3 puntos por victoria, 
;; 1 punto por empate y 0 puntos por derrota. Escribí una función calcular-puntos que reciba 
;; la cantidad de victorias, empates y derrotas de un equipo, y devuelva el total de puntos 
;; acumulados en la temporada.

;; (calcular-puntos 10 4 2) → 34
;; (calcular-puntos 0 3 5) → 3
;; (calcular-puntos 6 0 0) → 18


(defun ingresar-num ()
    (format t "Ingrese el número: ")
    (finish-output)
    (let ((x (read)))
        (if (and (numberp x) (>= x 0))
            x
            (progn 
                (format t "Error: debe ingresar un número positivo.~%")
                (ingresar-num)))))

(defun ingresar-datos ()
    (format t "(Victorias) ")
    (let ((vic (ingresar-num)))
        (format t "(Empates) ")
        (let ((emp (ingresar-num)))
            (format t "(Derrotas) ")
            (let ((der (ingresar-num)))
            (list vic emp der)))))

(defun calcular-puntos (lista)
    (+ (* (car lista) 3) (cadr lista)))

(defun mostrar-resultados-puntos ()
    (let* ((resultado (ingresar-datos))
           (vic (car resultado))
           (emp (cadr resultado))
           (der (caddr resultado))
           (puntos (calcular-puntos resultado)))
        (format t "Victorias: ~a~%" vic)
        (format t "Empates: ~a~%" emp)
        (format t "Derrotas: ~a~%" der)
        (format t "Puntos: ~a~%" puntos)))

;; (mostrar-resultados-puntos)



;; Ejercicio 2 — 25 pts
;; Función definida por el usuario
;; Clasificación de un jugador por posición

;; El sistema de la liga identifica a cada jugador mediante un número de dorsal. Por convención, 
;; los dorsales determinan la posición en el campo. Usando COND, escribí la función posicion-jugador 
;; que reciba el número de dorsal y devuelva un símbolo según la siguiente clasificación:

;; dorsal 1 → ARQUERO
;; dorsales 2, 3, 4, 5 → DEFENSOR
;; dorsales 6, 7, 8 → MEDIOCAMPISTA
;; dorsales 9, 10, 11 → DELANTERO
;; cualquier otro → SUPLENTE

;; (posicion-jugador 1) → ARQUERO
;; (posicion-jugador 10) → DELANTERO
;; (posicion-jugador 18) → SUPLENTE

(defun ingresar-num-dorsal ()
    (format t "Ingrese el número del dorsal: ")
    (finish-output)
    (let ((x (read)))
        (if (and (numberp x) (plusp x))
            x
            (progn 
                (format t "Error: debe ingresar un número positivo.~%")
                (ingresar-num-dorsal)))))

(defun posicion-jugador (num)
    (cond 
        ((= num 1) 'ARQUERO)
        ((<= num 5) 'DEFENSOR)
        ((<= num 8) 'MEDIOCAMPISTA)
        ((<= num 11) 'DELANTERO)
        (t 'SUPLENTE)))

(defun mostrar-resultad-posicion ()
    (let ((num (ingresar-num-dorsal)))
        (format t "Número de dorsal: ~a~%" num)
        (format t "Posición: ~a~%" (posicion-jugador num))))

;; (mostrar-resultad-posicion)



;; Ejercicio 3 — 30 pts
;; Función con recursividad
;; Goleadores por encima de un umbral

;; El registro de goleadores de la temporada se representa como una lista de sublistas con 
;; la forma (nombre equipo goles). Escribí una función recursiva goleadores-destacados que 
;; reciba dicho registro y un número mínimo de goles, y devuelva una lista con los nombres 
;; de los jugadores que hayan convertido estrictamente más goles que el umbral indicado.

;; (goleadores-destacados
;;   '((martinez river 12) (gomez boca 7) (silva racing 15) (diaz san-lorenzo 4))
;;   7)
;; → (martinez silva)

(defparameter lista-goleadores '((martinez river 12) (gomez boca 7) 
                                 (silva racing 15) (diaz san-lorenzo 4)
                                 (gomez boca 20) (perez river 13)))

(defun goleadores-destacados (lista umbral)
    (if (null lista)
        '()
        (let ((resto (goleadores-destacados (cdr lista) umbral))
              (jugador (car lista)))
            (if (> (third jugador) umbral)
                (cons (car jugador) resto)
                resto))))

;; (print (goleadores-destacados lista-goleadores 10))



;; Ejercicio 4 — 25 pts
;; Función con MAPCAR
;; Proyección de goles ajustados por coeficiente

;; El analista estadístico de la liga quiere proyectar cuántos goles habría convertido cada 
;; jugador si hubiera jugado todos los partidos de la temporada. Para ello, multiplica la 
;; cantidad de goles anotados por un coeficiente de ajuste (número de punto flotante). 
;; Usando MAPCAR y una función LAMBDA, escribí la función proyectar-goles que reciba 
;; una lista de cantidades de goles y un coeficiente, y devuelva una nueva lista con
;; cada valor multiplicado por dicho coeficiente. No está permitido usar recursión 
;; explícita en este ejercicio.

;; (proyectar-goles '(8 12 5 20) 1.5) → (12.0 18.0 7.5 30.0)
;; (proyectar-goles '(3 7) 2.0) → (6.0 14.0)

(defun proyectar-goles (lista coef)
    (mapcar (lambda (x) (float (* x coef))) lista))

;; (print (proyectar-goles '(8 12 5 20) 1.5)) ;→ (12.0 18.0 7.5 30.0)
;; (print (proyectar-goles '(3 7) 2.0)) ;→ (6.0 14.0)