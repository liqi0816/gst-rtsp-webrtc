#!/bin/bash

while true; do
	ffmpeg -re -i big_buck_bunny_640_512kb.mp4 -c:v copy -f rtsp rtsp://127.0.0.1:5554/stream1
done
