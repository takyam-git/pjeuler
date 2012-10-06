inversePrimeNumberTheorem = (nth)-> 
  Math.floor nth*(Math.log nth) + nth/(Math.log nth)*(Math.log nth)*1.5

sieveOfEratosthenesWithWheelFactorization = (x)->
  flags = new Buffer Math.floor x/2
  flags.fill 1
  flags[0] = 0
  primes = [2]
  for i in [0..x]
    if flags[i] is 1
      primes[primes.length] = p = 2*i + 1
      for j in [i..x] by p
        flags[j] = 0
  primes

sum = 0
sum += i for i in (sieveOfEratosthenesWithWheelFactorization inversePrimeNumberTheorem 10000).slice(0,10000)
console.log sum

