FROM docker.io/apache/superset:4.1.1

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      build-essential \
      python3-dev \
      libldap2-dev \
      libsasl2-dev \
      slapd \
      ldap-utils \
      tox \
      lcov \
      valgrind \
    && rm -rf /var/cache/apt/

USER superset

RUN pip install --no-cache-dir --upgrade \
    PyAthena[SQLAlchemy]==3.9.0 \
    psycopg2-binary \
    Authlib \
    python-ldap \
    boto3 \
    botocore \
    celery[sqs] \
    s3werkzeugcache \
    s3cache
