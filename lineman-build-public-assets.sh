#!/bin/bash

cd front-end
lineman clean
lineman build
rm -rf ../public
cp -r dist ../public
