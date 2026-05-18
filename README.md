# Bratko - Exercícios 21.1 e 21.2

Repositório para entrega dos exercícios do Capítulo 21 do livro do Bratko.

## Conteúdo atual

- `exercise_21_1/`: resolução do exercício 21.1, com arquivos Prolog para teste do predicado `has_daughter/1`.
- `exercise_21_1/HOWTO.md`: passos de execução e resultados esperados.
- `exercise_21_1/run_21_1_expected.pl`: script executável em SWI-Prolog para validar as hipóteses discutidas.
- `exercise_21_1/minihyper_21_1_base.pl`: base no formato usado pelo MINIHYPER.

O exercício 21.2 será adicionado depois.

## Requisitos

Para executar os testes automáticos da resolução:

```bash
sudo apt install swi-prolog
```

No Windows, instale pelo site oficial do SWI-Prolog e execute os comandos no terminal dentro da pasta do repositório.

## Execução rápida

```bash
cd exercise_21_1
swipl -q -s run_21_1_expected.pl -g main -t halt
```
