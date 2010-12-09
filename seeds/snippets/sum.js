var sum = function(term, a, next, b){
    if(a > b)
        return 0;
    return term(a) + sum(term, next(a), next, b);
}

function successor(x){
    return x+1;
}

//calcula la suma de los números entre limite_inf y limite_sup
var regular_sum = function(limite_inf, limite_sup){
     return  sum(function(x){return x;}, limite_inf, successor, limite_sup);
}

//calcula la suma de cuadrados entre limite_inf y limite_sup
var square_sum = function(limite_inf, limite_sup){
    return  sum(function(x){return x*x;}, limite_inf, successor, limite_sup);
}
console.log("woot");
console.log(regular_sum(1,10));
console.log(square_sum(1,10));
