FROM python:3.10.13

WORKDIR /tmp

RUN apt update -y && \
    apt install -y \
    git \
    wget \
    yarn \
    curl

RUN echo 'alias ll="ls -l"' >> ~/.bashrc  && \
    echo 'alias python="python3'>> ~/.bashrc  && \
    echo 'alias pip="pip3'>> ~/.bashrc  && \
    . ~/.bashrc

WORKDIR /projects
ADD ./requirements.txt /projects/

RUN pip install --upgrade pip \
    pip install -r requirements.txt

ADD ./run.sh /tmp/run.sh
RUN chmod 777 /tmp/run.sh

CMD [ "sh", "-c", "/tmp/run.sh" ]
