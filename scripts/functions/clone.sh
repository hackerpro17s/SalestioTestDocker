#!/bin/bash

function clone_site() {
	target_dir=~/workspace/salestio/www/site
  if [ ! -d $target_dir ]; then
    echo "Clonning site";
    git clone https://github.com/hackerpro17s/SalestioTest.git $target_dir
  else
    echo "site already exist"
  fi
}

clone_site
