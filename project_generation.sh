#!/bin/bash

mkdir $1
mkdir $1/css
mkdir $1/img
mkdir $1/js
touch $1/css/style.css
touch $1/js/main.js
cp ~/django/template/index.html $1/index.html
cp template/css/reset.css $1/css/reset.css