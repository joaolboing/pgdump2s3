Build your docker image

`docker build -t <your-image>:<tag> .`


Env Vars:
```
DB_HOST=your.postgres.host
DB_PORT=5432
DB_USER=postgresUser
DB_PASS=postgresPassword
DB_NAME=myDatabase

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=us-east-1

BUCKET_NAME=my-s3-bucket
```