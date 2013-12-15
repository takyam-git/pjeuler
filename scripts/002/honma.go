package main

import (
    "fmt"
)

func main() {
    max := 4000000
    a, b, sum := 1, 2, 2
    r := 3*b + 2*a
    for r <= max {
        sum += r
        a = 2*b + a
        b = r
        r = 3*b + 2*a
    }
    fmt.Println(sum)
}
