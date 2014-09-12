software_architecture_course
============================

Software architecture course based on simple web application


## For install

### Install dependencies

    sudo aptitude install git postgresql libdata-uuid-perl libdbi-perl libdbd-pg-perl nginx uwsgi uwsgi-plugin-psgi curl libipc-run3-perl

### COnfigure postgresql client and server, create database/table and load random data

    ln -s software_architecture_course/.pg_service.conf ~/.pg_service.conf
    ln -s software_architecture_course/.pgpass ~/.pgpass
    chmod 600 software_architecture_course/.pgpass

    cat software_architecture_course/sql/create_db_and_user.sql | sudo -u postgres psql
    cat software_architecture_course/sql/create_table.sql | psql 'service=stat'

    sudo perl -i -pe 's/(local\s+all\s+all\s+)peer/$1md5/' /etc/postgresql/9.1/main/pg_hba.conf
    sudo bash -c "echo \"LANG = 'ru_RU.UTF-8'\" >> /etc/postgresql/9.1/main/environment"

    sudo service postgresql restart

    perl load_random_data2db.pl
    psql 'service=stat'
    select * from payments limit 10;

### Make and install debian package and test result

    cd software_architecture_course
    make

    curl 127.0.0.1

    curl 'http://185.31.161.64/'
