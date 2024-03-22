package main

import (
	"fmt"
	"github.com/oreans/virtualizersdk"
	"io/ioutil"
	"net/http"
)

func main() {
	string1 := "This is string1"
	virtualizersdk.Macro(virtualizersdk.TIGER_BLACK_START)
	string2 := "This is string2"
	string3 := string1 + string2
	fmt.Println(string3)
	resp, err := http.Get("http://google.com")
	if err != nil {
		fmt.Println(err)
	} else {
		defer resp.Body.Close()
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			fmt.Println(err)
		}
		fmt.Println(string(body))
	}
	virtualizersdk.Macro(virtualizersdk.TIGER_BLACK_END)
	string4 := string2 + "...and string 4"
	fmt.Println(string4)
}
