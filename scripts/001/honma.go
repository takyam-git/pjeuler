package main

import (
    "fmt"
)

func sum(max int, num1 int, num2 int) int {
    sum := 0
    for i := 0; i < max; i++ {
        if i%num1 == 0 || i%num2 == 0 {
            sum += i
        }
    }
    return sum
}

func main() {
    fmt.Println(sum(1000, 3, 5))
}
