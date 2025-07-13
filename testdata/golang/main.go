package main

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		_, err := fmt.Fprintln(w, "Hello, world!")
		if err != nil {
			panic(err)
		}
	})

	if err := http.ListenAndServe(":8080", r); err != nil {
		panic(err)
	}
}
