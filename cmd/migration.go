package cmd

import (
	"database/sql"
	"errors"
	"fmt"
	"github.com/golang-migrate/migrate/v4"
	"github.com/golang-migrate/migrate/v4/database/postgres"
	_ "github.com/golang-migrate/migrate/v4/database/postgres"
	"github.com/spf13/cobra"

	"log"
)

var version int
var dbname string
var migrateCmd = &cobra.Command{
	Use:   "migrate",
	Short: "Manipulate database migrations",
	Long: `Manipulate with database migrations with options" +
		Usage example migrate COMMAND [args...]
	
	Commands:
  	up 		-db [DBNAME] 		Apply all up migrations to all db's or one
  	down 	-db [DBNAME] N  	Apply N down migrations
  	drop 	-db [DBNAME]		Drop everything inside database
  	force 	-db [DBNAME] -v [N] Set version V but don't run migration (ignores dirty state)
  	version -db [DBNAME] 		Print current migration version`,
	Args: cobra.ExactArgs(1),
	Run:  migrateDatabase,
}

func init() {
	migrateCmd.Flags().IntVarP(&version, "version", "v", 0, "Version of migration")
	migrateCmd.Flags().StringVarP(&dbname, "dbname", "db", "", "DB to migrate")
	rootCmd.AddCommand(migrateCmd)
}

func getDBConn(cfg Config) map[string]*sql.DB {
	dbs := map[string]*sql.DB{}
	for _, val := range cfg.Database {
		dsn := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable", val.Host, val.Port, val.User, val.Password, val.Name)

		// Open connection to the database
		db, err := sql.Open("postgres", dsn)
		if err != nil {
			panic(err)
		}

		if err := db.Ping(); err != nil {
			log.Printf("cannot connect to %s \n error: $v", dsn, err)
		}

		dbs[val.File] = db
	}
	return dbs
}

func migrateDatabase(cmd *cobra.Command, args []string) {

	dbs := getDBConn(AppConfig)

	switch args[0] {

	case "up":
		Up(dbname, dbs)
	case "down":
		Down(dbname, version, dbs)
	case "force":
		if version == 0 {
			log.Println("Please specify the version")
			return
		}
		m, err := NewMigrator(dbs[dbname], dbname)
		if err != nil {
			log.Printf("Could not create instance of migrator: %s\n", err.Error())
			return
		}
		err = m.Force(version)
		if err != nil {
			log.Printf("force migration error: %s\n", err)
			return
		}
		log.Printf("force migration finished \n")

	case "version":
		m, err := NewMigrator(dbs[dbname], dbname)
		if err != nil {
			log.Printf("Could not create instance of migrator: %s\n", err.Error())
			return
		}
		ver, _, _ := m.Version()
		log.Printf("Current db version: %d\n", ver)
		return
	}

}

func NewMigrator(conn *sql.DB, dbname string) (*migrate.Migrate, error) {
	driver, err := postgres.WithInstance(conn, &postgres.Config{})
	if err != nil {
		return nil, err
	}
	return migrate.NewWithDatabaseInstance(
		fmt.Sprintf("file://%s", dbname),
		dbname,
		driver)
}

func Up(dbname string, dbs map[string]*sql.DB) {
	if dbname != "" {
		m, err := NewMigrator(dbs[dbname], dbname)
		if err != nil {
			log.Printf("Could not create instance of migrator: %s\n", err.Error())
			return
		}
		err = m.Up()
		if err != nil && !errors.Is(err, migrate.ErrNoChange) {
			log.Printf("up migration error error: %s\n", err)
			return
		}
		log.Printf("up migration finished.\n")
		return
	}
	for key, val := range dbs {
		m, err := NewMigrator(val, key)
		if err != nil {
			log.Printf("Could not create instance of migrator: %s\n", err.Error())
			return
		}
		err = m.Up()
		if err != nil && !errors.Is(err, migrate.ErrNoChange) {
			log.Printf("up migration error error: %s\n", err)
			return
		}
		log.Printf("up migration finished.\n")
	}
}

func Down(dbname string, version int, dbs map[string]*sql.DB) {

	if dbname != "" {
		m, err := NewMigrator(dbs[dbname], dbname)
		if err != nil {
			log.Printf("Could not create instance of migrator: %s\n", err.Error())
			return
		}
		err = m.Steps(-1 * version)
		if err != nil {
			log.Printf("down migration error: %s\n", err)
			return
		}
		log.Printf("down migration finished.\n")
		return
	}
	for key, val := range dbs {
		m, err := NewMigrator(val, key)
		if err != nil {
			log.Printf("Could not create instance of migrator: %s\n", err.Error())
			return
		}
		err = m.Steps(-1 * version)
		if err != nil {
			log.Printf("down migration error: %s\n", err)
			return
		}
		log.Printf("down migration finished.\n")
	}
}
