if [ -f "db.sqlite" ] ; then
  echo "db.sqlite exist"
else
  echo "db.sqlite create"
  curl -O https://raw.githubusercontent.com/hatiolab/operato-ecs/master/db.sqlite
fi

if [ -f "docker-compose.yml" ] ; then
  echo "docker-compose.yml exist"
else
  echo "docker-compose.yml create"
  curl -O https://raw.githubusercontent.com/hatiolab/operato-ecs/master/docker-compose.yml
fi

if [ -f "config.production.js" ] ; then
  echo "config.production.js exist"
else
  echo "config.production.js create"
  curl -O https://raw.githubusercontent.com/hatiolab/operato-ecs/master/config.production.js
fi



# echo "start"
# echo $1

HOST_PORT=3000

if [ $# -eq 0 ] ; then
  echo "Warning: default port 3000"
else
  HOST_PORT=$1
fi


echo "HOST_PORT : ${HOST_PORT}"

echo "HostPort="$HOST_PORT > .env


docker-compose up

# echo "end"