package cmd

import (
	"github.com/ilyakaznacheev/cleanenv"
	"github.com/spf13/cobra"
	"log"
	"os"
)

var AppConfig *Config

type Config struct {
	Database []Database `yaml:"databases"`
}

type Database struct {
	Host     string `yaml:"host"`
	User     string `yaml:"user"`
	Password string `yaml:"password"`
	Name     string `yaml:"name"`
	Port     int    `yaml:"port"`
	File     string `yaml:"file"`
}

var rootCmd = &cobra.Command{
	Use:   "app",
	Short: "migrations application",
}

func Execute() {

	LoadConf()
	err := rootCmd.Execute()
	if err != nil {
		log.Fatal(err)
	}
}

func LoadConf() {
	path := "./config/local.yaml"

	if _, err := os.Stat(path); os.IsNotExist(err) {
		panic("config file does not exists: " + path)
	}

	var cfg Config
	if err := cleanenv.ReadConfig(path, &cfg); err != nil {
		panic(err)
	}

	AppConfig = &cfg
}

func init() {
	rootCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")

}
