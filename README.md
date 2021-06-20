# Serverless Web Apps with Docker & Zappa

See the [accompanying blog post](https://ianwhitestone.work/zappa-serverless-docker) for more information.

## Setup
1. Make sure you have [poetry](https://python-poetry.org/docs/#installation), the [AWS CLI](https://aws.amazon.com/cli/) & [docker](https://docs.docker.com/get-docker/) installed on your system
2. Clone the repo and set your working directory to the root of the repository (i.e. `cd path/to/zappa-serverless-docker`)
3. Run `poetry install --no-root`
    * You may need to run `pip install --upgrade pip` after (for some reason [poetry is using an older version of pip](https://github.com/python-poetry/poetry/issues/732)
4. Activate your new virtual environment with `poetry shell`


## Building the Docker image
1. Run `zappa save-python-settings-file lambda_docker_flask -o zappa_settings.py` to generate & save the Python settings file required by Zappa
2. Build the Docker image with `docker build -t lambda-docker-flask:latest .`
3. Create a new ECR repository by running `aws ecr create-repository --repository-name lambda-docker-flask --image-scanning-configuration scanOnPush=true`
4. Authenticate your local machine so it can push images to your repostiroy by running `aws ecr get-login-password | docker login --username AWS --password-stdin <your_registry_id>.dkr.ecr.us-east-1.amazonaws.com`
5. Point your Docker image to your new repository `docker tag lambda-docker-flask:latest <your_registry_id>.dkr.ecr.us-east-1.amazonaws.com/lambda-docker-flask:latest`
6. And push it `docker push <your_registry_id>.dkr.ecr.us-east-1.amazonaws.com/lambda-docker-flask:latest`


## Deploying with Zappa

Deploying the lambda function with your new Docker image can be accomplished by using the `zappa deploy` command and passing in the Docker image URI:

`zappa deploy lambda_docker_flask -d <your_registry_id>.dkr.ecr.us-east-1.amazonaws.com/lambda-docker-flask:latest`