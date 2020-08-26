FROM     python:3.6-alpine

MAINTAINER zigler zhang <zigler.zhang@gmail.com>

# Data and config volumes
VOLUME   /app /Photos

# Install FlexGet
RUN      pip3 install --no-cache-dir -U pip && pip3 install --no-cache-dir plexapi watchdog xmltodict

RUN 	 cd /app \
	 && wget https://github.com/arehbein-git/ppTag/archive/master.zip \
	 && unzip master.zip \
	 && mv ppTag-master pptag
	 && rm master.zip \

# Add start script
COPY     /app/pptag/run.sh /app/
RUN      chmod +x /app/run.sh

CMD [ "/app/run.sh" ]
