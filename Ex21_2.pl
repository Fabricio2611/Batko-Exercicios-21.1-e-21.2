% ============================================================
% Exercicio 21.2 - Bratko / MINIHYPER
% Refinement steps for predecessor
% ============================================================

% ------------------------------------------------------------
% Background knowledge
% ------------------------------------------------------------

% Modified background literals suggested in the book.
% The use of atom(X) restricts parent(X,Y) and predecessor(X,Y)
% to be called only when X is instantiated.

backliteral([atom(X), parent(X,Y)], [X,Y]).
backliteral([atom(X), predecessor(X,Y)], [X,Y]).

prolog_predicate(parent(X,Y)).
prolog_predicate(atom(X)).

% ------------------------------------------------------------
% Family relations
% ------------------------------------------------------------

parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(pat,eve).

% ------------------------------------------------------------
% Positive examples for predecessor
% ------------------------------------------------------------

ex(predecessor(pam,bob)).
ex(predecessor(pam,ann)).
ex(predecessor(tom,ann)).
ex(predecessor(tom,jim)).
ex(predecessor(tom,liz)).

% ------------------------------------------------------------
% Negative examples for predecessor
% ------------------------------------------------------------

nex(predecessor(liz,bob)).
nex(predecessor(pat,bob)).
nex(predecessor(pam,liz)).
nex(predecessor(liz,jim)).
nex(predecessor(liz,liz)).

% ------------------------------------------------------------
% Starting hypothesis
% ------------------------------------------------------------

start_hyp([
    [predecessor(X1,Y1)] / [X1,Y1],
    [predecessor(X2,Y2)] / [X2,Y2]
]).

% ------------------------------------------------------------
% Target hypothesis
% ------------------------------------------------------------
%
% predecessor(A,B) :- parent(A,B).
%
% predecessor(A,B) :-
%     parent(A,C),
%     predecessor(C,B).
%
% ------------------------------------------------------------
% Refinement analysis
% ------------------------------------------------------------
%
% The target hypothesis has two clauses.
%
% Clause 1:
% predecessor(A,B) :- parent(A,B).
%
% This clause is obtained by adding one relevant background literal
% to the first empty clause body:
%
% Step 1:
% predecessor(A,B) :- parent(A,B).
%
% With the modified background, this appears as:
%
% predecessor(A,B) :- atom(A), parent(A,B).
%
% Clause 2:
% predecessor(A,B) :- parent(A,C), predecessor(C,B).
%
% This recursive clause requires two relevant additions:
%
% Step 2:
% predecessor(A,B) :- parent(A,C).
%
% Step 3:
% predecessor(A,B) :- parent(A,C), predecessor(C,B).
%
% With the modified background, this appears with atom checks:
%
% predecessor(A,B) :-
%     atom(A),
%     parent(A,C),
%     atom(C),
%     predecessor(C,B).
%
% Therefore, conceptually, at least three main refinement steps are
% needed to reach the target definition:
%
% 1. Add parent(A,B) to produce the direct parent case.
% 2. Add parent(A,C) to begin the recursive case.
% 3. Add predecessor(C,B) to complete the recursive case.
%
% The atom(A) and atom(C) literals are not part of the conceptual
% predecessor definition. They are operational restrictions used to
% reduce the search space and avoid useless hypotheses.
%
% ------------------------------------------------------------
% Expected MINIHYPER result shown in the book
% ------------------------------------------------------------
%
% H = [
%   [predecessor(A,B), [atom(A),parent(A,C)]],
%   [atom(C),predecessor(C,B)]
%   || / [A,C,B],
%   [predecessor(D,E), [atom(D),parent(D,E)]]
%   / [D,E]
% ]
%
% This corresponds to the expected recursive definition of predecessor.
