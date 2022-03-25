# POSTGRES Learning

- [POSTGRES Learning](#postgres-learning)
  - [Installation and Setup](#installation-and-setup)
    - [On Linux](#on-linux)
    - [Enabling](#enabling)
    - [Starting](#starting)
    - [Stopping](#stopping)
    - [Checking status](#checking-status)
    - [Creating a password](#creating-a-password)
    - [Staging Posgres shell](#staging-posgres-shell)
    - [Creating a User, database and acessing](#creating-a-user-database-and-acessing)
    - [Update Owner](#update-owner)
    - [Grating access to User](#grating-access-to-user)
    - [Listing databases](#listing-databases)
    - [Using a database](#using-a-database)

## Installation and Setup

### On Linux

```shell
sudo apt-get update
sudo apt-get upgrade
sudo apt install postgresql-13 postgresql-client-13
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add 
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee  /etc/apt/sources.list.d/pgdg.list
```

### Enabling

```shell
sudo systemctl enable postgresql.service
```

### Starting

```shell
sudo systemctl start postgresql.service
```

### Stopping

```shell
sudo systemctl stop postgresql.service
```

### Checking status

```shell
sudo systemctl status postgresql.service
```

### Creating a password

```shell
sudo passwd postgres
```

### Staging Posgres shell

```shell
sudo su -l postgres
psql
```

### Creating a User, database and acessing

```shell
CREATEUSER user_name
CREATEDB database_name -O user_name
psql database_name
```

### Update Owner

```shell
ALTER DATABASE database_name OWNER TO user_name;
```

### Grating access to User

```shell
GRANT CONNECT ON DATABASE database_name TO user_name;

GRANT USAGE ON SCHEMA public TO user_name;
```

### Listing databases

```shell
/l
```

### Using a database

```shell
/C database_name;
```
