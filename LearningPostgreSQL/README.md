# POSTGRES Learning

- [POSTGRES Learning](#postgres-learning)
  - [Installing postgres](#installing-postgres)
    - [On Linux](#on-linux)
  - [Handing Postgres Service](#handing-postgres-service)
    - [Enabling](#enabling)
    - [Starting](#starting)
    - [Stopping](#stopping)
    - [Checking status](#checking-status)
    - [Checking instances](#checking-instances)
  - [Running Postgres cli](#running-postgres-cli)
    - [Options list](#options-list)
  - [Postgres specific Syntax](#postgres-specific-syntax)
    - [Listing databases](#listing-databases)
    - [Using a database](#using-a-database)
    - [Listing Users/Roles](#listing-usersroles)
    - [Listing tables](#listing-tables)
  - [Postgres SQL Syntax](#postgres-sql-syntax)
    - [Create database](#create-database)
    - [Creating role](#creating-role)
    - [Granting ALL PRIVILEGES](#granting-all-privileges)
    - [Revoking PRIVILEGES](#revoking-privileges)
    - [Update Owner](#update-owner)
    - [Change password](#change-password)
  - [Concepts](#concepts)
    - [Data anonymization](#data-anonymization)
  - [References](#references)

## Installing postgres

### On Linux

**Installation:**

```sh
sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo tee /etc/apt/trusted.gpg.d/pgdg.asc &>/dev/null
sudo apt update
sudo apt upgrade -y
sudo apt install postgresql postgresql-client -y
```

**Change config file:**

```sh
sudo subl /etc/postgresql/15/main/postgresql.conf
```

> to change port search `port` under `Connection Settings` and update:

```sh
#------------------------------------------------------------------------------
# CONNECTIONS AND AUTHENTICATION
#------------------------------------------------------------------------------

# - Connection Settings -

#listen_addresses = 'localhost'  # what IP address(es) to listen on;
         # comma-separated list of addresses;
         # defaults to 'localhost'; use '*' for all
         # (change requires restart)
port = 5432       # (change requires restart)
```

**Setup Connections and Authentications:**

find postgres config file

```sh
sudo nano /etc/postgresql/13/main/postgresql.conf
```

Within the postgres config file update `listen_addresses` from `locahost` to `*` as bellow

```mono
#------------------------------------------------------------------------------
# CONNECTIONS AND AUTHENTICATION
#------------------------------------------------------------------------------
# - Connection Settings -

#listen_addresses = '*' 
```

**Remove older version:**

```sh
sudo apt-get --purge remove postgresql-14
```

## Handing Postgres Service

### Enabling

```sh
sudo pg_ctlcluster 15 main start
sudo systemctl enable postgresql.service
```

### Starting

```sh
sudo systemctl start postgresql.service
```

### Stopping

```sh
sudo systemctl stop postgresql.service
```

### Checking status

```sh
sudo systemctl status postgresql
```

### Checking instances

lists PostgreSQL clusters, showing their version, port, status, data directory, and log file for managing multiple instances.

```sh
pg_lsclusters
```

---

## Running Postgres cli

```sh
sudo -u postgres psql
```

> `-u` is a option for USERNAME

### Options list

Start psql with options, database name, and username

 ```mono
psql [OPTION]... [DBNAME [USERNAME]]
 ```

**General Options:**

| Option                            | Description                                                |
| :-------------------------------- | :--------------------------------------------------------- |
| -c, --command=COMMAND             | Run a single command (SQL or internal) and exit            |
| -d, --dbname=DBNAME               | Database name to connect to (default: "root")              |
| -f, --file=FILENAME               | Execute commands from file, then exit                      |
| -l, --list                        | List available databases, then exit                        |
| -v, --set=, --variable=NAME=VALUE | Set psql variable NAME to VALUE (e.g., -v ON_ERROR_STOP=1) |
| -V, --version                     | Output version information, then exit                      |
| -X, --no-psqlrc                   | Do not read startup file (~/.psqlrc)                       |
| -1, --single-transaction          | Execute as a single transaction (if non-interactive)       |
| -?, --help[=options]              | Show help, then exit                                       |
| --help=commands                   | List backslash commands, then exit                         |
| --help=variables                  | List special variables, then exit                          |

**Input and Output Options:**

| Option                  | Description                                           |
| :---------------------- | :---------------------------------------------------- |
| -a, --echo-all          | Echo all input from script                            |
| -b, --echo-errors       | Echo failed commands                                  |
| -e, --echo-queries      | Echo commands sent to server                          |
| -E, --echo-hidden       | Display queries that internal commands generate       |
| -L, --log-file=FILENAME | Send session log to file                              |
| -n, --no-readline       | Disable enhanced command line editing (readline)      |
| -o, --output=FILENAME   | Send query results to file (or \|pipe)                |
| -q, --quiet             | Run quietly (no messages, only query output)          |
| -s, --single-step       | Single-step mode (confirm each query)                 |
| -S, --single-line       | Single-line mode (end of line terminates SQL command) |

**Output Format Options:**

| Option                        | Description                                              |
| :---------------------------- | :------------------------------------------------------- |
| -A, --no-align                | Unaligned table output mode                              |
| --csv                         | CSV (Comma-Separated Values) table output mode           |
| -F, --field-separator=STRING  | Field separator for unaligned output (default: " ")      |
| -H, --html                    | HTML table output mode                                   |
| -P, --pset=VAR[=ARG]          | Set printing option VAR to ARG (see \pset command)       |
| -R, --record-separator=STRING | Record separator for unaligned output (default: newline) |
| -t, --tuples-only             | Print rows only                                          |
| -T, --table-attr=TEXT         | Set HTML table tag attributes (e.g., width, border)      |
| -x, --expanded                | Turn on expanded table output                            |
| -z, --field-separator-zero    | Set field separator for unaligned output to zero byte    |
| -0, --record-separator-zero   | Set record separator for unaligned output to zero byte   |

**Connection Options:**

| Option                  | Description                                                               |
| :---------------------- | :------------------------------------------------------------------------ |
| -h, --host=HOSTNAME     | Database server host or socket directory (default: "/var/run/postgresql") |
| -p, --port=PORT         | Database server port (default: "5432")                                    |
| -U, --username=USERNAME | Database user name (default: "root")                                      |
| -w, --no-password       | Never prompt for password                                                 |
| -W, --password          | Force password prompt (should happen automatically)                       |

## Postgres specific Syntax

### Listing databases

```postgres
\l
```

### Using a database

```postgres
\c database_name;
```

### Listing Users/Roles

```postgres
\du
```

### Listing tables

```postgres
\dt
```

---

## Postgres SQL Syntax

### Create database

```sh
createdb my_database
```

```psql
CREATE DATABASE my_database;
```

### Creating role

```psql
CREATE ROLE user_name SUPERUSER LOGIN PASSWORD 'password';
```

### Granting ALL PRIVILEGES

```psql
GRANT ALL PRIVILEGES ON SCHEMA public TO user_name;
```

### Revoking PRIVILEGES

```psql
REVOKE ALL PRIVILEGES ON SCHEMA public FROM user_name;
```

### Update Owner

```psql
ALTER DATABASE database_name OWNER TO user_name;
```

### Change password

```sql
ALTER USER user_name WITH PASSWORD 'new_password';
```

## Concepts

### Data anonymization

<https://www.postgresql.org/about/news/postgresql-anonymizer-10-privacy-by-design-for-postgres-2452/>
<https://www.youtube.com/watch?v=niIIFL4s-L8>

## References

[Postgres Administration Tutorial](<https://www.postgresqltutorial.com/postgresql-administration/>)
[Postgres Cheat Sheet](https://postgrescheatsheet.com/#/tables)
