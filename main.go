package main

import(
	"fmt"
	"net/http"
)

//The root route
func homeHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to my Go Application\n")
}

//The /health route

func healthHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Status: %d\n", http.StatusOK)
}


func main() {
	//Register the routes
	http.HandleFunc("/", homeHandler)
	http.HandleFunc("/health", healthHandler)

	//Start the server
	port := "8080"
	fmt.Printf("Server is running on port %s\n", port)
	err := http.ListenAndServe(": " + port, nil)
	if err != nil {
		fmt.Printf("Error starting server %s", err)
	}
}
