#!/bin/bash

docker run -tv $(pwd):/src checkmarx/kics:latest scan --path "/src" --config "/src/.github/kics.config.yml"