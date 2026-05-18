# HOWTO - Execução dos Exercícios 21.1 e 21.2

## 1. Requisitos

É necessário ter o SWI-Prolog instalado.

Site oficial:

```text
https://www.swi-prolog.org/
```

## 2. Clonar o repositório

Depois de enviar os arquivos para o GitHub, o repositório poderá ser clonado com:

```bash
git clone https://github.com/SEU_USUARIO/NOME_DO_REPOSITORIO.git
cd NOME_DO_REPOSITORIO
```

## 3. Executar o exercício 21.1

Abra o SWI-Prolog:

```bash
swipl
```

Carregue o arquivo:

```prolog
['ex21_1.pl'].
```

O arquivo contém os fatos de parentesco, exemplos positivos, exemplos negativos e comentários explicando os efeitos das modificações no predicado `has_daughter`.

Resultado esperado conceitualmente:

```prolog
has_daughter(X) :- parent(X,Y), female(Y).
```

Essa regra significa que uma pessoa possui filha se existir alguém `Y` tal que `Y` é filho ou filha de `X` e `Y` é do sexo feminino.

## 4. Executar o exercício 21.2

No SWI-Prolog:

```prolog
['ex21_2.pl'].
```

O arquivo contém a base de conhecimento para o predicado `predecessor`, a hipótese inicial e a hipótese-alvo esperada.

Resultado esperado conceitualmente:

```prolog
predecessor(A,B) :- parent(A,B).

predecessor(A,B) :-
    parent(A,C),
    predecessor(C,B).
```

Essa definição indica que `A` é predecessor de `B` se `A` é pai/mãe direto de `B`, ou se `A` é pai/mãe de alguém `C` que também é predecessor de `B`.

## 5. Resultado da análise

O exercício 21.1 demonstra que a qualidade dos exemplos positivos e negativos influencia diretamente a hipótese aprendida. Exemplos errados podem gerar hipóteses incorretas, enquanto exemplos variados melhoram a generalização.

O exercício 21.2 mostra que a hipótese recursiva de `predecessor` exige refinamentos sucessivos, adicionando literais como `parent(A,B)`, `parent(A,C)` e `predecessor(C,B)`. A restrição com `atom(X)` reduz o espaço de busca e evita que o MINIHYPER explore hipóteses inúteis.

nex(has_daughter(jim)).
```

Depois execute o MINIHYPER normalmente no ambiente Prolog onde ele estiver carregado. A ideia do experimento é comparar a hipótese aprendida antes e depois de cada alteração.
