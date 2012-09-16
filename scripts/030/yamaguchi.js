//#驚くべきことに, 各桁を4乗した数の和が元の数と一致する数は3つしかない.
//#
//#    1634 = 14 + 64 + 34 + 44
//#8208 = 84 + 24 + 04 + 84
//#9474 = 94 + 44 + 74 + 44
//#ただし, 1=14は含まないものとする. この数たちの和は 1634 + 8208 + 9474 = 19316 である.
//#
//#    各桁を5乗した数の和が元の数と一致するような数の総和を求めよ.
var limit = Math.pow(9,5) * 6;
var total = 0
for(var num = 2; num <= limit; ++num){
    var x = num.toString().split('');
    sum = 0
    for(var i in x){
        sum += Math.pow(x[i],5);
    }
    if(sum===num) total += num
}
console.log(total)