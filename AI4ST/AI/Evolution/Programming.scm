(define (list-length l)
        (if (null? l)
            0
            (+ 1 (list-length (cdr l)))))

(define (list-at l index)
        (if (not (null? l))
            (if (zero? index)
                (car l)
                (list-at (cdr l) (- index 1)))))

(define (list-is-in l element)
        (cond ((null? l) #f)
              ((equal? (car l) element) #t)
              (#t (list-is-in (cdr l) element))))

(define (list-depth l)
	(if (not (pair? l)) 0 (+ 1 (apply max (map list-depth l)))))

(define (random-choice l)
    	(list-at l (random (list-length l))))

(define (reduce f init l)
        (if (null? l)
            init
            (reduce f (f init (car l)) (cdr l))))

(define inputs (list `I0 `I1 `I2 `I3 `S0 `S1))
(define functions (list `AND `OR `NOT))
(define symbols (append inputs functions))
(define population-size 1000)

(define (genetic-sexp-validate sexp)
        (cond ((list-is-in inputs sexp) #t)
              ((and (list? sexp) (list-is-in functions (car sexp)))
              (cond ((or (equal? (car sexp) `AND)
                         (equal? (car sexp) `OR)) (list (genetic-sexp-validate (list-at sexp 1))
                                                        (genetic-sexp-validate (list-at sexp 2))))
                    ((equal? (car sexp) `NOT) (genetic-sexp-validate (list-at sexp 1)))
                    (#t #f)))
              (#t #f)))

(define (genetic-init-grow depth max-depth)
        (let ((f (random-choice functions))
              (i (random-choice inputs))
              (s (random-choice (list (random-choice functions)
                                      (random-choice inputs)))))
		      (cond ((= depth 0) (if (equal? f `NOT) (list f (genetic-init-full (+ 1 depth) max-depth))
                                                     (list f (genetic-init-full (+ 1 depth) max-depth)
                                                             (genetic-init-full (+ 1 depth) max-depth))))
		            ((> depth max-depth) (random-choice inputs))
		            (#t (cond ((or (equal? s `AND) (equal? s `OR)) (list s (genetic-init-grow (+ 1 depth) max-depth)
		                                                                   (genetic-init-grow (+ 1 depth) max-depth)))
		                      ((equal? s `NOT) (list s (genetic-init-grow (+ 1 depth) max-depth)))
		                      (#t (random-choice inputs)))))))

(define (genetic-init-full depth max-depth)
        (let ((f (random-choice functions))
              (i (random-choice inputs)))
              (if (> depth max-depth)
                  (random-choice inputs)
                  (if (equal? f `NOT)
                      (list f (genetic-init-full (+ 1 depth) max-depth))
                      (list f (genetic-init-full (+ 1 depth) max-depth)
                              (genetic-init-full (+ 1 depth) max-depth))))))

(define (genetic-population-grow population iterations max-depth)
	(if (zero? iterations)
	    population
	    (genetic-population-grow (append population (genetic-init-grow 0 max-depth))
	                             (- iterations 1)
	                             max-depth)))

(define (genetic-population-full population iterations max-depth)
	(if (zero? iterations)
	    population
	    (genetic-population-full (append population (genetic-init-full 0 max-depth))
	                             (- iterations 1)
	                             max-depth)))

(define (genetic-init-ramp population pop-size max-depth)
        (let ((batch-size (/ pop-size (* 2 max-depth))))
             (if (equal? 1 max-depth)
	             population
	             (genetic-init-ramp (append population
	                                        (genetic-population-grow (list) batch-size max-depth)
	                                        (genetic-population-full (list) batch-size max-depth))
	                                 pop-size (- max-depth 1)))))

(define (genetic-sexp-subsexp sexp cut-point)
	(let ((branch (random 2)))
	     (cond ((or (zero? cut-point) (not (pair? sexp))) sexp)
	           ((or (equal? `NOT (car sexp)) (zero? branch)) (genetic-sexp-subsexp (cadr sexp) (- cut-point 1)))
	           (#t (genetic-sexp-subsexp (car (cddr sexp)) (- cut-point 1))))))

;(display (genetic-init-full 0 5))
;(newline)
;(define random-source (open-input-file "/dev/urandom"))
;(define (random-integer) (let ((result (char->integer (read-char random-source)))) (if (< result 250) (modulo result 10) (random-integer))))
