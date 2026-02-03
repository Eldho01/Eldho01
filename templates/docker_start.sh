xhost +local:docker

docker run -it --rm \
    --net=host \
    --ipc=host \
    --privileged \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v /dev:/dev \
    -v ~/Dev:/Dev \
    ros:humble \
    bash
