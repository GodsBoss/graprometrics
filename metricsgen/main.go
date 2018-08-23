package main

import (
	"flag"
	"fmt"
	"math/rand"
	"net/http"
	"time"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func main() {
	addr := flag.String("addr", ":80", "Address to listen on")
	flag.Parse()
	srv := &http.Server{
		Addr: *addr,
		Handler: promhttp.HandlerFor(
			createRegistry(),
			promhttp.HandlerOpts{},
		),
	}
	fmt.Printf("Listening on %s...\n", *addr)
	err := srv.ListenAndServe()
	if err != nil {
		fmt.Printf("Error: %+v\n", err)
	}
}

func createRegistry() *prometheus.Registry {
	registry := prometheus.NewRegistry()
	registry.Register(randomCounter())
	return registry
}

func randomCounter() prometheus.Counter {
	counter := prometheus.NewCounter(
		prometheus.CounterOpts{
			Name: "count",
			Help: "Counts things",
		},
	)
	go func(inc func()) {
		for {
			time.Sleep(time.Duration(rand.Intn(10)+1) * time.Millisecond)
			inc()
		}
	}(counter.Inc)
	return counter
}
