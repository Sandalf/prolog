package main

import (
	"fmt"
)

func main() {
	var n int
	fmt.Scan(&n)

	arr := make([]int, n)
	num := 1
	j := 1
	for i := 0; j <= n; {
		if i == 0 {
			arr = make([]int, n)
			arr[i] = num
		} else {
			arr[i] = num
		}

		if i == n-1 {
			fmt.Println(arr)
			i = 0
			j++
			continue
		} else if num < n {
			num++
		} else if num == n && i != n-1 {
			num = 1
		}
		i++
	}
}
