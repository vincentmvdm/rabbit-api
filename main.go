package main

import (
	"fmt"
	"log"
	"os"

	"github.com/streadway/amqp"
)

func main() {
	mqAddr := os.Getenv("RABBITADDR")
	log.Printf("Got a MQ addr: %v", mqAddr)
	if len(mqAddr) == 0 {
		fmt.Printf("Please provide a RabbitMQ port: %v", mqAddr)
		os.Exit(1)
	}
	mqURL := fmt.Sprintf("amqp://%s", mqAddr)
	log.Println(mqURL)
	conn, err := amqp.Dial(mqURL)
	if err != nil {
		log.Fatalf("Error connecting to RabbitMQ: %v", err)
	}
	channel, err := conn.Channel()
	if err != nil {
		log.Fatalf("Error creating channel: %v", err)
	}
	q, err := channel.QueueDeclare("messageQ", false, false, false, false, nil)
	log.Println(q)
}
