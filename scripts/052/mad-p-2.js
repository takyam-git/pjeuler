function digits(n) {
    var r = 0;
    while (n > 0) {
        r |= 1 << (n % 10);
        n = Math.floor(n / 10);
    }
    return r;
}

for (var n = 12; n <= 987654321; n++) {
    var d = digits(n);
    for (var mul = 2; mul <= 6; mul++) {
        var d1 = digits(mul * n);
        if (d != d1) break;
    }
    if (mul > 6) break;
}
console.log(n);
