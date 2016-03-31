#!/bin/bash
export DBNAME=reprisk
export DBUSER=postgres
export CURRENTD=$PWD
export PATH=/usr/local/pgsql/bin:$PATH
export GENESIS=~/projects/genesis/trunk
export APP=~/projects/RepRisk
export DBHOST=127.0.0.1
export DBPORT=5432


###############################################################
#check the semantic correctness of the schema files involved
###############################################################
nodejs ~/projects/semantiker/semantiker.js $APP/schema/reprisk_inventory.xml $APP/schema/reprisk_db.xml ~/projects/inventory/trunk/schema.xml

if [ $? -ne 0 ]
then
	exit 1;
fi

###############################################################
#create a base template from genesis core
###############################################################
psql -h $DBHOST -p $DBPORT -c  "DROP DATABASE IF EXISTS $DBNAME" template1 $DBUSER
psql -h $DBHOST -p $DBPORT -c  "CREATE DATABASE $DBNAME TEMPLATE genesis" template1 $DBUSER


###############################################################
#transform & load schema
###############################################################
cd $GENESIS/xslt/

./xenesis.sh $APP/schema/schema.xml /tmp/inventory.sql
psql -h $DBHOST -p $DBPORT -P pager=off  -f  /tmp/inventory.sql $DBNAME $DBUSER

#reprisk inventory
./xenesis.sh $APP/schema/reprisk_inventory.xml /tmp/reprisk_inventory.sql
psql -h $DBHOST -p $DBPORT -P pager=off  -f  /tmp/reprisk_inventory.sql $DBNAME $DBUSER

#reprisk DB
./xenesis.sh $APP/schema/reprisk_db.xml /tmp/reprisk_db.sql
psql -h $DBHOST -p $DBPORT -P pager=off  -f  /tmp/reprisk_db.sql $DBNAME $DBUSER


###############################################################
#load data
###############################################################

# #inventory
psql -h $DBHOST -p $DBPORT -P pager=off  -f  $APP/data/currency.sql $DBNAME $DBUSER
psql -h $DBHOST -p $DBPORT -P pager=off  -f  $APP/data/01_country.sql $DBNAME $DBUSER
psql -h $DBHOST -p $DBPORT -P pager=off  -f  $APP/data/02_country_city.sql $DBNAME $DBUSER
psql -h $DBHOST -p $DBPORT -P pager=off  -f  $APP/data/company.sql $DBNAME $DBUSER
psql -h $DBHOST -p $DBPORT -P pager=off  -f  $APP/data/unit.sql $DBNAME $DBUSER
psql -h $DBHOST -p $DBPORT -P pager=off  -f  $APP/data/approach.sql $DBNAME $DBUSER
psql -h $DBHOST -p $DBPORT -P pager=off  -f  $APP/data/model_type.sql $DBNAME $DBUSER
psql -h $DBHOST -p $DBPORT -P pager=off  -f  $APP/data/model.sql $DBNAME $DBUSER


#add users and agendas
psql -h $DBHOST -p $DBPORT -P pager=off  -f  $APP/data/clients.sql $DBNAME $DBUSER


#reprisk


###############################################################
#start the frontend
###############################################################

# prepare the acceleration table for the frontend generation (see confog.js in the root directory of NEMESIS for more details)
psql -h $DBHOST -p $DBPORT -c "SELECT refresh_genesis_graph(NULL::JSON);" $DBNAME -U $DBUSER


###############################################################
# go back to the start directory
###############################################################
cd $CURRENTD

###############################################################
# license activation
###############################################################

curl -sSL https://glm.genesis.wf/scripts/genesis-activation.sh | bash -s $DBNAME $DBUSER $DBHOST
