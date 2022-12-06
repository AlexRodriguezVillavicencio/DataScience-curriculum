## **¿Reglas de asociación?**

El aprendizaje de reglas de asociación es un método de aprendizaje automático basado en reglas para descubrir relaciones interesantes entre variables en grandes bases de datos. Su objetivo es identificar reglas sólidas descubiertas en bases de datos utilizando algunas medidas de interés.

Basándose en el concepto de reglas estrictas, **Rakesh Agrawal, Tomasz Imieliński y Arun Swam** introdujeron reglas de asociación para descubrir regularidades entre productos en datos de transacciones a gran escala registrados por sistemas de punto de venta (POS) en los supermercados. Por ejemplo, la regla **{cebollas, patatas} -> {hamburguesa}** que se encuentra en los datos de ventas de un supermercado indicaría que si un cliente compra cebollas y patatas juntas, es probable que también compre carne de hamburguesa. Dicha información se puede utilizar como base para decisiones sobre actividades de marketing como, por ejemplo, precios promocionales o colocación de productos.

Además del ejemplo anterior del análisis de la canasta de mercado, las reglas de asociación se emplean hoy en muchas áreas de aplicación, incluida la minería del uso de la web, la detección de intrusiones, la producción continua y la bioinformática. A diferencia de la minería de secuencias, el aprendizaje de reglas de asociación generalmente no considera el orden de los elementos dentro de una transacción o entre transacciones. [Wikipedia]


**Reglas de asociación**

Si bien estamos interesados en extraer conjuntos frecuentes de elementos, esta información a menudo se presenta como una colección de reglas **si-entonces**, llamadas **reglas de asociación**.

La forma de una regla de asociación es $\{X\rightarrow Y\}$, donde $\{X\}$ es un conjunto de elementos y $\{Y\}$ es un elemento. La implicación de esta regla de asociación es que si todos los elementos de $\{X\}$ aparecen en alguna canasta, entonces $\{Y\}$ es “probable” que también aparezcan en esa canasta.

*	$\{X\}$ también se llama antecedente o lado izquierdo (LHS) y

* $\{Y\}$ se llama consecuente o lado derecho (RHS) .

Un ejemplo de regla de asociación para productos de Apple podría ser $\{Apple iPad, Apple,iPad, Cover\}\rightarrow \{Apple, Pencil\}$, lo que significa que si $\{X\}$ se compran la funda para iPad y iPad de Apple , es probable que los clientes también compren el lápiz de Apple $\{Y\}$. Observe que el símbolo de implicación lógica 
$\rightarrow$ no indica una relación causal entre $\{X\}$ e $\{Y\}$. Es simplemente una estimación de la probabilidad condicional de $\{Y\}$ dado $\{X\}$.


Ahora imagine una tienda de comestibles con decenas de miles de productos diferentes. No querríamos calcular todas las asociaciones entre todas las combinaciones posibles de productos. En su lugar, querríamos seleccionar solo reglas potencialmente "relevantes" del conjunto de todas las reglas posibles. Por eso, utilizamos las medidas de 

* **Soport (Soporte,apoyo)**

* **Confidence (Confianza)**

* **Lift (Levantamiento)**

para reducir el número de relaciones que necesitamos analizar:
 
* **El soporte:** es una indicación de la frecuencia con la que aparece un conjunto de artículos en las cestas.

*	**La confianza:** es una indicación de la frecuencia con la que se ha encontrado que la regla de apoyo es cierta.

*	**El levantamiento:** es una medida de asociación que utiliza tanto apoyo como confianza.


Si buscamos reglas de asociación $\{X\rightarrow Y\}$ que se apliquen a una fracción razonable de las canastas, entonces el soporte de X debe ser razonablemente alto. En la práctica, como en el caso de la comercialización en tiendas físicas, "razonablemente alto" suele ser entre el 1% y el 10% de las canastas. También queremos que la confianza de la regla sea razonablemente alta, quizás el 50%, o de lo contrario la regla tiene poco efecto práctico. (Leskovec, Rajaraman y Ullman, 2020)

Además, se debe suponer que no hay demasiados conjuntos de elementos frecuentes y, por lo tanto, no hay demasiados candidatos para las reglas de asociación de alto apoyo y alta confianza. La razón de esto es que si les damos a las empresas muchas reglas de asociación que cumplen con nuestros umbrales de apoyo y confianza, ni siquiera pueden leerlas, y mucho menos actuar en consecuencia. Por lo tanto, es normal ajustar los umbrales de soporte y confianza para que no obtengamos demasiados conjuntos de elementos frecuentes. (Leskovec, Rajaraman y Ullman, 2020).



**2 Medidas de asociación**

#### **2.1 Soporte**

El soporte métrico nos dice qué tan popular es un conjunto de elementos, medido por la proporción de transacciones en las que aparece el conjunto de elementos.

Según nuestros datos, los soporte son de.
El soporte **{manzana}** es 4 de 8, o 50%. 
El soporte de **{manzana, cerveza, arroz}** es 2 de 8, o 25%.
El soporte **{leche, cerveza}** es 3 de 8, o 37.5%.

$$support(manzana)=\frac{4}{8} $$

O en general, para un conjunto de elementos $X$:

$$support(X)=\frac{Frecuencia(X)}{n} $$

con n = número de todas las transacciones (cestas).

Por lo general, se utiliza un umbral de soporte específico para reducir la cantidad de conjuntos de elementos que necesitamos analizar. Al comienzo del análisis, podríamos establecer nuestro umbral de soporte al 10%.


