# Use the official SQLite image as the base
FROM alpine/sqlite:latest

# Set the working directory inside the container
WORKDIR /db

# Optionally, copy a pre-existing SQLite database file to the container
# Uncomment and replace "your-database.db" with your actual database file
# COPY your-database.db /data/

COPY test.db .

CMD ["sqlite3"]
