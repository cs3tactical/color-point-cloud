FROM osrf/ros:humble-desktop-full

ARG WORKSPACE=humble_dev_ws
WORKDIR /root/$WORKSPACE

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
ENV QT_X11_NO_MITSHM=1
ENV EDITOR=nano
ENV XDG_RUNTIME_DIR=/tmp


# ###### Install ROS2
# RUN apt-get update && apt-get upgrade -y && apt-get install -y \
#     curl \
#     gnupg2 \
#     lsb-release

# RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
# RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
# RUN apt-get update && apt-get upgrade -y
# RUN apt install ros-humble-desktop-full -y


# ###### Install python packages
# RUN apt-get install -y \
#     python-is-python3 \
#     python3-pip

# RUN pip install opencv-python
# RUN pip install --upgrade numpy==1.24.3
# RUN pip install matplotlib==3.6.0
# RUN pip install \
#     pandas \
#     open3d
    
# ###### Install package dependencies
# RUN apt-get install -y \
#     git \
#     libpcl-dev \
#     terminator

###### Install ros dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    ros-dev-tools \
    ros-humble-pcl-ros \
    ros-humble-pcl-conversions \
    ros-humble-cv-bridge \
    libopencv-dev \
    libpcl-dev \
    libeigen3-dev \
    python3-colcon-common-extensions \
    ros-humble-image-transport \
    ros-humble-pcl-msgs \
    ros-humble-rosbag2-storage-mcap

# RUN rosdep init && rosdep update

###### Build the workspace
RUN mkdir -p /ros2_ws/src
WORKDIR /ros2_ws
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build --symlink-install"

###### Source the workspace
RUN echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc
