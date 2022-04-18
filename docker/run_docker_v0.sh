#!/bin/bash

# --user $(id -u):$(id -g) \
# --user root \
#--mount type=bind,src="/AJAX_STOR/amahmood/",target=/ajax \
# --mount type=bind,src="/ASD/ahsan_projects/tensorflow_datasets",target=/root/tensorflow_datasets \

	# --mount type=bind,src="/AJAX_STOR/amahmood/tfds",target=/home/amahmood/tensorflow_datasets \

docker run \
	-d \
	--rm \
	--init \
	-it \
	--name jax_sde_v0 \
	--ipc=host \
	-p 9010:8888 \
	-e JUPYTER_ENABLE_LAB=yes \
	--gpus device=all \
	--entrypoint="" \
	--mount type=bind,src=/ASD/ahsan_projects/,target=/ahsan_projects \
	--mount type=bind,src="/BEE/Connectome/ABCD/",target=/DATA \
	ahsanmah/jax_sde:v0 \
	bash -c '
	jupyter lab --ip 0.0.0.0 --notebook-dir=/ --no-browser --allow-root
	'