A diferencia de la regresión donde se predice un valor continuo, se utiliza la clasificación para predecir una categoría. Existen una gran amalgama de aplicaciones del proceso de clasificación desde medicina hasta marketing. Los modelos de clasificación incluyen desde modelos lineales como la Regresión Logística, SVM, así como otros no lineales como K-NN, Kernel SVM y Bosques Aleatorios.

En esta parte vamos a entender y aprender cómo implementar los siguientes modelos de Clasificación del Machine Learning:

- Regresión Logística 
- K-Nearest Neighbors (K-NN)
- Support Vector Machine (SVM)
- Kernel SVM
- Naive Bayes
- Árboles de Decisión para Clasificación
- Clasificación con Bosques Aleatorios




. ¿Cuales son los pros y los contras de cada modelo?

En esta clase encontrarás una chuleta que te dará todos los pros y contras de cada modelo de clasificación.

2. ¿Cómo sé qué modelo debo elegir para resolver mi problema?

Al igual que con los modelos de regresión, primero tendrás que averiguar si tu problema es o no es lineal. En la Parte 10 - Selección de Modelos hablaremos precisamente de este y otros temas. Una vez lo sepas,

Si tu problema es lineal, deberás intentar crear un modelo de Regresión Logística o bien SVM.
Si tu problema no es lineal, entonces tenemos varias técnicas donde elegir, como K-NN, Naïve Bayes, Árboles de Decisión o Random Forest.
Desde un punto de vista empresarial, entonces deberías usar:

Regresión Logística o Naïve Bayes cuando quieras ordenar tus predicciones por probabilidad. Por ejemplo, deberías usar estas técnicas si quieres crear un ranking de clientes desde el más probable al menos probable que compre un producto. Esto permite crear objetivos específicos para las campañas de marketing, por ejemplo. Y por supuesto, si tu problema de empresa es lineal, mejor utiliza la regresión logística, y si no lo es, intenta con Naïve Bayes.
SVM  cuando quieras predecir a qué segmento pertenece un cliente. Los segmentos pueden ser cualquier conjunto de características que definan a los clientes, como los que identificaremos en la Parte 4 - Clustering.
Los árboles de decisión cuando necesites tener una interpretación clara de los resultados modelizados.
Y por último, Random Forest cuando busques un mejor resultado de predicción y te preocupe menos la interpretación de los modelos.


3. ¿Cómo puedo mejorar cada uno de estos modelos ?

Existen dos tipos de parámetros en nuestros modelos:

los parámetros que el modelo aprende, como los coeficientes de la Regresión Lineal,
los hiper parámetros del algoritmo.
En este último caso, los hiper parámetros  son parámetros que el algoritmo no aprende, si no que son fijos y forman parte de las ecuaciones de los modelos. Por ejemplo, el parámetro lambda de regularización o el factor de penalización C son hiper parámetros. Hasta el momento hemos tomado los valores por defecto y no nos hemos preocupados de afinar su valor óptimo para mejorar la eficacia del modelo. Entontrar el valor óptimo es parte del Ajuste de Parámetros.