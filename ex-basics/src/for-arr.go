package main

import "fmt"

func main() {
        var arr [10]int       // Create an array with 10 elements
	for i := 0; i < 10; i++ {
                arr[i] = i    // Fill it one by one
	}
        fmt.Printf("%v", arr) // With \%v Go prints the type
}
