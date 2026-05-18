% Exercise 21.1 - Bratko
% Learning has_daughter/1 with MINIHYPER

% Background predicates available to MINIHYPER

backliteral(parent(X,Y), [X,Y]).
backliteral(male(X), [X]).
backliteral(female(X), [X]).

prolog_predicate(parent(_,_)).
prolog_predicate(male(_)).
prolog_predicate(female(_)).

% Background knowledge

parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(pat,eve).

female(pam).
male(tom).
male(bob).
female(liz).
female(ann).
female(pat).
male(jim).
female(eve).

% Positive examples

ex(has_daughter(tom)).
ex(has_daughter(bob)).
ex(has_daughter(pat)).

% Negative examples

nex(has_daughter(pam)).
nex(has_daughter(jim)).

% Starting hypothesis

start_hyp([[has_daughter(X)]/[X]]).
