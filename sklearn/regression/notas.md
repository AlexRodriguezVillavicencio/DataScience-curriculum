# ¿Cómo sé que modelo elegir para resolver mi problema?

Primero tendrás que averiguar si tu problema es o no es lineal:
- Si tu problema es lineal, deberás intentar crear un modelo de Regresión Lineal Simple si solo tienes una variable independiente o un modelo de Regresión Lineal Múltiple en el caso de tener varias.

- Si tu problema no es lineal, entonces tenemos varias técnicas donde elegir, como la Regresión Polinómica, SVR, Árboles de Decisión y Bosques Aleatorios. El método en este caso consiste en utilizar una técnica muy útil para evaluar modelos llamada k-Fold Cross Validation, y elegir el modelo que demuestre mejores resultados.

# Si ya tengo mi modelo, ¿Cómo puedo mejorarlo?

Ajustando los valores de los parámetros. Como habrás comprobado, existen dos tipos de parámetros en nuestros modelos:

- Los parámetros que el modelo aprende, como los coeficientes de la Regresión Lineal,
- Los hiper parámetros del algoritmo.

En este último caso, los hiper parámetros  son parámetros que el algoritmo no aprende, si no que son fijos y forman parte de las ecuaciones de los modelos. Por ejemplo, el parámetro lambda de regularización o el factor de penalización C son hiper parámetros. Encontrar el valor óptimo es parte del Ajuste de Parámetros.