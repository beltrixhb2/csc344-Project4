% Define the constants
#const n1=25.
#const n2=25.
#const startX=1.
#const d = 6.

% Define the grid
cell(X, Y) :- X >- 1, X < n1 + 1, Y >- 1, Y <n2 + 1.

% Define the people in the park
p(8,8).
p(20,5).
p(20,20).
p(0,6).

% Set the starting point
start(startX, 0).

%Set the posible destinations
destination (X, n2) :- X >- 1, X < n1 + 1.

%Define the posible first moves
{path (X, Y, X + 1, Y); path(X, Y, X - 1, Y); path(X, Y, X, Y + 1); path(X, Y, X, Y - 1)}=1 :- start(X, Y), cell(X, Y).

% Define the possible movements from a previous movement
{path (X, Y, X + 1, Y); path(X, Y, X - 1, Y); path(X, Y, X, Y + 1); path(X, Y, X, Y - 1)} < 2 :- path(_,_, X, Y), cell(X,Y).

% The path should start from a cell in the grid
:- path(X,Y,_,_), not cell(X,Y).

% There can not be a path from a destination
:- path(X, Y,_, _), destination (X, Y).

% Te path should not go less than d feet from any person
:- path(_,_,X1,Y1), p(X2,Y2), (((X2 - X1) * (X2 - X1) + (Y2 - Y1) * (Y2 - Y1))) < (d * d).

% There should be a path that ends in a possible destination
:- not path(_,_, _, Y), destination (_, Y).

#show path/4.
