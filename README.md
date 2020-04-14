# Description

This project demonstrates how to use [gstreamer](https://gstreamer.freedesktop.org) to covert a RTSP stream into a WebRTC stream, and how to feed it into a browser.

This work is based on [centricular/gstwebrtc-demos](https://github.com/centricular/gstwebrtc-demos).

# Setup

Test environment: Ubuntu 18.04 LTS

Add `sudo` when appropriate.

## Install gstreamer

From [API reference](https://gstreamer.freedesktop.org/documentation/installing/on-linux.html):

```bash
apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
```

## Install gstreamer WebRTC plugins

```bash
apt install -y gir1.2-gst-plugins-bad-1.0 gstreamer1.0-nice
```

## Install Python3

```bash
apt install -y python3 python3-pip
```

## Install Python3 Websocket module

We will use the [public demo server](https://webrtc.nirbheek.in) provided by [centricular](https://github.com/centricular/gstwebrtc-demos), so we need Websocket support. Any WebRTC handshake channel will work, but for simplicity we keep it as is.

```bash
pip3 install websockets
```

## Prepare local RTSP server (optional)

There exists [a public RTSP test stream](https://www.wowza.com/html/mobile.html) hosted by wowza.com, but there is no grantee that it will be there forever. In addition, it seems to have a rate limit and behaves weird if requested too many times. 

### Install ffmpeg

```bash
apt install ffmpeg
```

### Install rtsp-streaming-server

```bash
cd rtsp-source
npm install
```

### Download source video file

```bash
wget http://ia800501.us.archive.org/10/items/BigBuckBunny_310/big_buck_bunny_640_512kb.mp4
```

### Run stream push script

```bash
while true; do
	ffmpeg -re -i big_buck_bunny_640_512kb.mp4 -c:v copy -f rtsp rtsp://127.0.0.1:5554/stream1
done
```

# Demo

