#!/bin/bash

composer install

if [ "$PHP_ENV" = "test" ]; then
    composer run test
    exit $?
fi

if [ "$PHP_ENV" = "dev" ]; then
    composer run start
else 
    start-apache
fi