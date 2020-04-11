package main

import (
	"fmt"
	"math"
	"net/http"
	"strconv"
)

func main() {
	http.HandleFunc("/", home)
	http.ListenAndServe(":8080", nil)
}

func home(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		http.Error(w, "404 not found.", http.StatusNotFound)
		return
	}

	switch r.Method {
	case "GET":
		http.ServeFile(w, r, "form.html")
	case "POST":
		// Call ParseForm() to parse the raw query and update r.PostForm and r.Form.
		if err := r.ParseForm(); err != nil {
			fmt.Fprintf(w, "ParseForm() err: %v", err)
			return
		}
		a, _ := strconv.ParseFloat(r.FormValue("a"), 64)
		b, _ := strconv.ParseFloat(r.FormValue("b"), 64)
		c, _ := strconv.ParseFloat(r.FormValue("c"), 64)
		fmt.Fprintf(w, "A = %.2f\n", a)
		fmt.Fprintf(w, "B = %.2f\n", b)
		fmt.Fprintf(w, "C = %.2f\n\n", c)
		x1, x2 := calculate(a, b, c)
		fmt.Fprintf(w, "Resultado:\n")
		fmt.Fprintf(w, "x1 = %.2f\n", x1)
		fmt.Fprintf(w, "x2 = %.2f\n", x2)

	default:
		fmt.Fprintf(w, "Sorry, only GET and POST methods are supported.")
	}
}

func calculate(a float64, b float64, c float64) (float64, float64) {
	sqrt := math.Sqrt(math.Pow(b, 2) - (4 * a * c))
	fmt.Println("sqrt", sqrt)
	x1 := (-1*b + sqrt) / (2 * a)
	x2 := (-1*b - sqrt) / (2 * a)
	fmt.Printf("x1 = %.2f\n", x1)
	fmt.Printf("x2 = %.2f\n", x2)
	return x1, x2
}
