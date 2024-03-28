# RealSense-Jetson
<b>Install and build RealSense library for Jetson modules.</b>

Using this repository, one can able to install librealsense to a Jetson module and use RealSense cameras. I used 'build from source' option and do not use RSUSB implementation described [here](https://github.com/IntelRealSense/librealsense/blob/master/doc/installation_jetson.md) since couldn't run it properly and couldn't install pyrealsense2.

## Usage
After installing and writing relevant image file to an SD card as described in [user guides](https://developer.nvidia.com/embedded/learn/getting-started-jetson), insert it to the Jetson module and finish the initial setup. 

After the first boot, open a terminal and clone this repository to your system with:
* `git clone https://github.com/35selim/RealSense-Jetson.git`
* `cd RealSense-Jetson`

Now, just run the scripts with the following order:
1. If you only want to install RealSense SDK
* `sh initialize_Jetson.sh`
* After reboot, again open a terminal and run `cd RealSense-Jetson`
* Lastly, run `sh install_SDK_without_pyrealsense2.sh`
	
2. If you want to construct python bindings to use pyrealsense2
* `sh initialize_Jetson.sh`
* After reboot, again open a terminal and run `cd RealSense-Jetson`
* Lastly, run `sh build_pyrealsense2_and_SDK.sh`

You'll need to add the Python path to the librealsense folder so it can get the compiled libraries. Assuming you're in a `Repo` folder in your home directory, it will look something like this:
```
export PYTHONPATH="$PYTHONPATH:/home/nvidia/Repos/librealsense/build/release"
```

**Note:** 'initialize_Jetson.sh' script will clean some unnecessary stuff, upgrade the system and install a swap file for further operations that require more ram than the Jetson module has. Eventually, it reboots the system to make sure changes are in effect. Whenever the command promt requires, enter your password.

**Note:** The second operation that is done by 'sh build_pyrealsense2_and_SDK.sh' builds from source. That means that the operation will take a long time.

You can configure the scripts according to your needs. Note that, pyrealsense2 will be built using CUDA.

>**Warning:** The scripts are tested only on Jetson Nano module. Further information will be provided as the scripts tested on other modules.

