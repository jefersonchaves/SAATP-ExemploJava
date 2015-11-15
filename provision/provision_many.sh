#!/bin/bash
PROJECT_DEPENDENCIES=$1
DEPS=(`echo $PROJECT_DEPENDENCIES | tr "," "\n"`)

echo "project dependencies $PROJECT_DEPENDENCIES"

for package in "${DEPS[@]}"
do
  echo $package
  sh /vagrant/provision/packages/$package.sh
done

FILE="/vagrant/provision/softwares_custom.txt"
DEPS2=()
k=0
#expecting 1 software per line
while read line;do
  DEPS2[k]=$line
  ((k++))
done < $FILE

for package in "${DEPS2[@]}"
do
  echo $package
  sh /vagrant/provision/packages/$package.sh
done
