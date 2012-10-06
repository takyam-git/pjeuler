// -*- javascript -*-

var primeSum = function(nth) {
    if (nth <= 5) throw new RangeError();

    var sieveSize = Math.floor(nth * Math.log(nth) + nth * Math.log(Math.log(nth)) / 2);
    var sieve = new Buffer(sieveSize);  // sieve[i] is for 2*i+1
    sieve.fill(0);
    var count = 1;
    var sum = 2;
    var p;
    var q = 1;
    while (true) {
        while(sieve[q])
            q++;
        p = 2 * q + 1;
        //console.log(p);
        count++;
        sum += p;
        if (count >= nth)
            return sum;
        for (var i = q; i < sieveSize; i += p)
            sieve[i] = 1;
    }
}

//var nth = process.argv.length > 2 ? Number(process.argv[2]) : 10000;
var nth = 10000;
var result = primeSum(nth);
console.log(result);


