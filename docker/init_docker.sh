set -e

echo "===starting docker-compose build...==="

docker-compose build
sleep 10 # wait to start the mysql container
docker-compose run app bundle exec rake db:migrate:reset

echo "===docker-compose build is complete!==="
