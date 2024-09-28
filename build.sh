#!/bin/sh

mkdir -p js

cp node_modules/bootstrap/dist/js/bootstrap.min.* js/
cp node_modules/jquery/dist/jquery.slim.min.* js/
cp node_modules/popper.js/dist/umd/popper.min.* js/

echo "Built!"
