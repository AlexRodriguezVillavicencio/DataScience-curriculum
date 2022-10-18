#!bin/sh

TRY_LOOP="20"
wait_for_port() {
  local name="$1" host="$2" port="$3"
  local j=0
  while ! nc -z "$host" "$port" >/dev/null 2>&1 < /dev/null; do
    j=$((j+1))
    if [ $j -ge $TRY_LOOP ]; then
      echo >&2 "$(date) - $host:$port still not reachable, giving up"
      exit 1
    fi
    echo "$(date) - waiting for $name $host... $j/$TRY_LOOP"
    sleep 5
  done
}
create_airflow_user() {
  airflow users create \
  --username "$AF_USER_NAME" \
  --firstname "$AF_USER_FIRST_NAME" \
  --lastname "$AF_USER_LAST_NAME" \
  --role "$AF_USER_ROLE" \
  --email "$AF_USER_EMAIL" \
  --password "$AF_USER_PASSWORD"
}
setup_airflow_variables() {
    if [ -e "variables.json" ]; then
      echo "Start importing Airflow variables"
      airflow variables import variables.json
    fi
}
setup_airflow_connections() {
    if [ -e "connections.yml" ]; then
      echo "Start setting up Airflow connections"
      python3 setup_connections.py
    fi
}
install_python_packages() {
    if [ -e "requirements.txt" ]; then
      echo "Installing additional Python packages"
      pip3 install -r requirements.txt
    fi
}
wait_for_port "Postgres" "$POSTGRES_HOST" "$POSTGRES_PORT"
wait_for_port "Redis" "$REDIS_HOST" "$REDIS_PORT"
export AIRFLOW__CORE__SQL_ALCHEMY_CONN \
AIRFLOW__CELERY__RESULT_BACKEND \
AIRFLOW__CORE__FERNET_KEY \
AIRFLOW__CORE__LOAD_EXAMPLES \
AIRFLOW__CORE__EXECUTOR
AIRFLOW__CORE__SQL_ALCHEMY_CONN="postgres+psycopg2://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DB"
AIRFLOW__CELERY__RESULT_BACKEND="db+postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DB"
AIRFLOW__CORE__LOAD_EXAMPLES=False
AIRFLOW__CORE__EXECUTOR=CeleryExecutor
AIRFLOW__CORE__FERNET_KEY="wVKXj_gUFi0scVsP-HARZYyxxihQCpj3B2gA_ERaIBE="
case "$1" in
    webserver)
        airflow db init
        sleep 10
        create_airflow_user
        setup_airflow_variables
        setup_airflow_connections
        install_python_packages
        exec airflow scheduler &
        exec airflow webserver
        ;;
    worker)
        airflow db init
        sleep 10
        install_python_packages
        exec airflow celery "$@" -q "$QUEUE_NAME"
        ;;
    flower)
        airflow db init
        sleep 10
        exec airflow celery "$@"
        ;;
    *)
        exec "$@"
        ;;
esac