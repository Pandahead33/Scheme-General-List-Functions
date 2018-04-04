# Scheme Functions
## 1. First Element

To obtain the first element of a list, simply call car on it. 

    (define (first_element f)
      display (car f))
    
    (first_element '(1 2 3))
    
    Output: 
    => 1
## 2. Last Element

To obtain the last element, we can recurse through the list until the next cdr will be null. Then we know the current front of the list, or car, will be the last element in the list. 

    (define (last_element l)
      (cond ((null? (cdr l)) display (car l))
            (else (last_element (cdr l)))
                    ))
    
    (last_element '(1 2 3))
    
    Output:
    => 3
## 3. Append Lists

Appending two lists is not as simple as it may seem. Cons creates pairs not lists. Two lists (1 2 3) and (4 5 6) can be appended together in the following manner: 

    (define (next_cons a b) 
      (cond 
            ((null? a) ())
            ((not (null? (cdr a))) (cons (car a) (next_cons (cdr a) b)))
            (else (cons (car a) (next_cons b ())))
      )
    )
    
    (define (append_lists a b)
      (cons (car a) (next_cons (cdr a) b))
    )
    
    (append_lists '(1 2 3) '(4 5 6))
    
    Output:
    => (1 2 3 4 5 6)

I have found a slight error that lists of size one may not work. Will come back to this later. 

**Fixed it:** 

    (define (append_lists a b)
      (cond 
            ((null? (cdr a)) (cons (car a) (next_cons b ())))
            (else (cons (car a) (next_cons (cdr a) b)))
      )
    )
## 4. Reverse Lists

Reversing a list is even tougher! I decided to make a helper method 

    (define (remove_last_element a)
     (cond 
        ((null? (cdr a)) ())
        (else (cons(car a) (remove_last_element (cdr a))))   
     )
    )

We already have a method for getting the last element. So if we can get the last element, then remove it from the list over and over- we can reverse the list easily by cons the last element then recursing the method until the list is null. 

    (define (reverse_list a)
      (cond 
        ((null? (cdr a)) (cons (car a) ()))
        (else 
              (cons (last_element a) (reverse_list(remove_last_element a)))
        )
      )
    )
    
    (reverse_list '(1 2 3))
    
    Output:
    => (3 2 1)



