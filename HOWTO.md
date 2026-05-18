# HOWTO - Exercício 21.1

## Objetivo

O exercício 21.1 pede para experimentar o MINIHYPER com modificações nos exemplos do predicado `has_daughter/1`, observando como essas alterações afetam os resultados do aprendizado.

A base original descreve relações familiares por meio dos predicados `parent/2`, `male/1` e `female/1`. A hipótese correta esperada é:

```prolog
has_daughter(X) :- parent(X,Y), female(Y).
```

Ou seja, uma pessoa possui filha se existe algum `Y` tal que `Y` é filho(a) de `X` e `Y` é do sexo feminino.

## Arquivos

- `minihyper_21_1_base.pl`: base original do exercício, com exemplos positivos, negativos, conhecimento de fundo e hipótese inicial.
- `run_21_1_expected.pl`: script para executar os testes da hipótese correta e das hipóteses alternativas discutidas.
- `RESULTS_21_1.md`: explicação dos resultados.

## Como executar

Entre na pasta do exercício:

```bash
cd exercise_21_1
```

Execute:

```bash
swipl -q -s run_21_1_expected.pl -g main -t halt
```

## Resultado esperado

A saída esperada mostra que a hipótese correta:

```prolog
has_daughter(X) :- parent(X,Y), female(Y).
```

classifica corretamente os exemplos originais:

```text
[OK] tom deve ser positivo
[OK] bob deve ser positivo
[OK] pat deve ser positivo
[OK] pam deve ser negativo
[OK] jim deve ser negativo
```

O script também demonstra o efeito das modificações. Quando se adiciona um positivo incorreto, como `has_daughter(pam)`, uma hipótese muito geral como `has_daughter(X) :- parent(X,_)` passa a aceitar Pam, mas perde precisão, pois confunde "ter filho" com "ter filha". Quando se adiciona um negativo contraditório, como `nex(has_daughter(tom))`, ocorre inconsistência, pois Tom realmente possui Liz como filha. Quando se remove o exemplo de Pat, o conjunto fica menos representativo e o sistema pode aprender uma regra específica demais, por exemplo exigindo que `X` seja homem.

## Como usar com MINIHYPER

O arquivo `minihyper_21_1_base.pl` contém a formulação base no estilo do MINIHYPER. Para testar modificações, altere os blocos de exemplos positivos e negativos:

```prolog
ex(has_daughter(tom)).
ex(has_daughter(bob)).
ex(has_daughter(pat)).

nex(has_daughter(pam)).
nex(has_daughter(jim)).
```

Depois execute o MINIHYPER normalmente no ambiente Prolog onde ele estiver carregado. A ideia do experimento é comparar a hipótese aprendida antes e depois de cada alteração.
