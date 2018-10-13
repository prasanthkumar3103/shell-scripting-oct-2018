#!/bin/bash

#Desc : command substitution


testing=`date`
echo $testing

test=$(date)

echo $test

test_dt=$(date +%y-%m-%d)

echo $test_dt
