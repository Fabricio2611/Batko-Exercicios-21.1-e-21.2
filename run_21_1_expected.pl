% Executable validation for Exercise 21.1
% Run with:
% swipl -q -s run_21_1_expected.pl -g main -t halt

:- initialization(main, main).

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

% Correct learned hypothesis

has_daughter_correct(X) :-
    parent(X,Y),
    female(Y).

% Over-general hypothesis that may appear if pam is incorrectly added as positive

has_daughter_too_general(X) :-
    parent(X,_).

% Over-specific hypothesis that may appear if only male positive examples remain

has_daughter_too_specific(X) :-
    parent(X,Y),
    female(Y),
    male(X).

positive_original(tom).
positive_original(bob).
positive_original(pat).

negative_original(pam).
negative_original(jim).

ok(Message) :-
    format("[OK] ~w~n", [Message]).

fail_msg(Message) :-
    format("[FALHOU] ~w~n", [Message]).

check_true(Goal, Message) :-
    ( call(Goal) -> ok(Message) ; fail_msg(Message) ).

check_false(Goal, Message) :-
    ( \+ call(Goal) -> ok(Message) ; fail_msg(Message) ).

section(Title) :-
    format("~n=== ~w ===~n", [Title]).

main :-
    section("Hipotese correta aprendida"),
    check_true(has_daughter_correct(tom), "tom deve ser positivo"),
    check_true(has_daughter_correct(bob), "bob deve ser positivo"),
    check_true(has_daughter_correct(pat), "pat deve ser positivo"),
    check_false(has_daughter_correct(pam), "pam deve ser negativo"),
    check_false(has_daughter_correct(jim), "jim deve ser negativo"),

    section("Modificacao 1: adicionar pam como positivo incorreto"),
    check_false(has_daughter_correct(pam), "a hipotese correta rejeita pam"),
    check_true(has_daughter_too_general(pam), "a hipotese geral demais aceita pam"),
    format("Conclusao: para cobrir pam, o sistema pode perder precisao e ignorar female(Y).~n"),

    section("Modificacao 2: adicionar tom como negativo contraditorio"),
    check_true(has_daughter_correct(tom), "tom e verdadeiro pela base, pois parent(tom,liz) e female(liz)"),
    format("Conclusao: marcar tom como negativo gera inconsistencia nos exemplos.~n"),

    section("Modificacao 3: remover pat dos positivos"),
    check_true(has_daughter_too_specific(tom), "hipotese especifica cobre tom"),
    check_true(has_daughter_too_specific(bob), "hipotese especifica cobre bob"),
    check_false(has_daughter_too_specific(pat), "hipotese especifica rejeita pat, mesmo ela tendo filha"),
    format("Conclusao: sem exemplos variados, o sistema pode aprender regra especifica demais.~n"),

    section("Fim"),
    halt.
