#const n = 3. % Max-Value

xcoo(1..n).
ycoo(1..n).
value(1..n).
%text( f ( 1 , 1 ),3 ). 
1 { text( f ( X , Y ),V ) : value(V) } 1  :- xcoo ( X ) , ycoo( Y ) .
field(f(X,Y)) :- xcoo(X), ycoo(Y).


cage(c1,"+",4).

in(c1,f(1,1)).
in(c1,f(1,2)).

%cagesum(C,S) :- S = #sum{in(C,f(X,Y)):cage(C)}.

cagesum(P, S) :- S = #sum{V:in(P,I), text(I,V)}, cage( P,"+",R ).

:- cagesum(P,S), cage(P,"+",R), S!=R.
%% cagesum(P, S) :- S = #sum{ V,field(I,V) : in(P,I)},cage(P,"+",S).


%sudoku(X,Y,V) :- initial(X,Y,V).
%initial(1,2,3).

% For every value X and Y that don't describe a cell that is initially filled out, 
% choose one value V and generate fact sudoku(X,Y,V)
%1 { sudoku(X,Y,V) : value(V) } 1 :- value(X), value(Y), not initial(X,Y,_).

% Each row may only contain the same value once
:- text(f(X,Y),V), text(f(XX,Y),V), X != XX.
% Each column may only contain the same value once
:- text(f(X,Y),V), text(f(X,YY),V), Y != YY.




% #show sudoku/3.