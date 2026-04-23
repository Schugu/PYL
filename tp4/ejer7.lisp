;; En la compañía telefónica FunTel, el equipo de análisis de datos trabaja diariamente 
;; revisando el comportamiento de sus usuarios para entender mejor cómo utilizan el servicio. 
;; Una mañana, llega el caso de un cliente cuyo historial de llamadas está organizado de una 
;; forma particular: en una lista con dos sublistas. La primera contiene todas las duraciones de 
;; sus llamadas realizadas en horario normal, mientras que la segunda agrupa las llamadas 
;; hechas en horario reducido. 
;; Intrigado, uno de los analistas decide profundizar en esos datos. Su primera pregunta es 
;; simple pero clave: ¿en qué horario este usuario habló más? Para responderla, piensa en 
;; desarrollar una función llamada cuandoHabloMas, que le permita sumar los minutos de cada 
;; horario y compararlos. Si ambos resultan iguales, la respuesta será clara: IGUAL. 
;; Luego, el analista se pregunta cuál habrá sido la llamada más extensa que realizó el cliente. 
;; Para eso, imagina otra función, LlamadaMasLarga, que recorra ambas sublistas y no solo 
;; encuentre la mayor duración, sino que también indique si ocurrió en horario normal o reducido. 
;; Finalmente, para completar el análisis, decide buscar el otro extremo: ¿cuál fue la llamada 
;; más corta? Así surge la función LlamadaMasCorta, que deberá identificar la menor duración 
;; registrada y el horario en el que se produjo. 
;; Con estas herramientas, el analista logra transformar un simple registro de datos en 
;; información valiosa, permitiendo a FunTel entender mejor los hábitos de sus usuarios y 
;; mejorar sus servicios. 

;; Resumen: el cliente tiene un registro particular con dos sublistas.
;; Sublista 1: duraciones de llamadas en horario normal (en minutos).
;; Sublista 2: duraciones de llamadas en horario reducido (en minutos).

;; Se necesita una función que analice las dos sublistas y determine en cuál se habló más.
;; Si se habla lo mismo en ambas, debe devolver IGUAL.
;; Para esto, conviene hacer una función auxiliar que sume los minutos y reutilizarla.
;; Luego, crear una función que devuelva uno de los siguientes símbolos:
;; NORMAL, REDUCIDO o IGUAL.
;; Nombre: cuandoHabloMas

;; Se necesita una función que indique cuál es la llamada más larga y en qué horario fue realizada.
;; Nombre: LlamadaMasLarga
;; Para esto, conviene crear una función que obtenga el máximo de una lista, independientemente
;; de cuál sea, para luego reutilizarla y comparar ambos resultados.

;; Se necesita una función que indique cuál es la llamada más corta y en qué horario fue realizada.
;; Nombre: LlamadaMasCorta
;; De forma similar, se debe crear una función que obtenga el mínimo de una lista y reutilizarla.

(defparameter llamadas-normal '(20 30 40 50 60))
(defparameter llamadas-reducido '(10 20 30 40 50))

(defparameter lista (list llamadas-normal llamadas-reducido))

(defun sumar-minutos (lista)
    (if (null lista)
        0
        (+ (car lista) (sumar-minutos (cdr lista)))))

(defun cuandoHabloMas (lista)
    (let* ((normal (sumar-minutos (first lista)))
            (reducido (sumar-minutos (cadr lista))))
        (if (= normal reducido)
            'IGUAL
            (if (> normal reducido)
                'NORMAL
                'REDUCIDO))))

(defun obtener-mayor (lista max)
    (if (null lista)
        max 
        (obtener-mayor (cdr lista)
            (if (> (car lista) max)
                (car lista)
                max))))

(defun llamada-mas-larga (lista-normal lista-reducido)
    (let* ((normal (obtener-mayor (cdr lista-normal) (car lista-normal)))
            (reducido (obtener-mayor (cdr lista-reducido) (car lista-reducido))))
        (if (= normal reducido)
            (list 'IGUAL normal reducido)
            (if (> normal reducido)
                (list 'NORMAL normal)
                (list 'REDUCIDO reducido)))))

(defun obtener-menor (lista min)
    (if (null lista)
        min
        (obtener-menor (cdr lista)
            (if (< (car lista) min)
                (car lista)
                min))))

(defun llamada-mas-corta (lista-normal lista-reducido)
    (let* ((normal (obtener-menor (cdr lista-normal) (car lista-normal)))
            (reducido (obtener-menor (cdr lista-reducido) (car lista-reducido))))
        (if (= normal reducido)
            (list 'IGUAL normal reducido)
            (if (< normal reducido)
                (list 'NORMAL normal)
                (list 'REDUCIDO reducido)))))

(defun mostrar-resultados (lista)
    (let* ((normal (first lista))
            (reducido (cadr lista)))
            
        (format t "=========| Llamadas: |=========~%")
        (format t "===| En horario normal |===~%")
        (format t "Duraciones: ~a~%" normal)
        (format t "Total: ~a~%" (sumar-minutos normal))

        (format t "~%===| En horario reducido |===~%")
        (format t "Duraciones: ~a~%" reducido)
        (format t "Total: ~a~%" (sumar-minutos reducido))
        
        (format t "~%¿En que horario habló más?: ~a~%" (cuandoHabloMas lista))
        (format t "Llamada más larga: ~a~%" (llamada-mas-larga normal reducido))
        (format t "Llamada más corta: ~a~%" (llamada-mas-corta normal reducido))))


(mostrar-resultados lista)