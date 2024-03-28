#   Author: Yavuz Selim Ozkaya
# LinkedIn: https://www.linkedin.com/in/yavuzselimozkaya

# References: https://github.com/IntelRealSense/librealsense/tree/master/wrappers/python
# 	      https://github.com/IntelRealSense/librealsense/issues/6964
#	      https://www.youtube.com/watch?v=EeT-pzM8n-o

cd ~/Repos
git clone https://github.com/IntelRealSense/librealsense.git
cd librealsense && mkdir build && cd build
sudo apt-get -y install python3-dev libssl-dev libxinerama-dev libxcursor-dev libcanberra-gtk-module libcanberra-gtk3-module
sudo apt-get -y install libusb-1.0-0-dev pkg-config
sudo apt-get -y install build-essential cmake cmake-curses-gui
sudo apt-get -y install libgtk-3-dev libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev

echo "[INFO] pyrealsense2 bindings build has been started!"
sleep 2
# Give the CUDA path to CMake
sed -i '3iset(CMAKE_CUDA_COMPILER /usr/local/cuda/bin/nvcc)\' ../CMakeLists.txt
# Set the flags so that librealsense is compatible with python
cmake ../ -DBUILD_PYTHON_BINDINGS:bool=true -DPYTHON_EXECUTABLE=/usr/bin/python3 -DCMAKE_BUILD_TYPE=release -DBUILD_EXAMPLES=true -DBUILD_GRAPHICAL_EXAMPLES=true -DBUILD_WITH_CUDA:bool=true

sudo make uninstall && sudo make clean
echo "[INFO] Building is starting, it will take a long time like half an hour or more!"
sleep 2
sudo make -j$(($(nproc)-1)) && sudo make install

echo 'PYTHONPATH="/usr/local/lib:/usr/local/lib/python3.10/pyrealsense2:$PYTHONPATH"' >> ~/.bashrc
echo 'export PYTHONPATH' >> ~/.bashrc

sudo cp ~/Repos/librealsense/config/99-realsense-libusb.rules /etc/udev/rules.d/ && sudo udevadm control --reload-rules && udevadm trigger

echo "[INFO] pyrealsense2 and RealSense SDK are ready to use!"
echo '[INFO] pyrealsense2 can only be used with "python3" not with "python"!'

echo '[INFO] Run your scripts update for the kernel in the LibRealSense library!'
