#!/usr/bin/env bash

day=$1
part=$2

dmd source/day_${day}_${part}.d source/util.d -J=input -of=out/${day}-${part}
