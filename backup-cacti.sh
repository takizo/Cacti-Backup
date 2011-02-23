#!/usr/local/bin/bash

## binary setting
##
MYSQL_DUMP=/usr/local/bin/mysqldump
MKDIR=/bin/mkdir
CP=/bin/cp
CURRENT_DATE=`date +%Y%m%d`

## Please change necessary here!
##
CACTI_RRA_DIR='/usr/local/share/cacti/rra/'
DIRECTORY="/cacti-backup/cacti.backup/banana/$CURRENT_DATE"
RRA_DIR=${DIRECTORY}'/rra/'
MYSQL_DIR=${DIRECTORY}'/mysql/'
DUMP_DB_FILE=${MYSQL_DIR}"${CURRENT_DATE}-cacti.sql"

MYSQL_USER='cacti-username'
MYSQL_PASS='cacti-password'
MYSQL_DB='cacti-db'

## Script start
### Create directory
${MKDIR} -p ${MYSQL_DIR}
${MKDIR} -p ${RRA_DIR}

## Dump DB first 
${MYSQL_DUMP} --user=${MYSQL_USER} --password=${MYSQL_PASS} ${MYSQL_DB} > ${DUMP_DB_FILE}

## Copy Cacti's RRA Files only
${CP} -rf ${CACTI_RRA_DIR} ${RRA_DIR}
