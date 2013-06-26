var a       = 600851475143;
var divisor = 2;
var divided = a;
while ( divisor <= divided ) {
  if ( divided % divisor == 0) {
    divided /= divisor;
    continue;
  }
  divisor += 1;
}
console.log(divisor);
