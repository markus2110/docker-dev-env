#!/bin/sh

mysql --user=root --password=password --comments < test-db.sql && rm -f test-db.sql