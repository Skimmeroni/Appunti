(define (list-length _list)
        (if (null? _list)
            0
            (+ 1 (list-length (cdr _list)))))

(define (list-at _list index)
        (if (not (null? _list))
            (if (zero? index)
                (car _list)
                (list-at (cdr _list) (- index 1)))))

(define (list-is-in _list element)
        (cond ((null? _list) #f)
              ((equal? (car _list) element) #t)
              (#t (list-is-in (cdr _list) element))))

(define (random-choice _list)
    	(list-at _list (random (list-length _list))))

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

(display (genetic-init-full 0 5))
(newline)

;(define (random decimals)
;        (if (zero? decimals)
;            (list)
;            (append (list (char->integer (read-char (open-input-file "/dev/urandom")))) (random (- decimals 1)))))
;
;(define (random decimals) (if (zero? decimals) 1 (* (char->integer (read-char (open-input-file "/dev/urandom"))) (random (- decimals 1)))))
;
;(char->integer (read-char (open-input-file "/dev/urandom")))
