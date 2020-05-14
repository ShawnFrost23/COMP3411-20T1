 % Made by Arth  Sanskar Patel
% z5228942
% Started on 29/02/2020
% Finished on 13/03/2020

% HELPER FUNCTIONS
%====================================================
% isNumberEven(Number) : A function to check if a number is even.
isNumberEven(Number) :-
        0 is mod(Number, 2).
% isNumberODD(Number) : A function to check if a number is Odd.
isNumberOdd(Number) :-
        1 is mod(Number, 2).
%====================================================

% PART 1 Q1
%====================================================
% sumsq_even(Numbers, Sum) : A function to find the sum of square of even numbers in a list
sumsq_even([], 0).                              % Base Case
sumsq_even([Head | Tail], Sum) :-               % If Statement
        sumsq_even(Tail, SumDash),              % Recursive Call
    	(   
        	isNumberEven(Head)                  
        	->  Sum is SumDash + (Head*Head)    % If the Head is even
        	;   Sum is SumDash + 0              % If the Head is odd
        ).
%====================================================

% PART 1 Q2
%====================================================
% log_table(NumberList,ResultList) : A function to make a resultlist with logs 
%                                    of the numbers in numberlist.

log_table([], []).                                      % Base Case
log_table([Head | Tail], [HeadResult | TailResult]) :-  % If Statement
        log_table(Tail, TailResult),                    % Recursive call
        HeadResult = [Head, X],                         
    	X is log(Head).
%====================================================

% PART 1 Q3
%====================================================
% paruns(NumberList, ResultList) : A function which breaks sequence of even numbers and odd number.
paruns([], []).
paruns([Head | Tail], List1) :-
        ifNumberEven([Head | Tail], EvenList, ContinuedList1),
        ifNumberOdd(ContinuedList1, OddList, ContinuedList2),
        paruns(ContinuedList2, List2),
        (
            EvenList = []
            -> List1 = [OddList | List2]
            ; OddList = []
            -> List1 = [EvenList | List2]
            ; List1 = [EvenList, OddList | List2]
        ).
        

ifNumberEven([],[],[]).
ifNumberEven([Head | Tail], [], [Head | Tail]) :-
        isNumberOdd(Head).
ifNumberEven([Head | Tail], [Head | Rest], TailList) :-
        isNumberEven(Head),
        ifNumberEven(Tail, Rest, TailList).

ifNumberOdd([],[],[]).
ifNumberOdd([Head | Tail], [], [Head | Tail]) :-
        isNumberEven(Head).
ifNumberOdd([Head | Tail], [Head | Rest], TailList) :-
        isNumberOdd(Head),
        ifNumberEven(Tail, Rest, TailList).
%====================================================

% PART 1 Q4
%====================================================
% eval(Expr, FinalResult) : A function to evalute the expression Expr and give a final result.
eval(Expr, FinalResult) :-              % Case when Expr is a number.
        number(Expr),                     
        FinalResult is Expr.
eval(add(X, Y), FinalResult) :-         % Case when Expr is an Add expression
        eval(X, FinalResult1),
        eval(Y, FinalResult2),
        FinalResult is FinalResult1 + FinalResult2.
eval(sub(X, Y), FinalResult) :-         % Case when Expr is a Sub expression
        eval(X, FinalResult1),
        eval(Y, FinalResult2),
        FinalResult is FinalResult1 - FinalResult2.
eval(mul(X, Y), FinalResult) :-         % Case when Expr is mul expression
        eval(X, FinalResult1),
        eval(Y, FinalResult2),
        FinalResult is FinalResult1 * FinalResult2.
eval(div(X, Y), FinalResult) :-         % Case when Expr is div expression
        eval(X, FinalResult1),          
        eval(Y, FinalResult2),
        FinalResult is FinalResult1 / FinalResult2.
%====================================================