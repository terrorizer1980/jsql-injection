jobs

docker -H ${DOCKER_HOST} build -t mysql \
-f model/src/test/resources/docker/Dockerfile.mysql . &
pids[$!]=$!

docker -H ${DOCKER_HOST} build -t mysql \
-f model/src/test/resources/docker/Dockerfile.mysql-5.5.40 . &
pids[$!]=$!

docker -H ${DOCKER_HOST} build -t postgres \
-f model/src/test/resources/docker/Dockerfile.postgres . &
pids[$!]=$!

docker -H ${DOCKER_HOST} build -t sqlserver \
-f model/src/test/resources/docker/Dockerfile.sqlserver . &
pids[$!]=$!

docker -H ${DOCKER_HOST} build -t neo4j \
-f model/src/test/resources/docker/Dockerfile.neo4j . &
pids[$!]=$!

docker -H ${DOCKER_HOST} build -t cubrid \
-f model/src/test/resources/docker/Dockerfile.cubrid . &
pids[$!]=$!

docker -H ${DOCKER_HOST} build -t db2 \
-f model/src/test/resources/docker/Dockerfile.db2 . &
pids[$!]=$!

jobs
for pid in ${pids[*]}; do wait $pid; done
unset pids