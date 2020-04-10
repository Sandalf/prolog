package main

import (
	"fmt"
	"math"
	"sync"
	"time"
)

func main() {
	var wg sync.WaitGroup
	wg.Add(2)

	go func() {
		range1()
		wg.Done()
	}()

	go func() {
		range2()
		wg.Done()
	}()

	wg.Wait()
}

func range1() {
	for i := 1; i <= 500000; i++ {
		if IsPrime(i) {
			fmt.Println(i, "es primo")
			time.Sleep(time.Millisecond * 500)
		}
	}
}

func range2() {
	for i := 500001; i <= 1000000; i++ {
		if IsPrime(i) {
			fmt.Println(i, "es primo")
			time.Sleep(time.Millisecond * 500)
		}
	}
}

func IsPrime(value int) bool {
	for i := 2; i <= int(math.Floor(float64(value)/2)); i++ {
		if value%i == 0 {
			return false
		}
	}
	return value > 1
}
