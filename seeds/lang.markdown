
En javascript, podemos aprovechar que las funciones son de orden superior
para escribir código elegante. Por ejemplo, si estuviéramos haciendo un
programa matemático y quisiéramos abstraer el concepto de [sumatoria](http://es.wikipedia.org/wiki/Sumatoria),
podríamos definir una función como la siguiente:

    var sum = function(term, a, next, b){
        if(a > b)
            return 0;
        return term(a) + sum(term, next(a), next, b);
    };

Así, para la sumatoria de números en un rango, escribiríamos:

    function successor(x){
       return x+1;
    }

    //calcula la suma de los números entre limite_inf y limite_sup
    var regular_sum = function(limite_inf, limite_sup){
        return  sum(function(x){return x;}, limite_inf, successor, limite_sup);
    }

Y para la sumatoria de _cuadrados_ :

    var square_sum = function(limite_inf, limite_sup){
        return  sum(function(x){return x*x;}, limite_inf, successor, limite_sup);
    }

Si quisiéramos definir de forma similar la 
[serie de Leibniz](http://es.wikipedia.org/wiki/Serie_de_Leibniz) para calcular pi, 
¿qué código escribiríamos?

---

En javascript, si uno define un objeto con la JSON, puede acceder a sus propiedades mediante el operador punto
(`objeto.propiedad`) y el operador corchetes, tratando a la propiedad como un `string`: `objeto['propiedad']`.
Además, para iterar _sobre las propiedades_ de un objeto, podemos usar la sintaxis especial 
`for(propiedad in objeto)`, con el detalle que en el ámbito de ese `for` la `propiedad` es sólo un string, no la propiedad
en sí. Con este conocimiento, escriba una función que reciba objetos como el siguiente:

    var a = {
        test_sum: function(){
            console.log(1+1);
        },

        test_mult: function(){
                    console.log(1*2);
                   },
        no_test: function(){
            console.log("nooo, me ejecutaste!");
        },

        algo: function(){console.log("algo");}
    };

y ejecute los métodos cuyo nombre _empieza_ con `test_`

---

En common lisp existe una función bien popular llamada `mapcar`, que recibe una función y un arreglo y 
devuelve un **nuevo** arreglo con la función aplicada a cada elemento. Así, por ejemplo, si esa función
existiera en javascript, en el siguiente código
    
    var square= function(x){return x*x;};
    b = mapcar(square, [1,2,3,4]);

La variable `b` valdría `[1,4,9,16]`.

También existe la función `remove_if_not` que recibe una función condicional y un arreglo y devuelve un
nuevo arreglo con sólo los elementos para los cuales *la función condicional devuelve `true`*.

Por ejemplo, en el siguiente código:

    var even= function(x){ (x%2) === 0;};
    c = remove_if_not(even, [1,2,3,4,5,6]);

La variable `c` valdría `[2,4,6]`

Implemente las funciones `mapcar` y `remove-if-not` en javascript.
Una pista: los arreglos en javascript, igual que en ruby
no tienen tamaño fijo y cuentan con métodos como `push` para agregarles elementos.
