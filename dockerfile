# Using a debian image.
FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND=noninteractive
# Updating and installing all the requiered deps.
RUN apt update
RUN apt install -y libfftw3-dev libfftw3-bin meson pkgconf ninja-build git cmake libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio python3-pip gunicorn3
# Cleaning the apt to slim the image a bit.
RUN rm -rf /var/lib/apt/lists/*
ADD ./*.cpp /
ADD ./*.h /
ADD ./src /src
ADD ./gst /gst
ADD ./meson.build /
ADD ./test.py /
# Building the moodbar program.
RUN meson --buildtype=release build/
# Installing the moodbar command.
WORKDIR /build/
RUN ninja
RUN ninja install
ADD ./server /server
WORKDIR /server/
# Launching the python server to launch the moodbar command.
RUN pip3 install -r requirement.txt --break-system-packages
ENTRYPOINT ["gunicorn3", "-w", "10", "-b", "0.0.0.0:4545", "MoodApp:app"]