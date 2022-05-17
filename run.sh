#!/bin/sh

rm -rf /tmp/*

export PGPASSWORD=${DB_PASS}

DATE=`date +%Y-%m-%d_%H-%M`

YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`

BKPNAME=${DB_NAME}-${DATE}

echo $(date) "Backup iniciado"
pg_dump -h ${DB_HOST} -p ${DB_PORT} -U${DB_USER} -Fp -c -C -O ${DB_NAME} | gzip > /tmp/${BKPNAME}.sql.gz

echo $(date) "Copiando arquivo para o bucket s3"
aws s3 cp /tmp/${BKPNAME}.sql.gz s3://${BUCKET_NAME}/${YEAR}/${MONTH}/${DAY}/${BKPNAME}.sql.gz --region ${AWS_REGION}