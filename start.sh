#!/bin/bash

echo delete vm goinfre
rm -rf /mnt/nfs/homes/ajung/goinfre/inception-graphical

echo copy vm from sgoinfre to goinfre
cp -R /mnt/nfs/homes/ajung/sgoinfre/inception-graphical	/mnt/nfs/homes/ajung/goinfre
