#const n = 3. % Max-Value

xcoo(1..n).
ycoo(1..n).
value(1..n).
%text( f ( 1 , 1 ),3 ). 
1 { text( f ( X , Y ),V ) : value(V) } 1  :- xcoo ( X ) , ycoo( Y ) .
field(f(X,Y)) :- xcoo(X), ycoo(Y).


cage(c1,"-",1).

in(c1,f(1,1)).
in(c1,f(1,2)).

cage(c2,"+",4).

in(c2,f(2,1)).
in(c2,f(2,2)).

cage(c3,"/",1).

in(c3,f(3,3)).
in(c3,f(3,2)).

cage(c4,"*",2).

in(c4,f(3,1)).
in(c4,f(3,2)).


cagesum(P,S) :- S = #sum{V:in(P,I), text(I,V)}, cage( P,"+",R ).

cageminus(P,S) :- S=V-VV, in(P,I),text(I,V),in(P,II), text(II,VV), cage( P,"-",R ), I!=II, S>0.

cagediv(P,S) :- S=V/VV, in(P,I),text(I,V),in(P,II), text(II,VV), cage( P,"/",R ), I!=II, S>0.

cageproduct(P,S) :- S=V*VV, in(P,I),text(I,V),in(P,II), text(II,VV), cage( P,"*",R ), I!=II, S>0.

:- cagesum(P,S), cage(P,"+",R), S!=R.
:- cageminus(P,S), cage(P,"-",R), S!=R.
:- cagediv(P,S), cage(P,"/",R), S!=R.
:- cageproduct(P,S), cage(P,"*",R), S!=R.

% One number can only appear once in a row
:- text(f(X,Y),V), text(f(XX,Y),V), X != XX.
% One number can only appear once in a column
:- text(f(X,Y),V), text(f(X,YY),V), Y != YY.