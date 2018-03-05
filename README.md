[![CircleCI](https://circleci.com/gh/strehlst/what-would-you-do/tree/master.svg?style=shield)](https://circleci.com/gh/strehlst/what-would-you-do/tree/master)  [![Maintainability](https://api.codeclimate.com/v1/badges/2609b77b2336cbf7afaa/maintainability)](https://codeclimate.com/github/strehlst/what-would-you-do/maintainability)  [![Test Coverage](https://api.codeclimate.com/v1/badges/2609b77b2336cbf7afaa/test_coverage)](https://codeclimate.com/github/strehlst/what-would-you-do/test_coverage)
# What would you do if your income were taken care of?

## Synopsis
This application provides a space for people to imagine and share what they would like to accomplish in their lives if basic economic security was not bound to a job.

## Setup
### Postgres Database
Install Postgres 10.2 locally. Then create a user and two databases as follows.

```
$ psql postgres
> CREATE ROLE whatwouldyoudo PASSWORD 'whatwouldyoudo' NOSUPERUSER CREATEDB NOCREATEROLE INHERIT LOGIN;
> CREATE DATABASE whatwouldyoudo OWNER whatwouldyoudo;
> CREATE DATABASE whatwouldyoudo_test OWNER whatwouldyoudo;
```
