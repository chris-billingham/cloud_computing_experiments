# build dockerfile, i think you have to navigate to the right directory and then build

docker build /Google Drive/R_code_hub/cloud_experiments/data/Dockerfile
docker build - < /Google Drive/R_code_hub/cloud_experiments/data/Dockerfile

# connect gcloud and docker for authorisation
gcloud auth configure-docker

# tab the docker image for upload
docker tag [SOURCE_IMAGE] [HOSTNAME]/[PROJECT-ID]/[IMAGE]

# push into the cloud
docker push [HOSTNAME]/[PROJECT-ID]/[IMAGE]


