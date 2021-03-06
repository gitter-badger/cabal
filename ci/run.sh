#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


export PATH="$HOME/miniconda/bin:$PATH"
export PYTHONPATH="$DIR/..:$PYTHONPATH"
export CABAL_APP_CONFIG="config.test_app_config"
export CABEL_DB_CONFIG="config.test_db_config"


# Activate Python environment

source activate cabal


# Init DB

echo 'init db...'

$DIR/init_db.sh

echo 'init db...done'


# Run tests

py.test -x -vv -s $DIR/../site/tests/


# Clean up DB

echo 'clean up...'

mysql -uroot -hlocalhost -e "DROP DATABASE IF EXISTS cabal_test_$USER;"

echo 'clean up...done'