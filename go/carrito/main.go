package main

import (
	"database/sql"
	"log"
	"net/http"
	"strconv"
	"text/template"

	_ "github.com/go-sql-driver/mysql"
)

type Product struct {
	Id    int
	Name  string
	Price float32
}

type ShoppingCartItem struct {
	Id      int
	Product Product
	Amount  int
	Total   float32
}

func dbConn() (db *sql.DB) {
	dbDriver := "mysql"
	dbUser := "root"
	dbPass := "root"
	dbPort := "tcp(localhost:8889)"
	dbName := "supermercado"
	db, err := sql.Open(dbDriver, dbUser+":"+dbPass+"@"+dbPort+"/"+dbName)
	if err != nil {
		panic(err.Error())
	}
	return db
}

var tmpl = template.Must(template.ParseGlob("form/*"))

func Index(w http.ResponseWriter, r *http.Request) {
	db := dbConn()
	selDB, err := db.Query("SELECT * FROM products ORDER BY id ASC")
	print(selDB)
	if err != nil {
		panic(err.Error())
	}
	prod := Product{}
	res := []Product{}
	for selDB.Next() {
		var id int
		var name string
		var price float32
		err = selDB.Scan(&id, &name, &price)
		if err != nil {
			panic(err.Error())
		}
		prod.Id = id
		prod.Name = name
		prod.Price = price
		res = append(res, prod)
	}
	tmpl.ExecuteTemplate(w, "Index", res)
	defer db.Close()
}

func Insert(w http.ResponseWriter, r *http.Request) {
	db := dbConn()
	if r.Method == "POST" {
		productID := r.FormValue("uid")

		selDB, err := db.Query("SELECT * FROM cart WHERE productId=?", productID)

		if err != nil {
			panic(err.Error())
		}

		count := 0

		for selDB.Next() {
			count++
		}

		log.Println("Count: " + strconv.Itoa(count))

		strQuery := ""
		if count == 0 {
			strQuery = "INSERT INTO cart(productID, amount) VALUES(?,?)"
			insForm, err := db.Prepare(strQuery)

			if err != nil {
				panic(err.Error())
			}

			insForm.Exec(productID, 1)
		} else {
			strQuery = "UPDATE cart SET amount = amount + 1 WHERE productId = ?"
			insForm, err := db.Prepare(strQuery)

			if err != nil {
				panic(err.Error())
			}

			insForm.Exec(productID)
		}

		log.Println("INSERT: ProductId: " + productID)
	}
	defer db.Close()
	http.Redirect(w, r, "/", 301)
}

func Update(w http.ResponseWriter, r *http.Request) {
	db := dbConn()
	if r.Method == "POST" {
		amount := r.FormValue("amount")
		id := r.FormValue("uid")
		insForm, err := db.Prepare("UPDATE cart SET amount = ? WHERE id = ?")
		if err != nil {
			panic(err.Error())
		}
		insForm.Exec(amount, id)
		log.Println("UPDATE: CartId: " + id)
	}
	defer db.Close()
	http.Redirect(w, r, "/carrito", 301)
}

func Delete(w http.ResponseWriter, r *http.Request) {
	db := dbConn()
	emp := r.URL.Query().Get("id")
	delForm, err := db.Prepare("DELETE FROM cart WHERE id=?")
	if err != nil {
		panic(err.Error())
	}
	delForm.Exec(emp)
	log.Println("DELETE")
	defer db.Close()
	http.Redirect(w, r, "/carrito", 301)
}

func Carrito(w http.ResponseWriter, r *http.Request) {
	db := dbConn()
	selDB, err := db.Query("SELECT cart.id, cart.amount, products.id as productID, products.name, products.price FROM cart INNER JOIN products ON cart.productId = products.id")

	if err != nil {
		panic(err.Error())
	}

	prod := Product{}
	shoppingCartItem := ShoppingCartItem{}
	res := []ShoppingCartItem{}

	for selDB.Next() {
		var id int
		var amount int
		var productID int
		var name string
		var price float32
		err = selDB.Scan(&id, &amount, &productID, &name, &price)

		if err != nil {
			panic(err.Error())
		}

		prod.Id = id
		prod.Name = name
		prod.Price = price

		shoppingCartItem.Id = id
		shoppingCartItem.Amount = amount
		shoppingCartItem.Product = prod
		shoppingCartItem.Total = float32(amount) * price

		res = append(res, shoppingCartItem)
	}

	tmpl.ExecuteTemplate(w, "Carrito", res)
	defer db.Close()
}

func Seeder() {
	db := dbConn()

	_, err := db.Query(`
		INSERT INTO cart(name, price) VALUES('agua',10);
	`)

	if err != nil {
		panic(err.Error())
	}

	defer db.Close()
}

func main() {
	log.Println("Server started on: http://localhost:8080")

	http.HandleFunc("/", Index)
	http.HandleFunc("/insert", Insert)
	http.HandleFunc("/update", Update)
	http.HandleFunc("/delete", Delete)
	http.HandleFunc("/carrito", Carrito)
	http.ListenAndServe(":8080", nil)
}
