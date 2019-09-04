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

WORKDIR /src
# Download gst-rtsp-server, the same version as gstreamer
RUN RTSP_SERVER_VERSION=$(gst-launch-1.0 --version | grep GStreamer | egrep -o "([0-9]{1,}\.)+[0-9]{1,}") \
    && wget https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-${RTSP_SERVER_VERSION}.tar.xz -O rtsp_server.tar.xz

RUN tar xf rtsp_server.tar.xz --strip-components 1 && rm rtsp_server.tar.xz
RUN ./configure && make && make check && make install && make installcheck

WORKDIR /src/examples
ENTRYPOINT ["./test-mp4"]
