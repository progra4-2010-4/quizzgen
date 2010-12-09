function mapcar(f, ary){
    result = [];
    for(i=0;i<ary.length; i++)
        result.push(f(ary[i]));
    return result;
}

function remove_if_not(c, ary){
    result = [];
    for(i=0; i<ary.length; i++)
       if(c(ary[i])) result.push(ary[i]);
    return result;
}

console.log(mapcar(function(x){return x*x;}, [1,2,3,4]));

console.log(remove_if_not(function(x){return (x%2) === 0}, [1,2,3,4,5,6]));

