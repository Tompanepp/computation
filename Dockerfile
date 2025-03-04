FROM mcr.microsoft.com/devcontainers/python:3.13

WORKDIR /computation_and_information

RUN apt-get update \
    && apt-get install -y aspell
    
COPY . .
    
RUN pipenv sync --system -d

RUN adduser -u 5678 --disabled-password --gecos "" computation_and_information && chown -R computation_and_information /computation_and_information
USER computation_and_information