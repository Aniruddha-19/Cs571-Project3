

%problem 1

dept_employees(dept ,E([]), ([])):- !, Fail.
dept_employees(dept ,([H| _]), ([])):- dept_employees(dept , H, ([])).
dept_employees(cs ,E([_| T]), ([])):- 
		dept_employees([dept, T, ([])).
		
		
%problem 2
list_sum([],0).

list_sum([Head|Tail], TotalSum):-
list_sum(Tail, Sum1),
TotalSum is Head+Sum1.



%Problem 4
count([], _, 0).
count([H|T], H, R) :- count(T, H, RT), R is RT + 1.
count([H|T], X, R) :- H \= X, count(T, X, R).

add_if_count_is_one(H, T, RT, R) :- count(T, H, 1), R is RT + 1.
add_if_count_is_one(H, T, R, R) :- count(T, H, X), X \= 2.

num_pairs([], 0).
num_pairs([H|T], R) :- delete(T, H, TT),
                       num_pairs(TT, RT),
                       add_if_count_is_one(H, T, RT, R).

:- num_pairs([4,1,1,1,4], N is N+1), write(N).

%problem 5

divisible([],_,[]).
divisible([H|T],X,[H|T1]):-
    H mod X=:=0, divisible(T,X,T1).
divisible([H|T],X,T1):- H mod X=\=0, divisible(T,X,T1).
