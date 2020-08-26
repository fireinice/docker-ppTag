FROM     python:3.6-alpine

MAINTAINER zigler zhang <zigler.zhang@gmail.com>

# Install FlexGet
RUN      pip3 install --no-cache-dir -U pip \
	 && pip3 install --no-cache-dir plexapi watchdog xmltodict

RUN	 mkdir /app \
	 && cd /app \
	 && wget https://github.com/arehbein-git/ppTag/archive/master.zip \
	 && unzip master.zip \
	 && rm master.zip \ 
	 && mv ppTag-master pptag

# Add start script
COPY  	 run.sh /app
RUN      chmod +x /app/run.sh

CMD 	 [ "/app/run.sh" ]
