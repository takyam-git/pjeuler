String.prototype.reverse = function (){
    var t = "";
    for(var i = this.length; i > 0; i--) t = t + this.substring(i - 1, i);
    return t;
}
var max = 1000000;
var sum = 0;
var i = 1;
var str_num = null;
for(; i <= max; ++i){
    str_num = i.toString();
    if(str_num !== str_num.reverse()){
        continue;
    }

    bin_num = i.toString(2);
    if(bin_num === bin_num.reverse()){
        sum += i;
    }
}
console.log(sum);