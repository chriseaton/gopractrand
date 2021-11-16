package main

import (
	"fmt"

	"github.com/chriseaton/gopractrand/rng"
)

func main() {
	tb := rng.NewSalsa()
	fmt.Println(tb)
	fmt.Println("Done")
}
