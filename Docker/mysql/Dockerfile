FROM mysql:5.7

COPY ./test-db.sql /
COPY ./sqldump.sh /

RUN chmod +x sqldump.sh

#CMD ["sqldump.sh"]

