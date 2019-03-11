#!/bin/bash
export PGPASSWORD="db_password"
pg_dump -v -h <db_prod> -p 5432 -U <user_db> -f /tmp/foo.sql <db_name>

su postgres -c 'createdb <db_name>'
su postgres /bin/bash -c "psql -c \"CREATE USER <user_db> WITH PASSWORD <'db_password'>;\""
su postgres -c 'psql <user_db> -c "GRANT ALL PRIVILEGES ON DATABASE <db_name> TO <user_db>;"'
su postgres -c 'psql <user_db> -c "ALTER USER <user_db> WITH SUPERUSER;"'
su postgres -c 'psql -U <user_db> -d <db_name> < /tmp/foo.sql'
