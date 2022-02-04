#!/usr/bin/env bash
echo node version: $(node --version)
echo tsc version: $(tsc --version)
echo node sass version: $(npm list -g node-sass)
echo npm version: $(npm list -g npm)
echo python version: $(python --version)
echo aws cli version: $(aws --version)