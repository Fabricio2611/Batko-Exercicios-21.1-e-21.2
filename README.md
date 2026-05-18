# Exercícios 21.1 e 21.2 - Bratko / MINIHYPER

Este repositório contém a resolução dos exercícios 21.1 e 21.2 do livro do Bratko, envolvendo experimentos com o MINIHYPER e aprendizado indutivo em lógica.

## Arquivos

- `ex21_1.pl`: resolução e experimentos do exercício 21.1.
- `ex21_2.pl`: resolução do exercício 21.2.
- `HOWTO.md`: instruções de execução e resultados esperados.

## Exercício 21.1

O exercício 21.1 pede para experimentar o MINIHYPER com modificações nos exemplos do predicado `has_daughter` e observar como essas alterações afetam os resultados.

A hipótese esperada para os exemplos originais é:

```prolog
has_daughter(X) :- parent(X,Y), female(Y).
```

Quando exemplos positivos incorretos, negativos contraditórios ou exemplos insuficientes são adicionados/removidos, o sistema pode aprender hipóteses mais genéricas, inconsistentes ou específicas demais.

## Exercício 21.2

O exercício 21.2 pede para analisar quantos passos de refinamento são necessários para obter a hipótese-alvo a partir da hipótese inicial do exercício anterior, agora para o predicado `predecessor`.

A hipótese-alvo esperada é:

```prolog
predecessor(A,B) :- parent(A,B).

predecessor(A,B) :-
    parent(A,C),
    predecessor(C,B).
```

O exercício mostra que o espaço de busca do MINIHYPER cresce de forma rápida. Por isso, o livro sugere restringir os literais de fundo com `atom(X)`, fazendo com que `parent(X,Y)` e `predecessor(X,Y)` só sejam chamados quando o primeiro argumento estiver instanciado.

## Execução rápida

No terminal:

```bash
swipl
```

Depois:

```prolog
['ex21_1.pl'].
```

ou:

```prolog
['ex21_2.pl'].
```

Mais detalhes estão no arquivo `HOWTO.md`.
