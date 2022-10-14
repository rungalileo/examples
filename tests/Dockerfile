FROM python:3.7.14-slim-buster
ADD . /test
ADD requirements.txt /test
WORKDIR /test
#RUN pip install -r requirements.txt
RUN --mount=type=cache,target=/root/.cache pip install  -r requirements.txt
CMD ["python", "test.py"]
