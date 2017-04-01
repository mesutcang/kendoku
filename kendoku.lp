#const n = 9. % Max-Value

value(1..n).
sudoku(X,Y,V) :- initial(X,Y,V).
initial(1,2,3).

% For every value X and Y that don't describe a cell that is initially filled out, 
% choose one value V and generate fact sudoku(X,Y,V)
1 { sudoku(X,Y,V) : value(V) } 1 :- value(X), value(Y), not initial(X,Y,_).

% Each row may only contain the same value once
:- sudoku(X,Y,V), sudoku(XX,Y,V), X != XX.
% Each column may only contain the same value once
:- sudoku(X,Y,V), sudoku(X,YY,V), Y != YY.

% calculations for 2 parameters
cage("+",sudoku(X,Y,V),sudoku(XX,YY,VV), T) :- sudoku(X,Y,V), sudoku(XX,YY,VV), V+VV==T.
cage("-",sudoku(X,Y,V),sudoku(XX,YY,VV), T) :- sudoku(X,Y,V), sudoku(XX,YY,VV), V-VV==T.
cage("x",sudoku(X,Y,V),sudoku(XX,YY,VV), T) :- sudoku(X,Y,V), sudoku(XX,YY,VV), V*VV==T.
cage("/",sudoku(X,Y,V),sudoku(XX,YY,VV), T) :- sudoku(X,Y,V), sudoku(XX,YY,VV), V/VV==T.

% calculations for 3 parameters

cage("+",sudoku(X,Y,V),sudoku(XX,YY,VV),sudoku(XXX,YYY,VVV), T) :- sudoku(X,Y,V), sudoku(XX,YY,VV), sudoku(XXX,YYY,VVV), V+VV+VVV==T.


%% :- not cage("+",sudoku(1,1,_),sudoku(1,2,_), 3).
%% :- not cage("x",sudoku(1,1,_),sudoku(1,2,_), 9).
%% :- not cage("/",sudoku(1,1,_),sudoku(1,2,_), 2).
:- not cage("+", sudoku(1,1,_), sudoku(1,2,_), sudoku(1,3,_), 6).

#show sudoku/3.