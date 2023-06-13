#!/bin/bash
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
    echo "XDG_SESSION_TYPE is x11, starting container."
    xhost +local:root
    docker run -it \
        --net=host \
        -v /home/$USER/foxy_ws:/root/foxy_ws \
        --env="DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
        --env="XDG_RUNTIME_DIR=/tmp" \
        --device=/dev/dri:/dev/dri \
        aadi/ros:foxy-desktop-turtlebot

    xhost -local:root
else
    echo "Not running in x!"
fi

        # --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
        # -v /home/$USER/noetic_ws:/noetic_ws \
        # -v /home/$USER/turtlebot3_ws:/turtlebot3_ws \

# -e ROS_MASTER_URI=http://10.0.0.220:11311 \
# -e ROS_HOSTNAME=10.0.0.2 \

#docker run --net=host -v /home/$USER/docker/noetic:/host -v /home/$USER/noetic_ws:/noetic_ws -e ROS_MASTER_URI=http://10.249.85.129:11311 -e ROS_HOSTNAME=10.249.85.129 -e DISPLAY=$DISPLAY -v /run/user/1001/.X11-unix:/run/user/1001/.X11-unix --ipc=host -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/run/user/1001/$WAYLAND_DISPLAY -it ros-test

# docker run \
#     --net=host \
#     -v /home/$USER/docker/noetic:/host \
#     -v /home/$USER/noetic_ws:/noetic_ws \
#     -e ROS_MASTER_URI=http://10.249.85.129:11311 \
#     -e ROS_HOSTNAME=10.249.85.129 \
#     -e DISPLAY=$DISPLAY \
#     -v /run/user/1001/.X11-unix:/run/user/1001/.X11-unix \
#     --ipc=host \
#     -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
#     -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
#     -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/run/user/1001/$WAYLAND_DISPLAY \
#     -it ros-test

