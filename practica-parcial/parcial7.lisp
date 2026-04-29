;; Ejercicio 1 — 20 pts
;; Función simple
;; Cálculo del Índice de Masa Corporal (IMC)

;; En el sistema del hospital, cada paciente tiene registrado su peso en kilogramos y su altura en metros. 
;; Escribí una función calcular-imc que reciba el peso y la altura de un paciente y devuelva su Índice de 
;; Masa Corporal, calculado como el cociente entre el peso y el cuadrado de la altura. El resultado debe 
;; expresarse como número de punto flotante.

;; (calcular-imc 70 1.75) → 22.857...
;; (calcular-imc 90 1.60) → 35.156...
;; (calcular-imc 55 1.68) → 19.486...

(defun ingresar-peso ()
    (format t "Ingrese su peso en kilogramos: ")
    (finish-output)
    (let ((peso (read)))
        (if (and (numberp peso) (plusp peso))
            peso
            (progn 
                (format t "Error: debe ingresar un número positívo.~%")
                (ingresar-peso)))))

(defun ingresar-altura ()
    (format t "Ingrese su altura en metros: ")
    (finish-output)
    (let ((altura (read)))
        (if (and (numberp altura) (plusp altura))
            altura
            (progn 
                (format t "Error: debe ingresar un número positívo.~%")
                (ingresar-altura)))))

(defun calcular-imc (peso altura)
   (float (/ peso (expt altura 2))))

(defun mostrar-resultados-imc ()
    (let ((peso (ingresar-peso))
          (altura (ingresar-altura)))
        (format t "Peso: ~a~%" peso)
        (format t "Altura: ~a~%" altura)
        (format t "Índice de Masa Corporal (IMC): ~,2f~%" (calcular-imc peso altura))))

;; (mostrar-resultados-imc)



;; Ejercicio 2 — 25 pts
;; Función definida por el usuario
;; Clasificación de presión arterial

;; El sistema de enfermería registra la presión arterial sistólica (el número superior) de cada paciente. 
;; Usando COND, escribí la función clasificar-presion que reciba dicho valor numérico y devuelva un símbolo 
;; según los siguientes rangos clínicos:

;; menor a 90 → HIPOTENSION
;; entre 90 y 119 → NORMAL
;; entre 120 y 129 → ELEVADA
;; entre 130 y 179 → HIPERTENSION
;; mayor o igual a 180 → CRISIS-HIPERTENSIVA

;; (clasificar-presion 115) → NORMAL
;; (clasificar-presion 145) → HIPERTENSION
;; (clasificar-presion 82) → HIPOTENSION

(defun ingresar-presion ()
    (format t "Ingrese el valor de la presión arterial: ")
    (finish-output)
    (let ((presion (read)))
        (if (and (numberp presion) (plusp presion))
            presion
            (progn 
                (format t "Error: debe ingresar un número positivo.~%")
                (ingresar-presion)))))

(defun clasificar-presion (presion)
    (cond 
        ((< presion 90) 'HIPOTENSION) 
        ((and (>= presion 90) (< presion 120)) 'NORMAL) 
        ((and (>= presion 120) (< presion 130)) 'ELEVADA) 
        ((and (>= presion 130) (< presion 180)) 'HIPERTENSION) 
        ((>= presion 180) 'CRISIS-HIPERTENSIVA)))

(defun mostrar-resultados-presion ()
    (let ((presion (ingresar-presion)))
        (format t "Presión arterial: ~a~%" presion)
        (format t "Estado: ~a~%" (clasificar-presion presion))))

;; (mostrar-resultados-presion)



;; Ejercicio 3 — 30 pts
;; Función con recursividad
;; Pacientes internados en un servicio específico

;; El hospital mantiene un registro de pacientes internados como una lista de sublistas, donde cada sublista 
;; tiene la forma (nombre servicio dias-internado). Escribí una función recursiva pacientes-en-servicio 
;; que reciba el registro completo y un símbolo de servicio, y devuelva una lista con los nombres de los 
;; pacientes que pertenezcan a ese servicio.

;; (pacientes-en-servicio
;;   '((garcia cardiologia 5) (lopez traumatologia 2)
;;     (perez cardiologia 8) (roman neurologia 1))
;;   'cardiologia)
;; → (garcia perez)

(defparameter lista-pacientes '(
    (Pedro cardiologia 5) (Mario cardiologia 1)
    (Alberto cardiologia 3) (Juan traumatologia 1)
    (Mariano traumatologia 2) (Mateo traumatologia 3)
))

(defun pacientes-en-servicio (lista servicio)
    (if (null lista)
        '()
        (let ((resto (pacientes-en-servicio (cdr lista) servicio))
              (paciente (car lista)))
            (if (eq (second paciente) servicio)
                (cons (first paciente) resto)
                resto))))

;; (print (pacientes-en-servicio lista-pacientes 'traumatologia))

;; Ejercicio 4 — 25 pts
;; Función con MAPCAR
;; Conversión de temperatura corporal

;; El sistema de guardia importa registros de temperatura corporal en grados Fahrenheit desde un 
;; dispositivo externo, pero los médicos trabajan en Celsius. Usando MAPCAR y una función LAMBDA, 
;; escribí la función fahrenheit-a-celsius que reciba una lista de temperaturas en Fahrenheit y 
;; devuelva una nueva lista con cada valor convertido a Celsius. 
;; La fórmula de conversión es: C = (F - 32) × 5/9. No está permitido usar recursión explícita en este ejercicio.

;; (fahrenheit-a-celsius '(98.6 104 95 100.4)) → (37.0 40.0 35.0 38.0)
;; (fahrenheit-a-celsius '(32 212)) → (0.0 100.0)

(defparameter lista-temps '(98.6 104 95 100.4 32 212))

(defun convertir-a-celsius (temp)
    (float (* (- temp 32) 5/9)))

(defun convertir-lista (lista)
    (mapcar (lambda (x) (convertir-a-celsius x)) lista))

;; (print (convertir-lista lista-temps))