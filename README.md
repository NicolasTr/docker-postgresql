docker-postgresql
=================

[![Docker Repository on Quay.io](https://quay.io/repository/nicolastr11/docker-postgresql/status "Docker Repository on Quay.io")](https://quay.io/repository/nicolastr11/docker-postgresql)

Run postgresql on Docker with automatic backups to [Amazon S3](http://aws.amazon.com/s3/) every hour.

Environment
===========

| Variable                 | Default   |
|:------------------------ |:--------- |
| POSTGRESQL_USER          | docker    | 
| POSTGRESQL_PASS          | docker    |
| POSTGRESQL_DB            | docker    |
| AWS_ACCESS_KEY_ID        |           |
| AWS_SECRET_ACCESS_KEY    |           |
| AWS_DEFAULT_REGION       | us-east-1 |
| AWS_S3_BUCKET            |           |
| AWS_S3_BUCKET_KEY_PREFIX | /         |
