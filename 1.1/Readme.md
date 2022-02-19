## 1.1 The Elements of Programming
A language has three basic mechanisms by which it provide a framework where our mind can create and organize ideas.
- **primitive expressions**, are simplest entities the language is concerned with
- **means of combination** let's us build complex entities from simple ones
- **means of abstractions** let's us name compound elements and manipulate them as units

We deal with two kinds of elements in programming
- **Data** is what we want to manipulate
- **Procedures** are the descriptions of the rules for that manipulation

Thus the method of combining and abstracting procedures is core to any powerfull language.

From above discusstion if we go for an example of each of the bullet points then 
numbers `0 1 2 3..9` are the example of primitive expressions. It's value is the number it represents. If you evaluate `3` you get the value `3` and so on. 

We can associate names to  each of these primitive expressions like `(define five 5)`. This give us a limited means of abstraction.

The arithmetic operators are also another kind of primitive expressions but these are called primitive procedures. As we already know a procedure is something we apply on data so we can do something like `(+ 2 3)`. 
This is a compound expression because we have combined two sets of primitive expressions together. Now `()` are the means of combination that Lisp provide to combine such primitive expressions. 

Now what this compound expression represents is the 'addision' of two number `2` and `3` that will evaluate to `5`. If we name this operation like `(define (add x y) (+ x y))`. This is more powerfull abstraction than the previous one. We have abstracted the operation itself, now we can apply this operation to any numbers `(add 10 30)` and `(add 5 8)` and so on.

## 1.1.5 Substitution Model (Normal vs Applicative)
There are two models of evaluation exists 
- Normal order
- Applicative order

### Normal Order
In normal order evaluation operands are not evaluated until their values were needed. To evaluate `(f 5)` in normal order we first substitute `f` with it's body 

```
(sums-of-squares (+ 5 1) (* 5 2))
```
then again substitute `sums-of-square` with it's body
```
(+ (square (+ 5 1)) (square (* 5 2)))
```
then substitute `square` with it's body
```
(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))
```
now reduce
```
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```

at a glance
```
(f 5)
(sums-of-squares (+ 5 1) (* 5 2))
(+ (square (+ 5 1)) (square (* 5 2)))
(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```
### Applicative Order
In applicative order evaluation the interpreter first evaluates the arguments then applies the procedure to it. 
To evaludate `(f 5)` in applicative order
```
(f 5)
(sums-of-square (+ 5 1) (* 5 2))
(sums-of-square 6 10)
(+ (square 6) (square 10))
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```
Notice the difference here, in normal order evaluation we had to evaluate `(+ 5 1)` and `(* 5 2)` twice.

## 1.1.6 Conditional Expressions and Predicates
Two ways to express conditionals in Scheme, 
- cond
```
(cond   (<p1> <e1>)
        (<pn> <en>))          
```
- if
```
(if(<predicate> <consequent> <alternative>))
```
## 1.1.8 Procedures as Black-Box Abstractions
- Procedural abstraction is the idea that a procedure `(square x)` how it calculate the square of some number x is irrelevant to the user 
- Formal parameters are called bound variable to a procedure body
- Global variables are free variable to a procedure body
- The set of expression for which a variable name is bound is called it's *scope*, thus formal parameters have the full body as its scope
- When we define auxiliary procedures inside a procedure to hide the implementation detail from outside world we create *Block Structure*
- The formal parameters of first procedure acts as free variable for internally defined procedures, which is called *lexical scoping*
