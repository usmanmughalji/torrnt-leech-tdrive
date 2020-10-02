


RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR ./app

ENV TZ=Asia/Kolkata

RUN apt-get -qq update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/* && \
    apt-add-repository non-free && \
    apt-get -qq update && \
    apt-get -qq install -y p7zip-full p7zip-rar aria2 curl pv jq ffmpeg locales python3-lxml python3-pip unrar tar git wget busybox unzip && \
    apt-get purge -y software-properties-common

RUN wget https://rclone.org/install.sh
RUN bash install.sh

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["bash","start.sh"]
