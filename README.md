You can use this repo to test out a simple Zappa deployment for a flask app, using your branch. 

## Setup
1. Make sure you have [poetry](https://python-poetry.org/docs/#installation) & the [AWS CLI](https://aws.amazon.com/cli/)
2. Clone the repo and set your working directory to the root of the repository (i.e. `cd path/to/zappa-serverless-docker`)
3. Update `pyproject.toml` to point to your Zappa branch
4. Run `poetry install --no-root`
5. Activate your new virtual environment with `poetry shell`
