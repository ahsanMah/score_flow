#!/bin/bash

docker build ./ --build-arg USER=$USER \
				--build-arg UID=$(id -u) \
				-t ahsanmah/jax_sde:v0