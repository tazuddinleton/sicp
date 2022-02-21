## 1.2 Procedures and the Process they generate
Procedure and process are not the same thing. A procedure is the description of the steps a process follows to acomplish a task. In other word procedures generates processes. 

### Iterative vs Recursive process
Recursive process builds up a chain of defered operations to be performed later, consider the follwing snippet. It expands when it builds the operations to be performed and contracts when those operations are actually performed. Recursive processes are expensive because it requires extra information to be hold by the interpreter about the actions to be performed later.

If we look closely we can observ that the amount of information needed to keep track of grows linearly with the input n, this is why we call this type of process *linear recursive*.

```
(factorial 6)
(* 6 (factorial 5))
(* 6 (* 5 (factorial 4)))
(* 6 (* 5 (* 4 (factorial 3))))
(* 6 (* 5 (* 4 (* 3 (factorial 3)))))
(* 6 (* 5 (* 4 (* 3 (* 2 (factorial 1))))))
(* 6 (* 5 (* 4 (* 3 (* 2 1)))))
(* 6 (* 5 (* 4 (* 3 2))))
(* 6 (* 5 (* 4 6)))
(* 6 (* 5 24))
(* 6 120)
720
```

Now if we look at the substitution model of `(factorial2 n)` it apparent that there is not defered operations here. All the computation is performed and the state is maintained by few state variables. This kind of process is known as iterative process. Since the number of steps to be performed grows with the input n linearly it is called a *linear iterative process*
```
(factorial2 1 1 6)
(factorial2 1 2 6)
(factorial2 2 3 6)
(factorial2 6 4 6)
(factorial2 24 5 6)
(factorial2 120 6 6)
(factorial2 720 7 6)
720
```
Points to be noted here is even though both procedures are implemented using self reference (recursion) they generates different proesses.
Most languages is designed in a way that the consumption of memory grows with recursive calls, no matter if the procedure simply generates a 
iterative process. In Lisp however the memory consumption is optimized for iterative proccesses. This property of a language is called `tail-recursive`.