**2.2 Confianza**

La confianza nos dice la probabilidad de que se compre un artículo $Y$ dado que se compra el artículo $X$, expresado como $\{X\rightarrow Y\}$. Se mide por la proporción de transacciones con el artículo $X$, en el que también aparece el artículo $Y$. La confianza de una regla se define como:

$$\ support(X\rightarrow Y)=\frac{support(X\cup Y)}{support(X)} $$

Por tanto, la confianza se puede interpretar como una estimación de la probabilidad $P(Y/X)$. En otras palabras, esta es la probabilidad de encontrar el RHS (Y) de la regla en transacciones con la condición de que estas transacciones también contengan el LHS (X) (Hornik, Grün y Hahsler, 2005). La confianza está dirigida y por lo tanto suele dar valores diferentes a las reglas $X\rightarrow Y$ y $Y\rightarrow X$.


Tenga en cuenta que $support(X\cup Y)$ significa el apoyo de la unión de los elementos en $X$ e $Y$. Dado que generalmente declaramos probabilidades de eventos y no conjuntos de elementos, podemos reescribir $support(X\cup Y)$ como la probabilidad $P(E_X\cap E_Y )$, dónde $E_X$ y $E_Y$, son los eventos en los que una transacción contiene el conjunto de elementos $X$ e $Y$, respectivamente.

En nuestro ejemplo, la confianza en que se compra cerveza dado que se compra manzana $(\{manzana\rightarrow cerveza\})$   es 3 de 4, o 75%.  Esto significa que la  probabilidad condicional $P(cerveza | manzana) = 75%$. manazan es el antecedente o el lado izquierdo (LHS) y la cerveza es el consecuente o el lado derecho (RHS).

$$confidene(apple->beer)=\frac{support(apple\cup beer)}{support(apple)} $$

$$=\frac{(2/8)}{(4/8)} =0.5$$


Tenga en cuenta que la medida de confianza podría tergiversar la importancia de una asociación. Esto se debe a que solo tiene en cuenta lo popular que es el artículo $X$ (en nuestro caso, la manzana) pero no $Y$ (en nuestro caso, la cerveza).

Si la cerveza también es muy popular en general, habrá una mayor probabilidad de que una transacción que contenga manzana también contenga cerveza, lo que inflará la medida de confianza. Para tener en cuenta la popularidad base de ambos elementos, utilizamos una tercera medida denominada incremento.


**Elevación o lift**

**Lift** nos dice qué tan probable es que se compre el artículo $Y$ cuando se compra el artículo $X$, mientras controla qué tan populares son los artículos $Y$ y $X$. Mide cuántas veces más $X$ e $Y$ ocurren juntos de lo esperado si fueran estadísticamente independientes.

En nuestro ejemplo, la elevación se calcula como:

$$Lift(manzana→cerveza)=\frac {support(manzana\cup  cerveza)} {(support(manzana)support(cerveza)} $$

$$=\frac{(2/8)}{(4/8)(5/8)}=0.8$$


Un valor de elevación de:

*	**elevación = 1:** implica que no hay asociación entre elementos.

*	**elevación> 1:** mayor que 1 significa que es probable que se compre el artículo $Y$ si se compra el artículo $X$, es decir,  $P(Y/X)$

*	**elevación <1:** menos de 1 significa que es poco probable que se compre el artículo $Y$ si se compra el artículo $X$.

La elevación de $\{manzana\rightarrow cerveza\}$ es 0.8, lo que implica que es poco probable que se compre el artículo $Y$ si se compra el artículo $X$


- **Conviction:** La razón de la frecuencia esperada en la que $X$ ocurre sin $Y $(es decir, la frecuencia con la que la regla hace una predicción incorrecta) si $X$ e $Y$ fueran independientes dividida por la frecuencia observada de predicciones incorrectas.

Conviction compara la probabilidad de que $X$ aparezca sin $Y$ si fueran dependientes con la frecuencia real de aparición de $X$ sin $Y4$. En ese sentido, es similar a lift (ver sección sobre lift), sin embargo, contrasta levantarlo. es una medida dirigida. Además, la convicción es monótona en la confianza y la elevación.

- **Leverage:** Conviction compara la probabilidad de que $X$ aparece sin $Y$ si fueron dependientes con la frecuencia real de aparición de $X$ sin $Y$. En sentido, es similar a lift (ver sección sobre lift en esta página), sin embargo, contrasta levantarlo. es una medida dirigida. Además, la convicción es monótona en la confianza y la elevación.


Lo racional en un entorno de ventas es averiguar cuántas unidades más (artículos $X$ e $Y$ juntos) se venden de lo esperado de las ventas independientes. Usando min. los umbrales de apalancamiento incorporan al mismo tiempo una restricción de frecuencia implícita. Por ejemplo, para establecer un min. umbrales de apalancamiento al 0,01% (corresponde a 10 casos en un conjunto de datos con 100.000 transacciones), primero se puede utilizar un algoritmo para encontrar todos los conjuntos de elementos con mín. soporte de 0.01% y luego filtrar los conjuntos de elementos encontrados usando la restricción de apalancamiento. Debido a esta propiedad, el apalancamiento también puede sufrir el problema de los artículos raros. [Michael Hahsler]

***************************************
Introducción teórica al algoritmo Apriori:

https://jdvelasq.github.io/courses/notebooks/statistical_thinking/1-03-induccion-de-items-apriori.html?highlight=apriori