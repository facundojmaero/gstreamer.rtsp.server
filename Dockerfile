FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    libgstreamer1.0-0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \ 
    gstreamer1.0-plugins-bad \ 
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-doc \
    gstreamer1.0-tools \
    gstreamer1.0-x \
    gstreamer1.0-alsa \
    gstreamer1.0-gl \
    gstreamer1.0-gtk3 \
    gstreamer1.0-qt5 \
    gstreamer1.0-pulseaudio \
    libgstreamer-plugins-base1.0-dev \
    wget 

RUN apt-get install -y \
    libgstreamer1.0-dev \
    libgstrtspserver-1.0-dev

COPY code /src
WORKDIR /src/examples
RUN make test-mp4
ENTRYPOINT ["./test-mp4"]
