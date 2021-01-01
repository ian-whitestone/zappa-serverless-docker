FROM amazon/aws-lambda-python:3.8

ARG FUNCTION_DIR="/var/task/"

COPY ./ ${FUNCTION_DIR}

# temporary
RUN yum update -y && yum install git -y 

# Setup Python environment
RUN pip install poetry
RUN POETRY_VIRTUALENVS_CREATE=false poetry install --no-root

# Or if you're using pipenv, you can run:
# pip install pipenv && pipenv install

# Or if you have a requirements.txt, you can run:
# RUN pip install -r requirements.txt

# Grab the zappa handler.py and put it in the working directory
RUN ZAPPA_HANDLER_PATH=$( \
    python -c "from zappa import handler; print (handler.__file__)" \
    ) \
    && echo $ZAPPA_HANDLER_PATH \
    && cp $ZAPPA_HANDLER_PATH ${FUNCTION_DIR}


CMD [ "handler.lambda_handler" ]