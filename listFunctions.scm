(define (first_element f)
  display (car f))
  

(define (last_element l)
  (cond ((null? (cdr l)) display (car l))
        (else (last_element (cdr l)))
                ))
          
(define (next_cons a b) 
  (cond 
        ((null? a) ())
        ((not (null? (cdr a))) (cons (car a) (next_cons (cdr a) b)))
        (else (cons (car a) (next_cons b ())))
  )
)

(define (append list1 list2)
  (cond 
    ((null? (cdr list1)) (cons (car list1) list2))
    (else (append (remove_last_element list1) (cons (last_element list1) list2)))
  )
)

(define (append_lists a b)
  (cond 
        ((null? (cdr a)) (cons (car a) (next_cons b ())))
        (else (cons (car a) (next_cons (cdr a) b)))
  )
)

(define (remove_last_element a)
 (cond 
    ((null? (cdr a)) ())
    (else (cons(car a) (remove_last_element (cdr a))))   
 )
)


(define (reverse_list a)
  (cond 
    ((null? (cdr a)) (cons (car a) ()))
    (else 
          (cons (last_element a) (reverse_list(remove_last_element a)))
    )
  )
)
