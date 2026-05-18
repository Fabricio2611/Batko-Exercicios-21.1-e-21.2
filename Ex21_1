% ============================================================
% Exercicio 21.1 - Bratko / MINIHYPER
% Experimento com exemplos modificados de has_daughter
% ============================================================

% ------------------------------------------------------------
% Background knowledge
% ------------------------------------------------------------

backliteral(parent(X,Y), [X,Y]).
backliteral(male(X), [X]).
backliteral(female(X), [X]).

prolog_predicate(parent(_,_)).
prolog_predicate(male(_)).
prolog_predicate(female(_)).

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

% ------------------------------------------------------------
% Exemplos Positivos
% ------------------------------------------------------------

ex(has_daughter(tom)).
ex(has_daughter(bob)).
ex(has_daughter(pat)).

% ------------------------------------------------------------
% Exemplos Negativos
% ------------------------------------------------------------

nex(has_daughter(pam)).
nex(has_daughter(jim)).

% ------------------------------------------------------------
% Hipóteses
% ------------------------------------------------------------

start_hyp([[has_daughter(X)] / [X]]).

% ------------------------------------------------------------
% Hipótese esperada
% ------------------------------------------------------------
%
% has_daughter(X) :- parent(X,Y), female(Y).
%
% Explanation:
% A person X has a daughter if there exists a Y such that
% parent(X,Y) is true and female(Y) is also true.
%
% Effects of modifications:
%
% 1. Adding an incorrect positive example such as:
%    ex(has_daughter(pam)).
%    can make the system learn an overly general rule, such as:
%    has_daughter(X) :- parent(X,Y).
%
% 2. Adding a contradictory negative example such as:
%    nex(has_daughter(tom)).
%    creates inconsistency, because Tom has Liz as a daughter.
%
% 3. Removing relevant positive examples can make the hypothesis
%    too specific. For example, removing Pat may lead the system
%    to think that only males can have daughters.
%
% 4. Adding more correct and varied examples improves generalization.
