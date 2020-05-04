# Buff MySQL
cat <<EOF | docker -H ${DOCKER_HOST} exec -i jsql-mysql /bin/bash
    mysql -uroot -pmy-secret-pw -e ' 
        SET GLOBAL max_connections = 100000; 
        SET GLOBAL thread_cache_size = 16384; 
        SET GLOBAL table_open_cache = 524288; 
    ';
EOF

# Check SQL Server connection
docker -H ${DOCKER_HOST} exec -i jsql-sqlserver /opt/mssql-tools/bin/sqlcmd \
-S "tcp:127.0.0.1,1434" \
-U SA \
-P "yourStrong(!)Password" \
-Q "select @@version"