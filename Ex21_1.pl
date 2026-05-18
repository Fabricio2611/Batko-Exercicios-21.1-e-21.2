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
% Explicação:
% Uma pessoa X possui uma filha se existir um Y tal que parent(X,Y) 
% seja verdadeiro e female(Y) também seja verdadeiro.
%
% Efeitos da modificação:
%
% 1. Adicionar um exemplo positivo incorreto, como:
%    ex(has_daughter(pam)).
%    pode fazer o sistema aprender uma regra excessivamente geral, como:
%    has_daughter(X) :- parent(X,Y).
%
% 2. Adicionar um exemplo negativo contraditório, como:
%    nex(has_daughter(tom)).
%    cria uma inconsistência, porque Tom possui Liz como filha.
%
% 3. Remover exemplos positivos relevantes pode fazer a hipótese 
% se tornar específica demais. Por exemplo, remover Pat pode levar 
% o sistema a pensar que apenas homens podem ter filhas.
%    
% 4.Adicionar mais exemplos corretos e variados melhora a generalização.
