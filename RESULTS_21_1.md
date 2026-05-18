# Resultados - Exercício 21.1

Na configuração original, o MINIHYPER deve aprender uma hipótese equivalente a:

```prolog
has_daughter(X) :- parent(X,Y), female(Y).
```

Essa regra explica todos os exemplos positivos, pois Tom possui Liz como filha, Bob possui Ann e Pat como filhas, e Pat possui Eve como filha. Ao mesmo tempo, rejeita corretamente os exemplos negativos, pois Pam possui apenas Bob como filho conhecido, e Jim não possui filhos registrados na base.

Ao adicionar um exemplo positivo incorreto, como `ex(has_daughter(pam)).`, o sistema passa a receber uma informação que não é compatível com os fatos disponíveis. Para tentar cobrir esse novo positivo, o aprendizado pode gerar uma hipótese mais geral, como `has_daughter(X) :- parent(X,Y).`. Essa hipótese cobre Pam, mas fica semanticamente errada, porque passa a considerar que qualquer pessoa com filhos possui uma filha, ignorando o predicado `female/1`.

Ao adicionar um exemplo negativo contraditório, como `nex(has_daughter(tom)).`, o conjunto se torna inconsistente. Tom possui Liz como filha, e Liz está marcada como `female(liz)`. Assim, não há uma hipótese simples e correta que ao mesmo tempo aceite os exemplos positivos originais e rejeite Tom.

Ao remover exemplos positivos importantes, como `ex(has_daughter(pat)).`, o conjunto fica menos representativo. Como os exemplos positivos restantes são Tom e Bob, ambos homens, o sistema pode aprender uma hipótese específica demais, como exigir também `male(X)`. Essa hipótese funciona para os exemplos restantes, mas não representa corretamente o conceito geral de possuir filha, pois mulheres também podem ter filhas.

Portanto, o experimento mostra que os exemplos positivos e negativos influenciam diretamente a hipótese aprendida. Exemplos incorretos podem gerar regras erradas, exemplos contraditórios podem impedir o aprendizado consistente, e exemplos pouco variados podem levar a hipóteses excessivamente específicas.
