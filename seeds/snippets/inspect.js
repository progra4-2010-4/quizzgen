var a = {
    test_sum: function(){
        console.log(1+1);
    },

    test_mult: function(){
                console.log(1*2);
               },
    no_test: function(){
        console.log("nooo, me ejecutaste!");
    }
};

for(p in a){
    if(!p.indexOf("test_"))
        a[p]();
}
