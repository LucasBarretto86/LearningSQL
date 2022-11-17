# POSTGRES Learning

- [POSTGRES Learning](#postgres-learning)
  - [Installation and Setup](#installation-and-setup)
    - [On Linux](#on-linux)
    - [Enabling](#enabling)
    - [Starting](#starting)
    - [Checking status](#checking-status)
    - [Stopping](#stopping)
    - [Staging Postgres shell](#staging-postgres-shell)
    - [Creating role](#creating-role)
    - [Granting ALL PRIVILEGES](#granting-all-privileges)
    - [Update Owner](#update-owner)
    - [Listing databases](#listing-databases)
    - [Using a database](#using-a-database)
    - [Listing Users/Roles](#listing-usersroles)
    - [Listing tables](#listing-tables)
    - [Connections and Authentications](#connections-and-authentications)
    - [Running PSQL Console](#running-psql-console)

## Installation and Setup

### On Linux

```shell
sudo apt-get update
sudo apt-get upgrade
sudo apt install postgresql-14 postgresql-client-14
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add 
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee  /etc/apt/sources.list.d/pgdg.list
```

### Enabling

```shell
sudo pg_ctlcluster 14 main start
sudo systemctl enable postgresql.service
```

### Starting

```shell
sudo systemctl start postgresql.service
```

### Checking status

```shell
sudo systemctl status postgresql@13-main.service
```

### Stopping

```shell
sudo systemctl stop postgresql.service
```

### Staging Postgres shell

```shell
sudo su -l postgres
psql
```

### Creating role

  ```sql
  CREATE ROLE user_name SUPERUSER LOGIN PASSWORD 'password';
  ```

> locally you don't really need a password

  ```sql
  CREATE ROLE user_name SUPERUSER LOGIN;
  ```

### Granting ALL PRIVILEGES

  ```sql
  GRANT ALL PRIVILEGES ON SCHEMA public TO user_name;
  ```

### Update Owner

  ```sql
  ALTER DATABASE database_name OWNER TO user_name;
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

To initialize the databse console within the project

```shell
psql DATABASE_NAME
```
