#!/bin/bash
/usr/local/firebird/bin/./gbak -user sysdba -pas <password> <db_prod>:/firebird/data/<firebird_db> /tmp/<firebird_db>
/usr/local/firebird/bin/./gbak -c -v -p 8192 -user sysdba -password <password> -se localhost:service_mgr /tmp/<firebird_db> /firebird/data/<firebird_db>

chmod 777 /firebird/data/*
