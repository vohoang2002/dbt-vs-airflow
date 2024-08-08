# How to build project
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.9.2/docker-compose.yaml'
Chuyển về LocalExcutor và xóa những thuộc tính và service không cần thiết (chi tiết xem file docker-compose.yml)
docker build . -t extending_airflow:v2
# How to run project
docker compose up airflow-init
docker compose up -d
# How to stop project
docker compose down -v