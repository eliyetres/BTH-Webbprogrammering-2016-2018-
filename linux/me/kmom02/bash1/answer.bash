#!/usr/bin/env bash

#
# ddb7e4dab79327caf87dee6860929e54
# linux
# bash1
# elhb16
# 2017-01-26 13:10:09
# v2.2.27 (2017-01-24)
#
# Generated 2017-01-26 14:10:10 by dbwebb lab-utility v2.2.27 (2017-01-24).
# https://github.com/mosbth/lab
#

. .dbwebb.bash
echo "${PROMPT}Ready to begin."



# ==========================================================================
# Bash 1 - linux 
# 
# A lab where you use Unix commands to list, find, and change i directory
# structure.
#
# The entire lab uses the apache2 configuration directory from '/etc/apache2'
# in linux installations.
#

# --------------------------------------------------------------------------
# Section 1. ls 
# 
# In this section we use the `ls` command to list files in the directory
# structure.
#

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.1 (1 points) 
# 
# Use the command `ls` to list the files in the `apache2` directory, list one
# file per line.
#
# Tip: Use the command `man ls` to see the flags that can be used for the
# `ls` command.
#
# Write your code below and put the answer into the variable ANSWER.
#


#ls -l



ANSWER=$( ls -1 apache2 )

# I will now test your answer - change false to true to get a hint.
assertEqual "1.1" true "$ANSWER"

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.2 (1 points) 
# 
# Use the command `ls` to list the files in the `apache2` directory. Use a
# flag so every directory gets a slash (`/`) after the name, list one file
# per line.
#
# Tip: Use the command `man ls` to see the flags that can be used for the
# `ls` command.
#
# Write your code below and put the answer into the variable ANSWER.
#



ANSWER=$( ls -p apache2 )

# I will now test your answer - change false to true to get a hint.
assertEqual "1.2" false "$ANSWER"

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.3 (1 points) 
# 
# First change directory to `apache2/mods-available` and use the `ls` command
# to list the files in the directory.
#
# List only files beginning with 'a' and have the file extension '.conf'.
# List one file per line.
#
# You can use `&&` to chain two or more commands on the same line.
#
# Tip: Use a wildcard `*` to match against more than one file.
#
# Write your code below and put the answer into the variable ANSWER.
#

#$(ls -1o apache2/mods-available/a*.conf)

ANSWER=$(cd apache2/mods-available/ && ls -1 a*.conf)

# I will now test your answer - change false to true to get a hint.
assertEqual "1.3" true "$ANSWER"

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.4 (1 points) 
# 
# List all, even hidden, files and directories in the
# `apache2/sites-available` directory. List one file per line.
#
# Write your code below and put the answer into the variable ANSWER.
#



ANSWER=$(ls -a apache2/sites-available/)

# I will now test your answer - change false to true to get a hint.
assertEqual "1.4" true "$ANSWER"

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.5 (1 points) 
# 
# List files and directories in `apache2/conf-available`, sort the files in
# file size order with the smallest file first.
#
# List one file per line.
#
# Do not show hidden files.
#
# Write your code below and put the answer into the variable ANSWER.
#

ANSWER=$(ls -S -r apache2/conf-available)

# I will now test your answer - change false to true to get a hint.
assertEqual "1.5" false "$ANSWER"

# --------------------------------------------------------------------------
# Section 2. file 
# 
# In this section we will use the `file` command to get information on the
# files in the directory structure.
#

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 2.1 (1 points) 
# 
# Use the `file` command to show the file name and type for the files and
# directories in `apache2`.
#
# Write your code below and put the answer into the variable ANSWER.
#
#name + type

