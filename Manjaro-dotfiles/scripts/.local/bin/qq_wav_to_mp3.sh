#!/bin/bash

ffmpeg -i $1 ${1%wav}mp3
