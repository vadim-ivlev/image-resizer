package main

import (
	"flag"
	"fmt"

	"image-resizer/pkg/img"
	"image-resizer/server"
	"strconv"
)

func main() {
	// считать параметры командной строки
	servePort, env := readCommandLineParams()
	// считать конфиг файлы
	img.ReadConfig("./configs/img.yaml", env)

	// если порт > 0, печатаем приветствие и запускаем сервер
	if servePort > 0 {
		printGreetings(servePort, env)
		server.Serve(":" + strconv.Itoa(servePort))
	}
}

// Вспомогательные функции =========================================

// readCommandLineParams возвращает параметры командной строки приложения
func readCommandLineParams() (serverPort int, env string) {
	flag.IntVar(&serverPort, "serve", 0, "Запустить приложение на порту с номером > 0 ")
	flag.StringVar(&env, "env", "prod", "Окружение. Возможные значения: dev - разработка, docker - в докере для фронтэнд разработчиков. prod - по умолчанию для продакшн.")
	flag.Parse()
	fmt.Println("\nПример запуска: ./image-resizer -serve 7777 -env=dev")
	flag.Usage()
	return
}

// printGreetings печатаем приветственное сообщение
func printGreetings(serverPort int, env string) {
	msg := `
	**********************************************
	image-resizer started. 
	Environment: %v
	GraphQL endpoint http://localhost:%v/schema
	CTRL-C to interrupt.
	**********************************************
`
	fmt.Printf(msg, env, serverPort)
}
