FROM     python:3.6-alpine

MAINTAINER zigler zhang <zigler.zhang@gmail.com>

WORKDIR	   /app

# install dependent package
RUN      pip3 install --no-cache-dir -U pip \
	 && pip3 install --no-cache-dir plexapi watchdog xmltodict

RUN	 wget https://github.com/arehbein-git/ppTag/archive/master.zip \
	 && unzip master.zip \
	 && rm master.zip \ 
	 && mv ppTag-master pptag

# Add start script
COPY  	 run.sh .
RUN      chmod +x run.sh

CMD 	 [ "run.sh" ]
