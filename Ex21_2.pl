% ============================================================
% Exercício 21.2 - Bratko / MINIHYPER
% Passos de refinamento para predecessor
% ============================================================

% ------------------------------------------------------------
% Conhecimento de fundo
% ------------------------------------------------------------

% Literais de fundo modificados sugeridos no livro.
% O uso de atom(X) restringe parent(X,Y) e predecessor(X,Y)
% para serem chamados apenas quando X estiver instanciado.

backliteral([atom(X), parent(X,Y)], [X,Y]).
backliteral([atom(X), predecessor(X,Y)], [X,Y]).

prolog_predicate(parent(X,Y)).
prolog_predicate(atom(X)).

% ------------------------------------------------------------
% Relações familiares
% ------------------------------------------------------------

parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(pat,eve).

% ------------------------------------------------------------
% Exemplos positivos
% ------------------------------------------------------------

ex(predecessor(pam,bob)).
ex(predecessor(pam,ann)).
ex(predecessor(tom,ann)).
ex(predecessor(tom,jim)).
ex(predecessor(tom,liz)).

% ------------------------------------------------------------
% Exemplos negativos
% ------------------------------------------------------------

nex(predecessor(liz,bob)).
nex(predecessor(pat,bob)).
nex(predecessor(pam,liz)).
nex(predecessor(liz,jim)).
nex(predecessor(liz,liz)).

% ------------------------------------------------------------
% Hipóteses
% ------------------------------------------------------------

start_hyp([
    [predecessor(X1,Y1)] / [X1,Y1],
    [predecessor(X2,Y2)] / [X2,Y2]
]).

% ------------------------------------------------------------
% Hipótese esperada
% ------------------------------------------------------------
%
% predecessor(A,B) :- parent(A,B).
%
% predecessor(A,B) :-
%     parent(A,C),
%     predecessor(C,B).
%
% ------------------------------------------------------------
% Análise dos refinamentos
% ------------------------------------------------------------
%
% A hipótese-alvo possui duas cláusulas.
%
% Cláusula 1:
% predecessor(A,B) :- parent(A,B).
%
% Essa cláusula é obtida adicionando um literal relevante
% de conhecimento de fundo ao primeiro corpo vazio:
%
% Passo 1:
% predecessor(A,B) :- parent(A,B).
%
% Com o conhecimento de fundo modificado, isso aparece como:
%
% predecessor(A,B) :- atom(A), parent(A,B).
%
% Cláusula 2:
% predecessor(A,B) :- parent(A,C), predecessor(C,B).
%
% Essa cláusula recursiva exige duas adições relevantes:
%
% Passo 2:
% predecessor(A,B) :- parent(A,C).
%
% Passo 3:
% predecessor(A,B) :- parent(A,C), predecessor(C,B).
%
% Com o conhecimento de fundo modificado, isso aparece
% com verificações atom:
%
% predecessor(A,B) :-
%     atom(A),
%     parent(A,C),
%     atom(C),
%     predecessor(C,B).
%
% Os literais atom(A) e atom(C) não fazem parte da definição
% conceitual de predecessor. Eles são restrições operacionais
% utilizadas para reduzir o espaço de busca e evitar hipóteses inúteis.
%
% ------------------------------------------------------------
% Resultado esperado do MINIHYPER mostrado no livro
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
% Isso corresponde à definição recursiva esperada de predecessor.
