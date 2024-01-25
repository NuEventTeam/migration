package cmd

import (
	"github.com/spf13/cobra"
	"log"
)

var AppConfig Config

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
	Short: "billing application",
}

func Execute() {
	//TODO load config

	err := rootCmd.Execute()
	if err != nil {
		log.Fatal(err)
	}
}

func init() {
	rootCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
