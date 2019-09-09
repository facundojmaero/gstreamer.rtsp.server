# GStreamer RTSP simple server

The Dockerfile builds an Ubuntu-based image that serves video files  to a RTSP stream.

Build with:
```
$ docker build -t rtsp_server .
```

Run with:
```
$ docker run --rm --net host -it -v <VIDEOS_FOLDER>:/src/examples/videos --name streamer rtsp_streamer videos/<VIDEO_NAME> -p <PORT>
```

The image runs the rtsp server in port 8554 by default.
