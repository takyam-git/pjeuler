package main

import (
    "fmt"
)

func factorization(num int) int {
    max := 0
    var a = []int{2, 3, 5}
    for _, prime := range a {
        if num%prime == 0 {
            max = prime
            num /= prime
        }
    }
    n := 0
    for true {
        n++
        prime := 6*n + 1
        if prime*prime > num {
            break
        }
        if num%prime == 0 {
            max = prime
            num /= prime
        }
        prime += 4
        if prime*prime > num {
            break
        }
        if num%prime == 0 {
            max = prime
            num /= prime
        }
    }
    max = num
    return max
}

func main() {
    fmt.Println(factorization(600851475143))
}
