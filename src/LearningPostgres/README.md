# POSTGRES Learning

- [POSTGRES Learning](#postgres-learning)
  - [Installation and Setup](#installation-and-setup)
    - [On Linux](#on-linux)
    - [Enabling](#enabling)
    - [Starting](#starting)
    - [Checking status](#checking-status)
    - [Stopping](#stopping)
    - [Staging Postgres shell](#staging-postgres-shell)
    - [Check clusters](#check-clusters)
    - [Remove older version](#remove-older-version)
    - [Change config file](#change-config-file)
    - [Creating role](#creating-role)
      - [With password](#with-password)
    - [Granting ALL PRIVILEGES](#granting-all-privileges)
    - [Update Owner](#update-owner)
    - [Change password](#change-password)
    - [Listing databases](#listing-databases)
    - [Using a database](#using-a-database)
    - [Listing Users/Roles](#listing-usersroles)
    - [Listing tables](#listing-tables)
    - [Connections and Authentications](#connections-and-authentications)
    - [Running PSQL Console](#running-psql-console)
  - [References](#references)

## Installation and Setup

### On Linux

```shell
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo tee /etc/apt/trusted.gpg.d/pgdg.asc &>/dev/null
sudo apt update
sudo apt upgrade -y
sudo apt install postgresql postgresql-client -y
```

### Enabling

```shell
sudo pg_ctlcluster 15 main start
sudo systemctl enable postgresql.service
```

### Starting

```shell
sudo systemctl start postgresql.service
```

### Checking status

```shell
sudo systemctl status postgresql
```

### Stopping

```shell
sudo systemctl stop postgresql.service
```

### Staging Postgres shell

```shell
sudo -u postgres psql
```

### Check clusters

```shell
pg_lsclusters
```

### Remove older version

```shell
sudo apt-get --purge remove postgresql-14
```

### Change config file

```shell
sudo subl /etc/postgresql/15/main/postgresql.conf
```

> to change port search `port` under `Connection Settings` and update:

```shell
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

### Creating role

```sql
CREATE ROLE user_name SUPERUSER LOGIN;
```

#### With password

```sql
CREATE ROLE user_name SUPERUSER LOGIN PASSWORD 'password';
```

### Granting ALL PRIVILEGES

```sql
GRANT ALL PRIVILEGES ON SCHEMA public TO user_name;
```

### Update Owner

```sql
ALTER DATABASE database_name OWNER TO user_name;
```

### Change password

```sql
ALTER USER user_name WITH PASSWORD 'new_password';
```

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

### Connections and Authentications

find postgres config file

```shell
sudo nano /etc/postgresql/13/main/postgresql.conf
```

Within the postgres config file update `listen_addresses` from `locahost` to `*` as bellow

```txt
#------------------------------------------------------------------------------
# CONNECTIONS AND AUTHENTICATION
#------------------------------------------------------------------------------
# - Connection Settings -

#listen_addresses = '*' 
```

find

### Running PSQL Console

To initialize the database console within the project

```shell
psql DATABASE_NAME
```

## References

[Postgres Administration Tutorial](<https://www.postgresqltutorial.com/postgresql-administration/>)
[Postgres Cheat Sheet](https://postgrescheatsheet.com/#/tables)
