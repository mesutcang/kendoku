#const n = 6. % Max-Value

xcoo(1..n).
ycoo(1..n).
value(1..n).
%text( f ( 1 , 1 ),3 ). 
1 { text( f ( X , Y ),V ) : value(V) } 1  :- xcoo ( X ) , ycoo( Y ) .
field(f(X,Y)) :- xcoo(X), ycoo(Y).


cage(c1,"-",1).

in(c1,f(1,1)).
in(c1,f(1,2)).
sign(f(1,1),"-1").
color(f(1,1),"#FF0000").
color(f(1,2),"#FF0000").

cage(c2,"+",7).

in(c2,f(2,1)).
in(c2,f(2,2)).
in(c2,f(3,2)).
sign(f(2,1),"+7").
color(f(2,1),"#00FFFF").
color(f(2,2),"#00FFFF").
color(f(3,2),"#00FFFF").

cage(c5,"+",16).
in(c5,f(3,1)).
in(c5,f(4,1)).
in(c5,f(4,2)).
in(c5,f(4,3)).
in(c5,f(4,4)).
sign(f(3,1),"+16").
color(f(3,1),"#78cb02").
color(f(4,1),"#78cb02").
color(f(4,2),"#78cb02").
color(f(4,3),"#78cb02").
color(f(4,4),"#78cb02").

cage(c6,"-",4).
in(c6,f(5,4)).
in(c6,f(5,5)).
sign(f(5,4),"-4").
color(f(5,4),"#ead367").
color(f(5,5),"#ead367").


cage(c7,"*",6).
in(c7,f(6,2)).
in(c7,f(6,3)).
sign(f(6,2),"*6").
color(f(6,2),"#fd7f00").
color(f(6,3),"#fd7f00").




cage(c3,"/",1).
in(c3,f(3,3)).
in(c3,f(3,2)).

cage(c4,"*",2).
in(c4,f(3,1)).
in(c4,f(3,2)).


cagesum(P,S) :- S = #sum{V,I:in(P,I), text(I,V)}, cage( P,"+",R ).

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