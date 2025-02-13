# For graphics

isRunning=`docker ps -f name=v | grep -c "color_point_cloud"`;

if [ $isRunning -eq 0 ]; then
    xhost +local:docker
    docker rm color_point_cloud
    docker run \
        --name color_point_cloud \
        -it \
        --env="DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --net host \
        --ipc host \
        --pid host \
        --privileged \
        --volume `pwd`/../:/ros2_ws/src/color_point_cloud \
        --volume "/mnt/data/:/data" \
        -w /ros2_ws \
        color_point_cloud:latest

else
    echo "color_point_cloud is already running"
    docker exec -it color_point_cloud /bin/bash
fi
