#!/bin/bash -e

set -x

app_name=bms-hellotodo-strongloop
app_git_url=https://github.com/ibm-bluemix-mobile-services/${app_name}.git

# Clean up /target
rm -rf target
mkdir target

cd boilerplate/imf

# Clean up before cloning a repo
rm -rf ${app_name}
rm -rf .git

# Clone a repo
git clone ${app_git_url}
cd ${app_name}
git checkout development
rm -rf .git
cd .. #back to /boilerplate/imf

# Create a new repo in /boilerplate/imf
git init
git add .
git commit -m "Created git repo for the boilerplate"
git gc --aggressive
git update-server-info
cd .. #back to /boilerplate

# Jar /boilerplate/imf to boilerplate.war
jar -cf ../target/boilerplate.war * .cfignore

# Clean up cloned repo and .git folders in /boilerplate/imf
rm -rf imf/${app_name}
rm -rf imf/.git
cd ..

# Copy manifest.yml to /target
cp manifest.yml target
mv environments target