ANSWER=$(file apache2/*)

# I will now test your answer - change false to true to get a hint.
assertEqual "2.1" true "$ANSWER"

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 2.2 (1 points) 
# 
# Use the `file` command to show only the file type for the files and
# directories in `apache2`.
#
# Write your code below and put the answer into the variable ANSWER.
#

ANSWER="$(file apache2/* -b)"

# I will now test your answer - change false to true to get a hint.
assertEqual "2.2" true "$ANSWER"

# --------------------------------------------------------------------------
# Section 3. cp, mv, mkdir och rm 
# 
# In this section we use the `cp`, `mv`, `mkdir` and `rm` to change in the
# directory structure.
#

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 3.1 (1 points) 
# 
# Use the `mkdir` command to create a directory called `backup/` if the
# directory does not exist.
#
# Copy all files with the file extension `.conf` from
# `apache2/mods-available` to a new directory `backup/conf/`, create the
# directory if it does not exist.
#
# List the files in the new directory `backup/conf/`, sort the files
# according to file size, with the biggest file first. List one file per
# line.
#
# Tip: Use `&&` to execute more than one command and `man mkdir` to find the
# correct flag.
#
# Write your code below and put the answer into the variable ANSWER.
#


#cp -R apache2/mods-available backup/conf
#sudo för mkdir
#mkdir backup/ &&
ANSWER=$(cp -R apache2/mods-available/*.conf backup/conf && ls -1S backup/conf)

# I will now test your answer - change false to true to get a hint.
assertEqual "3.1" true "$ANSWER"

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 3.2 (1 points) 
# 
# Use the `mkdir` command to create a new subdirectory `backup/php/` if it
# does not exist.
#
# Use the `mv` command to move all files beginning with 'php' from
# `backup/conf/` to the new directory.
#
# List the files in the `backup/conf/` directory. List one file per line.
#
# Write your code below and put the answer into the variable ANSWER.
#

#sudo mkdir backup/php
#mv backup/conf/php* backup/php && ls -1

ANSWER=$(mkdir backup/php && mv backup/conf/php* backup/php && ls -1 backup/conf)

# I will now test your answer - change false to true to get a hint.
assertEqual "3.2" true "$ANSWER"

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 3.3 (1 points) 
# 
# Remove all files the begins with 'proxy' from `backup/conf/`.
#
# List the files in the `backup/conf/` directory. List one file per line.
#
# Write your code below and put the answer into the variable ANSWER.
#

#rm backup/conf/proxy*&& ls -1 backup/conf

ANSWER=$(rm backup/conf/proxy* && ls -1 backup/conf)

# I will now test your answer - change false to true to get a hint.
assertEqual "3.3" true "$ANSWER"

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 3.4 (1 points) 
# 
# Use the `cp` command to copy all files from the `backup/php/` directory to
# the `backup/` directory.
#
# Remove the entire `backup/php/` directory.
#
# List files and directories in the `backup/` directory, use a flag so that
# all directories gets a slash (`/`) at the end of the file name. List one
# file per line.
#
# Write your code below and put the answer into the variable ANSWER.
#


ANSWER=$(cp -R backup/php/* backup && rm -r backup/php && ls -p backup)

# I will now test your answer - change false to true to get a hint.
assertEqual "3.4" false "$ANSWER"

# --------------------------------------------------------------------------
# Section 4. find 
# 
# In this section we use the `find` to find files and directories in a
# directory structure.
#
# In this section you work with the original directory `apache2/`.
#

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 4.1 (1 points) 
# 
# Use the `find` command to find the `apache2.conf` file in the `apache2/`
# directory.
#
# Write your code below and put the answer into the variable ANSWER.
#


ANSWER=$(find apache2/ -name "apache2.conf")

# I will now test your answer - change false to true to get a hint.
assertEqual "4.1" false "$ANSWER"

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 4.2 (1 points) 
# 
# Use the `find` command to find all empty files in the `apache2/` directory.
#
# Write your code below and put the answer into the variable ANSWER.
#


ANSWER=$(find apache2/ -type f -empty)

# I will now test your answer - change false to true to get a hint.
assertEqual "4.2" true "$ANSWER"

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 4.3 (1 points) 
# 
# Use the `find` command to find all directories which have 'conf' in the
# file name in the `apache2/` directory.
#
# Search only in the `apache2/` directory and not inte subdirectories.
#
# Write your code below and put the answer into the variable ANSWER.
#

ANSWER=$(find apache2/ -maxdepth 1 -name "conf*")

# I will now test your answer - change false to true to get a hint.
assertEqual "4.3" true "$ANSWER"

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 4.4 (1 points) 
# 
# Use the `find` command to find all files which contain 'ssl' in the name
# and has the file extension '.conf'.
#
# Search only in the `apache2/sites-available` and `apache2/mods-available`
# directories.
#
# Write your code below and put the answer into the variable ANSWER.
#

ANSWER=$(find apache2/sites-available apache2/mods-available -maxdepth 1 -name "*ssl*.conf" -type f)

# I will now test your answer - change false to true to get a hint.
assertEqual "4.4" true "$ANSWER"


exitWithSummary
